<%@ Control Language="VB" AutoEventWireup="true" CodeBehind="ResponseOnMeetingTab.ascx.vb" Inherits="POSSystem.Pages.Operations.MeetingManagementControls.ResponseOnMeetingTab" %>

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
            <span class="fw-semibold">Assigned To:</span>
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
            <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
        </div>
        <div class="col-auto ms-3">
            <span class="fw-semibold">Venue:</span>
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

    <%-- Response by In House Receiver --%>
    <div class="row g-0 mb-3">
        <div class="col-auto pe-3 pt-1" style="min-width:150px;">
            <span class="small fw-semibold">Response<br />by In House<br />Receiver</span>
        </div>
        <div class="col d-flex flex-column gap-2">

            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:220px;">
                    <input class="form-check-input" type="radio" name="inHouseResponse" id="ih1" value="confirm" checked />
                    <label class="form-check-label small" for="ih1">Confirm</label>
                </div>
                <label class="small mb-0">Time</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                <label class="small mb-0">Date</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
            </div>

            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:220px;">
                    <input class="form-check-input" type="radio" name="inHouseResponse" id="ih2" value="change_venue" />
                    <label class="form-check-label small" for="ih2">Please change Venue</label>
                </div>
                <label class="small mb-0">Time</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                <label class="small mb-0">Date</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                <label class="small mb-0">Remarks</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
            </div>

            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:220px;">
                    <input class="form-check-input" type="radio" name="inHouseResponse" id="ih3" value="deffer_until" />
                    <label class="form-check-label small" for="ih3">Please Deffer Until</label>
                </div>
                <label class="small mb-0">Time</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                <label class="small mb-0">Date</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                <label class="small mb-0">Remarks</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
            </div>

            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:220px;">
                    <input class="form-check-input" type="radio" name="inHouseResponse" id="ih4" value="unavailable" />
                    <label class="form-check-label small" for="ih4">I am Unavailabe</label>
                </div>
                <label class="small mb-0">Time</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                <label class="small mb-0">Date</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                <label class="small mb-0">Remarks</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
            </div>

        </div>
    </div>

    <hr class="my-2" />

    <%-- Response by Outside Participant --%>
    <div class="row g-0 mb-3">
        <div class="col-auto pe-3 pt-1" style="min-width:150px;">
            <span class="small fw-semibold">Response<br />by Outside<br />Participant</span>
        </div>
        <div class="col d-flex flex-column gap-2">

            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:220px;">
                    <input class="form-check-input" type="radio" name="outsideResponse" id="out1" value="confirmed_email" checked />
                    <label class="form-check-label small" for="out1">Confirmed by Email</label>
                </div>
                <label class="small mb-0">Time</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                <label class="small mb-0">Date</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                <label class="small mb-0">Remarks</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
            </div>

            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:220px;">
                    <input class="form-check-input" type="radio" name="outsideResponse" id="out2" value="deffer_requested" />
                    <label class="form-check-label small" for="out2">Deffer requested</label>
                </div>
                <label class="small mb-0">Time</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                <label class="small mb-0">Date</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                <label class="small mb-0">Remarks</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
            </div>

            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:220px;">
                    <input class="form-check-input" type="radio" name="outsideResponse" id="out3" value="change_venue" />
                    <label class="form-check-label small" for="out3">Please change Venue</label>
                </div>
                <label class="small mb-0">Time</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                <label class="small mb-0">Date</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                <label class="small mb-0">Remarks</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
            </div>

        </div>
    </div>

    <hr class="my-2" />

    <%-- Final Confirmation --%>
    <div class="row g-0">
        <div class="col-auto pe-3 pt-1" style="min-width:150px;">
            <span class="small fw-semibold">Final<br />Confirmation</span>
        </div>
        <div class="col d-flex flex-column gap-2">

            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:220px;">
                    <input class="form-check-input" type="radio" name="finalConfirmation" id="fc1" value="rescheduled" checked />
                    <label class="form-check-label small" for="fc1">Rescheduled</label>
                </div>
                <label class="small mb-0">Time</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                <label class="small mb-0">Date</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                <label class="small mb-0">Remarks</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
            </div>

            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:220px;">
                    <input class="form-check-input" type="radio" name="finalConfirmation" id="fc2" value="new_venue" />
                    <label class="form-check-label small" for="fc2">New Venue</label>
                </div>
                <label class="small mb-0">Time</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                <label class="small mb-0">Date</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                <label class="small mb-0">Remarks</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
            </div>

            <%-- Final Date, Time & Venue --%>
            <div class="d-flex align-items-center gap-2 flex-wrap mt-1">
                <span class="small fw-semibold" style="min-width:120px;">Date, Time &amp; Venue</span>
                <label class="small mb-0">Final Time</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" />
                <label class="small mb-0">Date</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                <label class="small mb-0">Venue</label>
                <input type="text" class="form-control form-control-sm rounded-0 flex-grow-1" />
            </div>

        </div>
    </div>

</div>

<%-- Upload Outside Participant email response + Note (bottom-right) --%>
<div class="row g-2 justify-content-end mt-3">
    <div class="col-md-5">
        <div class="border p-2 d-flex flex-column" style="height:90px;">
            <span class="small fw-semibold mb-1">Upload Outside Participant's email response</span>
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
