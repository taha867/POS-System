<%@ Control Language="VB" AutoEventWireup="true" CodeBehind="NewMeetingTab.ascx.vb" Inherits="POSSystem.Pages.Operations.MeetingManagementControls.NewMeetingTab" %>

<%-- Meeting Id + Date (top-right) --%>
<div class="d-flex justify-content-end gap-4 mb-3">
    <div class="d-flex align-items-center gap-2">
        <label class="small fw-semibold mb-0">Meeting Id:</label>
        <input type="text" class="form-control form-control-sm rounded-0" style="width:130px;" />
    </div>
    <div class="d-flex align-items-center gap-2">
        <label class="small fw-semibold mb-0">Date:</label>
        <input type="text" class="form-control form-control-sm rounded-0" style="width:130px;" placeholder="mm/dd/yyyy" />
    </div>
</div>

<%-- Filter Row: Checkboxes (left) + radios (right) --%>
<div class="d-flex gap-4 mb-2 flex-wrap align-items-start">

    <%-- Checkboxes: urgency --%>
    <div class="d-flex flex-column gap-1">
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="nmUrgent" />
            <label class="form-check-label small" for="nmUrgent">Urgent</label>
        </div>
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="nmImportant" checked />
            <label class="form-check-label small" for="nmImportant">Important</label>
        </div>
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="nmRegular" />
            <label class="form-check-label small" for="nmRegular">Regular</label>
        </div>
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="nmAll" />
            <label class="form-check-label small" for="nmAll">All</label>
        </div>
    </div>

    <%-- Radios: recurrence + meeting type --%>
    <div class="d-flex flex-column gap-2">
        <%-- Recurrence --%>
        <div class="d-flex gap-4 flex-wrap">
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="nmRecurrence" id="nmSingle" checked />
                <label class="form-check-label small" for="nmSingle">Single Meeting Event</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="nmRecurrence" id="nmRecurring" />
                <label class="form-check-label small" for="nmRecurring">Raccuring Meetings</label>
            </div>
        </div>
        <%-- Meeting type row 1 --%>
        <div class="d-flex gap-3 flex-wrap">
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="nmMeetingType" id="nmManagement" />
                <label class="form-check-label small" for="nmManagement">Management Meeting</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="nmMeetingType" id="nmGeneral" />
                <label class="form-check-label small" for="nmGeneral">Genral Meeting</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="nmMeetingType" id="nmProcurement" />
                <label class="form-check-label small" for="nmProcurement">Procurement Meeting</label>
            </div>
        </div>
        <%-- Meeting type row 2 --%>
        <div class="d-flex gap-3 flex-wrap">
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="nmMeetingType" id="nmSales" />
                <label class="form-check-label small" for="nmSales">Sales Meeting</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="nmMeetingType" id="nmVender" />
                <label class="form-check-label small" for="nmVender">Vender Meeting</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="nmMeetingType" id="nmBoard" />
                <label class="form-check-label small" for="nmBoard">Board Meeting</label>
            </div>
        </div>
    </div>

</div>

