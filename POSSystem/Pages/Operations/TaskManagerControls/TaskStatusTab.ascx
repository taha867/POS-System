<%@ Control Language="VB" AutoEventWireup="true" CodeBehind="TaskStatusTab.ascx.vb" Inherits="POSSystem.Pages.Operations.TaskManagerControls.TaskStatusTab" %>

<%-- Filters: Task Nature dropdown + radio rows --%>
<div class="d-flex gap-5 mb-3 pb-2 border-bottom flex-wrap align-items-start">

    <div class="d-flex align-items-center gap-2">
        <label class="fw-semibold small mb-0" for="ddlTaskNature">Task Nature</label>
        <select id="ddlTaskNature" class="form-select form-select-sm rounded-0" style="width:170px;">
            <option value="all">All</option>
            <option value="critically_urgent">Critically Urgent</option>
            <option value="important">Important</option>
            <option value="regular">Regular</option>
        </select>
    </div>

    <div class="d-flex flex-column gap-2">
        <%-- Row 1: Assignment --%>
        <div class="d-flex align-items-center gap-3 flex-wrap">
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="taskAssignFilter" id="fltSelf" value="self" checked>
                <label class="form-check-label small" for="fltSelf">Self Task (To Do)</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="taskAssignFilter" id="fltAssigned" value="assigned">
                <label class="form-check-label small" for="fltAssigned">Assigned Tasks to Others</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="taskAssignFilter" id="fltAssignAll" value="all">
                <label class="form-check-label small" for="fltAssignAll">All</label>
            </div>
        </div>
        <%-- Row 2: Status --%>
        <div class="d-flex align-items-center gap-3 flex-wrap">
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="taskStatusFilter" id="fltOpen" value="open" checked>
                <label class="form-check-label small" for="fltOpen">Open</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="taskStatusFilter" id="fltClosed" value="closed">
                <label class="form-check-label small" for="fltClosed">Closed</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="taskStatusFilter" id="fltDeferred" value="deferred">
                <label class="form-check-label small" for="fltDeferred">Deffered</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="taskStatusFilter" id="fltDelayed" value="delayed">
                <label class="form-check-label small" for="fltDelayed">Delayed</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="taskStatusFilter" id="fltStatusAll" value="all">
                <label class="form-check-label small" for="fltStatusAll">All</label>
            </div>
        </div>
    </div>

</div>

<%-- Task Grid --%>
<div class="table-responsive">
    <table class="table table-bordered table-sm mb-0" style="font-size:0.82rem;">
        <thead style="background-color:#f8f9fa;">
            <tr>
                <th class="rounded-0 text-nowrap">Task Id</th>
                <th class="rounded-0 text-nowrap">Task Name List</th>
                <th class="rounded-0 text-nowrap">Task Assigned To</th>
                <th class="rounded-0 text-nowrap">Task Initiated Date</th>
                <th class="rounded-0 text-nowrap">Status</th>
                <th class="rounded-0">Remarks</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td class="fw-bold">2345</td>
                <td class="fw-bold">Create Report</td>
                <td class="fw-bold">
                    Asst Manager<br />
                    Production<br />
                    Saleem Ahmed
                </td>
                <td class="fw-bold text-nowrap">Jan 01, 2016</td>
                <td>
                    <select class="form-select form-select-sm rounded-0" style="width:110px;">
                        <option></option>
                        <option>Open</option>
                        <option>Closed</option>
                        <option>Deffered</option>
                        <option>Delayed</option>
                    </select>
                </td>
                <td></td>
            </tr>
            <tr>
                <td>2346</td>
                <td>Get a Quote</td>
                <td>
                    Manager<br />
                    Procurement<br />
                    Sara Malik
                </td>
                <td class="text-nowrap">Feb 15, 2026</td>
                <td>
                    <select class="form-select form-select-sm rounded-0" style="width:110px;">
                        <option></option>
                        <option selected>Open</option>
                        <option>Closed</option>
                        <option>Deffered</option>
                        <option>Delayed</option>
                    </select>
                </td>
                <td>Follow up pending</td>
            </tr>
        </tbody>
    </table>
</div>
