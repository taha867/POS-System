<%@ Control Language="VB" AutoEventWireup="true" CodeBehind="TicketStringTab.ascx.vb" Inherits="POSSystem.Pages.Operations.TicketSetupControls.TicketStringTab" %>

<%-- Select Task Name + Date (top-right) --%>
<div class="d-flex justify-content-end gap-4 mb-3 flex-wrap">
    <div class="d-flex align-items-center gap-2">
        <label class="small fw-semibold mb-0" for="selTsTicketName">Select Task Name</label>
        <select id="selTsTicketName" class="form-select form-select-sm rounded-0" style="width:180px;">
            <option value="">-- Select --</option>
            <option>Building Maintanance</option>
            <option>Machine Maintanance</option>
            <option>ERP Ticket</option>
            <option>Product Ticket</option>
        </select>
    </div>
    <div class="d-flex align-items-center gap-2">
        <label class="small fw-semibold mb-0">Date:</label>
        <span class="small">Jan 01-2026</span>
    </div>
</div>

<%-- Ticket Info (read-only display) --%>
<div class="border p-2 mb-3" style="background-color:#f8f9fa; font-size:0.83rem;">
    <div class="row g-1 mb-1 align-items-center">
        <div class="col-auto">
            <span class="fw-semibold">Ticket ID:</span>
        </div>
        <div class="col-auto">
            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" />
        </div>
        <div class="col-auto ms-3">
            <span class="fw-semibold">Assigned To:</span>
        </div>
        <div class="col">
            <input type="text" class="form-control form-control-sm rounded-0" />
        </div>
    </div>
    <div class="row g-1 mb-1 align-items-center">
        <div class="col-auto">
            <span class="fw-semibold">Field Assignment To:</span>
        </div>
        <div class="col">
            <input type="text" class="form-control form-control-sm rounded-0" />
        </div>
    </div>
    <div class="row g-1 mb-1 align-items-center">
        <div class="col-auto">
            <span class="fw-semibold">Type of Ticket:</span>
        </div>
        <div class="col-auto">
            <input type="text" class="form-control form-control-sm rounded-0" style="width:200px;" />
        </div>
        <div class="col-auto ms-3">
            <span class="fw-semibold">Ticket Name:</span>
        </div>
        <div class="col">
            <input type="text" class="form-control form-control-sm rounded-0" />
        </div>
    </div>
    <div class="row g-1 mb-1 align-items-center">
        <div class="col-auto">
            <span class="fw-semibold">Ticket Closing Target Time &amp; Date:</span>
        </div>
        <div class="col-auto">
            <input type="text" class="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" />
        </div>
        <div class="col-auto">
            <input type="text" class="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
        </div>
    </div>
    <div class="row g-1 align-items-start">
        <div class="col-auto">
            <span class="fw-semibold">Remarks &amp; Details:</span>
        </div>
        <div class="col">
            <textarea class="form-control form-control-sm rounded-0" rows="2" style="resize:vertical;"></textarea>
        </div>
    </div>
</div>

<%-- Ticket String Timeline Grid --%>
<h6 class="fw-bold mb-2">Ticket String</h6>
<div class="table-responsive">
    <table class="table table-bordered table-sm mb-0" style="font-size:0.82rem;">
        <thead style="background-color:#f8f9fa;">
            <tr>
                <th class="rounded-0 text-nowrap">Time</th>
                <th class="rounded-0 text-nowrap">Date</th>
                <th class="rounded-0 text-nowrap">Action</th>
                <th class="rounded-0 text-nowrap">Response by Receiver</th>
                <th class="rounded-0 text-nowrap">Response by Creater</th>
            </tr>
        </thead>
        <tbody>
            <%-- Note: double-clicking a row displays full response detail on user's screen --%>
            <tr>
                <td class="text-nowrap">12:34 Pm</td>
                <td class="text-nowrap">Jan 01, 2026</td>
                <td>Created</td>
                <td>-</td>
                <td>Created</td>
            </tr>
            <tr>
                <td class="text-nowrap">12:39 Pm</td>
                <td class="text-nowrap">Jan 01, 2026</td>
                <td>Responsed</td>
                <td>Ticket Accepted</td>
                <td>-</td>
            </tr>
            <tr>
                <td class="text-nowrap">3:05 Pm</td>
                <td class="text-nowrap">Jan 01, 2026</td>
                <td>Delayed</td>
                <td>Changed Completion Time</td>
                <td>-</td>
            </tr>
            <tr>
                <td class="text-nowrap">4:10 Pm</td>
                <td class="text-nowrap">Jan 01, 2026</td>
                <td>Delay Accepted</td>
                <td>-</td>
                <td>Delay Accepted</td>
            </tr>
            <tr>
                <td class="text-nowrap">10:19 Am</td>
                <td class="text-nowrap">Jan 02, 2026</td>
                <td>Task Finished</td>
                <td>Ticket Finished Submitted</td>
                <td>-</td>
            </tr>
            <tr>
                <td class="text-nowrap">11:10 Am</td>
                <td class="text-nowrap">Jan 02, 2026</td>
                <td>Task Finished Accepted</td>
                <td>-</td>
                <td>Ticket Closed</td>
            </tr>
        </tbody>
    </table>
</div>

<%-- Attach File + Note (bottom-right) --%>
<div class="row g-2 justify-content-end mt-3">
    <div class="col-md-5">
        <div class="border p-2 d-flex flex-column" style="height:90px;">
            <span class="small fw-semibold mb-1">Attached File / Picture</span>
            <input type="file" class="form-control form-control-sm rounded-0" style="font-size:0.8rem;" />
        </div>
    </div>
    <div class="col-md-5">
        <div class="border p-2 d-flex flex-column" style="height:90px;">
            <span class="small fw-semibold mb-1">Note</span>
            <textarea class="form-control form-control-sm rounded-0" rows="2" style="flex:1; resize:none;"></textarea>
        </div>
    </div>
</div>
