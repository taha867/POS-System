<%@ Page Title="Create Ticket" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CreateTicket.aspx.vb" Inherits="POSSystem.Pages.Operations.CreateTicket" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Heading + Toolbar --%>
    <div class="d-flex align-items-center gap-2 mb-2 px-3 py-2 border flex-wrap" style="background-color:#f8f9fa;">
        <strong class="fs-5 me-2">Create Ticket</strong>
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
    <p class="text-muted small mb-2 px-1">Manager of the department of the person who is creating the Task.</p>

    <%-- Main content area --%>
    <div class="border p-3">

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
                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-0" onclick="showAddPanel('assigned')">+ Add New</button>
                    <div id="addPanel_assigned" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                        <input type="text" id="txtAdd_assigned" class="form-control form-control-sm rounded-0" style="max-width:100%;width:200px"
                               oninput="document.getElementById('btnAdd_assigned').disabled = this.value.trim() === '';" />
                        <button type="button" id="btnAdd_assigned" class="btn btn-sm btn-outline-secondary rounded-0" disabled onclick="addItem('assigned')">Add</button>
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
                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-0" onclick="showAddPanel('concerned')">+ Add New</button>
                    <div id="addPanel_concerned" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                        <input type="text" id="txtAdd_concerned" class="form-control form-control-sm rounded-0" style="max-width:100%;width:200px"
                               oninput="document.getElementById('btnAdd_concerned').disabled = this.value.trim() === '';" />
                        <button type="button" id="btnAdd_concerned" class="btn btn-sm btn-outline-secondary rounded-0" disabled onclick="addItem('concerned')">Add</button>
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
                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-0" onclick="showAddPanel('performer')">+ Add New</button>
                    <div id="addPanel_performer" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                        <input type="text" id="txtAdd_performer" class="form-control form-control-sm rounded-0" style="max-width:100%;width:200px"
                               oninput="document.getElementById('btnAdd_performer').disabled = this.value.trim() === '';" />
                        <button type="button" id="btnAdd_performer" class="btn btn-sm btn-outline-secondary rounded-0" disabled onclick="addItem('performer')">Add</button>
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
                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-0" onclick="showAddPanel('tickettype')">+ Add New</button>
                    <div id="addPanel_tickettype" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                        <input type="text" id="txtAdd_tickettype" class="form-control form-control-sm rounded-0" style="max-width:100%;width:200px"
                               oninput="document.getElementById('btnAdd_tickettype').disabled = this.value.trim() === '';" />
                        <button type="button" id="btnAdd_tickettype" class="btn btn-sm btn-outline-secondary rounded-0" disabled onclick="addItem('tickettype')">Add</button>
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
                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-0" onclick="showAddPanel('ticketresponse')">+ Add New</button>
                    <div id="addPanel_ticketresponse" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                        <input type="text" id="txtAdd_ticketresponse" class="form-control form-control-sm rounded-0" style="max-width:100%;width:200px"
                               oninput="document.getElementById('btnAdd_ticketresponse').disabled = this.value.trim() === '';" />
                        <button type="button" id="btnAdd_ticketresponse" class="btn btn-sm btn-outline-secondary rounded-0" disabled onclick="addItem('ticketresponse')">Add</button>
                        <a href="#" class="text-secondary small" onclick="hideAddPanel('ticketresponse'); return false;">Cancel</a>
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

</asp:Content>
