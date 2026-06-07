<%@ Page Title="Memos &amp; Circulars" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MemosCirculars.aspx.vb" Inherits="POSSystem.Pages.Operations.MemosCirculars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .memo-form { background:#f2f2f2; font-family:Arial,sans-serif; padding:0 0 12px; }
        .memo-form label,
        .memo-form span,
        .memo-form .fw-semibold,
        .memo-form .fw-bold { font-style:italic; }
        .mc-header { background:#d9d9d9; border:1px solid #555; min-height:76px; }
        .mc-title { color:#666; font-size:2rem; font-style:italic; font-weight:700; line-height:1; }
        .mc-toolbar { gap:14px; padding:0 8px; }
        .mc-command-btn { color:#002d62; font-size:10px; font-weight:700; height:52px; line-height:1.1; white-space:normal; width:78px; }
        .mc-approval-btn { width:96px; }
        .mc-tabs { display:flex; list-style:none; margin:20px 0 0; padding:0; flex-wrap:nowrap; overflow-x:auto; }
        .mc-tabs .mc-tab-btn {
            background:#a8a8a8; border:2px solid #000; border-bottom:none; color:#111; cursor:pointer;
            font-size:14px; font-style:italic; font-weight:700; height:86px; line-height:1.15; margin:0 4px 0 0;
            min-width:240px; padding:0 22px; white-space:normal;
        }
        .mc-tabs .mc-tab-btn.active { background:#b0b0b0; color:#111; border-color:#000; }
        .mc-tab-content { background:#f2f2f2; border:2px solid #000; min-height:520px; }
        .mc-pane { display:none; padding:28px 30px 34px; }
        .mc-pane.active { display:block; }
        .memo-form .form-control,
        .memo-form .form-select { border-color:#555; border-radius:0 !important; font-size:12px; font-style:italic; max-width:none; }
        .memo-form .table { border-color:#000; }
        .memo-form .table th { background:#c9c9c9; border-color:#000; font-style:italic; text-align:center; vertical-align:middle; }
        .memo-form .table td { border-color:#000; vertical-align:top; }
        .memo-form .border { border-color:#000 !important; }
        .memo-form #TxtMCDetails,
        .memo-form #TxtMCNote { width:100% !important; }
        .memo-form #txtDistCompany,
        .memo-form #txtDistDept { width:160px !important; }
        .mc-option-section { font-size:0.83rem; }
        .mc-option-row {
            display:grid;
            grid-template-columns:220px 220px 250px 240px;
            column-gap:24px;
            row-gap:8px;
            margin-bottom:8px;
        }
        .mc-option-row:last-child { margin-bottom:0; }
        .mc-option-row .form-check,
        .mc-option-row .form-check-inline {
            align-items:center;
            display:flex;
            margin-bottom:0 !important;
            margin-right:0 !important;
            min-width:0;
        }
        .mc-option-row .form-check-label { white-space:nowrap; }
        @media (max-width: 1199.98px) {
            .mc-option-row { grid-template-columns:repeat(2, minmax(190px, 1fr)); }
        }
    </style>

    <div class="memo-form">
        <%-- Heading + Toolbar --%>
        <div class="row g-0 align-items-stretch mc-header">
            <div class="col d-flex align-items-center px-4">
                <strong class="mc-title">Memos &amp; Circulars</strong>
            </div>
            <div class="col-auto d-flex align-items-center justify-content-end flex-wrap mc-toolbar">
                <asp:Button ID="BtnAsstMgrAdmin" runat="server" Text="Asst Manager Administration" UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 mc-command-btn mc-approval-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnAsstMgrHR"    runat="server" Text="Asst Manager HR"              UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 mc-command-btn mc-approval-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnDeptMgr"      runat="server" Text="Department Manager"            UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 mc-command-btn mc-approval-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnEdit"         runat="server" Text="Edit"                          UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 mc-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnPrint"        runat="server" Text="Print"                         UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 mc-command-btn" OnClientClick="return false;" />
            </div>
        </div>

    <%-- Tab Navigation --%>
    <ul class="mc-tabs" id="memoCircularTabs">
        <li><asp:Button runat="server" Text="Memo Circular Status" UseSubmitBehavior="false" CssClass="mc-tab-btn active" OnClientClick="showTab('pane-memocircularstatus',this); return false;" /></li>
        <li><asp:Button runat="server" Text="New Memo Circular"    UseSubmitBehavior="false" CssClass="mc-tab-btn"        OnClientClick="showTab('pane-newmemocircular',this);    return false;" /></li>
    </ul>

    <%-- Tab Content --%>
    <div class="mc-tab-content" id="memoCircularTabContent">

        <%-- Memo Circular Status --%>
        <div class="mc-pane active" id="pane-memocircularstatus">
            <div class="mc-option-section mb-2 pb-2 border-bottom">
                <div class="mc-option-row">
                    <div class="form-check mb-0"><asp:CheckBox ID="ChkImpMemos"      runat="server" ClientIDMode="Static" CssClass="form-check-input" Checked="true" /><label class="form-check-label" for="ChkImpMemos">Important Memos</label></div>
                    <div class="form-check mb-0"><asp:CheckBox ID="ChkRegMemos"      runat="server" ClientIDMode="Static" CssClass="form-check-input" /><label class="form-check-label" for="ChkRegMemos">Regular Memos</label></div>
                    <div class="form-check mb-0"><asp:CheckBox ID="ChkImpCirculars"  runat="server" ClientIDMode="Static" CssClass="form-check-input" Checked="true" /><label class="form-check-label" for="ChkImpCirculars">Important Circulars</label></div>
                    <div class="form-check mb-0"><asp:CheckBox ID="ChkRegCirculars"  runat="server" ClientIDMode="Static" CssClass="form-check-input" /><label class="form-check-label" for="ChkRegCirculars">Regular Circulars</label></div>
                </div>
                <div class="mc-option-row">
                    <div class="form-check mb-0"><asp:CheckBox ID="ChkRecalledMemos"     runat="server" ClientIDMode="Static" CssClass="form-check-input" Checked="true" /><label class="form-check-label" for="ChkRecalledMemos">Recalled Memos</label></div>
                    <div class="form-check mb-0"><asp:CheckBox ID="ChkRecalledCirculars" runat="server" ClientIDMode="Static" CssClass="form-check-input" /><label class="form-check-label" for="ChkRecalledCirculars">Recalled Circulars</label></div>
                </div>
                <div class="mc-option-row">
                    <div class="form-check mb-0"><asp:CheckBox ID="ChkAllMemos"           runat="server" ClientIDMode="Static" CssClass="form-check-input" /><label class="form-check-label" for="ChkAllMemos">All Memos</label></div>
                    <div class="form-check mb-0"><asp:CheckBox ID="ChkAllCirculars"       runat="server" ClientIDMode="Static" CssClass="form-check-input" Checked="true" /><label class="form-check-label" for="ChkAllCirculars">All Circulars</label></div>
                    <div class="form-check mb-0"><asp:CheckBox ID="ChkAllCircularsMemos"  runat="server" ClientIDMode="Static" CssClass="form-check-input" /><label class="form-check-label" for="ChkAllCircularsMemos">All Circulars &amp; Memos</label></div>
                </div>
            </div>
            <div class="mc-option-section mb-3">
                <div class="mc-option-row">
                    <div class="form-check form-check-inline mb-0"><asp:RadioButton ID="radMemoDept"         runat="server" ClientIDMode="Static" GroupName="radMCScope" CssClass="form-check-input" /><label class="form-check-label" for="radMemoDept">Memo By Department</label></div>
                    <div class="form-check form-check-inline mb-0"><asp:RadioButton ID="radMemoCompany"      runat="server" ClientIDMode="Static" GroupName="radMCScope" CssClass="form-check-input" /><label class="form-check-label" for="radMemoCompany">Memo By Company</label></div>
                    <div class="form-check form-check-inline mb-0"><asp:RadioButton ID="radCircularCompany"  runat="server" ClientIDMode="Static" GroupName="radMCScope" CssClass="form-check-input" /><label class="form-check-label" for="radCircularCompany">Circular By Company</label></div>
                    <div class="form-check form-check-inline mb-0"><asp:RadioButton ID="radCircularDept"     runat="server" ClientIDMode="Static" GroupName="radMCScope" CssClass="form-check-input" /><label class="form-check-label" for="radCircularDept">Circular By Department</label></div>
                </div>
                <div class="mc-option-row">
                    <div class="form-check form-check-inline mb-0"><asp:RadioButton ID="radMemosAllDept"      runat="server" ClientIDMode="Static" GroupName="radMCScope" CssClass="form-check-input" /><label class="form-check-label" for="radMemosAllDept">Memos By All Department</label></div>
                    <div class="form-check form-check-inline mb-0"><asp:RadioButton ID="radMemosAllCompanies" runat="server" ClientIDMode="Static" GroupName="radMCScope" CssClass="form-check-input" /><label class="form-check-label" for="radMemosAllCompanies">Memos By All Companies</label></div>
                </div>
                <div class="mc-option-row">
                    <div class="form-check form-check-inline mb-0"><asp:RadioButton ID="radCircularAllDept"      runat="server" ClientIDMode="Static" GroupName="radMCScope" CssClass="form-check-input" /><label class="form-check-label" for="radCircularAllDept">Circular By All Department</label></div>
                    <div class="form-check form-check-inline mb-0"><asp:RadioButton ID="radCircularAllCompanies" runat="server" ClientIDMode="Static" GroupName="radMCScope" CssClass="form-check-input" /><label class="form-check-label" for="radCircularAllCompanies">Circular By All Companies</label></div>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-bordered table-sm mb-0" style="font-size:0.82rem;">
                    <thead style="background-color:#f8f9fa;">
                        <tr>
                            <th class="rounded-0 text-nowrap">Memo / Cir Id</th>
                            <th class="rounded-0 text-nowrap">Memo or Circular<br />Date &amp; Time</th>
                            <th class="rounded-0 text-nowrap">Memo or Circular<br />By Company</th>
                            <th class="rounded-0 text-nowrap">Memo or Circular<br />By Person</th>
                            <th class="rounded-0 text-nowrap">Memo or Circular<br />By Designation</th>
                            <th class="rounded-0">Remarks</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><td class="fw-bold">2345</td><td class="text-nowrap fw-bold">Jan 01, 2016</td><td class="fw-bold">ASM</td><td class="fw-bold">Sales Meeting</td><td class="fw-bold">Saleem Khan</td><td></td></tr>
                        <tr><td></td><td></td><td>ASF</td><td>Genral Office Meeting</td><td>Noman Ahmed</td><td></td></tr>
                        <tr><td>2346</td><td class="text-nowrap">Jan 01, 2016</td><td>ASSF</td><td>Board Meeting</td><td>Board Meeting</td><td></td></tr>
                        <tr><td>2347</td><td class="text-nowrap">Jan 03, 2016</td><td>ASM</td><td>Scheduled Meeting</td><td>Noor Kha</td><td></td></tr>
                        <tr><td>2348</td><td class="text-nowrap">Jan 05, 2016</td><td></td><td></td><td></td><td></td></tr>
                    </tbody>
                </table>
            </div>
        </div>

        <%-- New Memo Circular --%>
        <div class="mc-pane" id="pane-newmemocircular">
            <div class="d-flex justify-content-end gap-4 mb-3 flex-wrap" style="font-size:0.83rem;">
                <div class="d-flex align-items-center gap-2">
                    <label class="fw-semibold mb-0" for="TxtMCId">Memo / Circular ID:</label>
                    <asp:TextBox ID="TxtMCId" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" />
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="fw-semibold mb-0" for="TxtMCDate">Date:</label>
                    <asp:TextBox ID="TxtMCDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
                </div>
            </div>
            <div class="d-flex flex-column gap-1 mb-3 ps-2" style="font-size:0.83rem;">
                <div class="d-flex gap-4 flex-wrap">
                    <div class="form-check mb-0"><asp:RadioButton ID="radImportant" runat="server" ClientIDMode="Static" GroupName="radMCNature" CssClass="form-check-input" Checked="true" /><label class="form-check-label fw-semibold" for="radImportant">Important</label></div>
                    <div class="form-check mb-0"><asp:RadioButton ID="radRegular"   runat="server" ClientIDMode="Static" GroupName="radMCNature" CssClass="form-check-input" /><label class="form-check-label" for="radRegular">Regular</label></div>
                </div>
                <div class="d-flex gap-4 flex-wrap">
                    <div class="form-check mb-0"><asp:RadioButton ID="radMemo"     runat="server" ClientIDMode="Static" GroupName="radMCType" CssClass="form-check-input" /><label class="form-check-label" for="radMemo">Memo</label></div>
                    <div class="form-check mb-0"><asp:RadioButton ID="radCircular" runat="server" ClientIDMode="Static" GroupName="radMCType" CssClass="form-check-input" /><label class="form-check-label" for="radCircular">Circular</label></div>
                </div>
            </div>
            <div class="border p-2 mb-3" style="font-size:0.83rem;">
                <div class="d-flex align-items-center gap-3 mb-2 flex-wrap">
                    <span class="fw-semibold">Memo / Circular Distributation List</span>
                    <div class="form-check mb-0"><asp:RadioButton ID="radDistCompany" runat="server" ClientIDMode="Static" GroupName="radMCDist" CssClass="form-check-input" Checked="true" /><label class="form-check-label" for="radDistCompany">Company</label></div>
                    <asp:TextBox ID="txtDistCompany" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" style="width:130px;" />
                    <label class="mb-0" for="txtDistDept">Department</label>
                    <asp:TextBox ID="txtDistDept" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" style="width:130px;" />
                    <asp:Button runat="server" UseSubmitBehavior="false" Text="→" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="addDistItem(); return false;" style="padding:0.15rem 0.5rem;" />
                </div>
                <ul class="list-unstyled mb-0 ps-1" id="distList" style="overflow-y:auto; max-height:80px; font-size:0.82rem;">
                    <li>ASM</li><li>ASF</li><li>AI</li>
                </ul>
            </div>
            <div class="mb-3" style="font-size:0.83rem;">
                <label class="fw-semibold mb-1">Memo / Circular Details:</label>
                <asp:TextBox ID="TxtMCDetails" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="5" style="resize:vertical; width:100%;" />
            </div>
            <div class="row g-2 justify-content-end">
                <div class="col-md-4">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Upload Picture / File</span>
                        <asp:FileUpload ID="FuMCAttach" runat="server" CssClass="form-control form-control-sm rounded-0" style="font-size:0.8rem;" />
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Note</span>
                        <asp:TextBox ID="TxtMCNote" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="2" style="flex:1; resize:none;" />
                    </div>
                </div>
            </div>
        </div>

    </div>

    <script type="text/javascript">
        function showTab(paneid, clickedBtn) {
            var panes = document.querySelectorAll('#memoCircularTabContent .mc-pane');
            for (var i = 0; i < panes.length; i++) { panes[i].classList.remove('active'); }
            var btns = document.querySelectorAll('#memoCircularTabs .mc-tab-btn');
            for (var j = 0; j < btns.length; j++) { btns[j].classList.remove('active'); }
            document.getElementById(paneid).classList.add('active');
            clickedBtn.classList.add('active');
        }
        function addDistItem() {
            var co = document.getElementById('txtDistCompany').value.trim();
            var de = document.getElementById('txtDistDept').value.trim();
            var val = co || de;
            if (!val) return;
            var li = document.createElement('li');
            li.textContent = val;
            document.getElementById('distList').appendChild(li);
            document.getElementById('txtDistCompany').value = '';
            document.getElementById('txtDistDept').value = '';
        }
    </script>

    </div>

</asp:Content>
