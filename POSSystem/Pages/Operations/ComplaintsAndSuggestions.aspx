<%@ Page Title="Complaints &amp; Suggestions" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ComplaintsAndSuggestions.aspx.vb" Inherits="POSSystem.Pages.Operations.ComplaintsAndSuggestions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Heading + Toolbar --%>
    <div class="d-flex align-items-center gap-2 mb-2 px-3 py-2 border flex-wrap" style="background-color:#f8f9fa;">
        <strong class="fs-5 me-2">Complains &amp; Suggestions Manager</strong>
        <asp:Button ID="BtnPost"   runat="server" Text="Post"   UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
        <asp:Button ID="BtnNew"    runat="server" Text="New"    UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
        <asp:Button ID="BtnSave"   runat="server" Text="Save"   UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
        <div class="ms-auto d-flex gap-2">
            <asp:Button ID="BtnDelete" runat="server" Text="Delete" UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
            <asp:Button ID="BtnEdit"   runat="server" Text="Edit"   UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
            <asp:Button ID="BtnPrint"  runat="server" Text="Print"  UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
        </div>
    </div>

    <style>
        .cs-tabs { display:flex; list-style:none; margin:0; padding:0; border-bottom:1px solid #dee2e6; flex-wrap:nowrap; overflow-x:auto; }
        .cs-tabs .cs-tab-btn { padding:0.25rem 0.75rem; cursor:pointer; background:#e9ecef; color:#495057; border:1px solid #dee2e6; border-bottom:none; margin-right:2px; font-size:0.78rem; white-space:nowrap; }
        .cs-tabs .cs-tab-btn.active { background:#6c757d; color:#fff; border-color:#6c757d; }
        .cs-tab-content { border:1px solid #dee2e6; border-top:none; }
        .cs-pane { display:none; padding:1rem; }
        .cs-pane.active { display:block; }
    </style>

    <%-- Tab Navigation --%>
    <ul class="cs-tabs" id="csTabs">
        <li><asp:Button runat="server" Text="Complains Status"                        UseSubmitBehavior="false" CssClass="cs-tab-btn active" OnClientClick="showTab('pane-complainsstatus',this);   return false;" /></li>
        <li><asp:Button runat="server" Text="New Complain"                             UseSubmitBehavior="false" CssClass="cs-tab-btn"        OnClientClick="showTab('pane-newcomplain',this);         return false;" /></li>
        <li><asp:Button runat="server" Text="Response on Complains &amp; Suggestions"  UseSubmitBehavior="false" CssClass="cs-tab-btn"        OnClientClick="showTab('pane-responseoncomplain',this); return false;" /></li>
    </ul>

    <%-- Tab Content --%>
    <div class="cs-tab-content" id="csTabContent">

        <%-- Complains Status --%>
        <div class="cs-pane active" id="pane-complainsstatus">
            <div class="d-flex gap-4 mb-3 flex-wrap" style="font-size:0.83rem;">
                <div class="d-flex flex-column gap-1">
                    <div class="form-check mb-0"><asp:CheckBox ID="ChkCsImportant" runat="server" ClientIDMode="Static" CssClass="form-check-input" Checked="true" /><label class="form-check-label" for="ChkCsImportant">Important</label></div>
                    <div class="form-check mb-0"><asp:CheckBox ID="ChkCsRegular"   runat="server" ClientIDMode="Static" CssClass="form-check-input" /><label class="form-check-label" for="ChkCsRegular">Regular</label></div>
                    <div class="form-check mb-0"><asp:CheckBox ID="ChkCsAll"       runat="server" ClientIDMode="Static" CssClass="form-check-input" /><label class="form-check-label" for="ChkCsAll">All</label></div>
                </div>
                <div class="d-flex flex-column gap-1">
                    <div class="d-flex gap-4 flex-wrap">
                        <div class="form-check form-check-inline mb-0"><asp:RadioButton ID="radCsAll"     runat="server" ClientIDMode="Static" GroupName="radCsType" CssClass="form-check-input" Checked="true" /><label class="form-check-label" for="radCsAll">All Complains</label></div>
                        <div class="form-check form-check-inline mb-0"><asp:RadioButton ID="radCsConduct" runat="server" ClientIDMode="Static" GroupName="radCsType" CssClass="form-check-input" /><label class="form-check-label" for="radCsConduct">Cunduct Related Complains</label></div>
                        <div class="form-check form-check-inline mb-0"><asp:RadioButton ID="radCsMgmt"    runat="server" ClientIDMode="Static" GroupName="radCsType" CssClass="form-check-input" /><label class="form-check-label" for="radCsMgmt">Management Related Complains</label></div>
                    </div>
                    <div class="d-flex gap-4 flex-wrap">
                        <div class="form-check form-check-inline mb-0"><asp:RadioButton ID="radCsFacility"    runat="server" ClientIDMode="Static" GroupName="radCsType" CssClass="form-check-input" /><label class="form-check-label" for="radCsFacility">Facility Complains</label></div>
                        <div class="form-check form-check-inline mb-0"><asp:RadioButton ID="radCsProduct"     runat="server" ClientIDMode="Static" GroupName="radCsType" CssClass="form-check-input" /><label class="form-check-label" for="radCsProduct">Product / Production Complains</label></div>
                        <div class="form-check form-check-inline mb-0"><asp:RadioButton ID="radCsOther"       runat="server" ClientIDMode="Static" GroupName="radCsType" CssClass="form-check-input" /><label class="form-check-label" for="radCsOther">Other</label></div>
                    </div>
                    <div class="d-flex gap-4 flex-wrap">
                        <div class="form-check form-check-inline mb-0"><asp:RadioButton ID="radCsSuggestions" runat="server" ClientIDMode="Static" GroupName="radCsType" CssClass="form-check-input" /><label class="form-check-label" for="radCsSuggestions">Sujstions</label></div>
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
                        <tr><td class="fw-bold text-nowrap">2345</td><td class="fw-bold text-nowrap">Jan 01, 2016</td><td style="font-size:0.80rem;">Property Id<br />Flr &amp; Room#<br />Hardware Id</td><td></td></tr>
                        <tr><td class="text-nowrap">2346</td><td class="text-nowrap">Jan 01, 2016</td><td style="font-size:0.80rem;">Machine Id<br />Loaction</td><td></td></tr>
                        <tr><td class="text-nowrap">2347</td><td class="text-nowrap">Jan 03, 2016</td><td style="font-size:0.80rem;">Form HR27</td><td></td></tr>
                        <tr><td class="text-nowrap">2348</td><td class="text-nowrap">Jan 05, 2016</td><td style="font-size:0.80rem;">VN/Extractor</td><td></td></tr>
                    </tbody>
                </table>
            </div>
        </div>

        <%-- New Complain --%>
        <div class="cs-pane" id="pane-newcomplain">
            <div class="d-flex justify-content-end gap-4 mb-3 flex-wrap" style="font-size:0.83rem;">
                <div class="d-flex align-items-center gap-2">
                    <label class="fw-semibold mb-0" for="TxtNcId">Complain &amp; Suggestion ID:</label>
                    <asp:TextBox ID="TxtNcId"   runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" />
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="fw-semibold mb-0" for="TxtNcDate">Date:</label>
                    <asp:TextBox ID="TxtNcDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
                </div>
            </div>
            <div class="d-flex gap-4 mb-2 ps-2 flex-wrap" style="font-size:0.83rem;">
                <div class="form-check mb-0"><asp:RadioButton ID="radNcComplain"   runat="server" ClientIDMode="Static" GroupName="radNcMain" CssClass="form-check-input" /><label class="form-check-label" for="radNcComplain">Complain</label></div>
                <div class="form-check mb-0"><asp:RadioButton ID="radNcSuggestion" runat="server" ClientIDMode="Static" GroupName="radNcMain" CssClass="form-check-input" Checked="true" /><label class="form-check-label" for="radNcSuggestion">Suggestion</label></div>
            </div>
            <div class="d-flex gap-4 mb-3 flex-wrap" style="font-size:0.83rem;">
                <div class="d-flex flex-column gap-1">
                    <div class="form-check mb-0"><asp:CheckBox ID="ChkNcImportant" runat="server" ClientIDMode="Static" CssClass="form-check-input" Checked="true" /><label class="form-check-label" for="ChkNcImportant">Important</label></div>
                    <div class="form-check mb-0"><asp:CheckBox ID="ChkNcRegular"   runat="server" ClientIDMode="Static" CssClass="form-check-input" /><label class="form-check-label" for="ChkNcRegular">Regular</label></div>
                    <div class="form-check mb-0"><asp:CheckBox ID="ChkNcAll"       runat="server" ClientIDMode="Static" CssClass="form-check-input" /><label class="form-check-label" for="ChkNcAll">All</label></div>
                </div>
                <div class="d-flex flex-column gap-1">
                    <div class="d-flex gap-4 flex-wrap">
                        <div class="form-check form-check-inline mb-0"><asp:RadioButton ID="radNcAllComp" runat="server" ClientIDMode="Static" GroupName="radNcType" CssClass="form-check-input" Checked="true" /><label class="form-check-label" for="radNcAllComp">All Complains</label></div>
                        <div class="form-check form-check-inline mb-0"><asp:RadioButton ID="radNcConduct" runat="server" ClientIDMode="Static" GroupName="radNcType" CssClass="form-check-input" /><label class="form-check-label" for="radNcConduct">Cunduct Related Complains</label></div>
                        <div class="form-check form-check-inline mb-0"><asp:RadioButton ID="radNcMgmt"    runat="server" ClientIDMode="Static" GroupName="radNcType" CssClass="form-check-input" /><label class="form-check-label" for="radNcMgmt">Management Related Complains</label></div>
                    </div>
                    <div class="d-flex gap-4 flex-wrap">
                        <div class="form-check form-check-inline mb-0"><asp:RadioButton ID="radNcFacility" runat="server" ClientIDMode="Static" GroupName="radNcType" CssClass="form-check-input" /><label class="form-check-label" for="radNcFacility">Facility Complains</label></div>
                        <div class="form-check form-check-inline mb-0"><asp:RadioButton ID="radNcProduct"  runat="server" ClientIDMode="Static" GroupName="radNcType" CssClass="form-check-input" /><label class="form-check-label" for="radNcProduct">Product / Production Complains</label></div>
                        <div class="form-check form-check-inline mb-0"><asp:RadioButton ID="radNcOther"    runat="server" ClientIDMode="Static" GroupName="radNcType" CssClass="form-check-input" /><label class="form-check-label" for="radNcOther">Other</label></div>
                    </div>
                </div>
            </div>
            <div class="mb-3" style="font-size:0.83rem;">
                <label class="fw-semibold mb-1">Complain or Sujstions Details:</label>
                <asp:TextBox ID="TxtNcDetails" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="6" style="resize:vertical; width:100%;" />
            </div>
            <div class="row g-2 justify-content-end">
                <div class="col-md-4">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Upload Picture (PDF)</span>
                        <asp:FileUpload ID="FuNcAttach" runat="server" CssClass="form-control form-control-sm rounded-0" style="font-size:0.8rem;" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Note</span>
                        <asp:TextBox ID="TxtNcNote" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="2" style="flex:1; resize:none;" />
                    </div>
                </div>
            </div>
        </div>

        <%-- Response on Complain --%>
        <div class="cs-pane" id="pane-responseoncomplain">
            <div class="d-flex justify-content-end gap-4 mb-3 flex-wrap" style="font-size:0.83rem;">
                <div class="d-flex align-items-center gap-2">
                    <label class="fw-semibold mb-0" for="TxtRocId">Complain ID</label>
                    <asp:TextBox ID="TxtRocId"   runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" />
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="fw-semibold mb-0" for="TxtRocDate">Date:</label>
                    <asp:TextBox ID="TxtRocDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
                </div>
            </div>
            <div class="border p-2 mb-3" style="background-color:#f8f9fa; font-size:0.83rem;">
                <div class="d-flex align-items-center gap-3 mb-1 flex-wrap">
                    <label class="fw-semibold mb-0" for="TxtRocInfoId">Complain ID:</label>
                    <asp:TextBox ID="TxtRocInfoId"     runat="server" CssClass="form-control form-control-sm rounded-0" style="width:130px;" />
                    <label class="fw-semibold mb-0" for="TxtRocAssignedTo">Assigned To:</label>
                    <asp:TextBox ID="TxtRocAssignedTo" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:220px;" />
                </div>
                <div class="d-flex align-items-center gap-3 flex-wrap">
                    <label class="fw-semibold mb-0" for="TxtRocTypeComplain">Type of Complain:</label>
                    <asp:TextBox ID="TxtRocTypeComplain" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:150px;" />
                    <label class="mb-0" for="TxtRocCompany">Company</label>
                    <asp:TextBox ID="TxtRocCompany"      runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" />
                    <label class="mb-0" for="TxtRocDept">Department</label>
                    <asp:TextBox ID="TxtRocDept"         runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" />
                </div>
            </div>
            <div style="font-size:0.83rem;">
                <h6 class="fw-bold mb-2">Actions</h6>
                <div class="border p-2 mb-2">
                    <span class="fw-semibold d-block mb-2">Response by 3 Managers</span>
                    <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                        <div class="form-check mb-0" style="min-width:220px;"><asp:RadioButton ID="radRocForwarded" runat="server" ClientIDMode="Static" GroupName="radRocMgr" CssClass="form-check-input" Checked="true" /><label class="form-check-label" for="radRocForwarded">Forwarded to</label></div>
                        <asp:TextBox ID="TxtRocFwdName"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" placeholder="Name" />
                        <label class="mb-0">Time</label><asp:TextBox ID="TxtRocFwdTime"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:70px;"  placeholder="HH:MM" />
                        <label class="mb-0">Date</label><asp:TextBox ID="TxtRocFwdDate"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:100px;" placeholder="mm/dd/yyyy" />
                        <label class="mb-0">Remarks</label><asp:TextBox ID="TxtRocFwdRemarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="flex:1; min-width:120px;" />
                    </div>
                    <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                        <div class="form-check mb-0" style="min-width:220px;"><asp:RadioButton ID="radRocRect1" runat="server" ClientIDMode="Static" GroupName="radRocMgr" CssClass="form-check-input" /><label class="form-check-label" for="radRocRect1">1 Recommended Rectification</label></div>
                        <label class="mb-0">Time</label><asp:TextBox ID="TxtRocRect1Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:70px;"  placeholder="HH:MM" />
                        <label class="mb-0">Date</label><asp:TextBox ID="TxtRocRect1Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:100px;" placeholder="mm/dd/yyyy" />
                        <label class="mb-0">Remarks</label><asp:TextBox ID="TxtRocRect1Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="flex:1; min-width:120px;" />
                    </div>
                    <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                        <div class="form-check mb-0" style="min-width:220px;"><asp:RadioButton ID="radRocRect2" runat="server" ClientIDMode="Static" GroupName="radRocMgr" CssClass="form-check-input" /><label class="form-check-label" for="radRocRect2">2 Recommended Rectification</label></div>
                        <label class="mb-0">Time</label><asp:TextBox ID="TxtRocRect2Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:70px;"  placeholder="HH:MM" />
                        <label class="mb-0">Date</label><asp:TextBox ID="TxtRocRect2Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:100px;" placeholder="mm/dd/yyyy" />
                        <label class="mb-0">Remarks</label><asp:TextBox ID="TxtRocRect2Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="flex:1; min-width:120px;" />
                    </div>
                    <div class="d-flex align-items-center gap-2 flex-wrap">
                        <div class="form-check mb-0" style="min-width:220px;"><asp:RadioButton ID="radRocRect3" runat="server" ClientIDMode="Static" GroupName="radRocMgr" CssClass="form-check-input" /><label class="form-check-label" for="radRocRect3">3 Recommended Rectification</label></div>
                        <label class="mb-0">Time</label><asp:TextBox ID="TxtRocRect3Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:70px;"  placeholder="HH:MM" />
                        <label class="mb-0">Date</label><asp:TextBox ID="TxtRocRect3Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:100px;" placeholder="mm/dd/yyyy" />
                        <label class="mb-0">Remarks</label><asp:TextBox ID="TxtRocRect3Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="flex:1; min-width:120px;" />
                    </div>
                </div>
                <div class="border p-2 mb-3">
                    <span class="fw-semibold d-block mb-2">Response by the Complainer</span>
                    <div class="d-flex align-items-center gap-2 mb-1 flex-wrap">
                        <div class="form-check mb-0" style="min-width:220px;"><asp:RadioButton ID="radRocSatisfied"    runat="server" ClientIDMode="Static" GroupName="radRocComp" CssClass="form-check-input" Checked="true" /><label class="form-check-label" for="radRocSatisfied">Satisfied by the Action</label></div>
                        <label class="mb-0">Time</label><asp:TextBox ID="TxtRocSatTime" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:70px;"  placeholder="HH:MM" />
                        <label class="mb-0">Date</label><asp:TextBox ID="TxtRocSatDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:100px;" placeholder="mm/dd/yyyy" />
                    </div>
                    <div class="d-flex align-items-center gap-2 flex-wrap">
                        <div class="form-check mb-0" style="min-width:220px;"><asp:RadioButton ID="radRocNotSatisfied" runat="server" ClientIDMode="Static" GroupName="radRocComp" CssClass="form-check-input" /><label class="form-check-label" for="radRocNotSatisfied">Not Satisfied</label></div>
                        <label class="mb-0">Time</label><asp:TextBox ID="TxtRocNotSatTime"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:70px;"  placeholder="HH:MM" />
                        <label class="mb-0">Date</label><asp:TextBox ID="TxtRocNotSatDate"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:100px;" placeholder="mm/dd/yyyy" />
                        <label class="mb-0">Remarks</label><asp:TextBox ID="TxtRocNotSatRemarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="flex:1; min-width:120px;" />
                    </div>
                </div>
            </div>
            <div class="row g-2 justify-content-end">
                <div class="col-md-4">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Note</span>
                        <asp:TextBox ID="TxtRocNote" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="2" style="flex:1; resize:none;" />
                    </div>
                </div>
            </div>
        </div>

    </div>

    <script type="text/javascript">
        function showTab(paneid, clickedBtn) {
            var panes = document.querySelectorAll('#csTabContent .cs-pane');
            for (var i = 0; i < panes.length; i++) { panes[i].classList.remove('active'); }
            var btns = document.querySelectorAll('#csTabs .cs-tab-btn');
            for (var j = 0; j < btns.length; j++) { btns[j].classList.remove('active'); }
            document.getElementById(paneid).classList.add('active');
            clickedBtn.classList.add('active');
        }
    </script>

</asp:Content>
