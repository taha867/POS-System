<%@ Page Title="Ticket Setup" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TicketSetup.aspx.vb" Inherits="POSSystem.Pages.Operations.TicketSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Heading + Toolbar --%>
    <div class="d-flex align-items-center gap-2 mb-2 px-3 py-2 border flex-wrap" style="background-color:#f8f9fa;">
        <strong class="fs-5 me-2">Ticket Setup</strong>
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

        <%-- Section 1: Type of Ticket + Ticket Response --%>
        <div class="row g-0 mb-3" style="align-items:stretch;">

            <%-- Type of Ticket --%>
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

            <%-- Ticket Response --%>
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

        <%-- Section 2: Ticket Type Assigned To --%>
        <div class="border mb-3 d-flex flex-column" style="height:270px; overflow:hidden;">
            <div class="px-3 py-2 border-bottom">
                <h6 class="fw-bold mb-0">Ticket Type Assigned to</h6>
            </div>
            <div class="d-flex" style="flex:1; min-height:0;">
                <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
                    <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Type</div>
                    <ul id="list_assigned_type" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>Building Maintanance Ticket</li>
                        <li>Machinary Maintanance Ticket</li>
                        <li>ERP Ticket</li>
                        <li>Product Related Ticket</li>
                    </ul>
                </div>
                <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
                    <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Designation</div>
                    <ul id="list_assigned_desig" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>Asst Manager Maintanance</li>
                        <li>Asst Manager Machinary Maint.</li>
                        <li>Sr Programming Manager</li>
                        <li>Design Engineeer</li>
                    </ul>
                </div>
                <div class="d-flex flex-column" style="flex:1; min-width:0;">
                    <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Name</div>
                    <ul id="list_assigned_name" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>Adnan Kha</li>
                        <li>Saleem Khan</li>
                        <li>Ahsaan Ahmed</li>
                        <li>Abdul Haq</li>
                    </ul>
                </div>
            </div>
            <div class="border-top px-2 py-1">
                <button type="button" class="btn btn-sm btn-outline-secondary rounded-0" onclick="showAdd3Col('assigned')">+ Add New</button>
                <div id="addPanel_assigned" class="d-flex gap-2 align-items-center flex-wrap mt-1" style="display:none !important">
                    <input type="text" id="txtAdd_assigned_type"  class="form-control form-control-sm rounded-0" placeholder="Type"        style="width:180px;" oninput="checkAdd3Col('assigned')" />
                    <input type="text" id="txtAdd_assigned_desig" class="form-control form-control-sm rounded-0" placeholder="Designation" style="width:180px;" oninput="checkAdd3Col('assigned')" />
                    <input type="text" id="txtAdd_assigned_name"  class="form-control form-control-sm rounded-0" placeholder="Name"        style="width:180px;" oninput="checkAdd3Col('assigned')" />
                    <button type="button" id="btnAdd_assigned" class="btn btn-sm btn-outline-secondary rounded-0" disabled onclick="addItem3Col('assigned')">Add</button>
                    <a href="#" class="text-secondary small" onclick="hideAddPanel('assigned'); return false;">Cancel</a>
                </div>
            </div>
        </div>

        <%-- Section 3: Concerned Person --%>
        <div class="border mb-3 d-flex flex-column" style="height:270px; overflow:hidden;">
            <div class="px-3 py-2 border-bottom">
                <h6 class="fw-bold mb-0">Concerned Person as per Building or Factory Location / Type of Machinary or Module</h6>
            </div>
            <div class="d-flex" style="flex:1; min-height:0;">
                <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
                    <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Type</div>
                    <ul id="list_concerned_type" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>Building Maintanance Ticket</li>
                        <li>Machinary Maintanance Ticket</li>
                        <li>ERP Ticket</li>
                        <li>Product Related Ticket</li>
                    </ul>
                </div>
                <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
                    <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Designation</div>
                    <ul id="list_concerned_desig" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>Supervisor Maintanance</li>
                        <li>Supervisor Machinry Maint.</li>
                        <li>Asst Programming Manager</li>
                        <li>Asst Design Engineeer</li>
                    </ul>
                </div>
                <div class="d-flex flex-column" style="flex:1; min-width:0;">
                    <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Name</div>
                    <ul id="list_concerned_name" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>Adnan Kha</li>
                        <li>Saleem Khan</li>
                        <li>Ahsaan Ahmed</li>
                        <li>Abdul Haq</li>
                    </ul>
                </div>
            </div>
            <div class="border-top px-2 py-1">
                <button type="button" class="btn btn-sm btn-outline-secondary rounded-0" onclick="showAdd3Col('concerned')">+ Add New</button>
                <div id="addPanel_concerned" class="d-flex gap-2 align-items-center flex-wrap mt-1" style="display:none !important">
                    <input type="text" id="txtAdd_concerned_type"  class="form-control form-control-sm rounded-0" placeholder="Type"        style="width:180px;" oninput="checkAdd3Col('concerned')" />
                    <input type="text" id="txtAdd_concerned_desig" class="form-control form-control-sm rounded-0" placeholder="Designation" style="width:180px;" oninput="checkAdd3Col('concerned')" />
                    <input type="text" id="txtAdd_concerned_name"  class="form-control form-control-sm rounded-0" placeholder="Name"        style="width:180px;" oninput="checkAdd3Col('concerned')" />
                    <button type="button" id="btnAdd_concerned" class="btn btn-sm btn-outline-secondary rounded-0" disabled onclick="addItem3Col('concerned')">Add</button>
                    <a href="#" class="text-secondary small" onclick="hideAddPanel('concerned'); return false;">Cancel</a>
                </div>
            </div>
        </div>

        <%-- Section 4: Person Who Will Perform --%>
        <div class="border d-flex flex-column" style="height:270px; overflow:hidden;">
            <div class="px-3 py-2 border-bottom">
                <h6 class="fw-bold mb-0">Person who actually will perform the job as per Building or Factory Location / Type of Machinary or Module</h6>
            </div>
            <div class="d-flex" style="flex:1; min-height:0;">
                <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
                    <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Type</div>
                    <ul id="list_performer_type" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>Building Maintanance Ticket</li>
                        <li>Machinary Maintanance Ticket</li>
                        <li>ERP Ticket</li>
                        <li>Product Related Ticket</li>
                    </ul>
                </div>
                <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
                    <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Designation</div>
                    <ul id="list_performer_desig" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>Machinary Maint.</li>
                        <li>Machinary Maint. Technecian</li>
                        <li>Programming Person</li>
                        <li>Asst Design Engineeer</li>
                    </ul>
                </div>
                <div class="d-flex flex-column" style="flex:1; min-width:0;">
                    <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Name</div>
                    <ul id="list_performer_name" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>Saleem Khan</li>
                        <li>Saleem Khan</li>
                        <li>Ahsaan Ahmed</li>
                        <li>Abdul Haq</li>
                    </ul>
                </div>
            </div>
            <div class="border-top px-2 py-1">
                <button type="button" class="btn btn-sm btn-outline-secondary rounded-0" onclick="showAdd3Col('performer')">+ Add New</button>
                <div id="addPanel_performer" class="d-flex gap-2 align-items-center flex-wrap mt-1" style="display:none !important">
                    <input type="text" id="txtAdd_performer_type"  class="form-control form-control-sm rounded-0" placeholder="Type"        style="width:180px;" oninput="checkAdd3Col('performer')" />
                    <input type="text" id="txtAdd_performer_desig" class="form-control form-control-sm rounded-0" placeholder="Designation" style="width:180px;" oninput="checkAdd3Col('performer')" />
                    <input type="text" id="txtAdd_performer_name"  class="form-control form-control-sm rounded-0" placeholder="Name"        style="width:180px;" oninput="checkAdd3Col('performer')" />
                    <button type="button" id="btnAdd_performer" class="btn btn-sm btn-outline-secondary rounded-0" disabled onclick="addItem3Col('performer')">Add</button>
                    <a href="#" class="text-secondary small" onclick="hideAddPanel('performer'); return false;">Cancel</a>
                </div>
            </div>
        </div>

    </div>

    <script type="text/javascript">
        function setManager(type) {
            document.getElementById('btnManagerHR').className   = 'btn btn-sm rounded-0' + (type === 'hr'   ? ' btn-primary' : ' btn-outline-secondary');
            document.getElementById('btnManagerDept').className = 'btn btn-sm rounded-0' + (type === 'dept' ? ' btn-primary' : ' btn-outline-secondary');
        }

        /* ── single-column add (Type of Ticket, Ticket Response) ── */
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
            var li = document.createElement('li');
            li.textContent = val;
            document.getElementById('list_' + id).appendChild(li);
            hideAddPanel(id);
        }

        /* ── three-column add (Assigned / Concerned / Performer) ── */
        var COLS = ['_type', '_desig', '_name'];

        function showAdd3Col(id) {
            document.getElementById('addPanel_' + id).setAttribute('style', 'display:flex !important');
            COLS.forEach(function (s) { document.getElementById('txtAdd_' + id + s).value = ''; });
            document.getElementById('btnAdd_' + id).disabled = true;
            document.getElementById('txtAdd_' + id + '_type').focus();
        }
        function checkAdd3Col(id) {
            var any = COLS.some(function (s) {
                return document.getElementById('txtAdd_' + id + s).value.trim() !== '';
            });
            document.getElementById('btnAdd_' + id).disabled = !any;
        }
        function addItem3Col(id) {
            COLS.forEach(function (s) {
                var val = document.getElementById('txtAdd_' + id + s).value.trim();
                if (val) {
                    var li = document.createElement('li');
                    li.textContent = val;
                    document.getElementById('list_' + id + s).appendChild(li);
                }
            });
            hideAddPanel(id);
        }
    </script>

</asp:Content>
