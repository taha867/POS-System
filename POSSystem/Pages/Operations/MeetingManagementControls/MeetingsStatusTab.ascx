<%@ Control Language="VB" AutoEventWireup="true" CodeBehind="MeetingsStatusTab.ascx.vb" Inherits="POSSystem.Pages.Operations.MeetingManagementControls.MeetingsStatusTab" %>

<%-- Filter Row: Checkboxes (left) + Meeting type / recurrence radios (right) --%>
<div class="d-flex gap-4 mb-2 pb-2 border-bottom flex-wrap align-items-start">

    <%-- Checkboxes: meeting urgency --%>
    <div class="d-flex flex-column gap-1">
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="chkUrgent" />
            <label class="form-check-label small" for="chkUrgent">Urgent</label>
        </div>
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="chkImportant" checked />
            <label class="form-check-label small" for="chkImportant">Important</label>
        </div>
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="chkRegular" />
            <label class="form-check-label small" for="chkRegular">Regular</label>
        </div>
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="chkAll" />
            <label class="form-check-label small" for="chkAll">All</label>
        </div>
    </div>

    <%-- Radio buttons: recurrence + meeting type --%>
    <div class="d-flex flex-column gap-2">
        <%-- Recurrence row --%>
        <div class="d-flex gap-4 flex-wrap">
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radRecurrence" id="radSingle" checked />
                <label class="form-check-label small" for="radSingle">Single Meeting Event</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radRecurrence" id="radRecurring" />
                <label class="form-check-label small" for="radRecurring">Raccuring Meetings</label>
            </div>
        </div>
        <%-- Meeting type row 1 --%>
        <div class="d-flex gap-3 flex-wrap">
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radMeetingType" id="radAllMeetings" checked />
                <label class="form-check-label small" for="radAllMeetings">All Meetings</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radMeetingType" id="radManagement" />
                <label class="form-check-label small" for="radManagement">Management Meeting</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radMeetingType" id="radGeneral" />
                <label class="form-check-label small" for="radGeneral">Genral Meeting</label>
            </div>
        </div>
        <%-- Meeting type row 2 --%>
        <div class="d-flex gap-3 flex-wrap">
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radMeetingType" id="radSales" />
                <label class="form-check-label small" for="radSales">Sales Meeting</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radMeetingType" id="radVender" />
                <label class="form-check-label small" for="radVender">Vender Meeting</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radMeetingType" id="radProcurement" />
                <label class="form-check-label small" for="radProcurement">Procurement Meeting</label>
            </div>
        </div>
        <%-- Meeting type row 3 --%>
        <div class="d-flex gap-3 flex-wrap">
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radMeetingType" id="radBoard" />
                <label class="form-check-label small" for="radBoard">Board Meeting</label>
            </div>
        </div>
    </div>

</div>

<%-- Meetings Grid --%>
<div class="table-responsive">
    <table class="table table-bordered table-sm mb-0" style="font-size:0.82rem;">
        <thead style="background-color:#f8f9fa;">
            <tr>
                <th class="rounded-0 text-nowrap">Meeting Id</th>
                <th class="rounded-0 text-nowrap">Meeting Final Time &amp; Date</th>
                <th class="rounded-0 text-nowrap">Meeting Type</th>
                <th class="rounded-0 text-nowrap">Meeting Called By</th>
                <th class="rounded-0 text-nowrap">Meeting Final Location</th>
                <th class="rounded-0">Remarks</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="fw-bold">2345</td>
                <td class="text-nowrap fw-bold">Jan 01, 2016</td>
                <td class="fw-bold">Board Meeting</td>
                <td class="fw-bold">Asst Manager<br />Maintanance<br />Zaman Khan</td>
                <td class="fw-bold">Company Premises Id</td>
                <td></td>
            </tr>
            <tr>
                <td>2346</td>
                <td class="text-nowrap">Jan 01, 2016</td>
                <td>Management Meeting</td>
                <td>Asst Manager<br />Maintanance<br />Zaman Khan</td>
                <td>Outdoor Address</td>
                <td></td>
            </tr>
            <tr>
                <td>2347</td>
                <td class="text-nowrap">Jan 03, 2016</td>
                <td>Sales Meeting</td>
                <td>Asst Manager<br />ERP Tickets<br />Kaleem</td>
                <td>Inter Company</td>
                <td></td>
            </tr>
            <tr>
                <td>2348</td>
                <td class="text-nowrap">Jan 05, 2016</td>
                <td>Vender Meeting</td>
                <td>Asst Manager<br />D&amp;P D<br />Adnan Khan</td>
                <td>Out Side Participants</td>
                <td></td>
            </tr>
        </tbody>
    </table>
</div>
