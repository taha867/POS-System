<%@ Control Language="VB" AutoEventWireup="true" CodeBehind="ResponseByCallerTab.ascx.vb" Inherits="POSSystem.Pages.Operations.MeetingManagementControls.ResponseByCallerTab" %>

<%-- Meeting ID + Date (top-right) --%>
<div class="d-flex justify-content-end gap-4 mb-3 flex-wrap">
    <div class="d-flex align-items-center gap-2">
        <label class="small fw-semibold mb-0">Meeting ID:</label>
        <input type="text" class="form-control form-control-sm rounded-0" style="width:130px;" />
    </div>
    <div class="d-flex align-items-center gap-2">
        <label class="small fw-semibold mb-0">Date:</label>
        <span class="small">Jan 01-2026</span>
    </div>
</div>

<%-- Meeting Info (read-only display) --%>
<div class="border p-2 mb-3" style="background-color:#f8f9fa; font-size:0.83rem;">
    <div class="row g-1 mb-1 align-items-center">
        <div class="col-auto">
            <span class="fw-semibold">Meeting ID:</span>
        </div>
        <div class="col-auto">
            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" />
        </div>
        <div class="col-auto ms-3">
            <span class="fw-semibold">Called By:</span>
        </div>
        <div class="col">
            <input type="text" class="form-control form-control-sm rounded-0" />
        </div>
    </div>
    <div class="row g-1 mb-2 align-items-center">
        <div class="col-auto">
            <span class="fw-semibold">Type of Meeting:</span>
        </div>
        <div class="col-auto">
            <input type="text" class="form-control form-control-sm rounded-0" style="width:160px;" />
        </div>
        <div class="col-auto ms-3">
            <span class="fw-semibold">Time</span>
        </div>
        <div class="col-auto">
            <input type="text" class="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" />
        </div>
        <div class="col-auto">
            <span class="fw-semibold">Date</span>
        </div>
        <div class="col-auto">
            <input type="text" class="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
        </div>
        <div class="col-auto ms-2">
            <span class="fw-semibold">Venue</span>
        </div>
        <div class="col">
            <input type="text" class="form-control form-control-sm rounded-0" />
        </div>
    </div>
    <%-- List of Participants --%>
    <div class="row g-1 mb-1 align-items-center">
        <div class="col-auto" style="min-width:130px;">
            <span class="fw-semibold">List of Participants</span>
        </div>
        <div class="col">
            <div class="row g-1 mb-1 align-items-center">
                <div class="col-auto"><label class="small mb-0">Name</label></div>
                <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                <div class="col-auto"><label class="small mb-0">Designation</label></div>
                <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                <div class="col-auto"><label class="small mb-0">Organization</label></div>
                <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
            </div>
            <div class="row g-1 mb-1 align-items-center">
                <div class="col-auto"><label class="small mb-0">Name</label></div>
                <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                <div class="col-auto"><label class="small mb-0">Designation</label></div>
                <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                <div class="col-auto"><label class="small mb-0">Organization</label></div>
                <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
            </div>
            <div class="row g-1 align-items-center">
                <div class="col-auto"><label class="small mb-0">Name</label></div>
                <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                <div class="col-auto"><label class="small mb-0">Designation</label></div>
                <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
            </div>
        </div>
    </div>
    <div class="row g-1 align-items-center">
        <div class="col-auto" style="min-width:130px;">
            <span class="fw-semibold">Organization</span>
        </div>
        <div class="col">
            <input type="text" class="form-control form-control-sm rounded-0" />
        </div>
    </div>
</div>

<%-- Actions --%>
<div class="border p-2" style="font-size:0.83rem;">
    <h6 class="fw-bold mb-3">Actions</h6>

    <%-- Closing Action or Amendments by Meeting Caller --%>
    <div class="row g-0">
        <div class="col-auto pe-3 pt-1" style="min-width:160px;">
            <span class="small fw-semibold">Closing Action or<br />Ammendements<br />by Meeting<br />Caller</span>
        </div>
        <div class="col d-flex flex-column gap-2">

            <%-- Rescheduled --%>
            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:220px;">
                    <input class="form-check-input" type="radio" name="callerAction" id="ca1" value="rescheduled" checked />
                    <label class="form-check-label small" for="ca1">Rescheduled</label>
                </div>
                <label class="small mb-0">Time</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                <label class="small mb-0">Date</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
            </div>

            <%-- New changed Venue --%>
            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:220px;">
                    <input class="form-check-input" type="radio" name="callerAction" id="ca2" value="new_venue" />
                    <label class="form-check-label small" for="ca2">New changed Venue</label>
                </div>
                <label class="small mb-0">Location Id</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:90px;" />
                <label class="small mb-0">Address</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:140px;" />
                <label class="small mb-0">Remarks</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:160px;" />
            </div>

            <%-- Add Participants --%>
            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:220px;">
                    <input class="form-check-input" type="radio" name="callerAction" id="ca3" value="add_participants" />
                    <label class="form-check-label small" for="ca3">Add Participants</label>
                </div>
                <label class="small mb-0">Name</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" />
                <label class="small mb-0">Company</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" />
                <label class="small mb-0">Remarks</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:160px;" />
            </div>

            <%-- Drop Participants --%>
            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:220px;">
                    <input class="form-check-input" type="radio" name="callerAction" id="ca4" value="drop_participants" />
                    <label class="form-check-label small" for="ca4">Drop Participants</label>
                </div>
                <label class="small mb-0">Name</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" />
                <label class="small mb-0">Company</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" />
                <label class="small mb-0">email</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:130px;" />
                <label class="small mb-0">Remarks</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:130px;" />
            </div>

            <%-- Un Finished & Rescheduled --%>
            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:220px;">
                    <input class="form-check-input" type="radio" name="callerAction" id="ca5" value="unfinished_rescheduled" />
                    <label class="form-check-label small" for="ca5">Un Finished &amp; Rescheduled</label>
                </div>
                <label class="small mb-0">Time</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                <label class="small mb-0">Venue Id</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:100px;" />
                <label class="small mb-0">Remarks</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:160px;" />
            </div>

            <%-- Closed & Finished --%>
            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:220px;">
                    <input class="form-check-input" type="radio" name="callerAction" id="ca6" value="closed_finished" />
                    <label class="form-check-label small" for="ca6">Closed &amp; Finished</label>
                </div>
                <label class="small mb-0">Time</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                <label class="small mb-0">Date</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                <label class="small mb-0">Remarks</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:160px;" />
            </div>

        </div>
    </div>

</div>

<%-- Upload Minutes & Picture + Note (bottom-right) --%>
<div class="row g-2 justify-content-end mt-3">
    <div class="col-md-5">
        <div class="border p-2 d-flex flex-column" style="height:90px;">
            <span class="small fw-semibold mb-1">Upload Miniutes &amp; Picture (PDF)</span>
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
