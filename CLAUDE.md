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
