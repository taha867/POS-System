<%@ Page Title="Task Setup" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaskSetup.aspx.vb" Inherits="POSSystem.Pages.Operations.TaskSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Toolbar --%>
    <div class="d-flex gap-2 mb-2 align-items-center flex-wrap">
        <button type="button" id="btnManagerHR" class="btn btn-outline-secondary rounded-0" style="min-width:130px" onclick="setManager('hr')">Manager HR</button>
        <button type="button" id="btnManagerDept" class="btn btn-outline-secondary rounded-0" style="min-width:150px" onclick="setManager('dept')">Manager Department</button>
        <button type="button" class="btn btn-outline-secondary rounded-0" style="min-width:110px">Verified</button>
        <button type="button" class="btn btn-outline-secondary rounded-0" style="min-width:110px">Save</button>
        <div class="ms-auto d-flex gap-2">
            <button type="button" class="btn btn-outline-secondary rounded-0" style="min-width:110px">New</button>
            <button type="button" class="btn btn-outline-secondary rounded-0" style="min-width:110px">Delete</button>
            <button type="button" class="btn btn-outline-secondary rounded-0" style="min-width:110px">Edit</button>
            <button type="button" class="btn btn-outline-secondary rounded-0" style="min-width:110px">Print</button>
        </div>
    </div>
    <p class="text-muted small mb-3">Manager of the department of the person who is creating the Task.</p>

    <%-- Main content area --%>
    <div class="border p-3">
        <div class="row g-0">

            <%-- Left column: Task Status + Task Action --%>
            <div class="col-md-6">

                <%-- Task Status --%>
                <div class="border p-3 me-md-2 mb-3">
                    <h6 class="fw-bold mb-2">Task Status</h6>
                    <ul id="list_status" class="list-unstyled mb-2">
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

                <%-- Task Action --%>
                <div class="border p-3 me-md-2">
                    <h6 class="fw-bold mb-2">Task Action</h6>
                    <ul class="list-unstyled mb-0">
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

            <%-- Right column: Type of Task + Task Response --%>
            <div class="col-md-6">

                <%-- Type of Task --%>
                <div class="border p-3 ms-md-2 mb-3">
                    <h6 class="fw-bold mb-2">Type of Task</h6>
                    <ul id="list_tasktype" class="list-unstyled mb-2">
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

                <%-- Task Response --%>
                <div class="border p-3 ms-md-2">
                    <h6 class="fw-bold mb-2">Task Response</h6>
                    <ul id="list_response" class="list-unstyled mb-2">
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
    </div>

    <script type="text/javascript">
        function setManager(type) {
            document.getElementById('btnManagerHR').className   = 'btn rounded-0' + (type === 'hr'   ? ' btn-primary' : ' btn-outline-secondary');
            document.getElementById('btnManagerDept').className = 'btn rounded-0' + (type === 'dept' ? ' btn-primary' : ' btn-outline-secondary');
            document.getElementById('btnManagerHR').style.minWidth   = '130px';
            document.getElementById('btnManagerDept').style.minWidth = '150px';
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
