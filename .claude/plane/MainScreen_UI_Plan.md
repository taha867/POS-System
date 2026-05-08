# Plan — Main Screen Navigation Update

## Context

The Operations dropdown was restructured: Tickets is now a proper hover submenu (opens to the right), Late Coming & Leaves is no longer bold, and three new placeholder pages were added.

---

## Files Changed

| Action | File |
|---|---|
| Modified | `POSSystem\Site.Master` — Operations dropdown restructured |
| Modified | `POSSystem\Content\Site.css` — `.dropdown-submenu` CSS added |
| Modified | `POSSystem\POSSystem.vbproj` — 3 new Content + Compile entries |
| Created | `POSSystem\Pages\Operations\MachineMaintanance.aspx` + `.vb` |
| Created | `POSSystem\Pages\Operations\MemosCirculars.aspx` + `.vb` |
| Created | `POSSystem\Pages\Operations\LateComingLeaves.aspx` + `.vb` |

---

## Nav Structure

```
Operations
├── Task Manager
├── Tickets ▶  (hover → submenu opens to the right)
│   ├── Building Maintanance
│   ├── Machine Maintanance
│   ├── ERP
│   └── Product Functioning & Quality
├── Meeting Management
├── Memos & Circulars
├── Complaints & Suggestions
├── Late Coming & Leaves  (no bold)
└── Task Setup
```

---

## Submenu CSS (Site.css)

```css
.dropdown-submenu { position: relative; }
.dropdown-submenu > .dropdown-menu { top: 0; left: 100%; margin-top: -1px; display: none; }
.dropdown-submenu:hover > .dropdown-menu { display: block; }
```

---

## Verification

1. Click Operations dropdown — all items visible
2. Hover over "Tickets" → submenu slides out to the right with 4 items
3. Each submenu item navigates correctly
4. "Late Coming & Leaves" is plain text, not bold
5. Build solution — zero errors
