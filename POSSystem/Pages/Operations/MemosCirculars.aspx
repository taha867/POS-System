<%@ Page Title="Memos &amp; Circulars" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MemosCirculars.aspx.vb" Inherits="POSSystem.Pages.Operations.MemosCirculars" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Heading + Toolbar --%>
    <div class="d-flex align-items-center gap-2 mb-2 px-3 py-2 border flex-wrap" style="background-color:#f8f9fa;">
        <strong class="fs-5 me-2">Memos &amp; Circulars</strong>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Asst Manager Administration</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Asst Manager HR</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Department Manager</button>
        <div class="ms-auto d-flex gap-2">
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Edit</button>
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Print</button>
        </div>
    </div>

    <style>
        #memoCircularTabs { flex-wrap: nowrap; overflow-x: auto; }
        #memoCircularTabs .nav-link {
            background-color: #e9ecef; color: #495057; border-color: #dee2e6;
            border-radius: 0; font-size: 0.78rem; white-space: nowrap;
            padding-left: 0.55rem; padding-right: 0.55rem;
        }
        #memoCircularTabs .nav-link.active { background-color: #6c757d; color: #fff; border-color: #6c757d #6c757d #fff; }
        #memoCircularTabs .nav-link:focus { box-shadow: none; }
    </style>

    <%-- Tab Navigation --%>
    <ul class="nav nav-tabs" id="memoCircularTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active rounded-0" data-bs-toggle="tab" data-bs-target="#pane-memocircularstatus" type="button" role="tab">Memo Circular Status</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link rounded-0" data-bs-toggle="tab" data-bs-target="#pane-newmemocircular" type="button" role="tab">New Memo Circular</button>
        </li>
    </ul>

    <%-- Tab Content --%>
    <div class="tab-content border border-top-0" id="memoCircularTabContent">

        <%-- Memo Circular Status --%>
        <div class="tab-pane fade show active p-3" id="pane-memocircularstatus" role="tabpanel">
            <div class="d-flex flex-column gap-1 mb-2 pb-2 border-bottom" style="font-size:0.83rem;">
                <div class="d-flex gap-4 flex-wrap">
                    <div class="form-check mb-0"><input class="form-check-input" type="checkbox" id="chkImpMemos" checked /><label class="form-check-label" for="chkImpMemos">Important Memos</label></div>
                    <div class="form-check mb-0"><input class="form-check-input" type="checkbox" id="chkRegMemos" /><label class="form-check-label" for="chkRegMemos">Regular Memos</label></div>
                    <div class="form-check mb-0"><input class="form-check-input" type="checkbox" id="chkImpCirculars" checked /><label class="form-check-label" for="chkImpCirculars">Important Circulars</label></div>
                    <div class="form-check mb-0"><input class="form-check-input" type="checkbox" id="chkRegCirculars" /><label class="form-check-label" for="chkRegCirculars">Regular Circulars</label></div>
                </div>
                <div class="d-flex gap-4 flex-wrap">
                    <div class="form-check mb-0"><input class="form-check-input" type="checkbox" id="chkRecalledMemos" checked /><label class="form-check-label" for="chkRecalledMemos">Recalled Memos</label></div>
                    <div class="form-check mb-0"><input class="form-check-input" type="checkbox" id="chkRecalledCirculars" /><label class="form-check-label" for="chkRecalledCirculars">Recalled Circulars</label></div>
                </div>
                <div class="d-flex gap-4 flex-wrap">
                    <div class="form-check mb-0"><input class="form-check-input" type="checkbox" id="chkAllMemos" /><label class="form-check-label" for="chkAllMemos">All Memos</label></div>
                    <div class="form-check mb-0"><input class="form-check-input" type="checkbox" id="chkAllCirculars" checked /><label class="form-check-label" for="chkAllCirculars">All Circulars</label></div>
                    <div class="form-check mb-0"><input class="form-check-input" type="checkbox" id="chkAllCircularsMemos" /><label class="form-check-label" for="chkAllCircularsMemos">All Circulars &amp; Memos</label></div>
                </div>
            </div>
            <div class="d-flex flex-column gap-1 mb-3" style="font-size:0.83rem;">
                <div class="d-flex gap-4 flex-wrap">
                    <div class="form-check form-check-inline mb-0"><input class="form-check-input" type="radio" name="radMCScope" id="radMemoDept" /><label class="form-check-label" for="radMemoDept">Memo By Department</label></div>
                    <div class="form-check form-check-inline mb-0"><input class="form-check-input" type="radio" name="radMCScope" id="radMemoCompany" /><label class="form-check-label" for="radMemoCompany">Memo By Company</label></div>
                    <div class="form-check form-check-inline mb-0"><input class="form-check-input" type="radio" name="radMCScope" id="radCircularCompany" /><label class="form-check-label" for="radCircularCompany">Circular By Company</label></div>
                    <div class="form-check form-check-inline mb-0"><input class="form-check-input" type="radio" name="radMCScope" id="radCircularDept" /><label class="form-check-label" for="radCircularDept">Circular By Department</label></div>
                </div>
                <div class="d-flex gap-4 flex-wrap">
                    <div class="form-check form-check-inline mb-0"><input class="form-check-input" type="radio" name="radMCScope" id="radMemosAllDept" /><label class="form-check-label" for="radMemosAllDept">Memos By All Department</label></div>
                    <div class="form-check form-check-inline mb-0"><input class="form-check-input" type="radio" name="radMCScope" id="radMemosAllCompanies" /><label class="form-check-label" for="radMemosAllCompanies">Memos By All Companies</label></div>
                </div>
                <div class="d-flex gap-4 flex-wrap">
                    <div class="form-check form-check-inline mb-0"><input class="form-check-input" type="radio" name="radMCScope" id="radCircularAllDept" /><label class="form-check-label" for="radCircularAllDept">Circular By All Department</label></div>
                    <div class="form-check form-check-inline mb-0"><input class="form-check-input" type="radio" name="radMCScope" id="radCircularAllCompanies" /><label class="form-check-label" for="radCircularAllCompanies">Circular By All Companies</label></div>
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
        <div class="tab-pane fade p-3" id="pane-newmemocircular" role="tabpanel">
            <div class="d-flex justify-content-end gap-4 mb-3 flex-wrap" style="font-size:0.83rem;">
                <div class="d-flex align-items-center gap-2">
                    <label class="fw-semibold mb-0" for="txtMCId">Memo / Circular ID:</label>
                    <input type="text" id="txtMCId" class="form-control form-control-sm rounded-0" style="width:120px;" />
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="fw-semibold mb-0" for="txtMCDate">Date:</label>
                    <input type="text" id="txtMCDate" class="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
                </div>
            </div>
            <div class="d-flex flex-column gap-1 mb-3 ps-2" style="font-size:0.83rem;">
                <div class="d-flex gap-4 flex-wrap">
                    <div class="form-check mb-0"><input class="form-check-input" type="radio" name="radMCNature" id="radImportant" checked /><label class="form-check-label fw-semibold" for="radImportant">Important</label></div>
                    <div class="form-check mb-0"><input class="form-check-input" type="radio" name="radMCNature" id="radRegular" /><label class="form-check-label" for="radRegular">Regular</label></div>
                </div>
                <div class="d-flex gap-4 flex-wrap">
                    <div class="form-check mb-0"><input class="form-check-input" type="radio" name="radMCType" id="radMemo" /><label class="form-check-label" for="radMemo">Memo</label></div>
                    <div class="form-check mb-0"><input class="form-check-input" type="radio" name="radMCType" id="radCircular" /><label class="form-check-label" for="radCircular">Circular</label></div>
                </div>
            </div>
            <div class="border p-2 mb-3" style="font-size:0.83rem;">
                <div class="d-flex align-items-center gap-3 mb-2 flex-wrap">
                    <span class="fw-semibold">Memo / Circular Distributation List</span>
                    <div class="form-check mb-0"><input class="form-check-input" type="radio" name="radMCDist" id="radDistCompany" checked /><label class="form-check-label" for="radDistCompany">Company</label></div>
                    <input type="text" id="txtDistCompany" class="form-control form-control-sm rounded-0" style="width:130px;" />
                    <label class="mb-0" for="txtDistDept">Department</label>
                    <input type="text" id="txtDistDept" class="form-control form-control-sm rounded-0" style="width:130px;" />
                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-0" onclick="addDistItem()" style="padding:0.15rem 0.5rem;">&#8594;</button>
                </div>
                <ul class="list-unstyled mb-0 ps-1" id="distList" style="overflow-y:auto; max-height:80px; font-size:0.82rem;">
                    <li>ASM</li><li>ASF</li><li>AI</li>
                </ul>
            </div>
            <div class="mb-3" style="font-size:0.83rem;">
                <label class="fw-semibold mb-1">Memo / Circular Details:</label>
                <textarea class="form-control form-control-sm rounded-0" rows="5" style="resize:vertical; width:100%;"></textarea>
            </div>
            <div class="row g-2 justify-content-end">
                <div class="col-md-4">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Upload Picture / File</span>
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

    </div>

    <script type="text/javascript">
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

</asp:Content>
