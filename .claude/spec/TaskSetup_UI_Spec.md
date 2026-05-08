# Task Setup Page — UI Spec

## Purpose

The Task Setup page defines the reference fields used in actual task forms. Each section displays a fixed list of field values (not selectable options) that will be available when creating tasks. Users can extend lists via "+Add New" where applicable.

---

## Toolbar

One row of buttons. Two groups separated by `ms-auto`:

| Group | Buttons |
|---|---|
| Left | Manager HR &nbsp;&nbsp; Manager Department &nbsp;&nbsp; Verified &nbsp;&nbsp; Save |
| Right | New &nbsp;&nbsp; Delete &nbsp;&nbsp; Edit &nbsp;&nbsp; Print |

- All buttons: `btn btn-outline-secondary rounded-0`, `min-width: 110px`
- Manager HR / Manager Department toggle: active = `btn-primary`, inactive = `btn-outline-secondary`
- No green/red/hover colour effects. No rounded corners.

**Manager type label:** Small muted text below toolbar — *"Manager of the department of the person who is creating the Task."*

---

## Main Content Area — 2×2 Grid

```
[ Task Status        ]  [ Type of Task         ]
[ Task Action        ]  [ Task Response        ]
```

- Outer container: `border p-3`
- Each section: `border p-3`, no shadow, no rounded corners
- Section title: `<h6 class="fw-bold">`
- Items: `<ul class="list-unstyled">` with `<li>` plain text — no radio buttons, no checkboxes

---

## Section Data

**Task Status** (+ Add New):
Finished, Deffered, Delayed, Under Process, Cancelled

**Type of Task** (+ Add New):
Create Report, Get Information, Get a Quote, Send a Proposal, Send a Sale Quote, Make a Visit to, Make a Out of City Visit, Make a Out of Country Visit, Arrange a Meeting, Submit Proposal

**Task Action** (no Add New):
Task Created, Responded, Delayed, Canceled, Deffered, Task Finished Reported, Task Finished Accepted

**Task Response** (+ Add New):
Task Created Report, Task Accepted, Task Deffered Request, Task Deffered Accepted, Task Deffered Recected, Task Cancel Request, Task Cancel Accepted, Task Cancel Recected, Task CFinished

---

## +Add New Behaviour (pure JS, no postback)

- Click "+ Add New" → inline input + disabled Add button + Cancel link appear below list
- Add button enables only after user types at least one character
- Click Add → item appended to list, panel closes
- Click Cancel → panel closes, nothing added
- Input uses `style="max-width:100%;width:200px"` to override Site.css `max-width:280px`
