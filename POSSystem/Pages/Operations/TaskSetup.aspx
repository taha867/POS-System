<%@ Page Title="Task Setup" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaskSetup.aspx.vb" Inherits="POSSystem.Pages.Operations.TaskSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Heading + Toolbar --%>
    <div class="d-flex align-items-center gap-2 mb-2 px-3 py-2 border flex-wrap" style="background-color:#f8f9fa;">
        <strong class="fs-5 me-2">Task Setup</strong>
        <button type="button" id="btnManagerHR" class="btn btn-sm btn-outline-secondary rounded-0" onclick="setManager('hr')">Manager HR</button>
        <button type="button" id="btnManagerDept" class="btn btn-sm btn-outline-secondary rounded-0" onclick="setManager('dept')">Manager Department</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Verified</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Save</button>
        <div class="ms-auto d-flex gap-2">
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">New</button>
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Delete</button>
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Edit</button>
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Print</button>
        </div>
    </div>
    <%-- Main content area --%>
    <div class="border p-3">
        <div class="row g-0" style="align-items:stretch;">

            <%-- Left column: Type of Task + Task Action --%>
            <div class="col-md-6 d-flex flex-column" style="gap:1rem;">

                <%-- Type of Task --%>
                <div class="border p-3 me-md-2 d-flex flex-column" style="height:220px;">
                    <h6 class="fw-bold mb-2">Type of Task</h6>
                    <ul id="list_tasktype" class="list-unstyled mb-2" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>Create Report</li>
                        <li>Get Information</li>
                        <li>Get a Quote</li>
                        <li>Send a Proposal</li>
                        <li>Send a Sale Quote</li>
                        <li>Make a Visit to</li>
                        <li>Make a Out of City Visit</li>
                        <li>Make a Out of Country Visit</li>
                        <li>Arrange a Meeting</li>
                        <li>Submit Proposal</li>
                    </ul>
                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-0" onclick="showAddPanel('tasktype')">+ Add New</button>
                    <div id="addPanel_tasktype" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                        <input type="text" id="txtAdd_tasktype" class="form-control form-control-sm rounded-0" style="max-width:100%;width:200px"
                               oninput="document.getElementById('btnAdd_tasktype').disabled = this.value.trim() === '';" />
                        <button type="button" id="btnAdd_tasktype" class="btn btn-sm btn-outline-secondary rounded-0" disabled onclick="addItem('tasktype')">Add</button>
                        <a href="#" class="text-secondary small" onclick="hideAddPanel('tasktype'); return false;">Cancel</a>
                    </div>
                </div>

                <%-- Task Action --%>
                <div class="border p-3 me-md-2 d-flex flex-column" style="height:220px;">
                    <h6 class="fw-bold mb-2">Task Action</h6>
                    <ul class="list-unstyled mb-0" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>Task Created</li>
                        <li>Responded</li>
                        <li>Delayed</li>
                        <li>Canceled</li>
                        <li>Deffered</li>
                        <li>Task Finished Reported</li>
                        <li>Task Finished Accepted</li>
                    </ul>
                </div>

            </div>

            <%-- Right column: Task Status + Task Response --%>
            <div class="col-md-6 d-flex flex-column" style="gap:1rem;">

                <%-- Task Status --%>
                <div class="border p-3 ms-md-2 d-flex flex-column" style="height:220px;">
                    <h6 class="fw-bold mb-2">Task Status</h6>
                    <ul id="list_status" class="list-unstyled mb-2" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>Finished</li>
                        <li>Deffered</li>
                        <li>Delayed</li>
                        <li>Under Process</li>
                        <li>Cancelled</li>
                    </ul>
                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-0" onclick="showAddPanel('status')">+ Add New</button>
                    <div id="addPanel_status" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                        <input type="text" id="txtAdd_status" class="form-control form-control-sm rounded-0" style="max-width:100%;width:200px"
                               oninput="document.getElementById('btnAdd_status').disabled = this.value.trim() === '';" />
                        <button type="button" id="btnAdd_status" class="btn btn-sm btn-outline-secondary rounded-0" disabled onclick="addItem('status')">Add</button>
                        <a href="#" class="text-secondary small" onclick="hideAddPanel('status'); return false;">Cancel</a>
                    </div>
                </div>

                <%-- Task Response --%>
                <div class="border p-3 ms-md-2 d-flex flex-column" style="height:220px;">
                    <h6 class="fw-bold mb-2">Task Response</h6>
                    <ul id="list_response" class="list-unstyled mb-2" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>Task Created Report</li>
                        <li>Task Accepted</li>
                        <li>Task Deffered Request</li>
                        <li>Task Deffered Accepted</li>
                        <li>Task Deffered Recected</li>
                        <li>Task Cancel Request</li>
                        <li>Task Cancel Accepted</li>
                        <li>Task Cancel Recected</li>
                        <li>Task CFinished</li>
                    </ul>
                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-0" onclick="showAddPanel('response')">+ Add New</button>
                    <div id="addPanel_response" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                        <input type="text" id="txtAdd_response" class="form-control form-control-sm rounded-0" style="max-width:100%;width:200px"
                               oninput="document.getElementById('btnAdd_response').disabled = this.value.trim() === '';" />
                        <button type="button" id="btnAdd_response" class="btn btn-sm btn-outline-secondary rounded-0" disabled onclick="addItem('response')">Add</button>
                        <a href="#" class="text-secondary small" onclick="hideAddPanel('response'); return false;">Cancel</a>
                    </div>
                </div>

            </div>
        </div>

        <%-- Task Nature --%>
        <div class="row g-0 mt-3">
            <div class="col-md-6">
                <div class="border p-3 me-md-2 d-flex flex-column" style="height:220px;">
                    <h6 class="fw-bold mb-2">Task Nature</h6>
                    <div style="overflow-y:auto; flex:1; min-height:0;">
                        <div class="form-check mb-1">
                            <input class="form-check-input" type="radio" name="taskNature" id="natCritical" value="critically_urgent">
                            <label class="form-check-label" for="natCritical">Critically Urgent</label>
                        </div>
                        <div class="form-check mb-1">
                            <input class="form-check-input" type="radio" name="taskNature" id="natImportant" value="important">
                            <label class="form-check-label" for="natImportant">Important</label>
                        </div>
                        <div class="form-check mb-1">
                            <input class="form-check-input" type="radio" name="taskNature" id="natRegular" value="regular">
                            <label class="form-check-label" for="natRegular">Regular</label>
                        </div>
                        <div class="form-check mb-1">
                            <input class="form-check-input" type="radio" name="taskNature" id="natAll" value="all">
                            <label class="form-check-label" for="natAll">All</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <script type="text/javascript">
        function setManager(type) {
            document.getElementById('btnManagerHR').className   = 'btn btn-sm rounded-0' + (type === 'hr'   ? ' btn-primary' : ' btn-outline-secondary');
            document.getElementById('btnManagerDept').className = 'btn btn-sm rounded-0' + (type === 'dept' ? ' btn-primary' : ' btn-outline-secondary');
        }
        function showAddPanel(id) {
            var panel = document.getElementById('addPanel_' + id);
            panel.style.display = 'flex';
            panel.style.removeProperty('display'); // clear the !important override
            panel.setAttribute('style', 'display:flex !important');
            document.getElementById('txtAdd_' + id).value = '';
            document.getElementById('btnAdd_' + id).disabled = true;
            document.getElementById('txtAdd_' + id).focus();
        }
        function hideAddPanel(id) {
            document.getElementById('addPanel_' + id).setAttribute('style', 'display:none !important');
        }
        function addItem(id) {
            var txt = document.getElementById('txtAdd_' + id);
            var val = txt.value.trim();
            if (!val) return;
            var list = document.getElementById('list_' + id);
            var li = document.createElement('li');
            li.textContent = val;
            list.appendChild(li);
            hideAddPanel(id);
        }
    </script>

</asp:Content>
