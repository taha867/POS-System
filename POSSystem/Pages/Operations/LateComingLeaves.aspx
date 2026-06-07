<%@ Page Title="Leave &amp; Late Coming" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LateComingLeaves.aspx.vb" Inherits="POSSystem.Pages.Operations.LateComingLeaves" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .leave-form { background:#f2f2f2; font-family:Arial,sans-serif; padding:0 0 12px; }
        .leave-form label,
        .leave-form span,
        .leave-form .fw-semibold,
        .leave-form .fw-bold { font-style:italic; }
        .ll-header { background:#d9d9d9; border:1px solid #555; min-height:76px; }
        .ll-title { color:#666; font-size:2rem; font-style:italic; font-weight:700; line-height:1; }
        .ll-toolbar { gap:14px; padding:0 8px; }
        .ll-command-btn { color:#002d62; font-size:10px; font-weight:700; height:52px; line-height:1.1; white-space:normal; width:78px; }
        .ll-approval-btn { width:96px; }
        .ll-tabs { display:flex; list-style:none; margin:20px 0 0; padding:0; flex-wrap:nowrap; overflow-x:auto; }
        .ll-tabs .ll-tab-btn {
            background:#a8a8a8; border:2px solid #000; border-bottom:none; color:#111; cursor:pointer;
            font-size:14px; font-style:italic; font-weight:700; height:86px; line-height:1.15; margin:0 4px 0 0;
            min-width:240px; padding:0 22px; white-space:normal;
        }
        .ll-tabs .ll-tab-btn.active { background:#b0b0b0; color:#111; border-color:#000; }
        .ll-tab-content { background:#f2f2f2; border:2px solid #000; min-height:520px; }
        .ll-pane { display:none; padding:28px 30px 34px; }
        .ll-pane.active { display:block; }
        .leave-form .form-control,
        .leave-form .form-select { border-color:#555; border-radius:0 !important; font-size:12px; font-style:italic; max-width:none; }
        .leave-form .border { border-color:#000 !important; }
        .leave-form #TxtLlLastName,
        .leave-form #TxtLlMiddleName,
        .leave-form #TxtLlFirstName { width:135px !important; }
        .leave-form #TxtLlPosition,
        .leave-form #TxtLlDept,
        .leave-form #TxtLlEmpStart { width:140px !important; }
        .leave-form #TxtLlLocation,
        .leave-form #TxtReason { width:100% !important; }
        .ll-record-row { font-size:0.83rem; }
        .ll-record-field { align-items:center; display:flex; gap:12px; }
        .ll-record-field label { flex:0 0 auto; margin-bottom:0; text-align:right; white-space:nowrap; }
        .ll-record-field label { min-width:82px; }
        .ll-employee-card { background-color:#f8f9fa; font-size:0.83rem; overflow:hidden; padding:14px 14px 12px !important; }
        .ll-employee-grid {
            align-items:start;
            column-gap:14px;
            display:grid;
            grid-template-columns: 100px minmax(0, 1fr) 130px minmax(0, 1fr) 210px minmax(0, 1fr);
            row-gap:12px;
            width:100%;
        }
        .ll-field-label { font-weight:600; margin-top:7px; text-align:right; white-space:nowrap; }
        .ll-control-wrap,
        .ll-name-control { min-width:0; }
        .ll-control-wrap .form-control,
        .ll-name-control .form-control { height:34px; width:100% !important; }
        .ll-employee-card #TxtLlEmpId,
        .ll-employee-card #TxtLlLastName,
        .ll-employee-card #TxtLlMiddleName,
        .ll-employee-card #TxtLlFirstName,
        .ll-employee-card #TxtLlPosition,
        .ll-employee-card #TxtLlCompany,
        .ll-employee-card #TxtLlLocation,
        .ll-employee-card #TxtLlDivision,
        .ll-employee-card #TxtLlDept,
        .ll-employee-card #TxtLlEmpStart { width:100% !important; }
        .ll-name-caption { color:#6c757d; display:block; font-size:0.75rem; margin-top:4px; }
        @media (max-width: 991.98px) {
            .ll-record-field { align-items:flex-start; flex-direction:column; gap:5px; }
            .ll-record-field label { min-width:0; text-align:left; }
            .ll-employee-grid { display:block; }
            .ll-field-label { display:block; margin:10px 0 4px; text-align:left; }
            .ll-control-wrap,
            .ll-name-control { margin-bottom:10px; }
        }
    </style>

    <div class="leave-form">
        <%-- Heading + Toolbar --%>
        <div class="row g-0 align-items-stretch ll-header">
            <div class="col d-flex align-items-center px-4">
                <strong class="ll-title">Leave &amp; Late Coming</strong>
            </div>
            <div class="col-auto d-flex align-items-center justify-content-end flex-wrap ll-toolbar">
                <asp:Button ID="BtnReportingMgr"  runat="server" Text="Reporting Manager Approved"  UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ll-command-btn ll-approval-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnDeptMgr"       runat="server" Text="Department Manager Approved" UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ll-command-btn ll-approval-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnDyMgrHR"       runat="server" Text="Dy Manager HR Approved"      UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ll-command-btn ll-approval-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnSave"          runat="server" Text="Save"                        UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ll-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnEdit"          runat="server" Text="Edit"                        UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ll-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnPrint"         runat="server" Text="Print"                       UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ll-command-btn" OnClientClick="return false;" />
            </div>
        </div>

    <%-- Tab Navigation --%>
    <ul class="ll-tabs" id="llTabs">
        <li><asp:Button runat="server" Text="Late Arrival &amp; Leaves" UseSubmitBehavior="false" CssClass="ll-tab-btn active" OnClientClick="showTab('pane-latearrivalleaves',this); return false;" /></li>
    </ul>

    <%-- Tab Content --%>
    <div class="ll-tab-content" id="llTabContent">

        <div class="ll-pane active" id="pane-latearrivalleaves">

            <%-- Record # + Date --%>
            <div class="row g-3 justify-content-end align-items-center mb-4 ll-record-row">
                <div class="col-auto">
                    <div class="ll-record-field">
                    <label class="fw-semibold mb-0" for="TxtLlRecordNo">Record #</label>
                    <asp:TextBox ID="TxtLlRecordNo" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                    </div>
                </div>
                <div class="col-auto">
                    <div class="ll-record-field">
                    <label class="fw-semibold mb-0" for="TxtLlDate">Date</label>
                    <asp:TextBox ID="TxtLlDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:170px;" placeholder="mm/dd/yyyy" />
                    </div>
                </div>
            </div>

            <%-- Employee Info --%>
            <div class="border mb-3 ll-employee-card">
                <div class="ll-employee-grid">
                    <label class="ll-field-label" for="TxtLlEmpId">Employ ID</label>
                    <div class="ll-control-wrap"><asp:TextBox ID="TxtLlEmpId" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" /></div>
                    <label class="ll-field-label">Employ Name</label>
                    <div class="ll-name-control">
                        <asp:TextBox ID="TxtLlLastName" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" />
                        <span class="ll-name-caption">Last Name</span>
                    </div>
                    <div class="ll-name-control">
                        <asp:TextBox ID="TxtLlMiddleName" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" />
                        <span class="ll-name-caption">Middle Name</span>
                    </div>
                    <div class="ll-name-control">
                        <asp:TextBox ID="TxtLlFirstName" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" />
                        <span class="ll-name-caption">First Name</span>
                    </div>

                    <label class="ll-field-label" for="TxtLlPosition">Position</label>
                    <div class="ll-control-wrap"><asp:TextBox ID="TxtLlPosition" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" /></div>
                    <label class="ll-field-label" for="TxtLlCompany">Company</label>
                    <div class="ll-control-wrap"><asp:TextBox ID="TxtLlCompany" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:100px;" /></div>
                    <label class="ll-field-label" for="TxtLlLocation">Location</label>
                    <div class="ll-control-wrap"><asp:TextBox ID="TxtLlLocation" runat="server" CssClass="form-control form-control-sm rounded-0" /></div>

                    <label class="ll-field-label" for="TxtLlDivision">Division</label>
                    <div class="ll-control-wrap"><asp:TextBox ID="TxtLlDivision" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:100px;" /></div>
                    <label class="ll-field-label" for="TxtLlDept">Department</label>
                    <div class="ll-control-wrap"><asp:TextBox ID="TxtLlDept" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" /></div>
                    <label class="ll-field-label" for="TxtLlEmpStart">Employment Starting Date</label>
                    <div class="ll-control-wrap"><asp:TextBox ID="TxtLlEmpStart" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" placeholder="MM/DD/YYYY" /></div>
                </div>
            </div>

            <%-- Report --%>
            <div class="border p-2 mb-2" style="font-size:0.83rem;">
                <div class="d-flex align-items-center justify-content-between flex-wrap gap-2">
                    <div class="d-flex align-items-center gap-1">
                        <span class="fw-semibold me-2">Report</span>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="radLlLateArrival" runat="server" ClientIDMode="Static" GroupName="radLlReport" CssClass="form-check-input" />
                            <label class="form-check-label" for="radLlLateArrival">Late Arrival</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="radLlSickLeave" runat="server" ClientIDMode="Static" GroupName="radLlReport" CssClass="form-check-input" Checked="true" />
                            <label class="form-check-label" for="radLlSickLeave">Sick Leave *</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="radLlCasualLeave" runat="server" ClientIDMode="Static" GroupName="radLlReport" CssClass="form-check-input" />
                            <label class="form-check-label" for="radLlCasualLeave">Casual Leave *</label>
                        </div>
                    </div>
                    <div class="d-flex align-items-center gap-2">
                        <label class="mb-0 fw-semibold">Time</label>
                        <asp:TextBox ID="TxtReportTime" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:70px;" placeholder="HH:MM" />
                        <label class="mb-0 fw-semibold">Date</label>
                        <asp:TextBox ID="TxtReportDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                    </div>
                </div>
            </div>

            <%-- Request: Early Departure --%>
            <div class="border p-2 mb-2" style="font-size:0.83rem;">
                <div class="d-flex align-items-center justify-content-between flex-wrap gap-2">
                    <div class="d-flex align-items-center gap-1">
                        <span class="fw-semibold me-2">Request</span>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="radLlEarlyDep" runat="server" ClientIDMode="Static" GroupName="radLlEarly" CssClass="form-check-input" />
                            <label class="form-check-label" for="radLlEarlyDep">Early Depatrure *</label>
                        </div>
                    </div>
                    <div class="d-flex align-items-center gap-2">
                        <label class="mb-0 fw-semibold">Time</label>
                        <asp:TextBox ID="TxtEarlyTime" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:70px;" placeholder="HH:MM" />
                        <label class="mb-0 fw-semibold">Date</label>
                        <asp:TextBox ID="TxtEarlyDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                    </div>
                </div>
            </div>

            <%-- Request: Leave Types --%>
            <div class="border p-2 mb-2" style="font-size:0.83rem;">
                <span class="fw-semibold d-block mb-2">Request</span>
                <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                    <div class="form-check mb-0" style="min-width:160px;">
                        <asp:RadioButton ID="radLlFormal" runat="server" ClientIDMode="Static" GroupName="radLlLeave" CssClass="form-check-input" />
                        <label class="form-check-label" for="radLlFormal">Formal Leave **</label>
                    </div>
                    <label class="mb-0">From</label>
                    <asp:TextBox ID="TxtFormalFrom" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                    <label class="mb-0">To</label>
                    <asp:TextBox ID="TxtFormalTo"   runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                    <label class="mb-0 ms-auto">Date</label>
                    <asp:TextBox ID="TxtFormalDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                </div>
                <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                    <div class="form-check mb-0" style="min-width:160px;">
                        <asp:RadioButton ID="radLlAnnual" runat="server" ClientIDMode="Static" GroupName="radLlLeave" CssClass="form-check-input" Checked="true" />
                        <label class="form-check-label" for="radLlAnnual">Anual Leave ***</label>
                    </div>
                    <label class="mb-0">From</label>
                    <asp:TextBox ID="TxtAnnualFrom" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                    <label class="mb-0">To</label>
                    <asp:TextBox ID="TxtAnnualTo"   runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                </div>
                <div class="d-flex align-items-center gap-2 flex-wrap">
                    <div class="form-check mb-0" style="min-width:160px;">
                        <asp:RadioButton ID="radLlWithoutPay" runat="server" ClientIDMode="Static" GroupName="radLlLeave" CssClass="form-check-input" />
                        <label class="form-check-label" for="radLlWithoutPay">Leave Without Pay ***</label>
                    </div>
                    <label class="mb-0">From</label>
                    <asp:TextBox ID="TxtUnpaidFrom" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                    <label class="mb-0">To</label>
                    <asp:TextBox ID="TxtUnpaidTo"   runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                </div>
            </div>

            <%-- Reason + Approval --%>
            <div class="border p-2 mb-2" style="font-size:0.83rem;">
                <div class="d-flex align-items-start gap-2 mb-2 flex-wrap">
                    <label class="fw-semibold mb-0 mt-1">Reason</label>
                    <asp:TextBox ID="TxtReason" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="2" style="flex:1; resize:vertical; min-width:200px;" />
                </div>
                <div class="d-flex align-items-center gap-3 flex-wrap">
                    <div class="form-check form-check-inline mb-0">
                        <asp:RadioButton ID="radLlApproved"    runat="server" ClientIDMode="Static" GroupName="radLlApproval" CssClass="form-check-input" />
                        <label class="form-check-label" for="radLlApproved">Approved</label>
                    </div>
                    <div class="form-check form-check-inline mb-0">
                        <asp:RadioButton ID="radLlDisapproved" runat="server" ClientIDMode="Static" GroupName="radLlApproval" CssClass="form-check-input" Checked="true" />
                        <label class="form-check-label" for="radLlDisapproved">Disapproved</label>
                    </div>
                    <div class="form-check form-check-inline mb-0">
                        <asp:RadioButton ID="radLlDeffered"    runat="server" ClientIDMode="Static" GroupName="radLlApproval" CssClass="form-check-input" />
                        <label class="form-check-label" for="radLlDeffered">Deffered Until</label>
                    </div>
                    <asp:TextBox ID="TxtApprovalDeferDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
                </div>
            </div>

            <%-- Proceed + System Status --%>
            <div class="d-flex align-items-center justify-content-between flex-wrap gap-2 mt-2" style="font-size:0.83rem;">
                <div class="d-flex align-items-center gap-3 flex-wrap">
                    <div class="form-check form-check-inline mb-0">
                        <asp:RadioButton ID="radLlSysApproved"    runat="server" ClientIDMode="Static" GroupName="radLlSystem" CssClass="form-check-input" />
                        <label class="form-check-label" for="radLlSysApproved">Approved by system</label>
                    </div>
                    <div class="form-check form-check-inline mb-0">
                        <asp:RadioButton ID="radLlSysDisapproved" runat="server" ClientIDMode="Static" GroupName="radLlSystem" CssClass="form-check-input" Checked="true" />
                        <label class="form-check-label" for="radLlSysDisapproved">Disapproved by System</label>
                    </div>
                </div>
                <div class="d-flex align-items-center gap-3">
                    <span class="small text-secondary">By Reporting Manager Approved</span>
                    <asp:Button ID="BtnProceed" runat="server" Text="Proceed" UseSubmitBehavior="false" CssClass="btn btn-sm btn-primary rounded-0" OnClientClick="return false;" />
                </div>
            </div>

        </div>
    </div>

    <script type="text/javascript">
        function showTab(paneid, clickedBtn) {
            var panes = document.querySelectorAll('#llTabContent .ll-pane');
            for (var i = 0; i < panes.length; i++) { panes[i].classList.remove('active'); }
            var btns = document.querySelectorAll('#llTabs .ll-tab-btn');
            for (var j = 0; j < btns.length; j++) { btns[j].classList.remove('active'); }
            document.getElementById(paneid).classList.add('active');
            clickedBtn.classList.add('active');
        }
    </script>

    </div>

</asp:Content>
