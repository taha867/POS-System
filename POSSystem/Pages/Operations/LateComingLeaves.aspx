<%@ Page Title="Leave &amp; Late Coming" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LateComingLeaves.aspx.vb" Inherits="POSSystem.Pages.Operations.LateComingLeaves" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Heading + Toolbar --%>
    <div class="d-flex align-items-center gap-2 mb-2 px-3 py-2 border flex-wrap" style="background-color:#f8f9fa;">
        <strong class="fs-5 me-2">Leave &amp; Late Coming</strong>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Reporting Manager Approved</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Department Manager Approved</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Dy Manager HR Approved</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Save</button>
        <div class="ms-auto d-flex gap-2">
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Edit</button>
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Print</button>
        </div>
    </div>

    <style>
        #llTabs { flex-wrap: nowrap; overflow-x: auto; }
        #llTabs .nav-link {
            background-color: #e9ecef; color: #495057;
            border-color: #dee2e6; border-radius: 0;
            font-size: 0.78rem; white-space: nowrap;
            padding-left: 0.55rem; padding-right: 0.55rem;
        }
        #llTabs .nav-link.active { background-color: #6c757d; color: #fff; border-color: #6c757d #6c757d #fff; }
        #llTabs .nav-link:focus { box-shadow: none; }
    </style>

    <%-- Tab Navigation --%>
    <ul class="nav nav-tabs" id="llTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active rounded-0" data-bs-toggle="tab"
                    data-bs-target="#pane-latearrivalleaves" type="button" role="tab">
                Late Arrival &amp; Leaves
            </button>
        </li>
    </ul>

    <%-- Tab Content --%>
    <div class="tab-content border border-top-0" id="llTabContent">

        <div class="tab-pane fade show active p-3" id="pane-latearrivalleaves" role="tabpanel">

            <%-- Record # + Date --%>
            <div class="d-flex justify-content-end gap-3 mb-3 flex-wrap" style="font-size:0.83rem;">
                <div class="d-flex align-items-center gap-2">
                    <label class="fw-semibold mb-0" for="txtLlRecordNo">Record #</label>
                    <input type="text" id="txtLlRecordNo" class="form-control form-control-sm rounded-0" style="width:130px;" />
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="fw-semibold mb-0" for="txtLlDate">Date</label>
                    <input type="text" id="txtLlDate" class="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
                </div>
            </div>

            <%-- Employee Info --%>
            <div class="border p-2 mb-3" style="background-color:#f8f9fa; font-size:0.83rem;">
                <div class="row g-2 mb-2 align-items-center">
                    <div class="col-auto"><label class="fw-semibold mb-0" for="txtLlEmpId">Employ ID</label></div>
                    <div class="col-auto"><input type="text" id="txtLlEmpId" class="form-control form-control-sm rounded-0" style="width:110px;" /></div>
                    <div class="col-auto ms-2"><label class="fw-semibold mb-0">Employ Name</label></div>
                    <div class="col-auto">
                        <div class="d-flex flex-column" style="gap:1px;">
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" />
                            <span style="font-size:0.75rem; color:#6c757d;">Last Name</span>
                        </div>
                    </div>
                    <div class="col-auto">
                        <div class="d-flex flex-column" style="gap:1px;">
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" />
                            <span style="font-size:0.75rem; color:#6c757d;">Middle Name</span>
                        </div>
                    </div>
                    <div class="col-auto">
                        <div class="d-flex flex-column" style="gap:1px;">
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" />
                            <span style="font-size:0.75rem; color:#6c757d;">First Name</span>
                        </div>
                    </div>
                </div>
                <div class="row g-2 mb-2 align-items-center">
                    <div class="col-auto"><label class="fw-semibold mb-0" for="txtLlPosition">Position</label></div>
                    <div class="col-auto"><input type="text" id="txtLlPosition" class="form-control form-control-sm rounded-0" style="width:120px;" /></div>
                    <div class="col-auto ms-2"><label class="fw-semibold mb-0" for="txtLlCompany">Company</label></div>
                    <div class="col-auto"><input type="text" id="txtLlCompany" class="form-control form-control-sm rounded-0" style="width:100px;" /></div>
                    <div class="col-auto ms-2"><label class="fw-semibold mb-0" for="txtLlLocation">Location</label></div>
                    <div class="col"><input type="text" id="txtLlLocation" class="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-2 align-items-center">
                    <div class="col-auto"><label class="fw-semibold mb-0" for="txtLlDivision">Division</label></div>
                    <div class="col-auto"><input type="text" id="txtLlDivision" class="form-control form-control-sm rounded-0" style="width:100px;" /></div>
                    <div class="col-auto ms-2"><label class="fw-semibold mb-0" for="txtLlDept">Department</label></div>
                    <div class="col-auto"><input type="text" id="txtLlDept" class="form-control form-control-sm rounded-0" style="width:120px;" /></div>
                    <div class="col-auto ms-2"><label class="fw-semibold mb-0" for="txtLlEmpStart">Employment Starting Date</label></div>
                    <div class="col-auto"><input type="text" id="txtLlEmpStart" class="form-control form-control-sm rounded-0" style="width:120px;" placeholder="MM/DD/YYYY" /></div>
                </div>
            </div>

            <%-- Report --%>
            <div class="border p-2 mb-2" style="font-size:0.83rem;">
                <div class="d-flex align-items-center justify-content-between flex-wrap gap-2">
                    <div class="d-flex align-items-center gap-1">
                        <span class="fw-semibold me-2">Report</span>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="radLlReport" id="radLlLateArrival" />
                            <label class="form-check-label" for="radLlLateArrival">Late Arrival</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="radLlReport" id="radLlSickLeave" checked="checked" />
                            <label class="form-check-label" for="radLlSickLeave">Sick Leave *</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="radLlReport" id="radLlCasualLeave" />
                            <label class="form-check-label" for="radLlCasualLeave">Casual Leave *</label>
                        </div>
                    </div>
                    <div class="d-flex align-items-center gap-2">
                        <label class="mb-0 fw-semibold">Time</label>
                        <input type="text" class="form-control form-control-sm rounded-0" style="width:70px;" placeholder="HH:MM" />
                        <label class="mb-0 fw-semibold">Date</label>
                        <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                    </div>
                </div>
            </div>

            <%-- Request: Early Departure --%>
            <div class="border p-2 mb-2" style="font-size:0.83rem;">
                <div class="d-flex align-items-center justify-content-between flex-wrap gap-2">
                    <div class="d-flex align-items-center gap-1">
                        <span class="fw-semibold me-2">Request</span>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="radLlEarly" id="radLlEarlyDep" />
                            <label class="form-check-label" for="radLlEarlyDep">Early Depatrure *</label>
                        </div>
                    </div>
                    <div class="d-flex align-items-center gap-2">
                        <label class="mb-0 fw-semibold">Time</label>
                        <input type="text" class="form-control form-control-sm rounded-0" style="width:70px;" placeholder="HH:MM" />
                        <label class="mb-0 fw-semibold">Date</label>
                        <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                    </div>
                </div>
            </div>

            <%-- Request: Leave Types --%>
            <div class="border p-2 mb-2" style="font-size:0.83rem;">
                <span class="fw-semibold d-block mb-2">Request</span>
                <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                    <div class="form-check mb-0" style="min-width:160px;">
                        <input class="form-check-input" type="radio" name="radLlLeave" id="radLlFormal" />
                        <label class="form-check-label" for="radLlFormal">Formal Leave **</label>
                    </div>
                    <label class="mb-0">From</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                    <label class="mb-0">To</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                    <label class="mb-0 ms-auto">Date</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                </div>
                <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                    <div class="form-check mb-0" style="min-width:160px;">
                        <input class="form-check-input" type="radio" name="radLlLeave" id="radLlAnnual" checked="checked" />
                        <label class="form-check-label" for="radLlAnnual">Anual Leave ***</label>
                    </div>
                    <label class="mb-0">From</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                    <label class="mb-0">To</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                </div>
                <div class="d-flex align-items-center gap-2 flex-wrap">
                    <div class="form-check mb-0" style="min-width:160px;">
                        <input class="form-check-input" type="radio" name="radLlLeave" id="radLlWithoutPay" />
                        <label class="form-check-label" for="radLlWithoutPay">Leave Without Pay ***</label>
                    </div>
                    <label class="mb-0">From</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                    <label class="mb-0">To</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                </div>
            </div>

            <%-- Reason + Approval --%>
            <div class="border p-2 mb-2" style="font-size:0.83rem;">
                <div class="d-flex align-items-start gap-2 mb-2 flex-wrap">
                    <label class="fw-semibold mb-0 mt-1">Reason</label>
                    <textarea class="form-control form-control-sm rounded-0" rows="2" style="flex:1; resize:vertical; min-width:200px;"></textarea>
                </div>
                <div class="d-flex align-items-center gap-3 flex-wrap">
                    <div class="form-check form-check-inline mb-0">
                        <input class="form-check-input" type="radio" name="radLlApproval" id="radLlApproved" />
                        <label class="form-check-label" for="radLlApproved">Approved</label>
                    </div>
                    <div class="form-check form-check-inline mb-0">
                        <input class="form-check-input" type="radio" name="radLlApproval" id="radLlDisapproved" checked="checked" />
                        <label class="form-check-label" for="radLlDisapproved">Disapproved</label>
                    </div>
                    <div class="form-check form-check-inline mb-0">
                        <input class="form-check-input" type="radio" name="radLlApproval" id="radLlDeffered" />
                        <label class="form-check-label" for="radLlDeffered">Deffered Until</label>
                    </div>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
                </div>
            </div>

            <%-- Proceed + System Status --%>
            <div class="d-flex align-items-center justify-content-between flex-wrap gap-2 mt-2" style="font-size:0.83rem;">
                <div class="d-flex align-items-center gap-3 flex-wrap">
                    <div class="form-check form-check-inline mb-0">
                        <input class="form-check-input" type="radio" name="radLlSystem" id="radLlSysApproved" />
                        <label class="form-check-label" for="radLlSysApproved">Approved by system</label>
                    </div>
                    <div class="form-check form-check-inline mb-0">
                        <input class="form-check-input" type="radio" name="radLlSystem" id="radLlSysDisapproved" checked="checked" />
                        <label class="form-check-label" for="radLlSysDisapproved">Disapproved by System</label>
                    </div>
                </div>
                <div class="d-flex align-items-center gap-3">
                    <span class="small text-secondary">By Reporting Manager Approved</span>
                    <button type="button" class="btn btn-sm btn-primary rounded-0">Proceed</button>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
