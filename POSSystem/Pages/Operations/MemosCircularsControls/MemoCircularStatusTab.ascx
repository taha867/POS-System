<%@ Control Language="VB" AutoEventWireup="true" CodeBehind="MemoCircularStatusTab.ascx.vb" Inherits="POSSystem.Pages.Operations.MemosCircularsControls.MemoCircularStatusTab" %>

<%-- Checkboxes: memo / circular type filters --%>
<div class="d-flex flex-column gap-1 mb-2 pb-2 border-bottom" style="font-size:0.83rem;">

    <div class="d-flex gap-4 flex-wrap">
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="chkImpMemos" checked />
            <label class="form-check-label" for="chkImpMemos">Important Memos</label>
        </div>
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="chkRegMemos" />
            <label class="form-check-label" for="chkRegMemos">Regular Memos</label>
        </div>
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="chkImpCirculars" checked />
            <label class="form-check-label" for="chkImpCirculars">Important Circulars</label>
        </div>
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="chkRegCirculars" />
            <label class="form-check-label" for="chkRegCirculars">Regular Circulars</label>
        </div>
    </div>

    <div class="d-flex gap-4 flex-wrap">
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="chkRecalledMemos" checked />
            <label class="form-check-label" for="chkRecalledMemos">Recalled Memos</label>
        </div>
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="chkRecalledCirculars" />
            <label class="form-check-label" for="chkRecalledCirculars">Recalled Circulars</label>
        </div>
    </div>

    <div class="d-flex gap-4 flex-wrap">
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="chkAllMemos" />
            <label class="form-check-label" for="chkAllMemos">All Memos</label>
        </div>
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="chkAllCirculars" checked />
            <label class="form-check-label" for="chkAllCirculars">All Circulars</label>
        </div>
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="chkAllCircularsMemos" />
            <label class="form-check-label" for="chkAllCircularsMemos">All Circulars &amp; Memos</label>
        </div>
    </div>

</div>

<%-- Radio buttons: scope filters --%>
<div class="d-flex flex-column gap-1 mb-3" style="font-size:0.83rem;">

    <div class="d-flex gap-4 flex-wrap">
        <div class="form-check form-check-inline mb-0">
            <input class="form-check-input" type="radio" name="radMCScope" id="radMemoDept" />
            <label class="form-check-label" for="radMemoDept">Memo By Department</label>
        </div>
        <div class="form-check form-check-inline mb-0">
            <input class="form-check-input" type="radio" name="radMCScope" id="radMemoCompany" />
            <label class="form-check-label" for="radMemoCompany">Memo By Company</label>
        </div>
        <div class="form-check form-check-inline mb-0">
            <input class="form-check-input" type="radio" name="radMCScope" id="radCircularCompany" />
            <label class="form-check-label" for="radCircularCompany">Circular By Company</label>
        </div>
        <div class="form-check form-check-inline mb-0">
            <input class="form-check-input" type="radio" name="radMCScope" id="radCircularDept" />
            <label class="form-check-label" for="radCircularDept">Circular By Department</label>
        </div>
    </div>

    <div class="d-flex gap-4 flex-wrap">
        <div class="form-check form-check-inline mb-0">
            <input class="form-check-input" type="radio" name="radMCScope" id="radMemosAllDept" />
            <label class="form-check-label" for="radMemosAllDept">Memos By All Department</label>
        </div>
        <div class="form-check form-check-inline mb-0">
            <input class="form-check-input" type="radio" name="radMCScope" id="radMemosAllCompanies" />
            <label class="form-check-label" for="radMemosAllCompanies">Memos By All Companies</label>
        </div>
    </div>

    <div class="d-flex gap-4 flex-wrap">
        <div class="form-check form-check-inline mb-0">
            <input class="form-check-input" type="radio" name="radMCScope" id="radCircularAllDept" />
            <label class="form-check-label" for="radCircularAllDept">Circular By All Department</label>
        </div>
        <div class="form-check form-check-inline mb-0">
            <input class="form-check-input" type="radio" name="radMCScope" id="radCircularAllCompanies" />
            <label class="form-check-label" for="radCircularAllCompanies">Circular By All Companies</label>
        </div>
    </div>

</div>

<%-- Memo / Circular Grid --%>
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
            <tr>
                <td class="fw-bold">2345</td>
                <td class="text-nowrap fw-bold">Jan 01, 2016</td>
                <td class="fw-bold">ASM</td>
                <td class="fw-bold">Sales Meeting</td>
                <td class="fw-bold">Saleem Khan</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td>ASF</td>
                <td>Genral Office Meeting</td>
                <td>Noman Ahmed</td>
                <td></td>
            </tr>
            <tr>
                <td>2346</td>
                <td class="text-nowrap">Jan 01, 2016</td>
                <td>ASSF</td>
                <td>Board Meeting</td>
                <td>Board Meeting</td>
                <td></td>
            </tr>
            <tr>
                <td>2347</td>
                <td class="text-nowrap">Jan 03, 2016</td>
                <td>ASM</td>
                <td>Scheduled Meeting</td>
                <td>Noor Kha</td>
                <td></td>
            </tr>
            <tr>
                <td>2348</td>
                <td class="text-nowrap">Jan 05, 2016</td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </tbody>
    </table>
</div>
