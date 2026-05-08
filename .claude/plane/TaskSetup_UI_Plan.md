# Plan — Task Setup Page UI

## Context

`TaskSetup.aspx` was a placeholder. Replaced with full UI: toolbar, 2×2 section grid, plain text lists, and client-side +Add New functionality. UI only — no backend wiring.

---

## Files Changed

| Action | File |
|---|---|
| Modified | `POSSystem\Pages\Operations\TaskSetup.aspx` — full UI implemented |
| No change | `TaskSetup.aspx.vb` — empty Page_Load stays |
| No change | `.vbproj` — already registered |
| No designer.vb | Zero `runat="server"` controls used |

---

## Key Implementation Notes

- All buttons are plain `<button type="button">` — no server controls, no postbacks
- Manager HR/Dept toggle handled by `setManager(type)` JS function
- +Add New is pure JS: `showAddPanel`, `hideAddPanel`, `addItem` functions
- Site.css `input { max-width: 280px }` overridden inline on +Add New inputs
- Left column: Task Status (top) + Task Action (bottom); Right column: Type of Task (top) + Task Response (bottom)
- Task Action has no +Add New

---

## Verification

1. Toolbar shows 8 buttons — left group of 4, right group of 4 pushed to far right
2. Click Manager HR → turns dark blue; Manager Department stays grey (and vice versa)
3. All four sections show plain text lists — no radio buttons
4. Task Action has no + Add New button
5. Click + Add New on Task Status → input appears, Add is disabled
6. Type text → Add enables; click Add → item appended, panel closes
7. Click Cancel → panel closes, nothing added
8. No rounded corners, no green/red buttons, no shadows anywhere
