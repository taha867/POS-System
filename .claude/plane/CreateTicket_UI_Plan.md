# Plan — Create Ticket Page UI

## Context

`CreateTicket.aspx` is currently a placeholder. This plan implements its full UI based on `.claude\spec\CreateTicket_UI_Spec.md`. The page is **UI only** — no backend, no server controls beyond `<asp:Content>`. All JS patterns are copied directly from the already-working `TaskSetup.aspx`.

---

## Critical Files

| Action | File |
|---|---|
| Modify | `POSSystem\Pages\Operations\CreateTicket.aspx` — replace placeholder with full UI |
| No change | `POSSystem\Pages\Operations\CreateTicket.aspx.vb` — empty Page_Load stays |
| No change | `POSSystem\POSSystem.vbproj` — already registered |
| No designer.vb | Zero `runat="server"` controls used |

**Pattern reference:** `POSSystem\Pages\Operations\TaskSetup.aspx` — reuse toolbar HTML and JS functions verbatim.

---

## Page Structure

```
Toolbar (Manager HR | Manager Dept | Verified | Save  …  New | Delete | Edit | Print)
Muted label: "Manager of the department of the person who is creating the Task."

<div class="border p-3">                          ← outer container

  Section 1 — Ticket Type Assigned To             (full width, border p-3 mb-3)
    row: col-md-4 [Ticket Type + AddNew] | col-md-4 [Role/Desig] | col-md-4 [Person]

  Section 2 — Concerned Person ...                (full width, border p-3 mb-3)
    row: col-md-4 [Ticket Type + AddNew] | col-md-4 [Role/Desig] | col-md-4 [Person]

  Section 3 — Person Who Will Perform ...         (full width, border p-3 mb-3)
    row: col-md-4 [Ticket Type + AddNew] | col-md-4 [Role/Desig] | col-md-4 [Person]

  row g-0:
    col-md-6 — Section 4: Type of Ticket + AddNew
    col-md-6 — Section 5: Ticket Response  + AddNew

</div>

<script> setManager / showAddPanel / hideAddPanel / addItem </script>
```

---

## +Add New Panel IDs

| Section | Panel ID |
|---|---|
| Section 1 — Ticket Type Assigned To | `assigned` |
| Section 2 — Concerned Person | `concerned` |
| Section 3 — Person Who Will Perform | `performer` |
| Section 4 — Type of Ticket | `tickettype` |
| Section 5 — Ticket Response | `ticketresponse` |

Each uses `id="list_{id}"` on the `<ul>` and `id="addPanel_{id}"`, `id="txtAdd_{id}"`, `id="btnAdd_{id}"` on the panel — same naming convention as TaskSetup.

---

## Section Data

### Section 1 — Ticket Type Assigned To

| col-md-4: Ticket Type | col-md-4: Role / Designation | col-md-4: Person Name |
|---|---|---|
| Building Maintanance Ticket | Asst Manager Maintanance | Adnan Kha |
| Machinary Maintanance Ticket | Asst Manager Machinary Maint. | Saleem Khan |
| ERP Ticket | Sr Programming Manager | Ahsaan Ahmed |
| Product Related Ticket | Design Engineeer | Abdul Haq |

### Section 2 — Concerned Person as per Building or Factory Location /Type of Machinary or Module

| col-md-4: Ticket Type | col-md-4: Role / Designation | col-md-4: Person Name |
|---|---|---|
| Building Maintanance Ticket | Supervisor Maintanance | Adnan Kha |
| Machinary Maintanance Ticket | Supervisor Machinry Maint. | Saleem Khan |
| ERP Ticket | Asst Programming Manager | Ahsaan Ahmed |
| Product Related Ticket | Asst Design Engineeer | Abdul Haq |

### Section 3 — Person who actually will perform the job as per Building or Factory Location /Type of Machinary or Module

| col-md-4: Ticket Type | col-md-4: Role / Designation | col-md-4: Person Name |
|---|---|---|
| Building Maintanance Ticket | MMachinary Maint. | Saleem Khan |
| Machinary Maintanance Ticket | Machinary Maint. Technecian | Saleem Khan |
| ERP Ticket | Programming Personr | Ahsaan Ahmed |
| Product Related Ticket | Asst Design Engineeer | Abdul Haq |

### Section 4 — Type of Ticket
Building Maintanance Ticket, Machinary Maintanance Ticket, ERP Ticket, Product Related Ticket

### Section 5 — Ticket Response
Ticket Created, Rectification in Process, Ticket Accepted, Ticket Completion Time Request, CTicket Completion Time, Ticket Deffer Requested, Ticket Deffer Accepted, Ticket Deffer Rejected, Ticket Delay Requested, Ticket Delay Rejected, Ticket bDelay Accepted, Ticket Task Closed, Ticket Canceled By Creater, Ticket Cancel Request by Receiver

---

## JS (reused from TaskSetup.aspx)

```js
setManager(type)          // toggles btn-primary on Manager HR / Manager Dept
showAddPanel(id)          // reveals inline input panel
hideAddPanel(id)          // hides inline input panel
addItem(id)               // appends new <li> to list_{id}, closes panel
oninput on each txtAdd_   // enables/disables Add button based on value
```

---

## Verification

1. Page loads with toolbar and all 5 sections visible.
2. Click Manager HR → turns dark blue; Manager Department stays grey.
3. Sections 1–3 show three side-by-side columns with correct data.
4. Click `+ Add New` on Section 1 → input appears; Add is disabled until text entered.
5. Type text → Add enables; click Add → item appended to Ticket Type column list.
6. Sections 4 and 5 sit side by side at the bottom with their respective lists.
7. All +Add New panels on all 5 sections work independently.
8. No rounded corners, no green/red buttons, no shadows.
9. Page title in browser: "Create Ticket - AS Operations".
