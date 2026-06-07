<%@ Page Title="Ticket Setup" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TicketSetup.aspx.vb" Inherits="POSSystem.Pages.Operations.TicketSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .ticket-setup-form { background:#f2f2f2; font-family:Arial,sans-serif; padding:0 0 12px; }
        .ticket-setup-form label,
        .ticket-setup-form span,
        .ticket-setup-form .fw-semibold,
        .ticket-setup-form .fw-bold,
        .ticket-setup-form h6 { font-style:italic; }
        .ticket-setup-header { background:#d9d9d9; border:1px solid #555; min-height:76px; }
        .ticket-setup-title { color:#666; font-size:2rem; font-style:italic; font-weight:700; line-height:1; }
        .ticket-setup-toolbar { gap:14px; padding:0 8px; }
        .ticket-setup-command-btn { color:#002d62; font-size:10px; font-weight:700; height:52px; line-height:1.1; white-space:normal; width:78px; }
        .ticket-setup-command-btn-wide { width:96px; }
        .ticket-setup-form .form-control { border-color:#555; border-radius:0 !important; font-size:12px; font-style:italic; max-width:none; }
        .ticket-setup-form .border { border-color:#000 !important; }
        .ticket-setup-body { background:#f2f2f2; border:2px solid #000 !important; min-height:520px; }
        .ticket-setup-panel {
            display:flex;
            flex-direction:column;
            height:220px;
            min-width:0;
            overflow:hidden;
        }
        .ticket-setup-panel-head {
            align-items:center;
            display:flex;
            gap:10px;
            justify-content:space-between;
            min-height:28px;
        }
        .ticket-setup-panel h6,
        .ticket-setup-wide-panel h6 { color:#222; font-size:14px; line-height:1.15; margin:0; }
        .ticket-setup-add-btn { font-size:10px; font-weight:700; height:26px; min-width:74px; padding:2px 8px; }
        .ticket-setup-table {
            background:#fff;
            border:1px solid #777;
            display:flex;
            flex:1;
            flex-direction:column;
            min-height:0;
            overflow:hidden;
        }
        .ticket-setup-table-head {
            background:#555;
            color:#fff;
            display:grid;
            font-size:12px;
            font-style:normal;
            font-weight:700;
            grid-template-columns:1fr 32px;
            min-height:30px;
        }
        .ticket-setup-table-head span { align-items:center; display:flex; padding:0 8px; }
        .ticket-setup-list { flex:1; margin:0; min-height:0; overflow-y:auto; }
        .ticket-setup-list li {
            align-items:center;
            border-bottom:1px solid #d6d6d6;
            cursor:default;
            display:grid;
            font-size:12px;
            grid-template-columns:1fr 32px;
            min-height:30px;
            padding-left:8px;
        }
        .ticket-setup-list li::after {
            align-items:center;
            border-left:1px solid #d6d6d6;
            color:#a34d4d;
            content:"x";
            cursor:pointer;
            display:flex;
            font-size:16px;
            justify-content:center;
        }
        .ticket-setup-wide-panel { background:#f2f2f2; }
        .ticket-setup-wide-head {
            align-items:center;
            border-bottom:1px solid #777;
            display:flex;
            min-height:36px;
            padding:6px 12px;
        }
        .ticket-setup-wide-body { background:#fff; }
        .ticket-setup-column-head {
            background:#555 !important;
            color:#fff;
            font-size:12px;
            font-style:normal;
        }
        .ticket-setup-column-list {
            background:#fff;
            flex:1;
            margin:0;
            min-height:0;
            overflow-y:auto;
            padding:0 !important;
        }
        .ticket-setup-column-list li {
            align-items:center;
            border-bottom:1px solid #d6d6d6;
            cursor:default;
            display:grid;
            font-size:12px;
            grid-template-columns:1fr 32px;
            min-height:30px;
            padding-left:8px;
        }
        .ticket-setup-column-list li::after {
            align-items:center;
            border-left:1px solid #d6d6d6;
            color:#a34d4d;
            content:"x";
            cursor:pointer;
            display:flex;
            font-size:16px;
            justify-content:center;
        }
        .ticket-setup-wide-add { background:#f2f2f2; border-top:1px solid #777; }
        .ticket-setup-add-panel { min-height:32px; }
    </style>

    <div class="ticket-setup-form">
        <%-- Heading + Toolbar --%>
        <div class="row g-0 align-items-stretch ticket-setup-header">
            <div class="col d-flex align-items-center px-4">
                <strong class="ticket-setup-title">Ticket Setup</strong>
            </div>
            <div class="col-auto d-flex align-items-center justify-content-end flex-wrap ticket-setup-toolbar">
                <asp:Button ID="BtnVerified" runat="server" Text="Verified" UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ticket-setup-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnSave"     runat="server" Text="Save"     UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ticket-setup-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnNew"      runat="server" Text="New"      UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ticket-setup-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnDelete"   runat="server" Text="Delete"   UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ticket-setup-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnEdit"     runat="server" Text="Edit"     UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ticket-setup-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnPrint"    runat="server" Text="Print"    UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ticket-setup-command-btn" OnClientClick="return false;" />
            </div>
        </div>

        <%-- Main content area --%>
        <div class="border p-3 mt-3 ticket-setup-body">

            <%-- Type of Ticket + Ticket Response --%>
            <div class="row g-0 mb-3" style="align-items:stretch;">
                <div class="col-md-6">
                    <div class="ticket-setup-panel me-md-2">
                        <div class="ticket-setup-panel-head">
                            <h6 class="fw-bold">Type of Ticket</h6>
                            <asp:Button runat="server" UseSubmitBehavior="false" Text="+ Add New" CssClass="btn btn-sm btn-outline-secondary rounded-0 ticket-setup-add-btn" OnClientClick="showAddPanel('tickettype'); return false;" />
                        </div>
                        <div class="ticket-setup-table">
                            <div class="ticket-setup-table-head"><span>Name</span><span></span></div>
                            <ul id="list_tickettype" class="list-unstyled ticket-setup-list">
                            <li>Building Maintanance Ticket</li>
                            <li>Machinary Maintanance Ticket</li>
                            <li>ERP Ticket</li>
                            <li>Product Related Ticket</li>
                            </ul>
                        </div>
                        <div id="addPanel_tickettype" class="d-flex gap-2 align-items-center mt-2 ticket-setup-add-panel" style="display:none !important">
                            <asp:TextBox ID="txtAdd_tickettype" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" style="width:200px;"
                                   oninput="document.getElementById('btnAdd_tickettype').disabled = this.value.trim() === '';" />
                            <asp:Button ID="btnAdd_tickettype" runat="server" ClientIDMode="Static" UseSubmitBehavior="false" Enabled="false" Text="Add" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="addItem('tickettype'); return false;" />
                            <a href="#" class="text-secondary small" onclick="hideAddPanel('tickettype'); return false;">Cancel</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="ticket-setup-panel ms-md-2">
                        <div class="ticket-setup-panel-head">
                            <h6 class="fw-bold">Ticket Response</h6>
                            <asp:Button runat="server" UseSubmitBehavior="false" Text="+ Add New" CssClass="btn btn-sm btn-outline-secondary rounded-0 ticket-setup-add-btn" OnClientClick="showAddPanel('ticketresponse'); return false;" />
                        </div>
                        <div class="ticket-setup-table">
                            <div class="ticket-setup-table-head"><span>Name</span><span></span></div>
                            <ul id="list_ticketresponse" class="list-unstyled ticket-setup-list">
                            <li>Ticket Created</li>
                            <li>Rectification in Process</li>
                            <li>Ticket Accepted</li>
                            <li>Ticket Completion Time Request</li>
                            <li>Ticket Completion Time</li>
                            <li>Ticket Deffer Requested</li>
                            <li>Ticket Deffer Accepted</li>
                            <li>Ticket Deffer Rejected</li>
                            <li>Ticket Delay Requested</li>
                            <li>Ticket Delay Rejected</li>
                            <li>Ticket Delay Accepted</li>
                            <li>Ticket Task Closed</li>
                            <li>Ticket Canceled By Creater</li>
                            <li>Ticket Cancel Request by Receiver</li>
                            </ul>
                        </div>
                        <div id="addPanel_ticketresponse" class="d-flex gap-2 align-items-center mt-2 ticket-setup-add-panel" style="display:none !important">
                            <asp:TextBox ID="txtAdd_ticketresponse" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" style="width:200px;"
                                   oninput="document.getElementById('btnAdd_ticketresponse').disabled = this.value.trim() === '';" />
                            <asp:Button ID="btnAdd_ticketresponse" runat="server" ClientIDMode="Static" UseSubmitBehavior="false" Enabled="false" Text="Add" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="addItem('ticketresponse'); return false;" />
                            <a href="#" class="text-secondary small" onclick="hideAddPanel('ticketresponse'); return false;">Cancel</a>
                        </div>
                    </div>
                </div>
            </div>

            <%-- Ticket Type Assigned To --%>
            <div class="border mb-3 d-flex flex-column ticket-setup-wide-panel" style="height:270px; overflow:hidden;">
                <div class="ticket-setup-wide-head"><h6 class="fw-bold">Ticket Type Assigned to</h6></div>
                <div class="d-flex ticket-setup-wide-body" style="flex:1; min-height:0;">
                    <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom ticket-setup-column-head">Type</div>
                        <ul id="list_assigned_type" class="list-unstyled ticket-setup-column-list">
                            <li>Building Maintanance Ticket</li><li>Machinary Maintanance Ticket</li><li>ERP Ticket</li><li>Product Related Ticket</li>
                        </ul>
                    </div>
                    <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom ticket-setup-column-head">Designation</div>
                        <ul id="list_assigned_desig" class="list-unstyled ticket-setup-column-list">
                            <li>Asst Manager Maintanance</li><li>Asst Manager Machinary Maint.</li><li>Sr Programming Manager</li><li>Design Engineer</li>
                        </ul>
                    </div>
                    <div class="d-flex flex-column" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom ticket-setup-column-head">Name</div>
                        <ul id="list_assigned_name" class="list-unstyled ticket-setup-column-list">
                            <li>Adnan Khan</li><li>Saleem Khan</li><li>Ahsaan Ahmed</li><li>Abdul Haq</li>
                        </ul>
                    </div>
                </div>
                <div class="ticket-setup-wide-add px-2 py-1">
                    <asp:Button runat="server" UseSubmitBehavior="false" Text="+ Add New" CssClass="btn btn-sm btn-outline-secondary rounded-0 ticket-setup-add-btn" OnClientClick="showAdd3Col('assigned'); return false;" />
                    <div id="addPanel_assigned" class="d-flex gap-2 align-items-center flex-wrap mt-1 ticket-setup-add-panel" style="display:none !important">
                        <asp:TextBox ID="txtAdd_assigned_type"  runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" placeholder="Type"        style="width:180px;" oninput="checkAdd3Col('assigned')" />
                        <asp:TextBox ID="txtAdd_assigned_desig" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" placeholder="Designation" style="width:180px;" oninput="checkAdd3Col('assigned')" />
                        <asp:TextBox ID="txtAdd_assigned_name"  runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" placeholder="Name"        style="width:180px;" oninput="checkAdd3Col('assigned')" />
                        <asp:Button ID="btnAdd_assigned" runat="server" ClientIDMode="Static" UseSubmitBehavior="false" Enabled="false" Text="Add" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="addItem3Col('assigned'); return false;" />
                        <a href="#" class="text-secondary small" onclick="hideAddPanel('assigned'); return false;">Cancel</a>
                    </div>
                </div>
            </div>

            <%-- Concerned Person --%>
            <div class="border mb-3 d-flex flex-column ticket-setup-wide-panel" style="height:270px; overflow:hidden;">
                <div class="ticket-setup-wide-head"><h6 class="fw-bold">Concerned Person as per Building or Factory Location / Type of Machinary or Module</h6></div>
                <div class="d-flex ticket-setup-wide-body" style="flex:1; min-height:0;">
                    <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom ticket-setup-column-head">Type</div>
                        <ul id="list_concerned_type" class="list-unstyled ticket-setup-column-list">
                            <li>Building Maintanance Ticket</li><li>Machinary Maintanance Ticket</li><li>ERP Ticket</li><li>Product Related Ticket</li>
                        </ul>
                    </div>
                    <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom ticket-setup-column-head">Designation</div>
                        <ul id="list_concerned_desig" class="list-unstyled ticket-setup-column-list">
                            <li>Supervisor Maintanance</li><li>Supervisor Machinary Maint.</li><li>Asst Programming Manager</li><li>Asst Design Engineer</li>
                        </ul>
                    </div>
                    <div class="d-flex flex-column" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom ticket-setup-column-head">Name</div>
                        <ul id="list_concerned_name" class="list-unstyled ticket-setup-column-list">
                            <li>Adnan Khan</li><li>Saleem Khan</li><li>Ahsaan Ahmed</li><li>Abdul Haq</li>
                        </ul>
                    </div>
                </div>
                <div class="ticket-setup-wide-add px-2 py-1">
                    <asp:Button runat="server" UseSubmitBehavior="false" Text="+ Add New" CssClass="btn btn-sm btn-outline-secondary rounded-0 ticket-setup-add-btn" OnClientClick="showAdd3Col('concerned'); return false;" />
                    <div id="addPanel_concerned" class="d-flex gap-2 align-items-center flex-wrap mt-1 ticket-setup-add-panel" style="display:none !important">
                        <asp:TextBox ID="txtAdd_concerned_type"  runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" placeholder="Type"        style="width:180px;" oninput="checkAdd3Col('concerned')" />
                        <asp:TextBox ID="txtAdd_concerned_desig" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" placeholder="Designation" style="width:180px;" oninput="checkAdd3Col('concerned')" />
                        <asp:TextBox ID="txtAdd_concerned_name"  runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" placeholder="Name"        style="width:180px;" oninput="checkAdd3Col('concerned')" />
                        <asp:Button ID="btnAdd_concerned" runat="server" ClientIDMode="Static" UseSubmitBehavior="false" Enabled="false" Text="Add" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="addItem3Col('concerned'); return false;" />
                        <a href="#" class="text-secondary small" onclick="hideAddPanel('concerned'); return false;">Cancel</a>
                    </div>
                </div>
            </div>

            <%-- Person Who Will Perform --%>
            <div class="border d-flex flex-column ticket-setup-wide-panel" style="height:270px; overflow:hidden;">
                <div class="ticket-setup-wide-head"><h6 class="fw-bold">Person who actually will perform the job as per Building or Factory Location / Type of Machinary or Module</h6></div>
                <div class="d-flex ticket-setup-wide-body" style="flex:1; min-height:0;">
                    <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom ticket-setup-column-head">Type</div>
                        <ul id="list_performer_type" class="list-unstyled ticket-setup-column-list">
                            <li>Building Maintanance Ticket</li><li>Machinary Maintanance Ticket</li><li>ERP Ticket</li><li>Product Related Ticket</li>
                        </ul>
                    </div>
                    <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom ticket-setup-column-head">Designation</div>
                        <ul id="list_performer_desig" class="list-unstyled ticket-setup-column-list">
                            <li>Machinary Maint.</li><li>Machinary Maint. Technician</li><li>Programming Person</li><li>Asst Design Engineer</li>
                        </ul>
                    </div>
                    <div class="d-flex flex-column" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom ticket-setup-column-head">Name</div>
                        <ul id="list_performer_name" class="list-unstyled ticket-setup-column-list">
                            <li>Saleem Khan</li><li>Saleem Khan</li><li>Ahsaan Ahmed</li><li>Abdul Haq</li>
                        </ul>
                    </div>
                </div>
                <div class="ticket-setup-wide-add px-2 py-1">
                    <asp:Button runat="server" UseSubmitBehavior="false" Text="+ Add New" CssClass="btn btn-sm btn-outline-secondary rounded-0 ticket-setup-add-btn" OnClientClick="showAdd3Col('performer'); return false;" />
                    <div id="addPanel_performer" class="d-flex gap-2 align-items-center flex-wrap mt-1 ticket-setup-add-panel" style="display:none !important">
                        <asp:TextBox ID="txtAdd_performer_type"  runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" placeholder="Type"        style="width:180px;" oninput="checkAdd3Col('performer')" />
                        <asp:TextBox ID="txtAdd_performer_desig" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" placeholder="Designation" style="width:180px;" oninput="checkAdd3Col('performer')" />
                        <asp:TextBox ID="txtAdd_performer_name"  runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" placeholder="Name"        style="width:180px;" oninput="checkAdd3Col('performer')" />
                        <asp:Button ID="btnAdd_performer" runat="server" ClientIDMode="Static" UseSubmitBehavior="false" Enabled="false" Text="Add" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="addItem3Col('performer'); return false;" />
                        <a href="#" class="text-secondary small" onclick="hideAddPanel('performer'); return false;">Cancel</a>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
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
            var TS_COLS = ['_type', '_desig', '_name'];
            function showAdd3Col(id) {
                document.getElementById('addPanel_' + id).setAttribute('style', 'display:flex !important');
                TS_COLS.forEach(function (s) { document.getElementById('txtAdd_' + id + s).value = ''; });
                document.getElementById('btnAdd_' + id).disabled = true;
                document.getElementById('txtAdd_' + id + '_type').focus();
            }
            function checkAdd3Col(id) {
                var any = TS_COLS.some(function (s) {
                    return document.getElementById('txtAdd_' + id + s).value.trim() !== '';
                });
                document.getElementById('btnAdd_' + id).disabled = !any;
            }
            function addItem3Col(id) {
                TS_COLS.forEach(function (s) {
                    var val = document.getElementById('txtAdd_' + id + s).value.trim();
                    if (val) {
                        var li = document.createElement('li');
                        li.textContent = val;
                        document.getElementById('list_' + id + s).appendChild(li);
                    }
                });
                hideAddPanel(id);
            }
            function isTicketDeleteClick(evt, item) {
                return evt.clientX >= item.getBoundingClientRect().right - 32;
            }
            document.addEventListener('click', function (evt) {
                var singleItem = evt.target.closest('.ticket-setup-list li');
                if (singleItem && isTicketDeleteClick(evt, singleItem)) {
                    singleItem.remove();
                    return;
                }

                var columnItem = evt.target.closest('.ticket-setup-column-list li');
                if (!columnItem || !isTicketDeleteClick(evt, columnItem)) return;

                var list = columnItem.parentElement;
                var rowIndex = Array.prototype.indexOf.call(list.children, columnItem);
                var panel = columnItem.closest('.ticket-setup-wide-panel');
                if (!panel || rowIndex < 0) {
                    columnItem.remove();
                    return;
                }

                panel.querySelectorAll('.ticket-setup-column-list').forEach(function (columnList) {
                    var row = columnList.children[rowIndex];
                    if (row) row.remove();
                });
            });
        </script>
    </div>

</asp:Content>
