<%@ Page Title="Complaints &amp; Suggestions" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ComplaintsAndSuggestions.aspx.vb" Inherits="POSSystem.Pages.Operations.ComplaintsAndSuggestions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Heading + Toolbar --%>
    <div class="d-flex align-items-center gap-2 mb-2 px-3 py-2 border flex-wrap" style="background-color:#f8f9fa;">
        <strong class="fs-5 me-2">Complains &amp; Suggestions Manager</strong>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Post</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">New</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Save</button>
        <div class="ms-auto d-flex gap-2">
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Delete</button>
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Edit</button>
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Print</button>
        </div>
    </div>

    <style>
        #csTabs { flex-wrap: nowrap; overflow-x: auto; }
        #csTabs .nav-link {
            background-color: #e9ecef; color: #495057; border-color: #dee2e6;
            border-radius: 0; font-size: 0.78rem; white-space: nowrap;
            padding-left: 0.55rem; padding-right: 0.55rem;
        }
        #csTabs .nav-link.active { background-color: #6c757d; color: #fff; border-color: #6c757d #6c757d #fff; }
        #csTabs .nav-link:focus { box-shadow: none; }
    </style>

    <%-- Tab Navigation --%>
    <ul class="nav nav-tabs" id="csTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active rounded-0" data-bs-toggle="tab" data-bs-target="#pane-complainsstatus" type="button" role="tab">Complains Status</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link rounded-0" data-bs-toggle="tab" data-bs-target="#pane-newcomplain" type="button" role="tab">New Complain</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link rounded-0" data-bs-toggle="tab" data-bs-target="#pane-responseoncomplain" type="button" role="tab">Response on Complains &amp; Suggestions</button>
        </li>
    </ul>

    <%-- Tab Content --%>
    <div class="tab-content border border-top-0" id="csTabContent">

        <%-- Complains Status --%>
        <div class="tab-pane fade show active p-3" id="pane-complainsstatus" role="tabpanel">
            <div class="d-flex gap-4 mb-3 flex-wrap" style="font-size:0.83rem;">
                <div class="d-flex flex-column gap-1">
                    <div class="form-check mb-0"><input class="form-check-input" type="checkbox" id="chkCsImportant" checked /><label class="form-check-label" for="chkCsImportant">Important</label></div>
                    <div class="form-check mb-0"><input class="form-check-input" type="checkbox" id="chkCsRegular" /><label class="form-check-label" for="chkCsRegular">Regular</label></div>
                    <div class="form-check mb-0"><input class="form-check-input" type="checkbox" id="chkCsAll" /><label class="form-check-label" for="chkCsAll">All</label></div>
                </div>
                <div class="d-flex flex-column gap-1">
                    <div class="d-flex gap-4 flex-wrap">
                        <div class="form-check form-check-inline mb-0"><input class="form-check-input" type="radio" name="radCsType" id="radCsAll" checked /><label class="form-check-label" for="radCsAll">All Complains</label></div>
                        <div class="form-check form-check-inline mb-0"><input class="form-check-input" type="radio" name="radCsType" id="radCsConduct" /><label class="form-check-label" for="radCsConduct">Cunduct Related Complains</label></div>
                        <div class="form-check form-check-inline mb-0"><input class="form-check-input" type="radio" name="radCsType" id="radCsMgmt" /><label class="form-check-label" for="radCsMgmt">Management Related Complains</label></div>
                    </div>
                    <div class="d-flex gap-4 flex-wrap">
                        <div class="form-check form-check-inline mb-0"><input class="form-check-input" type="radio" name="radCsType" id="radCsFacility" /><label class="form-check-label" for="radCsFacility">Facility Complains</label></div>
                        <div class="form-check form-check-inline mb-0"><input class="form-check-input" type="radio" name="radCsType" id="radCsProduct" /><label class="form-check-label" for="radCsProduct">Product / Production Complains</label></div>
                        <div class="form-check form-check-inline mb-0"><input class="form-check-input" type="radio" name="radCsType" id="radCsOther" /><label class="form-check-label" for="radCsOther">Other</label></div>
                    </div>
                    <div class="d-flex gap-4 flex-wrap">
                        <div class="form-check form-check-inline mb-0"><input class="form-check-input" type="radio" name="radCsType" id="radCsSuggestions" /><label class="form-check-label" for="radCsSuggestions">Sujstions</label></div>
                    </div>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered table-sm mb-0" style="font-size:0.82rem;">
                    <thead style="background-color:#f8f9fa;">
                        <tr>
                            <th class="rounded-0 text-nowrap">Complain Id</th>
                            <th class="rounded-0 text-nowrap">Complain<br />Date &amp; Time</th>
                            <th class="rounded-0">Complain Type</th>
                            <th class="rounded-0">Remarks</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="fw-bold text-nowrap">2345</td><td class="fw-bold text-nowrap">Jan 01, 2016</td>
                            <td style="font-size:0.80rem;">Property Id<br />Flr &amp; Room#<br />Hardware Id</td><td></td>
                        </tr>
                        <tr>
                            <td class="text-nowrap">2346</td><td class="text-nowrap">Jan 01, 2016</td>
                            <td style="font-size:0.80rem;">Machine Id<br />Loaction</td><td></td>
                        </tr>
                        <tr><td class="text-nowrap">2347</td><td class="text-nowrap">Jan 03, 2016</td><td style="font-size:0.80rem;">Form HR27</td><td></td></tr>
                        <tr><td class="text-nowrap">2348</td><td class="text-nowrap">Jan 05, 2016</td><td style="font-size:0.80rem;">VN/Extractor</td><td></td></tr>
                    </tbody>
                </table>
            </div>
        </div>

        <%-- New Complain --%>
        <div class="tab-pane fade p-3" id="pane-newcomplain" role="tabpanel">
            <div class="d-flex justify-content-end gap-4 mb-3 flex-wrap" style="font-size:0.83rem;">
                <div class="d-flex align-items-center gap-2">
                    <label class="fw-semibold mb-0" for="txtNcId">Complain % Suggestion ID:</label>
                    <input type="text" id="txtNcId" class="form-control form-control-sm rounded-0" style="width:120px;" />
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="fw-semibold mb-0" for="txtNcDate">Date:</label>
                    <input type="text" id="txtNcDate" class="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
                </div>
            </div>
            <div class="d-flex gap-4 mb-2 ps-2 flex-wrap" style="font-size:0.83rem;">
                <div class="form-check mb-0"><input class="form-check-input" type="radio" name="radNcMain" id="radNcComplain" /><label class="form-check-label" for="radNcComplain">Complain</label></div>
                <div class="form-check mb-0"><input class="form-check-input" type="radio" name="radNcMain" id="radNcSuggestion" checked /><label class="form-check-label" for="radNcSuggestion">Suggestion</label></div>
            </div>
            <div class="d-flex gap-4 mb-3 flex-wrap" style="font-size:0.83rem;">
                <div class="d-flex flex-column gap-1">
                    <div class="form-check mb-0"><input class="form-check-input" type="checkbox" id="chkNcImportant" checked /><label class="form-check-label" for="chkNcImportant">Important</label></div>
                    <div class="form-check mb-0"><input class="form-check-input" type="checkbox" id="chkNcRegular" /><label class="form-check-label" for="chkNcRegular">Regular</label></div>
                    <div class="form-check mb-0"><input class="form-check-input" type="checkbox" id="chkNcAll" /><label class="form-check-label" for="chkNcAll">All</label></div>
                </div>
                <div class="d-flex flex-column gap-1">
                    <div class="d-flex gap-4 flex-wrap">
                        <div class="form-check form-check-inline mb-0"><input class="form-check-input" type="radio" name="radNcType" id="radNcAllComp" checked /><label class="form-check-label" for="radNcAllComp">All Complains</label></div>
                        <div class="form-check form-check-inline mb-0"><input class="form-check-input" type="radio" name="radNcType" id="radNcConduct" /><label class="form-check-label" for="radNcConduct">Cunduct Related Complains</label></div>
                        <div class="form-check form-check-inline mb-0"><input class="form-check-input" type="radio" name="radNcType" id="radNcMgmt" /><label class="form-check-label" for="radNcMgmt">Management Related Complains</label></div>
                    </div>
                    <div class="d-flex gap-4 flex-wrap">
                        <div class="form-check form-check-inline mb-0"><input class="form-check-input" type="radio" name="radNcType" id="radNcFacility" /><label class="form-check-label" for="radNcFacility">Facility Complains</label></div>
                        <div class="form-check form-check-inline mb-0"><input class="form-check-input" type="radio" name="radNcType" id="radNcProduct" /><label class="form-check-label" for="radNcProduct">Product / Production Complains</label></div>
                        <div class="form-check form-check-inline mb-0"><input class="form-check-input" type="radio" name="radNcType" id="radNcOther" /><label class="form-check-label" for="radNcOther">Other</label></div>
                    </div>
                </div>
            </div>
            <div class="mb-3" style="font-size:0.83rem;">
                <label class="fw-semibold mb-1">Complain or Sujstions Details:</label>
                <textarea class="form-control form-control-sm rounded-0" rows="6" style="resize:vertical; width:100%;"></textarea>
            </div>
            <div class="row g-2 justify-content-end">
                <div class="col-md-4">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Upload Picture (PDF)</span>
                        <input type="file" class="form-control form-control-sm rounded-0" style="font-size:0.8rem;" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Note</span>
                        <textarea class="form-control form-control-sm rounded-0" rows="2" style="flex:1; resize:none;"></textarea>
                    </div>
                </div>
            </div>
        </div>

        <%-- Response on Complain --%>
        <div class="tab-pane fade p-3" id="pane-responseoncomplain" role="tabpanel">
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
            <div style="font-size:0.83rem;">
                <h6 class="fw-bold mb-2">Actions</h6>
                <div class="border p-2 mb-2">
                    <span class="fw-semibold d-block mb-2">Response by 3 Managers</span>
                    <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                        <div class="form-check mb-0" style="min-width:220px;"><input class="form-check-input" type="radio" name="radRocMgr" id="radRocForwarded" checked /><label class="form-check-label" for="radRocForwarded">Forwarded to</label></div>
                        <input type="text" class="form-control form-control-sm rounded-0" style="width:120px;" placeholder="Name" />
                        <label class="mb-0">Time</label><input type="text" class="form-control form-control-sm rounded-0" style="width:70px;" placeholder="HH:MM" />
                        <label class="mb-0">Date</label><input type="text" class="form-control form-control-sm rounded-0" style="width:100px;" placeholder="mm/dd/yyyy" />
                        <label class="mb-0">Remarks</label><input type="text" class="form-control form-control-sm rounded-0" style="flex:1; min-width:120px;" />
                    </div>
                    <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                        <div class="form-check mb-0" style="min-width:220px;"><input class="form-check-input" type="radio" name="radRocMgr" id="radRocRect1" /><label class="form-check-label" for="radRocRect1">1 Recommended Rectification</label></div>
                        <label class="mb-0">Time</label><input type="text" class="form-control form-control-sm rounded-0" style="width:70px;" placeholder="HH:MM" />
                        <label class="mb-0">Date</label><input type="text" class="form-control form-control-sm rounded-0" style="width:100px;" placeholder="mm/dd/yyyy" />
                        <label class="mb-0">Remarks</label><input type="text" class="form-control form-control-sm rounded-0" style="flex:1; min-width:120px;" />
                    </div>
                    <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                        <div class="form-check mb-0" style="min-width:220px;"><input class="form-check-input" type="radio" name="radRocMgr" id="radRocRect2" /><label class="form-check-label" for="radRocRect2">2 Recommended Rectification</label></div>
                        <label class="mb-0">Time</label><input type="text" class="form-control form-control-sm rounded-0" style="width:70px;" placeholder="HH:MM" />
                        <label class="mb-0">Date</label><input type="text" class="form-control form-control-sm rounded-0" style="width:100px;" placeholder="mm/dd/yyyy" />
                        <label class="mb-0">Remarks</label><input type="text" class="form-control form-control-sm rounded-0" style="flex:1; min-width:120px;" />
                    </div>
                    <div class="d-flex align-items-center gap-2 flex-wrap">
                        <div class="form-check mb-0" style="min-width:220px;"><input class="form-check-input" type="radio" name="radRocMgr" id="radRocRect3" /><label class="form-check-label" for="radRocRect3">3 Recommended Rectification</label></div>
                        <label class="mb-0">Time</label><input type="text" class="form-control form-control-sm rounded-0" style="width:70px;" placeholder="HH:MM" />
                        <label class="mb-0">Date</label><input type="text" class="form-control form-control-sm rounded-0" style="width:100px;" placeholder="mm/dd/yyyy" />
                        <label class="mb-0">Remarks</label><input type="text" class="form-control form-control-sm rounded-0" style="flex:1; min-width:120px;" />
                    </div>
                </div>
                <div class="border p-2 mb-3">
                    <span class="fw-semibold d-block mb-2">Response by the Complainer</span>
                    <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                        <div class="form-check mb-0" style="min-width:220px;"><input class="form-check-input" type="radio" name="radRocComp" id="radRocSatisfied" checked /><label class="form-check-label" for="radRocSatisfied">Satisfied by the Action</label></div>
                        <label class="mb-0">Time</label><input type="text" class="form-control form-control-sm rounded-0" style="width:70px;" placeholder="HH:MM" />
                        <label class="mb-0">Date</label><input type="text" class="form-control form-control-sm rounded-0" style="width:100px;" placeholder="mm/dd/yyyy" />
                    </div>
                    <div class="d-flex align-items-center gap-2 flex-wrap">
                        <div class="form-check mb-0" style="min-width:220px;"><input class="form-check-input" type="radio" name="radRocComp" id="radRocNotSatisfied" /><label class="form-check-label" for="radRocNotSatisfied">Not Satisfied</label></div>
                        <label class="mb-0">Time</label><input type="text" class="form-control form-control-sm rounded-0" style="width:70px;" placeholder="HH:MM" />
                        <label class="mb-0">Date</label><input type="text" class="form-control form-control-sm rounded-0" style="width:100px;" placeholder="mm/dd/yyyy" />
                        <label class="mb-0">Remarks</label><input type="text" class="form-control form-control-sm rounded-0" style="flex:1; min-width:120px;" />
                    </div>
                </div>
            </div>
            <div class="row g-2 justify-content-end">
                <div class="col-md-4">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Note</span>
                        <textarea class="form-control form-control-sm rounded-0" rows="2" style="flex:1; resize:none;"></textarea>
                    </div>
                </div>
            </div>
        </div>

    </div>

</asp:Content>
