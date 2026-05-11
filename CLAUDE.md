# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

ASP.NET Web Forms POS (Point of Sale) / Inventory system using Visual Basic .NET targeting .NET Framework 4.8. Managed via Visual Studio solution (`POSSystem.slnx`).

**Purpose:** This system is used to define and store *form structures* (inventory fields, configuration templates) — not to enter transactional data. Pages are UI-only at this stage; no backend or database wiring is needed until explicitly requested.

## UI Design Rules (apply to every page)

These rules are absolute — follow them without exception unless the user explicitly overrides one:

1. **UI only** — Build markup and layout only. Do not add backend code, event handlers, DAL calls, or database logic unless the user asks.
2. **Grid layout** — Use Bootstrap grid (`row` / `col-*`) for all page layouts. Align fields and labels in columns.
3. **Colour scheme** — Stick to the existing dark navbar/footer palette. Use only Bootstrap's default `btn-primary` (dark blue) and `btn-outline-secondary` (grey) for buttons. Do **not** introduce green (`btn-success`), red (`btn-danger`), or any other colour variants.
4. **No hover colour effects** — Do not add custom CSS hover states that change button or element colour.
5. **No rounded corners** — Set `border-radius: 0` on cards, inputs, buttons, and any bordered element. Override Bootstrap's default rounding with `rounded-0` utility class or inline style where needed.
6. **Consistent border style** — Use `border` (1px solid default Bootstrap border colour) for cards and panels. No shadow utilities (`shadow`, `shadow-sm`) unless already present on the page.

## Fixed-Height Panel Grid Pattern

All setup/config pages use a fixed-height panel grid. Apply this pattern to every bordered panel/section — **never let content push the panel taller**.

### Individual panel (e.g. Task Status, Type of Task)

```html
<div class="border p-3 d-flex flex-column" style="height:220px;">
    <h6 class="fw-bold mb-2">Panel Title</h6>

    <%-- Scrollable list area --%>
    <ul class="list-unstyled mb-2" style="overflow-y:auto; flex:1; min-height:0;">
        <li>Item</li>
    </ul>

    <%-- Optional: + Add New button --%>
    <button type="button" class="btn btn-sm btn-outline-secondary rounded-0"
            onclick="showAddPanel('KEY')">+ Add New</button>
    <div id="addPanel_KEY" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
        <input type="text" id="txtAdd_KEY" class="form-control form-control-sm rounded-0" style="width:200px"
               oninput="document.getElementById('btnAdd_KEY').disabled = this.value.trim() === '';" />
        <button type="button" id="btnAdd_KEY" class="btn btn-sm btn-outline-secondary rounded-0"
                disabled onclick="addItem('KEY')">Add</button>
        <a href="#" class="text-secondary small" onclick="hideAddPanel('KEY'); return false;">Cancel</a>
    </div>
</div>
```

- Replace `KEY` with a unique identifier (e.g. `status`, `tasktype`, `response`).
- Use `height:220px` for standard panels.
- For radio-button / checkbox panels, wrap the options in `<div style="overflow-y:auto; flex:1; min-height:0;">` instead of a `<ul>`.

### Stacked columns (two panels per column, side by side)

```html
<div class="row g-0" style="align-items:stretch;">
    <div class="col-md-6 d-flex flex-column" style="gap:1rem;">
        <%-- panel 1 with me-md-2 --%>
        <div class="border p-3 me-md-2 d-flex flex-column" style="height:220px;">...</div>
        <%-- panel 2 with me-md-2 --%>
        <div class="border p-3 me-md-2 d-flex flex-column" style="height:220px;">...</div>
    </div>
    <div class="col-md-6 d-flex flex-column" style="gap:1rem;">
        <%-- panel 3 with ms-md-2 --%>
        <div class="border p-3 ms-md-2 d-flex flex-column" style="height:220px;">...</div>
        <%-- panel 4 with ms-md-2 --%>
        <div class="border p-3 ms-md-2 d-flex flex-column" style="height:220px;">...</div>
    </div>
</div>
```

### 3-column section box (heading + three equal columns)

```html
<div class="border p-3 mb-3 d-flex flex-column" style="height:190px; overflow:hidden;">
    <h6 class="fw-bold mb-3">Section Title</h6>
    <div class="row" style="flex:1; min-height:0; align-items:stretch;">
        <div class="col-md-4 d-flex flex-column">
            <ul class="list-unstyled mb-2" style="overflow-y:auto; flex:1; min-height:0;">
                <li>Item</li>
            </ul>
            <%-- optional + Add New button here --%>
        </div>
        <div class="col-md-4 d-flex flex-column">
            <ul class="list-unstyled mb-0" style="overflow-y:auto; flex:1; min-height:0;">
                <li>Item</li>
            </ul>
        </div>
        <div class="col-md-4 d-flex flex-column">
            <ul class="list-unstyled mb-0" style="overflow-y:auto; flex:1; min-height:0;">
                <li>Item</li>
            </ul>
        </div>
    </div>
</div>
```

