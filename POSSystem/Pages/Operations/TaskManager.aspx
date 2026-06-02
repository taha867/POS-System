<%@ Page Title="Task Manager" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaskManager.aspx.vb" Inherits="POSSystem.Pages.Operations.TaskManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Heading + Toolbar --%>
    <div class="d-flex align-items-center gap-2 mb-2 px-3 py-2 border flex-wrap" style="background-color:#f8f9fa;">
        <strong class="fs-5 me-2">Task Manager</strong>
        <asp:Button ID="BtnTransmit" runat="server" Text="Transmit" UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
        <asp:Button ID="BtnNew"      runat="server" Text="New"      UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
        <asp:Button ID="BtnSave"     runat="server" Text="Save"     UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
        <asp:Button ID="BtnView"     runat="server" Text="View"     UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
        <div class="ms-auto d-flex gap-2">
            <asp:Button ID="BtnDelete" runat="server" Text="Delete" UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
            <asp:Button ID="BtnEdit"   runat="server" Text="Edit"   UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
            <asp:Button ID="BtnPrint"  runat="server" Text="Print"  UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
        </div>
    </div>

    <style>
        .tm-tabs { display:flex; list-style:none; margin:0; padding:0; border-bottom:1px solid #dee2e6; }
        .tm-tabs .tm-tab-btn {
            padding:0.375rem 1.5rem; cursor:pointer; background:#e9ecef;
            color:#495057; border:1px solid #dee2e6; border-bottom:none;
            margin-right:2px; font-size:0.875rem;
        }
        .tm-tabs .tm-tab-btn.active { background:#6c757d; color:#fff; border-color:#6c757d; }
        .tm-tab-content { border:1px solid #dee2e6; border-top:none; }
        .tm-pane { display:none; padding:1rem; }
        .tm-pane.active { display:block; }
    </style>

    <%-- Tab Navigation --%>
    <ul class="tm-tabs" id="taskManagerTabs">
        <li><asp:Button runat="server" Text="Task Status"      UseSubmitBehavior="false" CssClass="tm-tab-btn active" OnClientClick="showTab('pane-taskstatus',this);     return false;" /></li>
        <li><asp:Button runat="server" Text="New Task"         UseSubmitBehavior="false" CssClass="tm-tab-btn"        OnClientClick="showTab('pane-newtask',this);         return false;" /></li>
        <li><asp:Button runat="server" Text="Response on Task" UseSubmitBehavior="false" CssClass="tm-tab-btn"        OnClientClick="showTab('pane-responseontask',this);  return false;" /></li>
        <li><asp:Button runat="server" Text="Task String"      UseSubmitBehavior="false" CssClass="tm-tab-btn"        OnClientClick="showTab('pane-taskstring',this);      return false;" /></li>
    </ul>

    <%-- Tab Content --%>
    <div class="tm-tab-content" id="taskManagerTabContent">

        <%-- Task Status --%>
        <div class="tm-pane active" id="pane-taskstatus">
            <div class="d-flex gap-5 mb-3 pb-2 border-bottom flex-wrap align-items-start">
                <div class="d-flex align-items-center gap-2">
                    <label class="fw-semibold small mb-0" for="DdlTaskNature">Task Nature</label>
                    <asp:DropDownList ID="DdlTaskNature" runat="server" CssClass="form-select form-select-sm rounded-0" style="width:170px;">
                        <asp:ListItem Value="all">All</asp:ListItem>
                        <asp:ListItem Value="critically_urgent">Critically Urgent</asp:ListItem>
                        <asp:ListItem Value="important">Important</asp:ListItem>
                        <asp:ListItem Value="regular">Regular</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="d-flex flex-column gap-2">
                    <div class="d-flex align-items-center gap-3 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="RbFltSelf"      runat="server" GroupName="taskAssignFilter" CssClass="form-check-input" Checked="true" />
                            <label class="form-check-label small" for="RbFltSelf">Self Task (To Do)</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="RbFltAssigned"  runat="server" GroupName="taskAssignFilter" CssClass="form-check-input" />
                            <label class="form-check-label small" for="RbFltAssigned">Assigned Tasks to Others</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="RbFltAssignAll" runat="server" GroupName="taskAssignFilter" CssClass="form-check-input" />
                            <label class="form-check-label small" for="RbFltAssignAll">All</label>
                        </div>
                    </div>
                    <div class="d-flex align-items-center gap-3 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="RbFltOpen"      runat="server" GroupName="taskStatusFilter" CssClass="form-check-input" Checked="true" />
                            <label class="form-check-label small" for="RbFltOpen">Open</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="RbFltClosed"    runat="server" GroupName="taskStatusFilter" CssClass="form-check-input" />
                            <label class="form-check-label small" for="RbFltClosed">Closed</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="RbFltDeferred"  runat="server" GroupName="taskStatusFilter" CssClass="form-check-input" />
                            <label class="form-check-label small" for="RbFltDeferred">Deffered</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="RbFltDelayed"   runat="server" GroupName="taskStatusFilter" CssClass="form-check-input" />
                            <label class="form-check-label small" for="RbFltDelayed">Delayed</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="RbFltStatAll"   runat="server" GroupName="taskStatusFilter" CssClass="form-check-input" />
                            <label class="form-check-label small" for="RbFltStatAll">All</label>
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
                                <asp:DropDownList ID="DdlRowStatus1" runat="server" CssClass="form-select form-select-sm rounded-0" style="width:110px;">
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem>Open</asp:ListItem>
                                    <asp:ListItem>Closed</asp:ListItem>
                                    <asp:ListItem>Deffered</asp:ListItem>
                                    <asp:ListItem>Delayed</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>2346</td>
                            <td>Get a Quote</td>
                            <td>Manager<br />Procurement<br />Sara Malik</td>
                            <td class="text-nowrap">Feb 15, 2026</td>
                            <td>
                                <asp:DropDownList ID="DdlRowStatus2" runat="server" CssClass="form-select form-select-sm rounded-0" style="width:110px;">
                                    <asp:ListItem Value=""></asp:ListItem>
                                    <asp:ListItem Selected="True">Open</asp:ListItem>
                                    <asp:ListItem>Closed</asp:ListItem>
                                    <asp:ListItem>Deffered</asp:ListItem>
                                    <asp:ListItem>Delayed</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>Follow up pending</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <%-- New Task --%>
        <div class="tm-pane" id="pane-newtask">
            <div class="d-flex justify-content-end gap-4 mb-3">
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0" for="TxtTaskId">Task ID:</label>
                    <asp:TextBox ID="TxtTaskId" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:130px;" />
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0" for="TxtTaskDate">Date:</label>
                    <asp:TextBox ID="TxtTaskDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:130px;" placeholder="mm/dd/yyyy" />
                </div>
            </div>
            <div class="d-flex align-items-center gap-4 mb-2 flex-wrap">
                <div class="form-check form-check-inline mb-0">
                    <asp:RadioButton ID="RbNtSelf"   runat="server" GroupName="ntAssign" CssClass="form-check-input" Checked="true" />
                    <label class="form-check-label small" for="RbNtSelf">Self Task (To Do)</label>
                </div>
                <div class="form-check form-check-inline mb-0">
                    <asp:RadioButton ID="RbNtOthers" runat="server" GroupName="ntAssign" CssClass="form-check-input" />
                    <label class="form-check-label small" for="RbNtOthers">Assigned Tasks to Others</label>
                </div>
            </div>
            <div class="d-flex align-items-center gap-5 mb-3 pb-2 border-bottom flex-wrap">
                <div class="d-flex align-items-center gap-3">
                    <div class="form-check form-check-inline mb-0">
                        <asp:RadioButton ID="RbNtCritical"  runat="server" GroupName="ntNature" CssClass="form-check-input" />
                        <label class="form-check-label small" for="RbNtCritical">Critically Urgent</label>
                    </div>
                    <div class="form-check form-check-inline mb-0">
                        <asp:RadioButton ID="RbNtImportant" runat="server" GroupName="ntNature" CssClass="form-check-input" Checked="true" />
                        <label class="form-check-label small" for="RbNtImportant">Important</label>
                    </div>
                    <div class="form-check form-check-inline mb-0">
                        <asp:RadioButton ID="RbNtRegular"   runat="server" GroupName="ntNature" CssClass="form-check-input" />
                        <label class="form-check-label small" for="RbNtRegular">Regular</label>
                    </div>
                </div>
                <div class="d-flex align-items-center gap-3">
                    <div class="form-check form-check-inline mb-0">
                        <asp:RadioButton ID="RbNtConfidential"    runat="server" GroupName="ntConfidential" CssClass="form-check-input" />
                        <label class="form-check-label small" for="RbNtConfidential">Confidential</label>
                    </div>
                    <div class="form-check form-check-inline mb-0">
                        <asp:RadioButton ID="RbNtNonConfidential" runat="server" GroupName="ntConfidential" CssClass="form-check-input" Checked="true" />
                        <label class="form-check-label small" for="RbNtNonConfidential">Non Confidential</label>
                    </div>
                </div>
            </div>
            <div class="row g-2 mb-3 align-items-center">
                <div class="col-auto"><label class="small fw-semibold mb-0" for="DdlAssignedTo">Assigned To</label></div>
                <div class="col-auto">
                    <asp:DropDownList ID="DdlAssignedTo" runat="server" CssClass="form-select form-select-sm rounded-0" style="width:160px;">
                        <asp:ListItem Value="self">Self</asp:ListItem>
                        <asp:ListItem Value="others">Others</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-auto ms-3"><label class="small fw-semibold mb-0" for="DdlTaskType">Type of Task:</label></div>
                <div class="col-auto">
                    <asp:DropDownList ID="DdlTaskType" runat="server" CssClass="form-select form-select-sm rounded-0" style="width:190px;">
                        <asp:ListItem>Create a Report</asp:ListItem>
                        <asp:ListItem>Get Information</asp:ListItem>
                        <asp:ListItem>Get a Quote</asp:ListItem>
                        <asp:ListItem>Send a Proposal</asp:ListItem>
                        <asp:ListItem>Send a Sale Quote</asp:ListItem>
                        <asp:ListItem>Make a Visit to</asp:ListItem>
                        <asp:ListItem>Make an Out of City Visit</asp:ListItem>
                        <asp:ListItem>Make an Out of Country Visit</asp:ListItem>
                        <asp:ListItem>Arrange a Meeting</asp:ListItem>
                        <asp:ListItem>Submit Proposal</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-auto ms-3"><label class="small fw-semibold mb-0" for="DdlCopyTo">Copy to</label></div>
                <div class="col-auto">
                    <asp:DropDownList ID="DdlCopyTo" runat="server" CssClass="form-select form-select-sm rounded-0" style="width:190px;">
                        <asp:ListItem Value="">-- Select --</asp:ListItem>
                        <asp:ListItem>Any Person in Company</asp:ListItem>
                        <asp:ListItem>Department Head</asp:ListItem>
                        <asp:ListItem>Manager HR</asp:ListItem>
                        <asp:ListItem>Manager Department</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row g-2 mb-3 align-items-center">
                <div class="col-auto"><label class="small fw-semibold mb-0" for="TxtTaskName">Task Name:</label></div>
                <div class="col-auto">
                    <asp:TextBox ID="TxtTaskName" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:240px;" MaxLength="20" placeholder="Max 20 characters" />
                </div>
                <div class="col-auto ms-3"><label class="small fw-semibold mb-0">Task Finished by (Time &amp; Date):</label></div>
                <div class="col-auto">
                    <asp:TextBox ID="TxtFinishTime" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" />
                </div>
                <div class="col-auto">
                    <asp:TextBox ID="TxtFinishDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
                </div>
            </div>
            <div class="row g-2 mb-3 align-items-start">
                <div class="col-auto"><label class="small fw-semibold mb-0 mt-1" for="TxtRemarks">Remarks &amp; Details:</label></div>
                <div class="col">
                    <asp:TextBox ID="TxtRemarks" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="4" style="resize:vertical;" />
                </div>
            </div>
            <div class="row g-2 justify-content-end">
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Attach File / Picture</span>
                        <asp:FileUpload ID="FuAttachNew" runat="server" CssClass="form-control form-control-sm rounded-0" style="font-size:0.8rem;" />
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Note</span>
                        <asp:TextBox ID="TxtNoteNew" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="2" style="flex:1; resize:none;" />
                    </div>
                </div>
            </div>
        </div>

        <%-- Response on Task --%>
        <div class="tm-pane" id="pane-responseontask">
            <div class="d-flex justify-content-end gap-4 mb-3 flex-wrap">
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0" for="DdlRespTaskName">Select Task Name</label>
                    <asp:DropDownList ID="DdlRespTaskName" runat="server" CssClass="form-select form-select-sm rounded-0" style="width:180px;">
                        <asp:ListItem Value="">-- Select --</asp:ListItem>
                        <asp:ListItem>Create Report</asp:ListItem>
                        <asp:ListItem>Get a Quote</asp:ListItem>
                        <asp:ListItem>Arrange a Meeting</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0">Date:</label>
                    <span class="small">Jan 01-2026</span>
                </div>
            </div>
            <div class="border p-2 mb-3" style="background-color:#f8f9fa; font-size:0.83rem;">
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Task ID:</span></div>
                    <div class="col-auto"><asp:TextBox ID="TxtRespTaskId"     runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Assigned To:</span></div>
                    <div class="col"><asp:TextBox ID="TxtRespAssignedTo"      runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Type of Task:</span></div>
                    <div class="col-auto"><asp:TextBox ID="TxtRespTaskType"   runat="server" CssClass="form-control form-control-sm rounded-0" style="width:160px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Task Name:</span></div>
                    <div class="col"><asp:TextBox ID="TxtRespTaskName"        runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Task Completion Target Time &amp; Date:</span></div>
                    <div class="col-auto"><asp:TextBox ID="TxtRespTargetTime" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:90px;"  placeholder="HH:MM" /></div>
                    <div class="col-auto"><asp:TextBox ID="TxtRespTargetDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" /></div>
                </div>
                <div class="row g-1 align-items-start">
                    <div class="col-auto"><span class="fw-semibold">Remarks &amp; Details:</span></div>
                    <div class="col"><asp:TextBox ID="TxtRespDetails" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="2" style="resize:vertical;" /></div>
                </div>
            </div>
            <div class="border p-2" style="font-size:0.83rem;">
                <h6 class="fw-bold mb-3">Actions</h6>
                <div class="row g-0 mb-3">
                    <div class="col-auto pe-3 pt-1" style="min-width:140px;"><span class="small fw-semibold">Response<br />by Receiver</span></div>
                    <div class="col d-flex flex-column gap-2">
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:260px;">
                                <asp:RadioButton ID="RbRcvr1" runat="server" GroupName="rcvrResponse" CssClass="form-check-input" Checked="true" />
                                <label class="form-check-label small" for="RbRcvr1">Received Well and will Finish up by</label>
                            </div>
                            <label class="small mb-0">Time</label><asp:TextBox ID="TxtRcvr1Time" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;"  placeholder="HH:MM" />
                            <label class="small mb-0">Date</label><asp:TextBox ID="TxtRcvr1Date" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:260px;">
                                <asp:RadioButton ID="RbRcvr2" runat="server" GroupName="rcvrResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="RbRcvr2">Please Deffer until</label>
                            </div>
                            <label class="small mb-0">Time</label><asp:TextBox ID="TxtRcvr2Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;"  placeholder="HH:MM" />
                            <label class="small mb-0">Date</label><asp:TextBox ID="TxtRcvr2Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label><asp:TextBox ID="TxtRcvr2Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:260px;">
                                <asp:RadioButton ID="RbRcvr3" runat="server" GroupName="rcvrResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="RbRcvr3">Please Cancel the Task</label>
                            </div>
                            <label class="small mb-0">Remarks</label><asp:TextBox ID="TxtRcvr3Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:260px;">
                                <asp:RadioButton ID="RbRcvr4" runat="server" GroupName="rcvrResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="RbRcvr4">Task Finished</label>
                            </div>
                            <label class="small mb-0">Time</label><asp:TextBox ID="TxtRcvr4Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;"  placeholder="HH:MM" />
                            <label class="small mb-0">Date</label><asp:TextBox ID="TxtRcvr4Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label><asp:TextBox ID="TxtRcvr4Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                    </div>
                </div>
                <hr class="my-2" />
                <div class="row g-0">
                    <div class="col-auto pe-3 pt-1" style="min-width:140px;"><span class="small fw-semibold">Response<br />by Creater</span></div>
                    <div class="col d-flex flex-column gap-2">
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:260px;">
                                <asp:RadioButton ID="RbCrtr1" runat="server" GroupName="createrResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="RbCrtr1">Please Deffer until</label>
                            </div>
                            <label class="small mb-0">Time</label><asp:TextBox ID="TxtCrtr1Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;"  placeholder="HH:MM" />
                            <label class="small mb-0">Date</label><asp:TextBox ID="TxtCrtr1Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label><asp:TextBox ID="TxtCrtr1Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:260px;">
                                <asp:RadioButton ID="RbCrtr2" runat="server" GroupName="createrResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="RbCrtr2">Deffer request accepted</label>
                            </div>
                            <label class="small mb-0">Remarks</label><asp:TextBox ID="TxtCrtr2Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:260px;">
                                <asp:RadioButton ID="RbCrtr3" runat="server" GroupName="createrResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="RbCrtr3">Deffer request Rejected</label>
                            </div>
                            <label class="small mb-0">Remarks</label><asp:TextBox ID="TxtCrtr3Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:260px;">
                                <asp:RadioButton ID="RbCrtr4" runat="server" GroupName="createrResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="RbCrtr4">Please Explain the Delay</label>
                            </div>
                            <label class="small mb-0">Remarks</label><asp:TextBox ID="TxtCrtr4Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:260px;">
                                <asp:RadioButton ID="RbCrtr5" runat="server" GroupName="createrResponse" CssClass="form-check-input" Checked="true" />
                                <label class="form-check-label small" for="RbCrtr5">Task Finished but having issues</label>
                            </div>
                            <label class="small mb-0">Remarks</label><asp:TextBox ID="TxtCrtr5Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:260px;">
                                <asp:RadioButton ID="RbCrtr6" runat="server" GroupName="createrResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="RbCrtr6">Task Finished and Closed</label>
                            </div>
                            <label class="small mb-0">Time</label><asp:TextBox ID="TxtCrtr6Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;"  placeholder="HH:MM" />
                            <label class="small mb-0">Date</label><asp:TextBox ID="TxtCrtr6Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label><asp:TextBox ID="TxtCrtr6Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="row g-2 justify-content-end mt-3">
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Attach File / Picture</span>
                        <asp:FileUpload ID="FuAttachResp" runat="server" CssClass="form-control form-control-sm rounded-0" style="font-size:0.8rem;" />
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Note</span>
                        <asp:TextBox ID="TxtNoteResp" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="2" style="flex:1; resize:none;" />
                    </div>
                </div>
            </div>
        </div>

        <%-- Task String --%>
        <div class="tm-pane" id="pane-taskstring">
            <div class="d-flex justify-content-end gap-4 mb-3 flex-wrap">
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0" for="DdlTsTaskName">Select Task Name</label>
                    <asp:DropDownList ID="DdlTsTaskName" runat="server" CssClass="form-select form-select-sm rounded-0" style="width:180px;">
                        <asp:ListItem Value="">-- Select --</asp:ListItem>
                        <asp:ListItem>Create Report</asp:ListItem>
                        <asp:ListItem>Get a Quote</asp:ListItem>
                        <asp:ListItem>Arrange a Meeting</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0">Date:</label>
                    <span class="small">Jan 01-2026</span>
                </div>
            </div>
            <div class="border p-2 mb-3" style="background-color:#f8f9fa; font-size:0.83rem;">
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Task ID:</span></div>
                    <div class="col-auto"><asp:TextBox ID="TxtTsTaskId"     runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Assigned To:</span></div>
                    <div class="col"><asp:TextBox ID="TxtTsAssignedTo"      runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Type of Task:</span></div>
                    <div class="col-auto"><asp:TextBox ID="TxtTsTaskType"   runat="server" CssClass="form-control form-control-sm rounded-0" style="width:160px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Task Name:</span></div>
                    <div class="col"><asp:TextBox ID="TxtTsTaskName"        runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Task Completion Target Time &amp; Date:</span></div>
                    <div class="col-auto"><asp:TextBox ID="TxtTsTargetTime" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:90px;"  placeholder="HH:MM" /></div>
                    <div class="col-auto"><asp:TextBox ID="TxtTsTargetDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" /></div>
                </div>
                <div class="row g-1 align-items-start">
                    <div class="col-auto"><span class="fw-semibold">Remarks &amp; Details:</span></div>
                    <div class="col"><asp:TextBox ID="TxtTsDetails" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="2" style="resize:vertical;" /></div>
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
                        <asp:FileUpload ID="FuAttachTs" runat="server" CssClass="form-control form-control-sm rounded-0" style="font-size:0.8rem;" />
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Note</span>
                        <asp:TextBox ID="TxtNoteTs" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="2" style="flex:1; resize:none;" />
                    </div>
                </div>
            </div>
        </div>

    </div>


    <script type="text/javascript">
        function showTab(paneid, clickedBtn) {
            var panes = document.querySelectorAll('#taskManagerTabContent .tm-pane');
            for (var i = 0; i < panes.length; i++) { panes[i].classList.remove('active'); }
            var btns = document.querySelectorAll('#taskManagerTabs .tm-tab-btn');
            for (var j = 0; j < btns.length; j++) { btns[j].classList.remove('active'); }
            document.getElementById(paneid).classList.add('active');
            clickedBtn.classList.add('active');
        }
    </script>

</asp:Content>
