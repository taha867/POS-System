<%@ Control Language="VB" AutoEventWireup="true" CodeBehind="ComplainsStatusTab.ascx.vb" Inherits="POSSystem.Pages.Operations.ComplaintsAndSuggestionsControls.ComplainsStatusTab" %>

<%-- Filters: checkboxes (left) + radios (right) --%>
<div class="d-flex gap-4 mb-3 flex-wrap" style="font-size:0.83rem;">

    <%-- Checkboxes --%>
    <div class="d-flex flex-column gap-1">
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="chkCsImportant" checked />
            <label class="form-check-label" for="chkCsImportant">Important</label>
        </div>
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="chkCsRegular" />
            <label class="form-check-label" for="chkCsRegular">Regular</label>
        </div>
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="chkCsAll" />
            <label class="form-check-label" for="chkCsAll">All</label>
        </div>
    </div>

    <%-- Radios --%>
    <div class="d-flex flex-column gap-1">
        <div class="d-flex gap-4 flex-wrap">
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radCsType" id="radCsAll" checked />
                <label class="form-check-label" for="radCsAll">All Complains</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radCsType" id="radCsConduct" />
                <label class="form-check-label" for="radCsConduct">Cunduct Related Complains</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radCsType" id="radCsMgmt" />
                <label class="form-check-label" for="radCsMgmt">Management Related Complains</label>
            </div>
        </div>
        <div class="d-flex gap-4 flex-wrap">
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radCsType" id="radCsFacility" />
                <label class="form-check-label" for="radCsFacility">Facility Complains</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radCsType" id="radCsProduct" />
                <label class="form-check-label" for="radCsProduct">Product / Production Complains</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radCsType" id="radCsOther" />
                <label class="form-check-label" for="radCsOther">Other</label>
            </div>
        </div>
        <div class="d-flex gap-4 flex-wrap">
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radCsType" id="radCsSuggestions" />
                <label class="form-check-label" for="radCsSuggestions">Sujstions</label>
            </div>
        </div>
    </div>

</div>

<%-- Complains Grid --%>
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
                <td class="fw-bold text-nowrap">2345</td>
                <td class="fw-bold text-nowrap">Jan 01, 2016</td>
                <td style="font-size:0.80rem;">
                    Property Id<br />
                    Flr &amp; Room#<br />
                    Hardware Id
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="text-nowrap">2346</td>
                <td class="text-nowrap">Jan 01, 2016</td>
                <td style="font-size:0.80rem;">
                    Machine Id<br />
                    Loaction
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="text-nowrap">2347</td>
                <td class="text-nowrap">Jan 03, 2016</td>
                <td style="font-size:0.80rem;">Form HR27</td>
                <td></td>
            </tr>
            <tr>
                <td class="text-nowrap">2348</td>
                <td class="text-nowrap">Jan 05, 2016</td>
                <td style="font-size:0.80rem;">VN/Extractor</td>
                <td></td>
            </tr>
        </tbody>
    </table>
</div>
