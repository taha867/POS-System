<%@ Control Language="VB" AutoEventWireup="true" CodeBehind="NewMemoCircularTab.ascx.vb" Inherits="POSSystem.Pages.Operations.MemosCircularsControls.NewMemoCircularTab" %>

<%-- Memo / Circular ID + Date (top-right) --%>
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

<%-- Important / Regular + Memo / Circular radios --%>
<div class="d-flex flex-column gap-1 mb-3 ps-2" style="font-size:0.83rem;">
    <div class="d-flex gap-4 flex-wrap">
        <div class="form-check mb-0">
            <input class="form-check-input" type="radio" name="radMCNature" id="radImportant" checked />
            <label class="form-check-label fw-semibold" for="radImportant">Important</label>
        </div>
        <div class="form-check mb-0">
            <input class="form-check-input" type="radio" name="radMCNature" id="radRegular" />
            <label class="form-check-label" for="radRegular">Regular</label>
        </div>
    </div>
    <div class="d-flex gap-4 flex-wrap">
        <div class="form-check mb-0">
            <input class="form-check-input" type="radio" name="radMCType" id="radMemo" />
            <label class="form-check-label" for="radMemo">Memo</label>
        </div>
        <div class="form-check mb-0">
            <input class="form-check-input" type="radio" name="radMCType" id="radCircular" />
            <label class="form-check-label" for="radCircular">Circular</label>
        </div>
    </div>
</div>

<%-- Distribution List --%>
<div class="border p-2 mb-3" style="font-size:0.83rem;">
    <div class="d-flex align-items-center gap-3 mb-2 flex-wrap">
        <span class="fw-semibold">Memo / Circular Distributation List</span>
        <div class="form-check mb-0">
            <input class="form-check-input" type="radio" name="radMCDist" id="radDistCompany" checked />
            <label class="form-check-label" for="radDistCompany">Company</label>
        </div>
        <input type="text" id="txtDistCompany" class="form-control form-control-sm rounded-0" style="width:130px;" />
        <label class="mb-0" for="txtDistDept">Department</label>
        <input type="text" id="txtDistDept" class="form-control form-control-sm rounded-0" style="width:130px;" />
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0" onclick="addDistItem()" style="padding:0.15rem 0.5rem;">&#8594;</button>
    </div>
    <ul class="list-unstyled mb-0 ps-1" id="distList" style="overflow-y:auto; max-height:80px; font-size:0.82rem;">
        <li>ASM</li>
        <li>ASF</li>
        <li>AI</li>
    </ul>
</div>

<%-- Memo / Circular Details --%>
<div class="mb-3" style="font-size:0.83rem;">
    <label class="fw-semibold mb-1">Memo / Circular Details:</label>
    <textarea class="form-control form-control-sm rounded-0" rows="5" style="resize:vertical; width:100%;"></textarea>
</div>

<%-- Upload Picture/File + Note (bottom-right) --%>
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

<script>
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