- Use `height:190px` for 3-column section boxes (heading takes ~42 px; inner row gets the rest).
- `overflow:hidden` on the box prevents any child from breaking out.
- `flex:1; min-height:0` on the inner row lets it fill the remaining space.

### Shared JS for + Add New panels (include once per page, inside `<script>`)

```js
function showAddPanel(id) {
    document.getElementById('addPanel_' + id).setAttribute('style', 'display:flex !important');
    document.getElementById('txtAdd_' + id).value = '';
    document.getElementById('btnAdd_' + id).disabled = true;
    document.getElementById('txtAdd_' + id).focus();
}
function hideAddPanel(id) {
    document.getElementById('addPanel_' + id).setAttribute('style', 'display:none !important');
}
function addItem(id) {
    var txt = document.getElementById('txtAdd_' + id);
    var val = txt.value.trim();
    if (!val) return;
    var list = document.getElementById('list_' + id);
    var li = document.createElement('li');
    li.textContent = val;
    list.appendChild(li);
    hideAddPanel(id);
}
```

## Build & Run

Open and run from **Visual Studio** — this project cannot be built with the `dotnet` CLI (Web Forms is .NET Framework only).

- **Run:** Press `F5` in Visual Studio (IIS Express on `https://localhost:44396/`)
- **Build:** `Ctrl+Shift+B` or Build → Build Solution
- **NuGet restore:** Right-click solution → Restore NuGet Packages (packages stored in `/packages/`)

## Architecture

### Page File Triad

Every page consists of three files that must all exist and be registered in `.vbproj`:

| File | Purpose |
|---|---|
| `PageName.aspx` | Markup — HTML + ASP.NET server controls (`runat="server"`) |
| `PageName.aspx.vb` | Code-behind — VB.NET event handlers and page logic |
| `PageName.aspx.designer.vb` | Control declarations — `Protected WithEvents` fields for every `runat="server"` control |

