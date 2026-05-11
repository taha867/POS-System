<%@ Control Language="VB" AutoEventWireup="true" CodeBehind="ResponseOnTaskTab.ascx.vb" Inherits="POSSystem.Pages.Operations.TaskManagerControls.ResponseOnTaskTab" %>

<%-- Select Task + Date (top-right) --%>
<div class="d-flex justify-content-end gap-4 mb-3 flex-wrap">
    <div class="d-flex align-items-center gap-2">
        <label class="small fw-semibold mb-0" for="selTaskName">Select Task Name</label>
        <select id="selTaskName" class="form-select form-select-sm rounded-0" style="width:180px;">
            <option value="">-- Select --</option>
            <option>Create Report</option>
            <option>Get a Quote</option>
            <option>Arrange a Meeting</option>
        </select>
    </div>
    <div class="d-flex align-items-center gap-2">
        <label class="small fw-semibold mb-0">Date:</label>
        <span class="small">Jan 01-2026</span>
    </div>
</div>

<%-- Task Info --%>
<div class="border p-2 mb-3" style="background-color:#f8f9fa; font-size:0.83rem;">
    <div class="row g-1 mb-1 align-items-center">
        <div class="col-auto">
            <span class="fw-semibold">Task ID:</span>
        </div>
        <div class="col-auto">
            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" />
        </div>
        <div class="col-auto ms-3">
            <span class="fw-semibold">Assigned To:</span>
        </div>
        <div class="col">
            <input type="text" class="form-control form-control-sm rounded-0" />
        </div>
    </div>
    <div class="row g-1 mb-1 align-items-center">
        <div class="col-auto">
            <span class="fw-semibold">Type of Task:</span>
        </div>
        <div class="col-auto">
            <input type="text" class="form-control form-control-sm rounded-0" style="width:160px;" />
        </div>
        <div class="col-auto ms-3">
            <span class="fw-semibold">Task Name:</span>
        </div>
        <div class="col">
            <input type="text" class="form-control form-control-sm rounded-0" />
        </div>
    </div>
    <div class="row g-1 mb-1 align-items-center">
        <div class="col-auto">
            <span class="fw-semibold">Task Completion Target Time &amp; Date:</span>
        </div>
        <div class="col-auto">
            <input type="text" class="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" />
        </div>
        <div class="col-auto">
            <input type="text" class="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
        </div>
    </div>
    <div class="row g-1 align-items-start">
        <div class="col-auto">
            <span class="fw-semibold">Remarks &amp; Details:</span>
        </div>
        <div class="col">
            <textarea class="form-control form-control-sm rounded-0" rows="2" style="resize:vertical;"></textarea>
        </div>
    </div>
</div>

<%-- Actions --%>
<div class="border p-2" style="font-size:0.83rem;">
    <h6 class="fw-bold mb-3">Actions</h6>

    <%-- Response by Receiver --%>
    <div class="row g-0 mb-3">
        <div class="col-auto pe-3 pt-1" style="min-width:140px;">
            <span class="small fw-semibold">Response<br />by Receiver</span>
        </div>
        <div class="col d-flex flex-column gap-2">

            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:260px;">
                    <input class="form-check-input" type="radio" name="rcvrResponse" id="rcvr1" value="received_well" checked>
                    <label class="form-check-label small" for="rcvr1">Received Well and will Finish up by</label>
                </div>
                <label class="small mb-0">Time</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                <label class="small mb-0">Date</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
            </div>

            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:260px;">
                    <input class="form-check-input" type="radio" name="rcvrResponse" id="rcvr2" value="deffer_until">
                    <label class="form-check-label small" for="rcvr2">Please Deffer until</label>
                </div>
                <label class="small mb-0">Time</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                <label class="small mb-0">Date</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                <label class="small mb-0">Remarks</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
            </div>

            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:260px;">
                    <input class="form-check-input" type="radio" name="rcvrResponse" id="rcvr3" value="cancel_task">
                    <label class="form-check-label small" for="rcvr3">Please Cancel the Task</label>
                </div>
                <label class="small mb-0">Remarks</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
            </div>

            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:260px;">
                    <input class="form-check-input" type="radio" name="rcvrResponse" id="rcvr4" value="task_finished">
                    <label class="form-check-label small" for="rcvr4">Task Finished</label>
                </div>
                <label class="small mb-0">Time</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                <label class="small mb-0">Date</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                <label class="small mb-0">Remarks</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
            </div>

        </div>
    </div>

    <hr class="my-2" />

    <%-- Response by Creater --%>
    <div class="row g-0">
        <div class="col-auto pe-3 pt-1" style="min-width:140px;">
            <span class="small fw-semibold">Response<br />by Creater</span>
        </div>
        <div class="col d-flex flex-column gap-2">

            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:260px;">
                    <input class="form-check-input" type="radio" name="createrResponse" id="creater1" value="deffer_until">
                    <label class="form-check-label small" for="creater1">Please Deffer until</label>
                </div>
                <label class="small mb-0">Time</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                <label class="small mb-0">Date</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                <label class="small mb-0">Remarks</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
            </div>

            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:260px;">
                    <input class="form-check-input" type="radio" name="createrResponse" id="creater2" value="deffer_accepted">
                    <label class="form-check-label small" for="creater2">Deffer request accepted</label>
                </div>
                <label class="small mb-0">Remarks</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
            </div>

            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:260px;">
                    <input class="form-check-input" type="radio" name="createrResponse" id="creater3" value="deffer_rejected">
                    <label class="form-check-label small" for="creater3">Deffer request Rejected</label>
                </div>
                <label class="small mb-0">Remarks</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
            </div>

            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:260px;">
                    <input class="form-check-input" type="radio" name="createrResponse" id="creater4" value="explain_delay">
                    <label class="form-check-label small" for="creater4">Please Explain the Delay</label>
                </div>
                <label class="small mb-0">Remarks</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
            </div>

            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:260px;">
                    <input class="form-check-input" type="radio" name="createrResponse" id="creater5" value="finished_issues" checked>
                    <label class="form-check-label small" for="creater5">Task Finished but having issues</label>
                </div>
                <label class="small mb-0">Remarks</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
            </div>

            <div class="d-flex align-items-center gap-2 flex-wrap">
                <div class="form-check mb-0" style="min-width:260px;">
                    <input class="form-check-input" type="radio" name="createrResponse" id="creater6" value="finished_closed">
                    <label class="form-check-label small" for="creater6">Task Finished and Closed</label>
                </div>
                <label class="small mb-0">Time</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                <label class="small mb-0">Date</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                <label class="small mb-0">Remarks</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
            </div>

        </div>
    </div>

</div>

<%-- Attach File + Note (bottom-right) --%>
<div class="row g-2 justify-content-end mt-3">
    <div class="col-md-5">
        <div class="border p-2 d-flex flex-column" style="height:90px;">
            <span class="small fw-semibold mb-1">Attach File / Picture</span>
            <input type="file" class="form-control form-control-sm rounded-0" style="font-size:0.8rem;" />
        </div>
    </div>
    <div class="col-md-5">
        <div class="border p-2 d-flex flex-column" style="height:90px;">
            <span class="small fw-semibold mb-1">Note</span>
            <textarea class="form-control form-control-sm rounded-0" rows="2" style="flex:1; resize:none;"></textarea>
        </div>
    </div>
</div>
