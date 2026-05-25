<%@ Page Title="Task Manager" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaskManager.aspx.vb" Inherits="POSSystem.Pages.Operations.TaskManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Heading + Toolbar --%>
    <div class="d-flex align-items-center gap-2 mb-2 px-3 py-2 border flex-wrap" style="background-color:#f8f9fa;">
        <strong class="fs-5 me-2">Task Manager</strong>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Transmit</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">New</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Save</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">View</button>
        <div class="ms-auto d-flex gap-2">
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Delete</button>
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Edit</button>
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Print</button>
        </div>
    </div>

    <style>
        #taskManagerTabs .nav-link {
            background-color: #e9ecef; color: #495057;
            border-color: #dee2e6; border-radius: 0;
        }
        #taskManagerTabs .nav-link.active { background-color: #6c757d; color: #fff; border-color: #6c757d #6c757d #fff; }
        #taskManagerTabs .nav-link:focus { box-shadow: none; }
    </style>

    <%-- Tab Navigation --%>
    <ul class="nav nav-tabs" id="taskManagerTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active rounded-0 px-4" data-bs-toggle="tab" data-bs-target="#pane-taskstatus" type="button" role="tab">Task Status</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link rounded-0 px-4" data-bs-toggle="tab" data-bs-target="#pane-newtask" type="button" role="tab">New Task</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link rounded-0 px-4" data-bs-toggle="tab" data-bs-target="#pane-responseontask" type="button" role="tab">Response on Task</button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link rounded-0 px-4" data-bs-toggle="tab" data-bs-target="#pane-taskstring" type="button" role="tab">Task String</button>
        </li>
    </ul>

    <%-- Tab Content --%>
    <div class="tab-content border border-top-0" id="taskManagerTabContent">

        <%-- Task Status --%>
        <div class="tab-pane fade show active p-3" id="pane-taskstatus" role="tabpanel">
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
                            <td class="fw-bold">Asst Manager<br />Production<br />Saleem Ahmed</td>
                            <td class="fw-bold text-nowrap">Jan 01, 2016</td>
                            <td>
                                <select class="form-select form-select-sm rounded-0" style="width:110px;">
                                    <option></option><option>Open</option><option>Closed</option><option>Deffered</option><option>Delayed</option>
                                </select>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>2346</td>
                            <td>Get a Quote</td>
                            <td>Manager<br />Procurement<br />Sara Malik</td>
                            <td class="text-nowrap">Feb 15, 2026</td>
                            <td>
                                <select class="form-select form-select-sm rounded-0" style="width:110px;">
                                    <option></option><option selected>Open</option><option>Closed</option><option>Deffered</option><option>Delayed</option>
                                </select>
                            </td>
                            <td>Follow up pending</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <%-- New Task --%>
        <div class="tab-pane fade p-3" id="pane-newtask" role="tabpanel">
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
            <div class="row g-2 mb-3 align-items-center">
                <div class="col-auto"><label class="small fw-semibold mb-0" for="selAssignedTo">Assigned To</label></div>
                <div class="col-auto">
                    <select id="selAssignedTo" class="form-select form-select-sm rounded-0" style="width:160px;">
                        <option value="self">Self</option><option value="others">Others</option>
                    </select>
                </div>
                <div class="col-auto ms-3"><label class="small fw-semibold mb-0" for="selTaskType">Type of Task:</label></div>
                <div class="col-auto">
                    <select id="selTaskType" class="form-select form-select-sm rounded-0" style="width:190px;">
                        <option>Create a Report</option><option>Get Information</option><option>Get a Quote</option>
                        <option>Send a Proposal</option><option>Send a Sale Quote</option><option>Make a Visit to</option>
                        <option>Make an Out of City Visit</option><option>Make an Out of Country Visit</option>
                        <option>Arrange a Meeting</option><option>Submit Proposal</option>
                    </select>
                </div>
                <div class="col-auto ms-3"><label class="small fw-semibold mb-0" for="selCopyTo">Copy to</label></div>
                <div class="col-auto">
                    <select id="selCopyTo" class="form-select form-select-sm rounded-0" style="width:190px;">
                        <option value="">-- Select --</option><option>Any Person in Company</option>
                        <option>Department Head</option><option>Manager HR</option><option>Manager Department</option>
                    </select>
                </div>
            </div>
            <div class="row g-2 mb-3 align-items-center">
                <div class="col-auto"><label class="small fw-semibold mb-0" for="txtTaskName">Task Name:</label></div>
                <div class="col-auto">
                    <input type="text" id="txtTaskName" class="form-control form-control-sm rounded-0" style="width:240px;" maxlength="20" placeholder="Max 20 characters" />
                </div>
                <div class="col-auto ms-3"><label class="small fw-semibold mb-0">Task Finished by (Time &amp; Date):</label></div>
                <div class="col-auto">
                    <input type="text" id="txtFinishTime" class="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" />
                </div>
                <div class="col-auto">
                    <input type="text" id="txtFinishDate" class="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
                </div>
            </div>
            <div class="row g-2 mb-3 align-items-start">
                <div class="col-auto"><label class="small fw-semibold mb-0 mt-1" for="txtRemarks">Remarks &amp; Details:</label></div>
                <div class="col">
                    <textarea id="txtRemarks" class="form-control form-control-sm rounded-0" rows="4" style="resize:vertical;"></textarea>
                </div>
            </div>
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
                        <textarea class="form-control form-control-sm rounded-0" rows="2" style="flex:1; resize:none;"></textarea>
                    </div>
                </div>
            </div>
        </div>

        <%-- Response on Task --%>
        <div class="tab-pane fade p-3" id="pane-responseontask" role="tabpanel">
            <div class="d-flex justify-content-end gap-4 mb-3 flex-wrap">
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0" for="selTaskName">Select Task Name</label>
                    <select id="selTaskName" class="form-select form-select-sm rounded-0" style="width:180px;">
                        <option value="">-- Select --</option><option>Create Report</option><option>Get a Quote</option><option>Arrange a Meeting</option>
                    </select>
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0">Date:</label>
                    <span class="small">Jan 01-2026</span>
                </div>
            </div>
            <div class="border p-2 mb-3" style="background-color:#f8f9fa; font-size:0.83rem;">
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Task ID:</span></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Assigned To:</span></div>
                    <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Type of Task:</span></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:160px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Task Name:</span></div>
                    <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Task Completion Target Time &amp; Date:</span></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" /></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" /></div>
                </div>
                <div class="row g-1 align-items-start">
                    <div class="col-auto"><span class="fw-semibold">Remarks &amp; Details:</span></div>
                    <div class="col"><textarea class="form-control form-control-sm rounded-0" rows="2" style="resize:vertical;"></textarea></div>
                </div>
            </div>
            <div class="border p-2" style="font-size:0.83rem;">
                <h6 class="fw-bold mb-3">Actions</h6>
                <div class="row g-0 mb-3">
                    <div class="col-auto pe-3 pt-1" style="min-width:140px;"><span class="small fw-semibold">Response<br />by Receiver</span></div>
                    <div class="col d-flex flex-column gap-2">
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:260px;">
                                <input class="form-check-input" type="radio" name="rcvrResponse" id="rcvr1" value="received_well" checked>
                                <label class="form-check-label small" for="rcvr1">Received Well and will Finish up by</label>
                            </div>
                            <label class="small mb-0">Time</label><input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label><input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:260px;">
                                <input class="form-check-input" type="radio" name="rcvrResponse" id="rcvr2" value="deffer_until">
                                <label class="form-check-label small" for="rcvr2">Please Deffer until</label>
                            </div>
                            <label class="small mb-0">Time</label><input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label><input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label><input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:260px;">
                                <input class="form-check-input" type="radio" name="rcvrResponse" id="rcvr3" value="cancel_task">
                                <label class="form-check-label small" for="rcvr3">Please Cancel the Task</label>
                            </div>
                            <label class="small mb-0">Remarks</label><input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:260px;">
                                <input class="form-check-input" type="radio" name="rcvrResponse" id="rcvr4" value="task_finished">
                                <label class="form-check-label small" for="rcvr4">Task Finished</label>
                            </div>
                            <label class="small mb-0">Time</label><input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label><input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label><input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                    </div>
                </div>
                <hr class="my-2" />
                <div class="row g-0">
                    <div class="col-auto pe-3 pt-1" style="min-width:140px;"><span class="small fw-semibold">Response<br />by Creater</span></div>
                    <div class="col d-flex flex-column gap-2">
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:260px;">
                                <input class="form-check-input" type="radio" name="createrResponse" id="creater1" value="deffer_until">
                                <label class="form-check-label small" for="creater1">Please Deffer until</label>
                            </div>
                            <label class="small mb-0">Time</label><input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label><input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label><input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:260px;">
                                <input class="form-check-input" type="radio" name="createrResponse" id="creater2" value="deffer_accepted">
                                <label class="form-check-label small" for="creater2">Deffer request accepted</label>
                            </div>
                            <label class="small mb-0">Remarks</label><input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:260px;">
                                <input class="form-check-input" type="radio" name="createrResponse" id="creater3" value="deffer_rejected">
                                <label class="form-check-label small" for="creater3">Deffer request Rejected</label>
                            </div>
                            <label class="small mb-0">Remarks</label><input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:260px;">
                                <input class="form-check-input" type="radio" name="createrResponse" id="creater4" value="explain_delay">
                                <label class="form-check-label small" for="creater4">Please Explain the Delay</label>
                            </div>
                            <label class="small mb-0">Remarks</label><input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:260px;">
                                <input class="form-check-input" type="radio" name="createrResponse" id="creater5" value="finished_issues" checked>
                                <label class="form-check-label small" for="creater5">Task Finished but having issues</label>
                            </div>
                            <label class="small mb-0">Remarks</label><input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:260px;">
                                <input class="form-check-input" type="radio" name="createrResponse" id="creater6" value="finished_closed">
                                <label class="form-check-label small" for="creater6">Task Finished and Closed</label>
                            </div>
                            <label class="small mb-0">Time</label><input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label><input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label><input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                    </div>
                </div>
            </div>
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
        </div>

        <%-- Task String --%>
        <div class="tab-pane fade p-3" id="pane-taskstring" role="tabpanel">
            <div class="d-flex justify-content-end gap-4 mb-3 flex-wrap">
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0" for="selTsTaskName">Select Task Name</label>
                    <select id="selTsTaskName" class="form-select form-select-sm rounded-0" style="width:180px;">
                        <option value="">-- Select --</option><option>Create Report</option><option>Get a Quote</option><option>Arrange a Meeting</option>
                    </select>
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0">Date:</label>
                    <span class="small">Jan 01-2026</span>
                </div>
            </div>
            <div class="border p-2 mb-3" style="background-color:#f8f9fa; font-size:0.83rem;">
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Task ID:</span></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Assigned To:</span></div>
                    <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Type of Task:</span></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:160px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Task Name:</span></div>
                    <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Task Completion Target Time &amp; Date:</span></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" /></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" /></div>
                </div>
                <div class="row g-1 align-items-start">
                    <div class="col-auto"><span class="fw-semibold">Remarks &amp; Details:</span></div>
                    <div class="col"><textarea class="form-control form-control-sm rounded-0" rows="2" style="resize:vertical;"></textarea></div>
                </div>
            </div>
            <h6 class="fw-bold mb-2">Task String</h6>
            <div class="table-responsive">
                <table class="table table-bordered table-sm mb-0" style="font-size:0.82rem;">
                    <thead style="background-color:#f8f9fa;">
                        <tr>
                            <th class="rounded-0 text-nowrap">Time</th>
                            <th class="rounded-0 text-nowrap">Date</th>
                            <th class="rounded-0 text-nowrap">Action</th>
                            <th class="rounded-0 text-nowrap">Response by Receiver</th>
                            <th class="rounded-0 text-nowrap">Response by Creater</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr><td class="text-nowrap">12:34 Pm</td><td class="text-nowrap">Jan 01, 2026</td><td>Created</td><td>-</td><td>Created</td></tr>
                        <tr><td class="text-nowrap">12:39 Pm</td><td class="text-nowrap">Jan 01, 2026</td><td>Responsed</td><td>Task Accepted</td><td>-</td></tr>
                        <tr><td class="text-nowrap">3:05 Pm</td><td class="text-nowrap">Jan 01, 2026</td><td>Delayed</td><td>Changed Completion Time</td><td>-</td></tr>
                        <tr><td class="text-nowrap">4:10 Pm</td><td class="text-nowrap">Jan 01, 2026</td><td>Delay Accepted</td><td>-</td><td>Delay Accepted</td></tr>
                        <tr><td class="text-nowrap">10:19 Am</td><td class="text-nowrap">Jan 02, 2026</td><td>Task Finished</td><td>Task Finished Submitted</td><td>-</td></tr>
                        <tr><td class="text-nowrap">11:10 Am</td><td class="text-nowrap">Jan 02, 2026</td><td>Task Finished Accepted</td><td>-</td><td>Task Closed</td></tr>
                    </tbody>
                </table>
            </div>
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
        </div>

    </div>

</asp:Content>