> **Critical rule:** Pages added manually (not via Visual Studio's "Add Web Form" dialog) must have a `.designer.vb` created manually and registered in `.vbproj` with `<DependentUpon>`. Missing designer files cause `"is not declared"` build errors for every control.

### Master Pages

`Site.Master` defines the shared shell (navbar, footer, ScriptManager). All content pages set `MasterPageFile="~/Site.Master"` and fill `<asp:Content ContentPlaceHolderID="MainContent">`.

- Footer is **fixed to the bottom** (`fixed-bottom`) — dark background matching the navbar
- Page title format: `Page Title - AS Operations`

### App_Start

- `BundleConfig.vb` — registers CSS/JS bundles (Bootstrap 5.2.3, jQuery 3.7.0, WebForms scripts)
- `RouteConfig.vb` — enables ASP.NET Friendly URLs

### Global.asax.vb

Application startup — calls `RouteConfig.RegisterRoutes` and `BundleConfig.RegisterBundles`.

## Key Conventions

### VB.NET Namespace Rule

Root namespace is `POSSystem` (set in `.vbproj` as `<RootNamespace>POSSystem</RootNamespace>`). Any `Namespace Foo` in source compiles to `POSSystem.Foo`. Imports in code-behind must use the full path:

```vb
Imports POSSystem.Foo   ' correct
Imports Foo             ' will not compile
```

### Event Handler Wiring

Do **not** use `Handles controlName.Event` on control event handlers — this requires `Protected WithEvents` declarations which only exist when the designer file is present and up to date. Instead, wire all control events via ASPX markup attributes:

```aspx
<asp:Button OnClick="btnSave_Click" ... />
```

Only `Handles Me.Load` (Page's own Load event) is safe to use.

### UpdatePanel

Wrap page content in `<asp:UpdatePanel UpdateMode="Conditional">` for partial-page postbacks. The `ScriptManager` is already in `Site.Master` — never add a second one. Use `ScriptManager.RegisterStartupScript` (not inline `<script>`) to run JavaScript after a partial postback.

### Database Access

- Connection strings go in `Web.config` under `<connectionStrings>`
- All SQL must use parameterized queries (`SqlParameter`) — never string-concatenate SQL
- Keep all DB calls in `App_Code/` classes, never inline in code-behind

## Folder Structure (current)

```
POSSystem/
├── App_Code/                        # Shared VB.NET classes (compile into main assembly)
├── App_Data/                        # Local DB files (.mdf) and SQL scripts
├── App_Start/
│   ├── BundleConfig.vb              # CSS/JS bundle registration
│   └── RouteConfig.vb               # Friendly URL routing
├── Content/
│   ├── Site.css                     # Custom styles
│   └── bootstrap*.css               # Bootstrap 5.2.3 distribution files
├── Pages/
│   └── Operations/                  # Operations module pages
│       ├── MaintenanceTickets.aspx
│       ├── ERPTickets.aspx
│       ├── ProductQualityTickets.aspx
│       ├── HRConductTickets.aspx
│       ├── Meeting.aspx
│       └── ComplaintsAndSuggestions.aspx
├── Scripts/
│   ├── bootstrap.bundle.js          # Bootstrap 5 + Popper
│   ├── jquery-3.7.0.js              # jQuery
│   └── WebForms/                    # ASP.NET WebForms runtime scripts
├── My Project/                      # VB.NET project metadata (AssemblyInfo, Resources)
├── Default.aspx                     # Home page
├── Site.Master                      # Shared shell (navbar + fixed footer)
├── Site.Mobile.Master               # Mobile shell
├── Global.asax                      # Application startup
├── Web.config                       # App configuration
└── POSSystem.vbproj                 # MSBuild project file
```

## Dependencies (packages.config)

| Package | Version | Purpose |
|---|---|---|
| Bootstrap | 5.2.3 | UI framework |
| jQuery | 3.7.0 | Client-side scripting |
| Microsoft.AspNet.FriendlyUrls.Core | 1.0.2 | Clean URLs |
| Microsoft.AspNet.Web.Optimization | 1.1.3 | CSS/JS bundling & minification |
| Newtonsoft.Json | 13.0.3 | JSON serialization |
| Microsoft.CodeDom.Providers.DotNetCompilerPlatform | 2.0.1 | Roslyn compiler support |

## Adding New Pages

1. In Visual Studio: right-click project → Add → Web Form (with Master Page) — this auto-generates all three files and registers them in `.vbproj`
2. If adding manually, create all three files and add to `.vbproj`:

```xml
<Content Include="Pages\FeatureName\PageName.aspx" />
<Compile Include="Pages\FeatureName\PageName.aspx.vb">
  <DependentUpon>PageName.aspx</DependentUpon>
  <SubType>ASPXCodebehind</SubType>
</Compile>
<Compile Include="Pages\FeatureName\PageName.aspx.designer.vb">
  <DependentUpon>PageName.aspx</DependentUpon>
</Compile>
```

## Adding New Features with Database Access

1. Add connection string to `Web.config` under `<connectionStrings>`
2. Create a helper class in `App_Code/` (e.g., `SqlHelper.vb`) for shared ADO.NET logic
3. Create model classes in `App_Code/` (e.g., `MyFeatureModels.vb`) inside a `Namespace MyFeature`
4. Create a DAL class in `App_Code/` (e.g., `MyFeatureDAL.vb`) with `Public Shared` methods
5. In code-behind: `Imports POSSystem.MyFeature`
6. Register all new `App_Code` files in `.vbproj` as `<Compile Include="App_Code\FileName.vb" />`

---

## Coding Standards & Modularity (always apply these)

These rules govern how ALL code in this project is written and structured, not just UI.

### Modularity

- **Never put all code in a single file.** If a page has multiple tabs or sections, each tab/section is a separate **User Control** (`.ascx`).
- A page that acts as a container (toolbar + tabs) belongs in `Pages/Operations/PageName.aspx`. Its tab controls belong in a subfolder `Pages/Operations/PageName/`.
- User controls inherit from `System.Web.UI.UserControl` and live inside a namespaced sub-namespace matching their folder path (e.g. `Namespace Pages.Operations.TaskManager`).
- Register user controls in the host page with `<%@ Register Src="~/..." TagPrefix="..." TagName="..." %>` and use them as `<prefix:ControlName runat="server" ID="..." />`.

### Folder Structure Rules

```
Pages/
└── Operations/
    ├── PageName.aspx            ← container page (shell only: toolbar + tab nav)
    ├── PageName.aspx.vb
    └── PageName/                ← subfolder for all tab/section controls
        ├── TabOneName.ascx
        ├── TabOneName.ascx.vb
        ├── TabTwoName.ascx
        └── TabTwoName.ascx.vb
```

- All files in the subfolder must be registered in `.vbproj` under both `<Content>` and `<Compile>`.
- Add a `<Folder Include="Pages\Operations\PageName\" />` entry in `.vbproj` as well.

### Code Organisation

- **Single Responsibility** — each file does one thing. The host page manages layout/navigation only; each user control manages its own section's markup.
- **No duplication** — shared JavaScript helpers (e.g. `showAddPanel`, `addItem`) must not be copy-pasted into every control. Place shared scripts in a single `<script>` block in the host page or in a dedicated `.js` file under `Scripts/`.
- **No inline styles for layout logic** that is repeated across controls — extract into `Content/Site.css`.

### vbproj Registration (User Controls)

```xml
<Content Include="Pages\Operations\PageName\TabName.ascx" />
<Compile Include="Pages\Operations\PageName\TabName.ascx.vb">
  <DependentUpon>TabName.ascx</DependentUpon>
  <SubType>ASPXCodebehind</SubType>
</Compile>
```

### Naming Conventions

| Artefact | Convention | Example |
|---|---|---|
| Page (container) | `PascalCase.aspx` | `TaskManager.aspx` |
| Tab user control | `PascalCaseTab.ascx` | `NewTaskTab.ascx` |
| Section user control | `PascalCaseSection.ascx` | `AssignedToSection.ascx` |
| Code-behind namespace | mirrors folder path | `Namespace Pages.Operations.TaskManager` |
| HTML element IDs | `camelCase` or `prefixedCamelCase` | `txtTaskName`, `ddlTaskType` |
