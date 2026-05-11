<%@ Control Language="VB" AutoEventWireup="true" CodeBehind="NewTaskTab.ascx.vb" Inherits="POSSystem.Pages.Operations.TaskManagerControls.NewTaskTab" %>

<%-- Task ID + Date (top-right) --%>
<div class="d-flex justify-content-end gap-4 mb-3">
    <div class="d-flex align-items-center gap-2">
        <label class="small fw-semibold mb-0" for="txtTaskId">Task ID:</label>
        <input type="text" id="txtTaskId" class="form-control form-control-sm rounded-0" style="width:130px;" />
    </div>
    <div class="d-flex align-items-center gap-2">
        <label class="small fw-semibold mb-0" for="txtTaskDate">Date:</label>
        <input type="text" id="txtTaskDate" class="form-control form-control-sm rounded-0" style="width:130px;" placeholder="mm/dd/yyyy" />
    </div>
</div>

<%-- Radio Row 1: Assignment --%>
<div class="d-flex align-items-center gap-4 mb-2 flex-wrap">
    <div class="form-check form-check-inline mb-0">
        <input class="form-check-input" type="radio" name="ntAssign" id="ntSelf" value="self" checked>
        <label class="form-check-label small" for="ntSelf">Self Task (To Do)</label>
    </div>
    <div class="form-check form-check-inline mb-0">
        <input class="form-check-input" type="radio" name="ntAssign" id="ntOthers" value="others">
        <label class="form-check-label small" for="ntOthers">Assigned Tasks to Others</label>
    </div>
</div>

<%-- Radio Row 2: Nature + Confidentiality --%>
<div class="d-flex align-items-center gap-5 mb-3 pb-2 border-bottom flex-wrap">
    <div class="d-flex align-items-center gap-3">
        <div class="form-check form-check-inline mb-0">
            <input class="form-check-input" type="radio" name="ntNature" id="ntCritical" value="critically_urgent">
            <label class="form-check-label small" for="ntCritical">Critically Urgent</label>
        </div>
        <div class="form-check form-check-inline mb-0">
            <input class="form-check-input" type="radio" name="ntNature" id="ntImportant" value="important" checked>
            <label class="form-check-label small" for="ntImportant">Important</label>
        </div>
        <div class="form-check form-check-inline mb-0">
            <input class="form-check-input" type="radio" name="ntNature" id="ntRegular" value="regular">
            <label class="form-check-label small" for="ntRegular">Regular</label>
        </div>
    </div>
    <div class="d-flex align-items-center gap-3">
        <div class="form-check form-check-inline mb-0">
            <input class="form-check-input" type="radio" name="ntConfidential" id="ntConfidential" value="confidential">
            <label class="form-check-label small" for="ntConfidential">Confidential</label>
        </div>
        <div class="form-check form-check-inline mb-0">
            <input class="form-check-input" type="radio" name="ntConfidential" id="ntNonConfidential" value="non_confidential" checked>
            <label class="form-check-label small" for="ntNonConfidential">Non Confidential</label>
        </div>
    </div>
</div>

<%-- Form Row: Assigned To | Type of Task | Copy To --%>
<div class="row g-2 mb-3 align-items-center">
    <div class="col-auto">
        <label class="small fw-semibold mb-0" for="selAssignedTo">Assigned To</label>
    </div>
    <div class="col-auto">
        <select id="selAssignedTo" class="form-select form-select-sm rounded-0" style="width:160px;">
            <option value="self">Self</option>
            <option value="others">Others</option>
        </select>
    </div>
    <div class="col-auto ms-3">
        <label class="small fw-semibold mb-0" for="selTaskType">Type of Task:</label>
    </div>
    <div class="col-auto">
        <select id="selTaskType" class="form-select form-select-sm rounded-0" style="width:190px;">
            <option>Create a Report</option>
            <option>Get Information</option>
            <option>Get a Quote</option>
            <option>Send a Proposal</option>
            <option>Send a Sale Quote</option>
            <option>Make a Visit to</option>
            <option>Make an Out of City Visit</option>
            <option>Make an Out of Country Visit</option>
            <option>Arrange a Meeting</option>
            <option>Submit Proposal</option>
        </select>
    </div>
    <div class="col-auto ms-3">
        <label class="small fw-semibold mb-0" for="selCopyTo">Copy to</label>
    </div>
    <div class="col-auto">
        <select id="selCopyTo" class="form-select form-select-sm rounded-0" style="width:190px;">
            <option value="">-- Select --</option>
            <option>Any Person in Company</option>
            <option>Department Head</option>
            <option>Manager HR</option>
            <option>Manager Department</option>
        </select>
    </div>
</div>

<%-- Form Row: Task Name | Task Finished By --%>
<div class="row g-2 mb-3 align-items-center">
    <div class="col-auto">
        <label class="small fw-semibold mb-0" for="txtTaskName">Task Name:</label>
    </div>
    <div class="col-auto">
        <input type="text" id="txtTaskName" class="form-control form-control-sm rounded-0"
               style="width:240px;" maxlength="20" placeholder="Max 20 characters" />
    </div>
    <div class="col-auto ms-3">
        <label class="small fw-semibold mb-0">Task Finished by (Time &amp; Date):</label>
    </div>
    <div class="col-auto">
        <input type="text" id="txtFinishTime" class="form-control form-control-sm rounded-0"
               style="width:90px;" placeholder="HH:MM" />
    </div>
    <div class="col-auto">
        <input type="text" id="txtFinishDate" class="form-control form-control-sm rounded-0"
               style="width:120px;" placeholder="mm/dd/yyyy" />
    </div>
</div>

<%-- Remarks & Details --%>
<div class="row g-2 mb-3 align-items-start">
    <div class="col-auto">
        <label class="small fw-semibold mb-0 mt-1" for="txtRemarks">Remarks &amp; Details:</label>
    </div>
    <div class="col">
        <textarea id="txtRemarks" class="form-control form-control-sm rounded-0"
                  rows="4" style="resize:vertical;"></textarea>
    </div>
</div>

<%-- Attach File + Note (bottom-right) --%>
<div class="row g-2 justify-content-end">
    <div class="col-md-5">
        <div class="border p-2 d-flex flex-column" style="height:90px;">
            <span class="small fw-semibold mb-1">Attach File / Picture</span>
            <input type="file" class="form-control form-control-sm rounded-0" style="font-size:0.8rem;" />
        </div>
    </div>
    <div class="col-md-5">
        <div class="border p-2 d-flex flex-column" style="height:90px;">
            <span class="small fw-semibold mb-1">Note</span>
            <textarea class="form-control form-control-sm rounded-0" rows="2"
                      style="flex:1; resize:none;"></textarea>
        </div>
    </div>
</div>

<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        document.querySelectorAll('input[name="ntAssign"]').forEach(function (r) {
            r.addEventListener('change', function () {
                if (document.getElementById('ntSelf').checked) {
                    document.getElementById('selAssignedTo').value = 'self';
                }
            });
        });
    });
</script>
