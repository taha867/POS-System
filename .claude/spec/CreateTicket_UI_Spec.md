# Create Ticket Page — UI Spec

## Purpose

The Create Ticket page defines the reference assignment data used when tickets are created. It shows who is assigned to each ticket type, who the concerned person is, and who will perform the job — all organised by ticket type. Users can extend lists via "+Add New" where applicable.

---

## Toolbar

Identical to TaskSetup toolbar. Two groups:

| Group | Buttons |
|---|---|
| Left | Manager HR &nbsp;&nbsp; Manager Department &nbsp;&nbsp; Verified &nbsp;&nbsp; Save |
| Right (`ms-auto`) | New &nbsp;&nbsp; Delete &nbsp;&nbsp; Edit &nbsp;&nbsp; Print |

- All buttons: `btn btn-outline-secondary rounded-0`, `min-width: 110px`
- Manager HR / Manager Department toggle: active = `btn-primary`, inactive = `btn-outline-secondary`

**Manager type label:** Small muted text below toolbar — *"Manager of the department of the person who is creating the Task."*

---

## Main Content Area

One large outer `border p-3` container holding five sections.

### Layout

```
[ Section 1 — Ticket Type Assigned To                    (full width) ]
[ Section 2 — Concerned Person ...                       (full width) ]
[ Section 3 — Person Who Will Perform ...                (full width) ]
[ Type of Ticket (col-md-6) ] [ Ticket Response (col-md-6)           ]
```

---

## Section 1 — Ticket Type Assigned To

**Title:** `Ticket Type Assigned to` (bold heading)

**Layout:** Three plain-text columns in a `row`:
- `col-md-4` — Ticket Type
- `col-md-4` — Role / Designation
- `col-md-4` — Person Name

**Data (row by row):**

| Ticket Type | Role / Designation | Person Name |
|---|---|---|
| Building Maintanance Ticket | Asst Manager Maintanance | Adnan Kha |
| Machinary Maintanance Ticket | Asst Manager Machinary Maint. | Saleem Khan |
| ERP Ticket | Sr Programming Manager | Ahsaan Ahmed |
| Product Related Ticket | Design Engineeer | Abdul Haq |

**Footer:** `+ Add New` button below the Ticket Type column (first column only)

---

## Section 2 — Concerned Person as per Building or Factory Location / Type of Machinary or Module

**Title:** `Concerned Person as per Building or Factory Location /Type of Machinary or Module` (bold heading)

**Layout:** Same three-column structure as Section 1.

**Data (row by row):**

| Ticket Type | Role / Designation | Person Name |
|---|---|---|
| Building Maintanance Ticket | Supervisor Maintanance | Adnan Kha |
| Machinary Maintanance Ticket | Supervisor Machinry Maint. | Saleem Khan |
| ERP Ticket | Asst Programming Manager | Ahsaan Ahmed |
| Product Related Ticket | Asst Design Engineeer | Abdul Haq |

**Footer:** `+ Add New` button below the Ticket Type column

---

## Section 3 — Person Who Actually Will Perform the Job as per Building or Factory Location / Type of Machinary or Module

**Title:** `Person who actually will perform the job as per Building or Factory Location /Type of Machinary or Module` (bold heading)

**Layout:** Same three-column structure as Section 1.

**Data (row by row):**

| Ticket Type | Role / Designation | Person Name |
|---|---|---|
| Building Maintanance Ticket | MMachinary Maint. | Saleem Khan |
| Machinary Maintanance Ticket | Machinary Maint. Technecian | Saleem Khan |
| ERP Ticket | Programming Personr | Ahsaan Ahmed |
| Product Related Ticket | Asst Design Engineeer | Abdul Haq |

**Footer:** `+ Add New` button below the Ticket Type column

---

## Section 4 — Type of Ticket (bottom-left)

**Title:** `Type of Ticket` (bold heading)

**Layout:** `col-md-6`, plain text list (`list-unstyled`)

**Items (display only):**
- Building Maintanance Ticket
- Machinary Maintanance Ticket
- ERP Ticket
- Product Related Ticket

**Footer:** `+ Add New` button

**Left sidebar note (from screenshot):** *"List of the People who are responsible for Maintanance"* — shown as `text-muted small` label beside this section.

---

## Section 5 — Ticket Response (bottom-right)

**Title:** `Ticket Response` (bold heading)

**Layout:** `col-md-6`, plain text list (`list-unstyled`)

**Items (display only):**
- Ticket Created
- Rectification in Process
- Ticket Accepted
- Ticket Completion Time Request
- CTicket Completion Time
- Ticket Deffer Requested
- Ticket Deffer Accepted
- Ticket Deffer Rejected
- Ticket Delay Requested
- Ticket Delay Rejected
- Ticket bDelay Accepted
- Ticket Task Closed
- Ticket Canceled By Creater
- Ticket Cancel Request by Receiver

**Footer:** `+ Add New` button

---

## Three-Column Section Layout Detail

Each of the three assignment sections uses this structure:

```
<div class="border p-3 mb-3">
  <h6 class="fw-bold mb-3">Section Title</h6>
  <div class="row">
    <div class="col-md-4">
      <ul class="list-unstyled">
        <li>Building Maintanance Ticket</li>
        ...
      </ul>
      [+ Add New button + inline input panel]
    </div>
    <div class="col-md-4">
      <ul class="list-unstyled">
        <li>Role / Designation</li>
        ...
      </ul>
    </div>
    <div class="col-md-4">
      <ul class="list-unstyled">
        <li>Person Name</li>
        ...
      </ul>
    </div>
  </div>
</div>
```

The three columns are independent plain-text lists displayed side by side — not a table. Only the first column (Ticket Type) has a `+ Add New` button.

---

## +Add New Behaviour (pure JS, no postback)

Same as TaskSetup page:
- Click "+ Add New" → inline input + disabled Add button + Cancel link appear
- Add button enables only after user types at least one character
- Click Add → item appended to that column's list, panel closes
- Input uses `style="max-width:100%;width:200px"` to override Site.css constraint

---

## Design Rules

- No rounded corners (`rounded-0` on all buttons, inputs, borders)
- Colours: `btn-outline-secondary` and `btn-primary` only
- No hover colour effects, no shadows
- Grid layout using Bootstrap `row` / `col-*`
- UI only — no backend wiring
