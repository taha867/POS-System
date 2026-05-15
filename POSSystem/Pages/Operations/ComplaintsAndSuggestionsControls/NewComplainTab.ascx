<%@ Control Language="VB" AutoEventWireup="true" CodeBehind="NewComplainTab.ascx.vb" Inherits="POSSystem.Pages.Operations.ComplaintsAndSuggestionsControls.NewComplainTab" %>

<%-- Complain & Suggestion ID + Date (top-right) --%>
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

<%-- Complain / Suggestion radios --%>
<div class="d-flex gap-4 mb-2 ps-2 flex-wrap" style="font-size:0.83rem;">
    <div class="form-check mb-0">
        <input class="form-check-input" type="radio" name="radNcMain" id="radNcComplain" />
        <label class="form-check-label" for="radNcComplain">Complain</label>
    </div>
    <div class="form-check mb-0">
        <input class="form-check-input" type="radio" name="radNcMain" id="radNcSuggestion" checked />
        <label class="form-check-label" for="radNcSuggestion">Suggestion</label>
    </div>
</div>

<%-- Checkboxes (left) + Type radios (right) --%>
<div class="d-flex gap-4 mb-3 flex-wrap" style="font-size:0.83rem;">

    <div class="d-flex flex-column gap-1">
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="chkNcImportant" checked />
            <label class="form-check-label" for="chkNcImportant">Important</label>
        </div>
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="chkNcRegular" />
            <label class="form-check-label" for="chkNcRegular">Regular</label>
        </div>
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="chkNcAll" />
            <label class="form-check-label" for="chkNcAll">All</label>
        </div>
    </div>

    <div class="d-flex flex-column gap-1">
        <div class="d-flex gap-4 flex-wrap">
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radNcType" id="radNcAllComp" checked />
                <label class="form-check-label" for="radNcAllComp">All Complains</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radNcType" id="radNcConduct" />
                <label class="form-check-label" for="radNcConduct">Cunduct Related Complains</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radNcType" id="radNcMgmt" />
                <label class="form-check-label" for="radNcMgmt">Management Related Complains</label>
            </div>
        </div>
        <div class="d-flex gap-4 flex-wrap">
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radNcType" id="radNcFacility" />
                <label class="form-check-label" for="radNcFacility">Facility Complains</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radNcType" id="radNcProduct" />
                <label class="form-check-label" for="radNcProduct">Product / Production Complains</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radNcType" id="radNcOther" />
                <label class="form-check-label" for="radNcOther">Other</label>
            </div>
        </div>
    </div>

</div>

<%-- Complain or Sujstions Details --%>
<div class="mb-3" style="font-size:0.83rem;">
    <label class="fw-semibold mb-1">Complain or Sujstions Details:</label>
    <textarea class="form-control form-control-sm rounded-0" rows="6" style="resize:vertical; width:100%;"></textarea>
</div>

<%-- Upload Picture (PDF) + Note (bottom-right) --%>
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
