<%@ Control Language="VB" AutoEventWireup="true" CodeBehind="ResponseOnComplainTab.ascx.vb" Inherits="POSSystem.Pages.Operations.ComplaintsAndSuggestionsControls.ResponseOnComplainTab" %>

<%-- Complain ID + Date (top-right) --%>
<div class="d-flex justify-content-end gap-4 mb-3 flex-wrap" style="font-size:0.83rem;">
    <div class="d-flex align-items-center gap-2">
        <label class="fw-semibold mb-0" for="txtRocId">Complain ID</label>
        <input type="text" id="txtRocId" class="form-control form-control-sm rounded-0" style="width:120px;" />
    </div>
    <div class="d-flex align-items-center gap-2">
        <label class="fw-semibold mb-0" for="txtRocDate">Date:</label>
        <input type="text" id="txtRocDate" class="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
    </div>
</div>

<%-- Complain Info Panel --%>
<div class="border p-2 mb-3" style="background-color:#f8f9fa; font-size:0.83rem;">
    <div class="d-flex align-items-center gap-3 mb-1 flex-wrap">
        <label class="fw-semibold mb-0" for="txtRocInfoId">Complain ID:</label>
        <input type="text" id="txtRocInfoId" class="form-control form-control-sm rounded-0" style="width:130px;" />
        <label class="fw-semibold mb-0" for="txtRocAssignedTo">Assigned To:</label>
        <input type="text" id="txtRocAssignedTo" class="form-control form-control-sm rounded-0" style="width:220px;" />
    </div>
    <div class="d-flex align-items-center gap-3 flex-wrap">
        <label class="fw-semibold mb-0" for="txtRocTypeComplain">Type of Complain:</label>
        <input type="text" id="txtRocTypeComplain" class="form-control form-control-sm rounded-0" style="width:150px;" />
        <label class="mb-0" for="txtRocCompany">Company</label>
        <input type="text" id="txtRocCompany" class="form-control form-control-sm rounded-0" style="width:110px;" />
        <label class="mb-0" for="txtRocDept">Department</label>
        <input type="text" id="txtRocDept" class="form-control form-control-sm rounded-0" style="width:110px;" />
    </div>
</div>

<%-- Actions --%>
<div style="font-size:0.83rem;">
    <h6 class="fw-bold mb-2">Actions</h6>

    <%-- Response by 3 Managers --%>
    <div class="border p-2 mb-2">
        <span class="fw-semibold d-block mb-2">Response by 3 Managers</span>

        <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
            <div class="form-check mb-0" style="min-width:220px;">
                <input class="form-check-input" type="radio" name="radRocMgr" id="radRocForwarded" checked />
                <label class="form-check-label" for="radRocForwarded">Forwarded to</label>
            </div>
            <input type="text" class="form-control form-control-sm rounded-0" style="width:120px;" placeholder="Name" />
            <label class="mb-0">Time</label>
            <input type="text" class="form-control form-control-sm rounded-0" style="width:70px;" placeholder="HH:MM" />
            <label class="mb-0">Date</label>
            <input type="text" class="form-control form-control-sm rounded-0" style="width:100px;" placeholder="mm/dd/yyyy" />
            <label class="mb-0">Remarks</label>
            <input type="text" class="form-control form-control-sm rounded-0" style="flex:1; min-width:120px;" />
        </div>

        <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
            <div class="form-check mb-0" style="min-width:220px;">
                <input class="form-check-input" type="radio" name="radRocMgr" id="radRocRect1" />
                <label class="form-check-label" for="radRocRect1">1 Recommended Rectification</label>
            </div>
            <label class="mb-0">Time</label>
            <input type="text" class="form-control form-control-sm rounded-0" style="width:70px;" placeholder="HH:MM" />
            <label class="mb-0">Date</label>
            <input type="text" class="form-control form-control-sm rounded-0" style="width:100px;" placeholder="mm/dd/yyyy" />
            <label class="mb-0">Remarks</label>
            <input type="text" class="form-control form-control-sm rounded-0" style="flex:1; min-width:120px;" />
        </div>

        <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
            <div class="form-check mb-0" style="min-width:220px;">
                <input class="form-check-input" type="radio" name="radRocMgr" id="radRocRect2" />
                <label class="form-check-label" for="radRocRect2">2 Recommended Rectification</label>
            </div>
            <label class="mb-0">Time</label>
            <input type="text" class="form-control form-control-sm rounded-0" style="width:70px;" placeholder="HH:MM" />
            <label class="mb-0">Date</label>
            <input type="text" class="form-control form-control-sm rounded-0" style="width:100px;" placeholder="mm/dd/yyyy" />
            <label class="mb-0">Remarks</label>
            <input type="text" class="form-control form-control-sm rounded-0" style="flex:1; min-width:120px;" />
        </div>

        <div class="d-flex align-items-center gap-2 flex-wrap">
            <div class="form-check mb-0" style="min-width:220px;">
                <input class="form-check-input" type="radio" name="radRocMgr" id="radRocRect3" />
                <label class="form-check-label" for="radRocRect3">3 Recommended Rectification</label>
            </div>
            <label class="mb-0">Time</label>
            <input type="text" class="form-control form-control-sm rounded-0" style="width:70px;" placeholder="HH:MM" />
            <label class="mb-0">Date</label>
            <input type="text" class="form-control form-control-sm rounded-0" style="width:100px;" placeholder="mm/dd/yyyy" />
            <label class="mb-0">Remarks</label>
            <input type="text" class="form-control form-control-sm rounded-0" style="flex:1; min-width:120px;" />
        </div>
    </div>

    <%-- Response by the Complainer --%>
    <div class="border p-2 mb-3">
        <span class="fw-semibold d-block mb-2">Response by the Complainer</span>

        <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
            <div class="form-check mb-0" style="min-width:220px;">
                <input class="form-check-input" type="radio" name="radRocComp" id="radRocSatisfied" checked />
                <label class="form-check-label" for="radRocSatisfied">Satisfied by the Action</label>
            </div>
            <label class="mb-0">Time</label>
            <input type="text" class="form-control form-control-sm rounded-0" style="width:70px;" placeholder="HH:MM" />
            <label class="mb-0">Date</label>
            <input type="text" class="form-control form-control-sm rounded-0" style="width:100px;" placeholder="mm/dd/yyyy" />
        </div>

        <div class="d-flex align-items-center gap-2 flex-wrap">
            <div class="form-check mb-0" style="min-width:220px;">
                <input class="form-check-input" type="radio" name="radRocComp" id="radRocNotSatisfied" />
                <label class="form-check-label" for="radRocNotSatisfied">Not Satisfied</label>
            </div>
            <label class="mb-0">Time</label>
            <input type="text" class="form-control form-control-sm rounded-0" style="width:70px;" placeholder="HH:MM" />
            <label class="mb-0">Date</label>
            <input type="text" class="form-control form-control-sm rounded-0" style="width:100px;" placeholder="mm/dd/yyyy" />
            <label class="mb-0">Remarks</label>
            <input type="text" class="form-control form-control-sm rounded-0" style="flex:1; min-width:120px;" />
        </div>
    </div>
</div>

<%-- Note (bottom-right) --%>
<div class="row g-2 justify-content-end">
    <div class="col-md-4">
        <div class="border p-2 d-flex flex-column" style="height:90px;">
            <span class="small fw-semibold mb-1">Note</span>
            <textarea class="form-control form-control-sm rounded-0" rows="2" style="flex:1; resize:none;"></textarea>
        </div>
    </div>
</div>
