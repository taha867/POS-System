<%@ Page Title="Create Ticket" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateTicket.aspx.vb" Inherits="POSSystem.Pages.Operations.CreateTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .create-ticket-form { background:#f2f2f2; font-family:Arial,sans-serif; padding:0 0 12px; }
        .create-ticket-form label,
        .create-ticket-form span,
        .create-ticket-form .fw-semibold,
        .create-ticket-form .fw-bold,
        .create-ticket-form h6 { font-style:italic; }
        .ct-header { background:#d9d9d9; border:1px solid #555; min-height:76px; }
        .ct-title { color:#666; font-size:2rem; font-style:italic; font-weight:700; line-height:1; }
        .ct-toolbar { gap:14px; padding:0 8px; }
        .ct-command-btn { color:#002d62; font-size:10px; font-weight:700; height:52px; line-height:1.1; white-space:normal; width:78px; }
        .ct-command-btn-wide { width:96px; }
        .create-ticket-form .form-control { border-color:#555; border-radius:0 !important; font-size:12px; font-style:italic; max-width:none; }
        .create-ticket-form .border { border-color:#000 !important; }
        .ct-body { background:#f2f2f2; border:2px solid #000 !important; min-height:520px; }
    </style>

    <div class="create-ticket-form">
        <%-- Heading + Toolbar --%>
        <div class="row g-0 align-items-stretch ct-header">
            <div class="col d-flex align-items-center px-4">
                <strong class="ct-title">Create Ticket</strong>
            </div>
            <div class="col-auto d-flex align-items-center justify-content-end flex-wrap ct-toolbar">
                <asp:Button ID="btnManagerHR"   runat="server" ClientIDMode="Static" Text="Manager HR"         UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ct-command-btn ct-command-btn-wide" OnClientClick="setManager('hr');   return false;" />
                <asp:Button ID="btnManagerDept" runat="server" ClientIDMode="Static" Text="Manager Department" UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ct-command-btn ct-command-btn-wide" OnClientClick="setManager('dept'); return false;" />
                <asp:Button ID="BtnVerified"    runat="server" Text="Verified"           UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ct-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnSave"        runat="server" Text="Save"               UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ct-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnNew"         runat="server" Text="New"                UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ct-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnDelete"      runat="server" Text="Delete"             UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ct-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnEdit"        runat="server" Text="Edit"               UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ct-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnPrint"       runat="server" Text="Print"              UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ct-command-btn" OnClientClick="return false;" />
            </div>
        </div>
        <p class="text-muted small mb-2 px-1 pt-2">Manager of the department of the person who is creating the Task.</p>

    <%-- Main content area --%>
    <div class="border p-3 ct-body">

        <%-- Section 1 — Ticket Type Assigned To --%>
        <div class="border p-3 mb-3 d-flex flex-column" style="height:190px; overflow:hidden;">
            <h6 class="fw-bold mb-3">Ticket Type Assigned to</h6>
            <div class="row" style="flex:1; min-height:0; align-items:stretch;">
                <div class="col-md-4 d-flex flex-column">
                    <ul id="list_assigned" class="list-unstyled mb-2" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>Building Maintanance Ticket</li>
                        <li>Machinary Maintanance Ticket</li>
                        <li>ERP Ticket</li>
                        <li>Product Related Ticket</li>
                    </ul>
                    <asp:Button runat="server" Text="+ Add New" UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="showAddPanel('assigned'); return false;" />
                    <div id="addPanel_assigned" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                        <asp:TextBox ID="txtAdd_assigned" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" style="max-width:100%;width:200px"
                                     oninput="document.getElementById('btnAdd_assigned').disabled = this.value.trim() === '';" />
                        <asp:Button ID="btnAdd_assigned" runat="server" ClientIDMode="Static" UseSubmitBehavior="false" Enabled="false" Text="Add" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="addItem('assigned'); return false;" />
                        <a href="#" class="text-secondary small" onclick="hideAddPanel('assigned'); return false;">Cancel</a>
                    </div>
                </div>
                <div class="col-md-4 d-flex flex-column">
                    <ul class="list-unstyled mb-0" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>Asst Manager Maintanance</li>
                        <li>Asst Manager Machinary Maint.</li>
                        <li>Sr Programming Manager</li>
                        <li>Design Engineeer</li>
                    </ul>
                </div>
                <div class="col-md-4 d-flex flex-column">
                    <ul class="list-unstyled mb-0" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>Adnan Kha</li>
                        <li>Saleem Khan</li>
                        <li>Ahsaan Ahmed</li>
                        <li>Abdul Haq</li>
                    </ul>
                </div>
            </div>
        </div>

        <%-- Section 2 — Concerned Person --%>
        <div class="border p-3 mb-3 d-flex flex-column" style="height:190px; overflow:hidden;">
            <h6 class="fw-bold mb-3">Concerned Person as per Building or Factory Location /Type of Machinary or Module</h6>
            <div class="row" style="flex:1; min-height:0; align-items:stretch;">
                <div class="col-md-4 d-flex flex-column">
                    <ul id="list_concerned" class="list-unstyled mb-2" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>Building Maintanance Ticket</li>
                        <li>Machinary Maintanance Ticket</li>
                        <li>ERP Ticket</li>
                        <li>Product Related Ticket</li>
                    </ul>
                    <asp:Button runat="server" Text="+ Add New" UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="showAddPanel('concerned'); return false;" />
                    <div id="addPanel_concerned" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                        <asp:TextBox ID="txtAdd_concerned" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" style="max-width:100%;width:200px"
                                     oninput="document.getElementById('btnAdd_concerned').disabled = this.value.trim() === '';" />
                        <asp:Button ID="btnAdd_concerned" runat="server" ClientIDMode="Static" UseSubmitBehavior="false" Enabled="false" Text="Add" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="addItem('concerned'); return false;" />
                        <a href="#" class="text-secondary small" onclick="hideAddPanel('concerned'); return false;">Cancel</a>
                    </div>
                </div>
                <div class="col-md-4 d-flex flex-column">
                    <ul class="list-unstyled mb-0" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>Supervisor Maintanance</li>
                        <li>Supervisor Machinry Maint.</li>
                        <li>Asst Programming Manager</li>
                        <li>Asst Design Engineeer</li>
                    </ul>
                </div>
                <div class="col-md-4 d-flex flex-column">
                    <ul class="list-unstyled mb-0" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>Adnan Kha</li>
                        <li>Saleem Khan</li>
                        <li>Ahsaan Ahmed</li>
                        <li>Abdul Haq</li>
                    </ul>
                </div>
            </div>
        </div>

        <%-- Section 3 — Person Who Will Perform --%>
        <div class="border p-3 mb-3 d-flex flex-column" style="height:190px; overflow:hidden;">
            <h6 class="fw-bold mb-3">Person who actually will perform the job as per Building or Factory Location /Type of Machinary or Module</h6>
            <div class="row" style="flex:1; min-height:0; align-items:stretch;">
                <div class="col-md-4 d-flex flex-column">
                    <ul id="list_performer" class="list-unstyled mb-2" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>Building Maintanance Ticket</li>
                        <li>Machinary Maintanance Ticket</li>
                        <li>ERP Ticket</li>
                        <li>Product Related Ticket</li>
                    </ul>
                    <asp:Button runat="server" Text="+ Add New" UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="showAddPanel('performer'); return false;" />
                    <div id="addPanel_performer" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                        <asp:TextBox ID="txtAdd_performer" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" style="max-width:100%;width:200px"
                                     oninput="document.getElementById('btnAdd_performer').disabled = this.value.trim() === '';" />
                        <asp:Button ID="btnAdd_performer" runat="server" ClientIDMode="Static" UseSubmitBehavior="false" Enabled="false" Text="Add" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="addItem('performer'); return false;" />
                        <a href="#" class="text-secondary small" onclick="hideAddPanel('performer'); return false;">Cancel</a>
                    </div>
                </div>
                <div class="col-md-4 d-flex flex-column">
                    <ul class="list-unstyled mb-0" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>MMachinary Maint.</li>
                        <li>Machinary Maint. Technecian</li>
                        <li>Programming Personr</li>
                        <li>Asst Design Engineeer</li>
                    </ul>
                </div>
                <div class="col-md-4 d-flex flex-column">
                    <ul class="list-unstyled mb-0" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>Saleem Khan</li>
                        <li>Saleem Khan</li>
                        <li>Ahsaan Ahmed</li>
                        <li>Abdul Haq</li>
                    </ul>
                </div>
            </div>
        </div>

        <%-- Sections 4 & 5 — Type of Ticket + Ticket Response --%>
        <div class="row g-0" style="align-items:stretch;">
            <div class="col-md-6">
                <div class="border p-3 me-md-2 d-flex flex-column" style="height:220px;">
                    <h6 class="fw-bold mb-2">Type of Ticket</h6>
                    <ul id="list_tickettype" class="list-unstyled mb-2" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>Building Maintanance Ticket</li>
                        <li>Machinary Maintanance Ticket</li>
                        <li>ERP Ticket</li>
                        <li>Product Related Ticket</li>
                    </ul>
                    <asp:Button runat="server" Text="+ Add New" UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="showAddPanel('tickettype'); return false;" />
                    <div id="addPanel_tickettype" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                        <asp:TextBox ID="txtAdd_tickettype" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" style="max-width:100%;width:200px"
                                     oninput="document.getElementById('btnAdd_tickettype').disabled = this.value.trim() === '';" />
                        <asp:Button ID="btnAdd_tickettype" runat="server" ClientIDMode="Static" UseSubmitBehavior="false" Enabled="false" Text="Add" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="addItem('tickettype'); return false;" />
                        <a href="#" class="text-secondary small" onclick="hideAddPanel('tickettype'); return false;">Cancel</a>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="border p-3 ms-md-2 d-flex flex-column" style="height:220px;">
                    <h6 class="fw-bold mb-2">Ticket Response</h6>
                    <ul id="list_ticketresponse" class="list-unstyled mb-2" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>Ticket Created</li>
                        <li>Rectification in Process</li>
                        <li>Ticket Accepted</li>
                        <li>Ticket Completion Time Request</li>
                        <li>CTicket Completion Time</li>
                        <li>Ticket Deffer Requested</li>
                        <li>Ticket Deffer Accepted</li>
                        <li>Ticket Deffer Rejected</li>
                        <li>Ticket Delay Requested</li>
                        <li>Ticket Delay Rejected</li>
                        <li>Ticket bDelay Accepted</li>
                        <li>Ticket Task Closed</li>
                        <li>Ticket Canceled By Creater</li>
                        <li>Ticket Cancel Request by Receiver</li>
                    </ul>
                    <asp:Button runat="server" Text="+ Add New" UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="showAddPanel('ticketresponse'); return false;" />
                    <div id="addPanel_ticketresponse" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                        <asp:TextBox ID="txtAdd_ticketresponse" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" style="max-width:100%;width:200px"
                                     oninput="document.getElementById('btnAdd_ticketresponse').disabled = this.value.trim() === '';" />
                        <asp:Button ID="btnAdd_ticketresponse" runat="server" ClientIDMode="Static" UseSubmitBehavior="false" Enabled="false" Text="Add" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="addItem('ticketresponse'); return false;" />
                        <a href="#" class="text-secondary small" onclick="hideAddPanel('ticketresponse'); return false;">Cancel</a>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <script type="text/javascript">
        function setManager(type) {
            document.getElementById('btnManagerHR').className   = 'btn btn-sm rounded-0 ct-command-btn ct-command-btn-wide' + (type === 'hr'   ? ' btn-primary' : ' btn-outline-secondary');
            document.getElementById('btnManagerDept').className = 'btn btn-sm rounded-0 ct-command-btn ct-command-btn-wide' + (type === 'dept' ? ' btn-primary' : ' btn-outline-secondary');
        }
        function showAddPanel(id) {
            document.getElementById('addPanel_' + id).setAttribute('style', 'display:flex !important');
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