<%-- Recurring Meetings sub-section --%>
<div class="border p-2 mb-3" style="font-size:0.83rem;">
    <span class="fw-semibold small">Raccuring Meetings</span>
    <div class="mt-2 d-flex flex-column gap-1">
        <div class="d-flex gap-4 flex-wrap">
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="nmFrequency" id="nmEveryDay" checked />
                <label class="form-check-label small" for="nmEveryDay">Every Day</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="nmFrequency" id="nmEveryWeek" />
                <label class="form-check-label small" for="nmEveryWeek">Every Week</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="nmFrequency" id="nmEveryMonth" />
                <label class="form-check-label small" for="nmEveryMonth">Every Month</label>
            </div>
        </div>
        <div class="d-flex gap-4 flex-wrap align-items-center">
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="nmFrequency" id="nmEveryMonday" />
                <label class="form-check-label small" for="nmEveryMonday">Every Monday</label>
            </div>
            <span class="small text-muted">- - - - - - - - - - - - - - -</span>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="nmFrequency" id="nmEverySunday" />
                <label class="form-check-label small" for="nmEverySunday">Every Sunday</label>
            </div>
        </div>
        <div class="d-flex gap-4 flex-wrap">
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="nmFrequency" id="nmFirstWeek" />
                <label class="form-check-label small" for="nmFirstWeek">First Day of the Week</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="nmFrequency" id="nmLastWeek" />
                <label class="form-check-label small" for="nmLastWeek">Last Day of the Week</label>
            </div>
        </div>
        <div class="d-flex gap-4 flex-wrap">
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="nmFrequency" id="nmFirstMonth" />
                <label class="form-check-label small" for="nmFirstMonth">First Day of the Month</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="nmFrequency" id="nmLastMonth" />
                <label class="form-check-label small" for="nmLastMonth">Last Day of the Month</label>
            </div>
        </div>
        <div class="d-flex gap-4 flex-wrap">
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="nmFrequency" id="nmFirstYear" />
                <label class="form-check-label small" for="nmFirstYear">First Day of the Year</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="nmFrequency" id="nmLastYear" />
                <label class="form-check-label small" for="nmLastYear">Last Day of the Yeay</label>
            </div>
        </div>
    </div>
</div>

<%-- Meeting Proposed Time & Venue --%>
<div class="border p-2 mb-3" style="font-size:0.83rem;">
    <div class="d-flex align-items-center gap-2 mb-2 flex-wrap">
        <span class="fw-semibold">Meeting Proposed Time</span>
        <input type="text" class="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" />
        <input type="text" class="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
    </div>
    <div class="d-flex align-items-center gap-2 flex-wrap">
        <span class="fw-semibold">Meeting Proposed Venue</span>
        <label class="small mb-0">Location ID</label>
        <input type="text" class="form-control form-control-sm rounded-0" style="width:100px;" />
        <label class="small mb-0">Outdoor Premises</label>
        <input type="text" class="form-control form-control-sm rounded-0" style="width:130px;" />
        <label class="small mb-0">Address</label>
        <input type="text" class="form-control form-control-sm rounded-0 flex-grow-1" />
    </div>
</div>

<%-- Participants --%>
<div class="border p-2 mb-3" style="font-size:0.83rem;">
    <%-- Internal Participants --%>
    <div class="row g-1 mb-2 align-items-center">
        <div class="col-auto" style="min-width:130px;">
            <span class="fw-semibold">Participants</span>
        </div>
        <div class="col">
            <div class="row g-1 align-items-center">
                <div class="col-auto"><label class="small mb-0">Designation</label></div>
                <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                <div class="col-auto"><label class="small mb-0">Name</label></div>
                <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                <div class="col-auto"><label class="small mb-0">Department</label></div>
                <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                <div class="col-auto"><label class="small mb-0">Company</label></div>
                <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
            </div>
        </div>
    </div>
    <%-- Outside Participants --%>
    <div class="row g-1 align-items-center">
        <div class="col-auto" style="min-width:130px;">
            <span class="fw-semibold">Outside Participants</span>
        </div>
        <div class="col">
            <div class="row g-1 align-items-center">
                <div class="col-auto"><label class="small mb-0">Company</label></div>
                <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                <div class="col-auto"><label class="small mb-0">Name</label></div>
                <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                <div class="col-auto"><label class="small mb-0">Relation</label></div>
                <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                <div class="col-auto"><label class="small mb-0">e-mail</label></div>
                <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
            </div>
        </div>
    </div>
</div>

<%-- Meeting Agenda & Details --%>
<div class="row g-2 align-items-start">
    <div class="col-auto">
        <label class="small fw-semibold mb-0 mt-1">Meeting Agenda &amp; Details:</label>
    </div>
    <div class="col">
        <textarea class="form-control form-control-sm rounded-0" rows="4" style="resize:vertical;"></textarea>
    </div>
</div>
