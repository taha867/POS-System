# Main Screen (Navigation) — UI Spec

## Purpose

Defines the structure of the top navbar's **Operations** dropdown. The navbar itself (dark bg, brand, toggle) remains unchanged — only the Operations dropdown items are specified here.

---

## Operations Dropdown Structure

| # | Item | Type | Route | Notes |
|---|---|---|---|---|
| 1 | Task Manager | Link | `~/Pages/Operations/TaskManager` | |
| — | Tickets | Submenu toggle | — | `dropdown-submenu`, opens on hover to the right |
| 2 | &nbsp;&nbsp;&nbsp;&nbsp;Building Maintanance | Submenu link | `~/Pages/Operations/MaintenanceTickets` | inside Tickets submenu |
| 3 | &nbsp;&nbsp;&nbsp;&nbsp;Machine Maintanance | Submenu link | `~/Pages/Operations/MachineMaintanance` | inside Tickets submenu |
| 4 | &nbsp;&nbsp;&nbsp;&nbsp;ERP | Submenu link | `~/Pages/Operations/ERPTickets` | inside Tickets submenu |
| 5 | &nbsp;&nbsp;&nbsp;&nbsp;Product Functioning & Quality | Submenu link | `~/Pages/Operations/ProductQualityTickets` | inside Tickets submenu |
| 6 | Meeting Management | Link | `~/Pages/Operations/Meeting` | |
| 7 | Memos & Circulars | Link | `~/Pages/Operations/MemosCirculars` | |
| 8 | Complaints & Suggestions | Link | `~/Pages/Operations/ComplaintsAndSuggestions` | |
| 9 | Late Coming & Leaves | Link | `~/Pages/Operations/LateComingLeaves` | no bold |
| 10 | Task Setup | Link | `~/Pages/Operations/TaskSetup` | |

---

## Removed from Nav

- HR Conduct Tickets (page file kept, just not linked)

---

## New Placeholder Pages

| File | Title |
|---|---|
| `MachineMaintanance.aspx` | Machine Maintanance |
| `MemosCirculars.aspx` | Memos & Circulars |
| `LateComingLeaves.aspx` | Late Coming & Leaves |

---

## Design Rules

- Tickets uses `.dropdown-submenu` pattern — `<li class="dropdown-submenu">` with nested `<ul class="dropdown-menu dropdown-menu-dark">` that appears to the right on hover
- CSS in `Site.css` handles submenu show/hide via `.dropdown-submenu:hover > .dropdown-menu { display: block }`
- No bold on any dropdown item
- `dropdown-menu-dark` on all `<ul>` dropdown menus
