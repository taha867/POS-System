<%@ Page Title="Task Setup" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaskSetup.aspx.vb" Inherits="POSSystem.Pages.Operations.TaskSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .task-setup-form { background:#f2f2f2; font-family:Arial,sans-serif; padding:0 0 12px; }
        .task-setup-form label,
        .task-setup-form span,
        .task-setup-form .fw-semibold,
        .task-setup-form .fw-bold,
        .task-setup-form h6 { font-style:italic; }
        .task-setup-header { background:#d9d9d9; border:1px solid #555; min-height:76px; }
        .task-setup-title { color:#666; font-size:2rem; font-style:italic; font-weight:700; line-height:1; }
        .task-setup-toolbar { gap:14px; padding:0 8px; }
        .task-setup-command-btn { color:#002d62; font-size:10px; font-weight:700; height:52px; line-height:1.1; white-space:normal; width:78px; }
        .task-setup-command-btn-wide { width:96px; }
        .task-setup-form .form-control { border-color:#555; border-radius:0 !important; font-size:12px; font-style:italic; max-width:none; }
        .task-setup-form .border { border-color:#000 !important; }
        .task-setup-body { background:#f2f2f2; border:2px solid #000 !important; min-height:520px; }
    </style>

    <div class="task-setup-form">
        <%-- Heading + Toolbar --%>
        <div class="row g-0 align-items-stretch task-setup-header">
            <div class="col d-flex align-items-center px-4">
                <strong class="task-setup-title">Task Setup</strong>
            </div>
            <div class="col-auto d-flex align-items-center justify-content-end flex-wrap task-setup-toolbar">
                <asp:Button ID="btnManagerHR"   runat="server" ClientIDMode="Static" Text="Manager HR"         UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 task-setup-command-btn task-setup-command-btn-wide" OnClientClick="setManager('hr');   return false;" />
                <asp:Button ID="btnManagerDept" runat="server" ClientIDMode="Static" Text="Manager Department" UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 task-setup-command-btn task-setup-command-btn-wide" OnClientClick="setManager('dept'); return false;" />
                <asp:Button ID="BtnVerified"    runat="server" Text="Verified"           UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 task-setup-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnSave"        runat="server" Text="Save"               UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 task-setup-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnNew"         runat="server" Text="New"                UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 task-setup-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnDelete"      runat="server" Text="Delete"             UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 task-setup-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnEdit"        runat="server" Text="Edit"               UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 task-setup-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnPrint"       runat="server" Text="Print"              UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 task-setup-command-btn" OnClientClick="return false;" />
            </div>
        </div>

    <%-- Main content area --%>
    <div class="border p-3 mt-3 task-setup-body">
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
                    <asp:Button runat="server" Text="+ Add New" UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="showAddPanel('tasktype'); return false;" />
                    <div id="addPanel_tasktype" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                        <asp:TextBox ID="txtAdd_tasktype" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" style="max-width:100%;width:200px"
                                     oninput="document.getElementById('btnAdd_tasktype').disabled = this.value.trim() === '';" />
                        <asp:Button ID="btnAdd_tasktype" runat="server" ClientIDMode="Static" UseSubmitBehavior="false" Enabled="false" Text="Add" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="addItem('tasktype'); return false;" />
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
                    <asp:Button runat="server" Text="+ Add New" UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="showAddPanel('status'); return false;" />
                    <div id="addPanel_status" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                        <asp:TextBox ID="txtAdd_status" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" style="max-width:100%;width:200px"
                                     oninput="document.getElementById('btnAdd_status').disabled = this.value.trim() === '';" />
                        <asp:Button ID="btnAdd_status" runat="server" ClientIDMode="Static" UseSubmitBehavior="false" Enabled="false" Text="Add" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="addItem('status'); return false;" />
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
                    <asp:Button runat="server" Text="+ Add New" UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="showAddPanel('response'); return false;" />
                    <div id="addPanel_response" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                        <asp:TextBox ID="txtAdd_response" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" style="max-width:100%;width:200px"
                                     oninput="document.getElementById('btnAdd_response').disabled = this.value.trim() === '';" />
                        <asp:Button ID="btnAdd_response" runat="server" ClientIDMode="Static" UseSubmitBehavior="false" Enabled="false" Text="Add" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="addItem('response'); return false;" />
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
                            <asp:RadioButton ID="natCritical" runat="server" ClientIDMode="Static" GroupName="taskNature" CssClass="form-check-input" />
                            <label class="form-check-label" for="natCritical">Critically Urgent</label>
                        </div>
                        <div class="form-check mb-1">
                            <asp:RadioButton ID="natImportant" runat="server" ClientIDMode="Static" GroupName="taskNature" CssClass="form-check-input" />
                            <label class="form-check-label" for="natImportant">Important</label>
                        </div>
                        <div class="form-check mb-1">
                            <asp:RadioButton ID="natRegular" runat="server" ClientIDMode="Static" GroupName="taskNature" CssClass="form-check-input" />
                            <label class="form-check-label" for="natRegular">Regular</label>
                        </div>
                        <div class="form-check mb-1">
                            <asp:RadioButton ID="natAll" runat="server" ClientIDMode="Static" GroupName="taskNature" CssClass="form-check-input" />
                            <label class="form-check-label" for="natAll">All</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <script type="text/javascript">
        function setManager(type) {
            document.getElementById('btnManagerHR').className   = 'btn btn-sm rounded-0 task-setup-command-btn task-setup-command-btn-wide' + (type === 'hr'   ? ' btn-primary' : ' btn-outline-secondary');
            document.getElementById('btnManagerDept').className = 'btn btn-sm rounded-0 task-setup-command-btn task-setup-command-btn-wide' + (type === 'dept' ? ' btn-primary' : ' btn-outline-secondary');
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

    </div>

</asp:Content>
