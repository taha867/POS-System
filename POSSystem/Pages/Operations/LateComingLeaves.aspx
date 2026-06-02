<%@ Page Title="Leave &amp; Late Coming" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LateComingLeaves.aspx.vb" Inherits="POSSystem.Pages.Operations.LateComingLeaves" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Heading + Toolbar --%>
    <div class="d-flex align-items-center gap-2 mb-2 px-3 py-2 border flex-wrap" style="background-color:#f8f9fa;">
        <strong class="fs-5 me-2">Leave &amp; Late Coming</strong>
        <asp:Button ID="BtnReportingMgr"  runat="server" Text="Reporting Manager Approved"  UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
        <asp:Button ID="BtnDeptMgr"       runat="server" Text="Department Manager Approved" UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
        <asp:Button ID="BtnDyMgrHR"       runat="server" Text="Dy Manager HR Approved"      UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
        <asp:Button ID="BtnSave"          runat="server" Text="Save"                        UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
        <div class="ms-auto d-flex gap-2">
            <asp:Button ID="BtnEdit"  runat="server" Text="Edit"  UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
            <asp:Button ID="BtnPrint" runat="server" Text="Print" UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
        </div>
    </div>

    <style>
        .ll-tabs { display:flex; list-style:none; margin:0; padding:0; border-bottom:1px solid #dee2e6; flex-wrap:nowrap; overflow-x:auto; }
        .ll-tabs .ll-tab-btn { padding:0.25rem 0.75rem; cursor:pointer; background:#e9ecef; color:#495057; border:1px solid #dee2e6; border-bottom:none; margin-right:2px; font-size:0.78rem; white-space:nowrap; }
        .ll-tabs .ll-tab-btn.active { background:#6c757d; color:#fff; border-color:#6c757d; }
        .ll-tab-content { border:1px solid #dee2e6; border-top:none; }
        .ll-pane { display:none; padding:1rem; }
        .ll-pane.active { display:block; }
    </style>

    <%-- Tab Navigation --%>
    <ul class="ll-tabs" id="llTabs">
        <li><asp:Button runat="server" Text="Late Arrival &amp; Leaves" UseSubmitBehavior="false" CssClass="ll-tab-btn active" OnClientClick="showTab('pane-latearrivalleaves',this); return false;" /></li>
    </ul>

    <%-- Tab Content --%>
    <div class="ll-tab-content" id="llTabContent">

        <div class="ll-pane active" id="pane-latearrivalleaves">

            <%-- Record # + Date --%>
            <div class="d-flex justify-content-end gap-3 mb-3 flex-wrap" style="font-size:0.83rem;">
                <div class="d-flex align-items-center gap-2">
                    <label class="fw-semibold mb-0" for="TxtLlRecordNo">Record #</label>
                    <asp:TextBox ID="TxtLlRecordNo" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:130px;" />
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="fw-semibold mb-0" for="TxtLlDate">Date</label>
                    <asp:TextBox ID="TxtLlDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
                </div>
            </div>

            <%-- Employee Info --%>
            <div class="border p-2 mb-3" style="background-color:#f8f9fa; font-size:0.83rem;">
                <div class="row g-2 mb-2 align-items-center">
                    <div class="col-auto"><label class="fw-semibold mb-0" for="TxtLlEmpId">Employ ID</label></div>
                    <div class="col-auto"><asp:TextBox ID="TxtLlEmpId" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" /></div>
                    <div class="col-auto ms-2"><label class="fw-semibold mb-0">Employ Name</label></div>
                    <div class="col-auto">
                        <div class="d-flex flex-column" style="gap:1px;">
                            <asp:TextBox ID="TxtLlLastName" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" />
                            <span style="font-size:0.75rem; color:#6c757d;">Last Name</span>
                        </div>
                    </div>
                    <div class="col-auto">
                        <div class="d-flex flex-column" style="gap:1px;">
                            <asp:TextBox ID="TxtLlMiddleName" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" />
                            <span style="font-size:0.75rem; color:#6c757d;">Middle Name</span>
                        </div>
                    </div>
                    <div class="col-auto">
                        <div class="d-flex flex-column" style="gap:1px;">
                            <asp:TextBox ID="TxtLlFirstName" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" />
                            <span style="font-size:0.75rem; color:#6c757d;">First Name</span>
                        </div>
                    </div>
                </div>
                <div class="row g-2 mb-2 align-items-center">
                    <div class="col-auto"><label class="fw-semibold mb-0" for="TxtLlPosition">Position</label></div>
                    <div class="col-auto"><asp:TextBox ID="TxtLlPosition" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" /></div>
                    <div class="col-auto ms-2"><label class="fw-semibold mb-0" for="TxtLlCompany">Company</label></div>
                    <div class="col-auto"><asp:TextBox ID="TxtLlCompany" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:100px;" /></div>
                    <div class="col-auto ms-2"><label class="fw-semibold mb-0" for="TxtLlLocation">Location</label></div>
                    <div class="col"><asp:TextBox ID="TxtLlLocation" runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-2 align-items-center">
                    <div class="col-auto"><label class="fw-semibold mb-0" for="TxtLlDivision">Division</label></div>
                    <div class="col-auto"><asp:TextBox ID="TxtLlDivision" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:100px;" /></div>
                    <div class="col-auto ms-2"><label class="fw-semibold mb-0" for="TxtLlDept">Department</label></div>
                    <div class="col-auto"><asp:TextBox ID="TxtLlDept" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" /></div>
                    <div class="col-auto ms-2"><label class="fw-semibold mb-0" for="TxtLlEmpStart">Employment Starting Date</label></div>
                    <div class="col-auto"><asp:TextBox ID="TxtLlEmpStart" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" placeholder="MM/DD/YYYY" /></div>
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

</asp:Content>
