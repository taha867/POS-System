<%@ Page Title="Ticket Setup" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TicketSetup.aspx.vb" Inherits="POSSystem.Pages.Operations.TicketSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Heading + Toolbar --%>
    <div class="d-flex align-items-center gap-2 mb-2 px-3 py-2 border flex-wrap" style="background-color:#f8f9fa;">
        <strong class="fs-5 me-2">Ticket</strong>
        <asp:Button ID="BtnTransmit" runat="server" Text="Transmit" UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
        <asp:Button ID="BtnPost"     runat="server" Text="Post"     UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
        <asp:Button ID="BtnNew"      runat="server" Text="New"      UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
        <asp:Button ID="BtnSave"     runat="server" Text="Save"     UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
        <div class="ms-auto d-flex gap-2">
            <asp:Button ID="BtnDelete" runat="server" Text="Delete" UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
            <asp:Button ID="BtnEdit"   runat="server" Text="Edit"   UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
            <asp:Button ID="BtnPrint"  runat="server" Text="Print"  UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
        </div>
    </div>

    <style>
        .ts-tabs { display:flex; list-style:none; margin:0; padding:0; border-bottom:1px solid #dee2e6; flex-wrap:nowrap; overflow-x:auto; }
        .ts-tabs .ts-tab-btn { padding:0.25rem 1rem; cursor:pointer; background:#e9ecef; color:#495057; border:1px solid #dee2e6; border-bottom:none; margin-right:2px; font-size:0.78rem; white-space:nowrap; }
        .ts-tabs .ts-tab-btn.active { background:#6c757d; color:#fff; border-color:#6c757d; }
        .ts-tab-content { border:1px solid #dee2e6; border-top:none; }
        .ts-pane { display:none; padding:1rem; }
        .ts-pane.active { display:block; }
    </style>

    <%-- Tab Navigation --%>
    <ul class="ts-tabs" id="tsTabNav">
        <li><asp:Button runat="server" Text="Ticket Setup"       UseSubmitBehavior="false" CssClass="ts-tab-btn active" OnClientClick="showTab('pane-ticketsetup',this);   return false;" /></li>
        <li><asp:Button runat="server" Text="New Ticket"         UseSubmitBehavior="false" CssClass="ts-tab-btn"        OnClientClick="showTab('pane-newticket',this);      return false;" /></li>
        <li><asp:Button runat="server" Text="Response on Ticket" UseSubmitBehavior="false" CssClass="ts-tab-btn"        OnClientClick="showTab('pane-responseticket',this); return false;" /></li>
        <li><asp:Button runat="server" Text="Ticket String"      UseSubmitBehavior="false" CssClass="ts-tab-btn"        OnClientClick="showTab('pane-ticketstring',this);   return false;" /></li>
        <li><asp:Button runat="server" Text="Ticket Status"      UseSubmitBehavior="false" CssClass="ts-tab-btn"        OnClientClick="showTab('pane-ticketstatus',this);   return false;" /></li>
    </ul>

    <%-- Tab Content --%>
    <div class="ts-tab-content" id="tsTabContent">

        <%-- Ticket Setup Tab --%>
        <div class="ts-pane active" id="pane-ticketsetup">

            <%-- Type of Ticket + Ticket Response --%>
            <div class="row g-0 mb-3" style="align-items:stretch;">
                <div class="col-md-6">
                    <div class="border p-3 me-md-2 d-flex flex-column" style="height:220px;">
                        <h6 class="fw-bold mb-2">Type of Ticket</h6>
                        <ul id="list_tickettype" class="list-unstyled mb-2" style="overflow-y:auto; flex:1; min-height:0;">
                            <li>Building Maintanance Ticket</li>
                            <li>Machinary Maintanance Ticket</li>
                            <li>ERP Ticket</li>
                            <li>Product Related Ticket</li>
                        </ul>
                        <asp:Button runat="server" UseSubmitBehavior="false" Text="+ Add New" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="showAddPanel('tickettype'); return false;" />
                        <div id="addPanel_tickettype" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                            <asp:TextBox ID="txtAdd_tickettype" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" style="width:200px;"
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
                        <asp:Button runat="server" UseSubmitBehavior="false" Text="+ Add New" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="showAddPanel('ticketresponse'); return false;" />
                        <div id="addPanel_ticketresponse" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                            <asp:TextBox ID="txtAdd_ticketresponse" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" style="width:200px;"
                                   oninput="document.getElementById('btnAdd_ticketresponse').disabled = this.value.trim() === '';" />
                            <asp:Button ID="btnAdd_ticketresponse" runat="server" ClientIDMode="Static" UseSubmitBehavior="false" Enabled="false" Text="Add" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="addItem('ticketresponse'); return false;" />
                            <a href="#" class="text-secondary small" onclick="hideAddPanel('ticketresponse'); return false;">Cancel</a>
                        </div>
                    </div>
                </div>
            </div>

            <%-- Ticket Type Assigned To --%>
            <div class="border mb-3 d-flex flex-column" style="height:270px; overflow:hidden;">
                <div class="px-3 py-2 border-bottom"><h6 class="fw-bold mb-0">Ticket Type Assigned to</h6></div>
                <div class="d-flex" style="flex:1; min-height:0;">
                    <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Type</div>
                        <ul id="list_assigned_type" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                            <li>Building Maintanance Ticket</li><li>Machinary Maintanance Ticket</li><li>ERP Ticket</li><li>Product Related Ticket</li>
                        </ul>
                    </div>
                    <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Designation</div>
                        <ul id="list_assigned_desig" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                            <li>Asst Manager Maintanance</li><li>Asst Manager Machinary Maint.</li><li>Sr Programming Manager</li><li>Design Engineer</li>
                        </ul>
                    </div>
                    <div class="d-flex flex-column" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Name</div>
                        <ul id="list_assigned_name" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                            <li>Adnan Khan</li><li>Saleem Khan</li><li>Ahsaan Ahmed</li><li>Abdul Haq</li>
                        </ul>
                    </div>
                </div>
                <div class="border-top px-2 py-1">
                    <asp:Button runat="server" UseSubmitBehavior="false" Text="+ Add New" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="showAdd3Col('assigned'); return false;" />
                    <div id="addPanel_assigned" class="d-flex gap-2 align-items-center flex-wrap mt-1" style="display:none !important">
                        <asp:TextBox ID="txtAdd_assigned_type"  runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" placeholder="Type"        style="width:180px;" oninput="checkAdd3Col('assigned')" />
                        <asp:TextBox ID="txtAdd_assigned_desig" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" placeholder="Designation" style="width:180px;" oninput="checkAdd3Col('assigned')" />
                        <asp:TextBox ID="txtAdd_assigned_name"  runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" placeholder="Name"        style="width:180px;" oninput="checkAdd3Col('assigned')" />
                        <asp:Button ID="btnAdd_assigned" runat="server" ClientIDMode="Static" UseSubmitBehavior="false" Enabled="false" Text="Add" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="addItem3Col('assigned'); return false;" />
                        <a href="#" class="text-secondary small" onclick="hideAddPanel('assigned'); return false;">Cancel</a>
                    </div>
                </div>
            </div>

            <%-- Concerned Person --%>
            <div class="border mb-3 d-flex flex-column" style="height:270px; overflow:hidden;">
                <div class="px-3 py-2 border-bottom"><h6 class="fw-bold mb-0">Concerned Person as per Building or Factory Location / Type of Machinary or Module</h6></div>
                <div class="d-flex" style="flex:1; min-height:0;">
                    <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Type</div>
                        <ul id="list_concerned_type" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                            <li>Building Maintanance Ticket</li><li>Machinary Maintanance Ticket</li><li>ERP Ticket</li><li>Product Related Ticket</li>
                        </ul>
                    </div>
                    <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Designation</div>
                        <ul id="list_concerned_desig" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                            <li>Supervisor Maintanance</li><li>Supervisor Machinary Maint.</li><li>Asst Programming Manager</li><li>Asst Design Engineer</li>
                        </ul>
                    </div>
                    <div class="d-flex flex-column" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Name</div>
                        <ul id="list_concerned_name" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                            <li>Adnan Khan</li><li>Saleem Khan</li><li>Ahsaan Ahmed</li><li>Abdul Haq</li>
                        </ul>
                    </div>
                </div>
                <div class="border-top px-2 py-1">
                    <asp:Button runat="server" UseSubmitBehavior="false" Text="+ Add New" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="showAdd3Col('concerned'); return false;" />
                    <div id="addPanel_concerned" class="d-flex gap-2 align-items-center flex-wrap mt-1" style="display:none !important">
                        <asp:TextBox ID="txtAdd_concerned_type"  runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" placeholder="Type"        style="width:180px;" oninput="checkAdd3Col('concerned')" />
                        <asp:TextBox ID="txtAdd_concerned_desig" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" placeholder="Designation" style="width:180px;" oninput="checkAdd3Col('concerned')" />
                        <asp:TextBox ID="txtAdd_concerned_name"  runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" placeholder="Name"        style="width:180px;" oninput="checkAdd3Col('concerned')" />
                        <asp:Button ID="btnAdd_concerned" runat="server" ClientIDMode="Static" UseSubmitBehavior="false" Enabled="false" Text="Add" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="addItem3Col('concerned'); return false;" />
                        <a href="#" class="text-secondary small" onclick="hideAddPanel('concerned'); return false;">Cancel</a>
                    </div>
                </div>
            </div>

            <%-- Person Who Will Perform --%>
            <div class="border d-flex flex-column" style="height:270px; overflow:hidden;">
                <div class="px-3 py-2 border-bottom"><h6 class="fw-bold mb-0">Person who actually will perform the job as per Building or Factory Location / Type of Machinary or Module</h6></div>
                <div class="d-flex" style="flex:1; min-height:0;">
                    <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Type</div>
                        <ul id="list_performer_type" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                            <li>Building Maintanance Ticket</li><li>Machinary Maintanance Ticket</li><li>ERP Ticket</li><li>Product Related Ticket</li>
                        </ul>
                    </div>
                    <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Designation</div>
                        <ul id="list_performer_desig" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                            <li>Machinary Maint.</li><li>Machinary Maint. Technician</li><li>Programming Person</li><li>Asst Design Engineer</li>
                        </ul>
                    </div>
                    <div class="d-flex flex-column" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Name</div>
                        <ul id="list_performer_name" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                            <li>Saleem Khan</li><li>Saleem Khan</li><li>Ahsaan Ahmed</li><li>Abdul Haq</li>
                        </ul>
                    </div>
                </div>
                <div class="border-top px-2 py-1">
                    <asp:Button runat="server" UseSubmitBehavior="false" Text="+ Add New" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="showAdd3Col('performer'); return false;" />
                    <div id="addPanel_performer" class="d-flex gap-2 align-items-center flex-wrap mt-1" style="display:none !important">
                        <asp:TextBox ID="txtAdd_performer_type"  runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" placeholder="Type"        style="width:180px;" oninput="checkAdd3Col('performer')" />
                        <asp:TextBox ID="txtAdd_performer_desig" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" placeholder="Designation" style="width:180px;" oninput="checkAdd3Col('performer')" />
                        <asp:TextBox ID="txtAdd_performer_name"  runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" placeholder="Name"        style="width:180px;" oninput="checkAdd3Col('performer')" />
                        <asp:Button ID="btnAdd_performer" runat="server" ClientIDMode="Static" UseSubmitBehavior="false" Enabled="false" Text="Add" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="addItem3Col('performer'); return false;" />
                        <a href="#" class="text-secondary small" onclick="hideAddPanel('performer'); return false;">Cancel</a>
                    </div>
                </div>
            </div>

        </div>

        <%-- New Ticket Tab --%>
        <div class="ts-pane" id="pane-newticket">

            <div class="d-flex justify-content-end gap-4 mb-3">
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0" for="TxtNtId">Ticket ID:</label>
                    <asp:TextBox ID="TxtNtId" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:130px;" />
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0" for="TxtNtDate">Date:</label>
                    <asp:TextBox ID="TxtNtDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:130px;" placeholder="mm/dd/yyyy" />
                </div>
            </div>

            <div class="d-flex justify-content-center gap-4 mb-3">
                <div class="form-check form-check-inline mb-0">
                    <asp:RadioButton ID="ntCritical"  runat="server" ClientIDMode="Static" GroupName="ntNature" CssClass="form-check-input" />
                    <label class="form-check-label small" for="ntCritical">Critically Urgent</label>
                </div>
                <div class="form-check form-check-inline mb-0">
                    <asp:RadioButton ID="ntImportant" runat="server" ClientIDMode="Static" GroupName="ntNature" CssClass="form-check-input" Checked="true" />
                    <label class="form-check-label small" for="ntImportant">Important</label>
                </div>
                <div class="form-check form-check-inline mb-0">
                    <asp:RadioButton ID="ntRegular"   runat="server" ClientIDMode="Static" GroupName="ntNature" CssClass="form-check-input" />
                    <label class="form-check-label small" for="ntRegular">Regular</label>
                </div>
            </div>

            <div class="d-flex align-items-center gap-2 mb-3">
                <label class="small fw-semibold mb-0">Ticket Closing Time Requested (Time &amp; Date):</label>
                <asp:TextBox ID="TxtNtCloseTime" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" />
                <asp:TextBox ID="TxtNtCloseDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
            </div>

            <div class="border p-2 mb-3" style="font-size:0.83rem;">

                <div class="d-flex align-items-center gap-2 mb-2 flex-wrap">
                    <div class="form-check mb-0" style="min-width:210px;">
                        <asp:RadioButton ID="ntMaintenance" runat="server" ClientIDMode="Static" GroupName="ntTicketType" CssClass="form-check-input" />
                        <label class="form-check-label" for="ntMaintenance">Maintanance Ticket Location:</label>
                    </div>
                    <label class="mb-0 small">Building</label>
                    <asp:TextBox ID="TxtNtBuilding"   runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" />
                    <label class="mb-0 small">Floor</label>
                    <asp:TextBox ID="TxtNtFloor"      runat="server" CssClass="form-control form-control-sm rounded-0" style="width:65px;" />
                    <label class="mb-0 small">Room</label>
                    <asp:TextBox ID="TxtNtRoom"       runat="server" CssClass="form-control form-control-sm rounded-0" style="width:65px;" />
                    <label class="mb-0 small">Hardware Id</label>
                    <asp:TextBox ID="TxtNtHardwareId" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:85px;" />
                </div>

                <div class="d-flex align-items-center gap-2 mb-2 flex-wrap">
                    <div class="form-check mb-0" style="min-width:210px;">
                        <asp:RadioButton ID="ntMachine" runat="server" ClientIDMode="Static" GroupName="ntTicketType" CssClass="form-check-input" />
                        <label class="form-check-label" for="ntMachine">Machine Ticket Location:</label>
                    </div>
                    <label class="mb-0 small">Factory</label>
                    <asp:TextBox ID="TxtNtFactory"   runat="server" CssClass="form-control form-control-sm rounded-0" style="width:90px;" />
                    <label class="mb-0 small">Machine Id</label>
                    <asp:TextBox ID="TxtNtMachineId" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:90px;" />
                </div>

                <div class="d-flex align-items-center gap-2 mb-2 flex-wrap">
                    <div class="form-check mb-0" style="min-width:210px;">
                        <asp:RadioButton ID="ntERP" runat="server" ClientIDMode="Static" GroupName="ntTicketType" CssClass="form-check-input" Checked="true" />
                        <label class="form-check-label" for="ntERP">ERP Ticket:</label>
                    </div>
                    <label class="mb-0 small">Module</label>
                    <asp:TextBox ID="TxtNtModule"  runat="server" CssClass="form-control form-control-sm rounded-0" style="width:100px;" />
                    <label class="mb-0 small">Form #</label>
                    <asp:TextBox ID="TxtNtFormNum" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:90px;" />
                </div>

                <div class="d-flex align-items-center gap-2 flex-wrap">
                    <div class="form-check mb-0" style="min-width:210px;">
                        <asp:RadioButton ID="ntProduct" runat="server" ClientIDMode="Static" GroupName="ntTicketType" CssClass="form-check-input" />
                        <label class="form-check-label" for="ntProduct">Product Ticket:</label>
                    </div>
                    <label class="mb-0 small">Product Category</label>
                    <asp:TextBox ID="TxtNtProductCat" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:95px;" />
                    <label class="mb-0 small">Product</label>
                    <asp:TextBox ID="TxtNtProduct"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:85px;" />
                    <label class="mb-0 small">Model</label>
                    <asp:TextBox ID="TxtNtModel"      runat="server" CssClass="form-control form-control-sm rounded-0" style="width:75px;" />
                    <label class="mb-0 small">Part</label>
                    <asp:TextBox ID="TxtNtPart"       runat="server" CssClass="form-control form-control-sm rounded-0" style="width:75px;" />
                </div>

            </div>

            <div class="row g-2 mb-3 align-items-start">
                <div class="col-auto"><label class="small fw-semibold mb-0 mt-1">Ticket Remarks &amp; Details:</label></div>
                <div class="col"><asp:TextBox ID="TxtNtRemarks" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="4" style="resize:vertical; width:100%;" /></div>
            </div>

            <div class="row g-2 justify-content-end">
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Attach File / Picture</span>
                        <asp:FileUpload ID="FuNtAttach" runat="server" CssClass="form-control form-control-sm rounded-0" style="font-size:0.8rem;" />
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Note</span>
                        <asp:TextBox ID="TxtNtNote" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="2" style="flex:1; resize:none;" />
                    </div>
                </div>
            </div>

        </div>

        <%-- Response on Ticket Tab --%>
        <div class="ts-pane" id="pane-responseticket">

            <div class="d-flex justify-content-end gap-4 mb-3 flex-wrap">
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0" for="DdlRtTicketName">Select Ticket Name</label>
                    <asp:DropDownList ID="DdlRtTicketName" runat="server" CssClass="form-select form-select-sm rounded-0" style="width:180px;">
                        <asp:ListItem Value="">-- Select --</asp:ListItem>
                        <asp:ListItem>Building Maintanance</asp:ListItem>
                        <asp:ListItem>Machine Maintanance</asp:ListItem>
                        <asp:ListItem>ERP Ticket</asp:ListItem>
                        <asp:ListItem>Product Ticket</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0">Date:</label>
                    <span class="small">Jan 01-2026</span>
                </div>
            </div>

            <div class="border p-2 mb-3" style="background-color:#f8f9fa; font-size:0.83rem;">
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Ticket ID:</span></div>
                    <div class="col-auto"><asp:TextBox ID="TxtRtTicketId"   runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Assigned To:</span></div>
                    <div class="col"><asp:TextBox ID="TxtRtAssignedTo"      runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Type of Ticket:</span></div>
                    <div class="col-auto"><asp:TextBox ID="TxtRtTicketType" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:200px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Ticket Name:</span></div>
                    <div class="col"><asp:TextBox ID="TxtRtTicketName"      runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Ticket Completion Target Time &amp; Date:</span></div>
                    <div class="col-auto"><asp:TextBox ID="TxtRtTargetTime" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" /></div>
                    <div class="col-auto"><asp:TextBox ID="TxtRtTargetDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" /></div>
                </div>
                <div class="row g-1 align-items-start">
                    <div class="col-auto"><span class="fw-semibold">Remarks &amp; Details:</span></div>
                    <div class="col"><asp:TextBox ID="TxtRtDetails" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="2" style="resize:vertical; width:100%;" /></div>
                </div>
            </div>

            <div class="border p-2" style="font-size:0.83rem;">
                <h6 class="fw-bold mb-3">Actions</h6>

                <%-- Response by Receiver --%>
                <div class="row g-0 mb-3">
                    <div class="col-auto pe-3 pt-1" style="min-width:140px;"><span class="small fw-semibold">Response<br />by Receiver</span></div>
                    <div class="col d-flex flex-column gap-2">
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <asp:RadioButton ID="rcvr1" runat="server" ClientIDMode="Static" GroupName="rcvrResponse" CssClass="form-check-input" Checked="true" />
                                <label class="form-check-label small" for="rcvr1">Received well and will Finished up by</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtRcvr1Time" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtRcvr1Date" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <asp:RadioButton ID="rcvr2" runat="server" ClientIDMode="Static" GroupName="rcvrResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="rcvr2">Please Deffer Ticket until</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtRcvr2Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtRcvr2Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtRcvr2Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <asp:RadioButton ID="rcvr3" runat="server" ClientIDMode="Static" GroupName="rcvrResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="rcvr3">Please Cancel the Ticket</label>
                            </div>
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtRcvr3Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <asp:RadioButton ID="rcvr4" runat="server" ClientIDMode="Static" GroupName="rcvrResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="rcvr4">Ticket Finished</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtRcvr4Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtRcvr4Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtRcvr4Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                    </div>
                </div>

                <hr class="my-2" />

                <%-- Response by Creater --%>
                <div class="row g-0 mb-3">
                    <div class="col-auto pe-3 pt-1" style="min-width:140px;"><span class="small fw-semibold">Response<br />by Creater</span></div>
                    <div class="col d-flex flex-column gap-2">
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <asp:RadioButton ID="creater1" runat="server" ClientIDMode="Static" GroupName="createrResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="creater1">Please Deffer until</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtCrtr1Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtCrtr1Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtCrtr1Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <asp:RadioButton ID="creater2" runat="server" ClientIDMode="Static" GroupName="createrResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="creater2">Deffer request accepted</label>
                            </div>
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtCrtr2Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <asp:RadioButton ID="creater3" runat="server" ClientIDMode="Static" GroupName="createrResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="creater3">Please Explain the Delay</label>
                            </div>
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtCrtr3Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <asp:RadioButton ID="creater4" runat="server" ClientIDMode="Static" GroupName="createrResponse" CssClass="form-check-input" Checked="true" />
                                <label class="form-check-label small" for="creater4">Ticket Closed but having issues</label>
                            </div>
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtCrtr4Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <asp:RadioButton ID="creater5" runat="server" ClientIDMode="Static" GroupName="createrResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="creater5">Ticket Closed</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtCrtr5Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtCrtr5Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtCrtr5Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                    </div>
                </div>

                <hr class="my-2" />

                <%-- Forwarded to Concerned Technicians --%>
                <div class="row g-0">
                    <div class="col-auto pe-3 pt-1" style="min-width:140px;"><span class="small fw-semibold">Forwarded<br />to Concerned<br />Technicians &amp;<br />Supervisors</span></div>
                    <div class="col d-flex flex-column gap-2">
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <asp:RadioButton ID="fwd1" runat="server" ClientIDMode="Static" GroupName="fwdResponse" CssClass="form-check-input" Checked="true" />
                                <label class="form-check-label small" for="fwd1">Please Carry on the Ticket</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtFwd1Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtFwd1Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtFwd1Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                    </div>
                </div>

            </div>

            <div class="row g-2 justify-content-end mt-3">
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Upload Picture or File</span>
                        <asp:FileUpload ID="FuRtAttach" runat="server" CssClass="form-control form-control-sm rounded-0" style="font-size:0.8rem;" />
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Note</span>
                        <asp:TextBox ID="TxtRtNote" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="2" style="flex:1; resize:none;" />
                    </div>
                </div>
            </div>

        </div>

        <%-- Ticket String Tab --%>
        <div class="ts-pane" id="pane-ticketstring">

            <div class="d-flex justify-content-end gap-4 mb-3 flex-wrap">
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0" for="DdlTsTicketName">Select Task Name</label>
                    <asp:DropDownList ID="DdlTsTicketName" runat="server" CssClass="form-select form-select-sm rounded-0" style="width:180px;">
                        <asp:ListItem Value="">-- Select --</asp:ListItem>
                        <asp:ListItem>Building Maintanance</asp:ListItem>
                        <asp:ListItem>Machine Maintanance</asp:ListItem>
                        <asp:ListItem>ERP Ticket</asp:ListItem>
                        <asp:ListItem>Product Ticket</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0">Date:</label>
                    <span class="small">Jan 01-2026</span>
                </div>
            </div>

            <div class="border p-2 mb-3" style="background-color:#f8f9fa; font-size:0.83rem;">
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Ticket ID:</span></div>
                    <div class="col-auto"><asp:TextBox ID="TxtTsTicketId"       runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Assigned To:</span></div>
                    <div class="col"><asp:TextBox ID="TxtTsAssignedTo"          runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Field Assignment To:</span></div>
                    <div class="col"><asp:TextBox ID="TxtTsFieldAssignment"     runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Type of Ticket:</span></div>
                    <div class="col-auto"><asp:TextBox ID="TxtTsTicketType"     runat="server" CssClass="form-control form-control-sm rounded-0" style="width:200px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Ticket Name:</span></div>
                    <div class="col"><asp:TextBox ID="TxtTsTicketName"          runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Ticket Closing Target Time &amp; Date:</span></div>
                    <div class="col-auto"><asp:TextBox ID="TxtTsTargetTime"     runat="server" CssClass="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" /></div>
                    <div class="col-auto"><asp:TextBox ID="TxtTsTargetDate"     runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" /></div>
                </div>
                <div class="row g-1 align-items-start">
                    <div class="col-auto"><span class="fw-semibold">Remarks &amp; Details:</span></div>
                    <div class="col"><asp:TextBox ID="TxtTsDetails" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="2" style="resize:vertical; width:100%;" /></div>
                </div>
            </div>

            <h6 class="fw-bold mb-2">Ticket String</h6>
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
                        <tr><td class="text-nowrap">12:39 Pm</td><td class="text-nowrap">Jan 01, 2026</td><td>Responsed</td><td>Ticket Accepted</td><td>-</td></tr>
                        <tr><td class="text-nowrap">3:05 Pm</td><td class="text-nowrap">Jan 01, 2026</td><td>Delayed</td><td>Changed Completion Time</td><td>-</td></tr>
                        <tr><td class="text-nowrap">4:10 Pm</td><td class="text-nowrap">Jan 01, 2026</td><td>Delay Accepted</td><td>-</td><td>Delay Accepted</td></tr>
                        <tr><td class="text-nowrap">10:19 Am</td><td class="text-nowrap">Jan 02, 2026</td><td>Task Finished</td><td>Ticket Finished Submitted</td><td>-</td></tr>
                        <tr><td class="text-nowrap">11:10 Am</td><td class="text-nowrap">Jan 02, 2026</td><td>Task Finished Accepted</td><td>-</td><td>Ticket Closed</td></tr>
                    </tbody>
                </table>
            </div>

            <div class="row g-2 justify-content-end mt-3">
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Attached File / Picture</span>
                        <asp:FileUpload ID="FuTsAttach" runat="server" CssClass="form-control form-control-sm rounded-0" style="font-size:0.8rem;" />
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Note</span>
                        <asp:TextBox ID="TxtTsNote" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="2" style="flex:1; resize:none;" />
                    </div>
                </div>
            </div>

        </div>

        <%-- Ticket Status Tab --%>
        <div class="ts-pane" id="pane-ticketstatus">

            <div class="d-flex gap-4 mb-2 pb-2 border-bottom flex-wrap align-items-start">

                <div class="d-flex flex-column gap-1">
                    <div class="form-check mb-0">
                        <asp:CheckBox ID="ChkTsCritical"  runat="server" ClientIDMode="Static" CssClass="form-check-input" />
                        <label class="form-check-label small" for="ChkTsCritical">Critically Urgent</label>
                    </div>
                    <div class="form-check mb-0">
                        <asp:CheckBox ID="ChkTsImportant" runat="server" ClientIDMode="Static" CssClass="form-check-input" Checked="true" />
                        <label class="form-check-label small" for="ChkTsImportant">Important</label>
                    </div>
                    <div class="form-check mb-0">
                        <asp:CheckBox ID="ChkTsRegular"   runat="server" ClientIDMode="Static" CssClass="form-check-input" />
                        <label class="form-check-label small" for="ChkTsRegular">Regular</label>
                    </div>
                    <div class="form-check mb-0">
                        <asp:CheckBox ID="ChkTsAll"       runat="server" ClientIDMode="Static" CssClass="form-check-input" />
                        <label class="form-check-label small" for="ChkTsAll">All</label>
                    </div>
                </div>

                <div class="d-flex flex-column gap-2">
                    <div class="d-flex gap-3 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="radAllTickets"   runat="server" ClientIDMode="Static" GroupName="radTicketType" CssClass="form-check-input" Checked="true" />
                            <label class="form-check-label small" for="radAllTickets">All Tickets</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="radMachineMaint" runat="server" ClientIDMode="Static" GroupName="radTicketType" CssClass="form-check-input" />
                            <label class="form-check-label small" for="radMachineMaint">Machine Maintanance Tickets</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="radMaintenance"  runat="server" ClientIDMode="Static" GroupName="radTicketType" CssClass="form-check-input" />
                            <label class="form-check-label small" for="radMaintenance">Maintanance Tickets</label>
                        </div>
                    </div>
                    <div class="d-flex gap-3 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="radERP"     runat="server" ClientIDMode="Static" GroupName="radTicketType" CssClass="form-check-input" />
                            <label class="form-check-label small" for="radERP">ERP Tickets</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="radProduct" runat="server" ClientIDMode="Static" GroupName="radTicketType" CssClass="form-check-input" />
                            <label class="form-check-label small" for="radProduct">Product Tickets</label>
                        </div>
                    </div>
                    <div class="d-flex gap-3 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="radOpen"      runat="server" ClientIDMode="Static" GroupName="radTicketStatus" CssClass="form-check-input" Checked="true" />
                            <label class="form-check-label small" for="radOpen">Open</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="radClosed"    runat="server" ClientIDMode="Static" GroupName="radTicketStatus" CssClass="form-check-input" />
                            <label class="form-check-label small" for="radClosed">Closed</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="radDeffered"  runat="server" ClientIDMode="Static" GroupName="radTicketStatus" CssClass="form-check-input" />
                            <label class="form-check-label small" for="radDeffered">Deffered</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="radDelayed"   runat="server" ClientIDMode="Static" GroupName="radTicketStatus" CssClass="form-check-input" />
                            <label class="form-check-label small" for="radDelayed">Delayed</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="radAllStatus" runat="server" ClientIDMode="Static" GroupName="radTicketStatus" CssClass="form-check-input" />
                            <label class="form-check-label small" for="radAllStatus">All</label>
                        </div>
                    </div>
                </div>

            </div>

            <div class="table-responsive">
                <table class="table table-bordered table-sm mb-0" style="font-size:0.82rem;">
                    <thead style="background-color:#f8f9fa;">
                        <tr>
                            <th class="rounded-0 text-nowrap">Ticket Id</th>
                            <th class="rounded-0 text-nowrap">Ticket Issued Date</th>
                            <th class="rounded-0 text-nowrap">Location / Form# / Model or Part Id</th>
                            <th class="rounded-0 text-nowrap">Ticket Type</th>
                            <th class="rounded-0 text-nowrap">Ticket Issued To</th>
                            <th class="rounded-0 text-nowrap">Ticket Issued By</th>
                            <th class="rounded-0 text-nowrap">Ticket Status</th>
                            <th class="rounded-0">Remarks</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="fw-bold">2345</td><td class="text-nowrap fw-bold">Jan 01, 2016</td>
                            <td class="fw-bold">Property Id<br />Flr &amp; Room#<br />Hardware Id</td>
                            <td class="fw-bold">Building<br />Corrective<br />Maintanance</td>
                            <td class="fw-bold">Asst Manger<br />Maintanance<br />Zaman Khan</td>
                            <td class="fw-bold">Asst Manger<br />Production<br />Saleem Ahmed</td>
                            <td>In Process</td><td></td>
                        </tr>
                        <tr>
                            <td>2346</td><td class="text-nowrap">Jan 01, 2016</td>
                            <td>Machine Id<br />Location</td><td>Machine<br />Corrective<br />Maintanance</td>
                            <td>Asst Manger<br />Maintanance<br />Zaman Khan</td>
                            <td>Asst Manger<br />Production<br />Saleem Ahmed</td>
                            <td>Respose<br />Required</td><td></td>
                        </tr>
                        <tr>
                            <td>2347</td><td class="text-nowrap">Jan 03, 2016</td>
                            <td>Form HR27</td><td>ERP<br />Ticket</td>
                            <td>Asst Manger<br />ERP Tickets<br />Kaleem</td>
                            <td>Asst Manger<br />Production<br />Saleem Ahmed</td>
                            <td>Delayed</td><td></td>
                        </tr>
                        <tr>
                            <td>2348</td><td class="text-nowrap">Jan 05, 2016</td>
                            <td>VN/Extractor</td><td>Product<br />Ticket</td>
                            <td>Asst Manger<br />D&amp;P D<br />Adnan Khan</td>
                            <td>Asst Manger<br />Production<br />Saleem Ahmed</td>
                            <td>In Process</td><td></td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>

    </div>

    <script type="text/javascript">
        function showTab(paneid, clickedBtn) {
            var panes = document.querySelectorAll('#tsTabContent .ts-pane');
            for (var i = 0; i < panes.length; i++) { panes[i].classList.remove('active'); }
            var btns = document.querySelectorAll('#tsTabNav .ts-tab-btn');
            for (var j = 0; j < btns.length; j++) { btns[j].classList.remove('active'); }
            document.getElementById(paneid).classList.add('active');
            clickedBtn.classList.add('active');
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
    </script>

</asp:Content>
