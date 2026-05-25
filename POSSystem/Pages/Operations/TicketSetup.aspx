<%@ Page Title="Ticket Setup" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TicketSetup.aspx.vb" Inherits="POSSystem.Pages.Operations.TicketSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Heading + Toolbar --%>
    <div class="d-flex align-items-center gap-2 mb-2 px-3 py-2 border flex-wrap" style="background-color:#f8f9fa;">
        <strong class="fs-5 me-2">Ticket</strong>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Transmit</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Post</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">New</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Save</button>
        <div class="ms-auto d-flex gap-2">
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Delete</button>
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Edit</button>
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Print</button>
        </div>
    </div>

    <style>
        #ticketSetupTabs .nav-link {
            background-color: #e9ecef;
            color: #495057;
            border-color: #dee2e6;
            border-radius: 0;
        }
        #ticketSetupTabs .nav-link.active {
            background-color: #6c757d;
            color: #fff;
            border-color: #6c757d #6c757d #fff;
        }
        #ticketSetupTabs .nav-link:focus {
            box-shadow: none;
        }
    </style>

    <%-- Tab Navigation --%>
    <ul class="nav nav-tabs" id="ticketSetupTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active rounded-0 px-4" id="tab-ticketsetup"
                    data-bs-toggle="tab" data-bs-target="#pane-ticketsetup"
                    type="button" role="tab" aria-controls="pane-ticketsetup" aria-selected="true">
                Ticket Setup
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link rounded-0 px-4" id="tab-newticket"
                    data-bs-toggle="tab" data-bs-target="#pane-newticket"
                    type="button" role="tab" aria-controls="pane-newticket" aria-selected="false">
                New Ticket
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link rounded-0 px-4" id="tab-responseticket"
                    data-bs-toggle="tab" data-bs-target="#pane-responseticket"
                    type="button" role="tab" aria-controls="pane-responseticket" aria-selected="false">
                Response on Ticket
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link rounded-0 px-4" id="tab-ticketstring"
                    data-bs-toggle="tab" data-bs-target="#pane-ticketstring"
                    type="button" role="tab" aria-controls="pane-ticketstring" aria-selected="false">
                Ticket String
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link rounded-0 px-4" id="tab-ticketstatus"
                    data-bs-toggle="tab" data-bs-target="#pane-ticketstatus"
                    type="button" role="tab" aria-controls="pane-ticketstatus" aria-selected="false">
                Ticket Status
            </button>
        </li>
    </ul>

    <%-- Tab Content --%>
    <div class="tab-content border border-top-0" id="ticketSetupTabContent">

        <%-- Ticket Setup Tab --%>
        <div class="tab-pane fade show active p-3" id="pane-ticketsetup" role="tabpanel" aria-labelledby="tab-ticketsetup">

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
                            <input type="text" id="txtAdd_tickettype" class="form-control form-control-sm rounded-0" style="width:200px;"
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
                        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0" onclick="showAddPanel('ticketresponse')">+ Add New</button>
                        <div id="addPanel_ticketresponse" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                            <input type="text" id="txtAdd_ticketresponse" class="form-control form-control-sm rounded-0" style="width:200px;"
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
                            <li>Design Engineer</li>
                        </ul>
                    </div>
                    <div class="d-flex flex-column" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Name</div>
                        <ul id="list_assigned_name" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                            <li>Adnan Khan</li>
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
                            <li>Supervisor Machinary Maint.</li>
                            <li>Asst Programming Manager</li>
                            <li>Asst Design Engineer</li>
                        </ul>
                    </div>
                    <div class="d-flex flex-column" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Name</div>
                        <ul id="list_concerned_name" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                            <li>Adnan Khan</li>
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
                            <li>Machinary Maint. Technician</li>
                            <li>Programming Person</li>
                            <li>Asst Design Engineer</li>
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

        <%-- New Ticket Tab --%>
        <div class="tab-pane fade p-3" id="pane-newticket" role="tabpanel" aria-labelledby="tab-newticket">

            <%-- Ticket ID + Date (top-right) --%>
            <div class="d-flex justify-content-end gap-4 mb-3">
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0">Ticket ID:</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:130px;" />
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0">Date:</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:130px;" placeholder="mm/dd/yyyy" />
                </div>
            </div>

            <%-- Radio Row: Ticket Nature --%>
            <div class="d-flex justify-content-center gap-4 mb-3">
                <div class="form-check form-check-inline mb-0">
                    <input class="form-check-input" type="radio" name="ntNature" id="ntCritical" />
                    <label class="form-check-label small" for="ntCritical">Critically Urgent</label>
                </div>
                <div class="form-check form-check-inline mb-0">
                    <input class="form-check-input" type="radio" name="ntNature" id="ntImportant" checked />
                    <label class="form-check-label small" for="ntImportant">Important</label>
                </div>
                <div class="form-check form-check-inline mb-0">
                    <input class="form-check-input" type="radio" name="ntNature" id="ntRegular" />
                    <label class="form-check-label small" for="ntRegular">Regular</label>
                </div>
            </div>

            <%-- Ticket Closing Time Requested --%>
            <div class="d-flex align-items-center gap-2 mb-3">
                <label class="small fw-semibold mb-0">Ticket Closing Time Requested (Time &amp; Date):</label>
                <input type="text" class="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" />
                <input type="text" class="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
            </div>

            <%-- Ticket Type Rows --%>
            <div class="border p-2 mb-3" style="font-size:0.83rem;">

                <%-- Maintenance Ticket --%>
                <div class="d-flex align-items-center gap-2 mb-2 flex-wrap">
                    <div class="form-check mb-0" style="min-width:210px;">
                        <input class="form-check-input" type="radio" name="ntTicketType" id="ntMaintenance" />
                        <label class="form-check-label" for="ntMaintenance">Maintanance Ticket Location:</label>
                    </div>
                    <label class="mb-0 small">Building</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" />
                    <label class="mb-0 small">Floor</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:65px;" />
                    <label class="mb-0 small">Room</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:65px;" />
                    <label class="mb-0 small">Hardware Id</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:85px;" />
                </div>

                <%-- Machine Ticket --%>
                <div class="d-flex align-items-center gap-2 mb-2 flex-wrap">
                    <div class="form-check mb-0" style="min-width:210px;">
                        <input class="form-check-input" type="radio" name="ntTicketType" id="ntMachine" />
                        <label class="form-check-label" for="ntMachine">Machine Ticket Location:</label>
                    </div>
                    <label class="mb-0 small">Factory</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:90px;" />
                    <label class="mb-0 small">Machine Id</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:90px;" />
                </div>

                <%-- ERP Ticket --%>
                <div class="d-flex align-items-center gap-2 mb-2 flex-wrap">
                    <div class="form-check mb-0" style="min-width:210px;">
                        <input class="form-check-input" type="radio" name="ntTicketType" id="ntERP" checked />
                        <label class="form-check-label" for="ntERP">ERP Ticket:</label>
                    </div>
                    <label class="mb-0 small">Module</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:100px;" />
                    <label class="mb-0 small">Form #</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:90px;" />
                </div>

                <%-- Product Ticket --%>
                <div class="d-flex align-items-center gap-2 flex-wrap">
                    <div class="form-check mb-0" style="min-width:210px;">
                        <input class="form-check-input" type="radio" name="ntTicketType" id="ntProduct" />
                        <label class="form-check-label" for="ntProduct">Product Ticket:</label>
                    </div>
                    <label class="mb-0 small">Product Category</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:95px;" />
                    <label class="mb-0 small">Product</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:85px;" />
                    <label class="mb-0 small">Model</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:75px;" />
                    <label class="mb-0 small">Part</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:75px;" />
                </div>

            </div>

            <%-- Ticket Remarks & Details --%>
            <div class="row g-2 mb-3 align-items-start">
                <div class="col-auto">
                    <label class="small fw-semibold mb-0 mt-1">Ticket Remarks &amp; Details:</label>
                </div>
                <div class="col">
                    <textarea class="form-control form-control-sm rounded-0" rows="4" style="resize:vertical;"></textarea>
                </div>
            </div>

            <%-- Attach File + Note --%>
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

        <%-- Response on Ticket Tab --%>
        <div class="tab-pane fade p-3" id="pane-responseticket" role="tabpanel" aria-labelledby="tab-responseticket">

            <%-- Select Ticket Name + Date --%>
            <div class="d-flex justify-content-end gap-4 mb-3 flex-wrap">
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0" for="selTicketName">Select Ticket Name</label>
                    <select id="selTicketName" class="form-select form-select-sm rounded-0" style="width:180px;">
                        <option value="">-- Select --</option>
                        <option>Building Maintanance</option>
                        <option>Machine Maintanance</option>
                        <option>ERP Ticket</option>
                        <option>Product Ticket</option>
                    </select>
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0">Date:</label>
                    <span class="small">Jan 01-2026</span>
                </div>
            </div>

            <%-- Ticket Info --%>
            <div class="border p-2 mb-3" style="background-color:#f8f9fa; font-size:0.83rem;">
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Ticket ID:</span></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Assigned To:</span></div>
                    <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Type of Ticket:</span></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:200px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Ticket Name:</span></div>
                    <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Ticket Completion Target Time &amp; Date:</span></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" /></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" /></div>
                </div>
                <div class="row g-1 align-items-start">
                    <div class="col-auto"><span class="fw-semibold">Remarks &amp; Details:</span></div>
                    <div class="col"><textarea class="form-control form-control-sm rounded-0" rows="2" style="resize:vertical;"></textarea></div>
                </div>
            </div>

            <%-- Actions --%>
            <div class="border p-2" style="font-size:0.83rem;">
                <h6 class="fw-bold mb-3">Actions</h6>

                <%-- Response by Receiver --%>
                <div class="row g-0 mb-3">
                    <div class="col-auto pe-3 pt-1" style="min-width:140px;">
                        <span class="small fw-semibold">Response<br />by Receiver</span>
                    </div>
                    <div class="col d-flex flex-column gap-2">

                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <input class="form-check-input" type="radio" name="rcvrResponse" id="rcvr1" value="received_well" checked />
                                <label class="form-check-label small" for="rcvr1">Received well and will Finished up by</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                        </div>

                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <input class="form-check-input" type="radio" name="rcvrResponse" id="rcvr2" value="deffer_until" />
                                <label class="form-check-label small" for="rcvr2">Please Deffer Ticket until</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>

                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <input class="form-check-input" type="radio" name="rcvrResponse" id="rcvr3" value="cancel_ticket" />
                                <label class="form-check-label small" for="rcvr3">Please Cancel the Ticket</label>
                            </div>
                            <label class="small mb-0">Remarks</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>

                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <input class="form-check-input" type="radio" name="rcvrResponse" id="rcvr4" value="ticket_finished" />
                                <label class="form-check-label small" for="rcvr4">Ticket Finished</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>

                    </div>
                </div>

                <hr class="my-2" />

                <%-- Response by Creater --%>
                <div class="row g-0 mb-3">
                    <div class="col-auto pe-3 pt-1" style="min-width:140px;">
                        <span class="small fw-semibold">Response<br />by Creater</span>
                    </div>
                    <div class="col d-flex flex-column gap-2">

                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <input class="form-check-input" type="radio" name="createrResponse" id="creater1" value="deffer_until" />
                                <label class="form-check-label small" for="creater1">Please Deffer until</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>

                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <input class="form-check-input" type="radio" name="createrResponse" id="creater2" value="deffer_accepted" />
                                <label class="form-check-label small" for="creater2">Deffer request accepted</label>
                            </div>
                            <label class="small mb-0">Remarks</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>

                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <input class="form-check-input" type="radio" name="createrResponse" id="creater3" value="explain_delay" />
                                <label class="form-check-label small" for="creater3">Please Explain the Delay</label>
                            </div>
                            <label class="small mb-0">Remarks</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>

                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <input class="form-check-input" type="radio" name="createrResponse" id="creater4" value="closed_issues" checked />
                                <label class="form-check-label small" for="creater4">Ticket Closed but having issues</label>
                            </div>
                            <label class="small mb-0">Remarks</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>

                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <input class="form-check-input" type="radio" name="createrResponse" id="creater5" value="ticket_closed" />
                                <label class="form-check-label small" for="creater5">Ticket Closed</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>

                    </div>
                </div>

                <hr class="my-2" />

                <%-- Forwarded to Concerned Technicians & Supervisors --%>
                <div class="row g-0">
                    <div class="col-auto pe-3 pt-1" style="min-width:140px;">
                        <span class="small fw-semibold">Forwarded<br />to Concerned<br />Technicians &amp;<br />Supervisors</span>
                    </div>
                    <div class="col d-flex flex-column gap-2">
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <input class="form-check-input" type="radio" name="fwdResponse" id="fwd1" value="carry_on" checked />
                                <label class="form-check-label small" for="fwd1">Please Carry on the Ticket</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                    </div>
                </div>

            </div>

            <%-- Upload Picture or File + Note --%>
            <div class="row g-2 justify-content-end mt-3">
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Upload Picture or File</span>
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

        <%-- Ticket String Tab --%>
        <div class="tab-pane fade p-3" id="pane-ticketstring" role="tabpanel" aria-labelledby="tab-ticketstring">

            <%-- Select Task Name + Date --%>
            <div class="d-flex justify-content-end gap-4 mb-3 flex-wrap">
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0" for="selTsTicketName">Select Task Name</label>
                    <select id="selTsTicketName" class="form-select form-select-sm rounded-0" style="width:180px;">
                        <option value="">-- Select --</option>
                        <option>Building Maintanance</option>
                        <option>Machine Maintanance</option>
                        <option>ERP Ticket</option>
                        <option>Product Ticket</option>
                    </select>
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0">Date:</label>
                    <span class="small">Jan 01-2026</span>
                </div>
            </div>

            <%-- Ticket Info --%>
            <div class="border p-2 mb-3" style="background-color:#f8f9fa; font-size:0.83rem;">
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Ticket ID:</span></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Assigned To:</span></div>
                    <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Field Assignment To:</span></div>
                    <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Type of Ticket:</span></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:200px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Ticket Name:</span></div>
                    <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Ticket Closing Target Time &amp; Date:</span></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" /></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" /></div>
                </div>
                <div class="row g-1 align-items-start">
                    <div class="col-auto"><span class="fw-semibold">Remarks &amp; Details:</span></div>
                    <div class="col"><textarea class="form-control form-control-sm rounded-0" rows="2" style="resize:vertical;"></textarea></div>
                </div>
            </div>

            <%-- Ticket String Timeline Grid --%>
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
                        <tr>
                            <td class="text-nowrap">12:34 Pm</td>
                            <td class="text-nowrap">Jan 01, 2026</td>
                            <td>Created</td>
                            <td>-</td>
                            <td>Created</td>
                        </tr>
                        <tr>
                            <td class="text-nowrap">12:39 Pm</td>
                            <td class="text-nowrap">Jan 01, 2026</td>
                            <td>Responsed</td>
                            <td>Ticket Accepted</td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td class="text-nowrap">3:05 Pm</td>
                            <td class="text-nowrap">Jan 01, 2026</td>
                            <td>Delayed</td>
                            <td>Changed Completion Time</td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td class="text-nowrap">4:10 Pm</td>
                            <td class="text-nowrap">Jan 01, 2026</td>
                            <td>Delay Accepted</td>
                            <td>-</td>
                            <td>Delay Accepted</td>
                        </tr>
                        <tr>
                            <td class="text-nowrap">10:19 Am</td>
                            <td class="text-nowrap">Jan 02, 2026</td>
                            <td>Task Finished</td>
                            <td>Ticket Finished Submitted</td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td class="text-nowrap">11:10 Am</td>
                            <td class="text-nowrap">Jan 02, 2026</td>
                            <td>Task Finished Accepted</td>
                            <td>-</td>
                            <td>Ticket Closed</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <%-- Attach File + Note --%>
            <div class="row g-2 justify-content-end mt-3">
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Attached File / Picture</span>
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

        <%-- Ticket Status Tab --%>
        <div class="tab-pane fade p-3" id="pane-ticketstatus" role="tabpanel" aria-labelledby="tab-ticketstatus">

            <%-- Filter Row --%>
            <div class="d-flex gap-4 mb-2 pb-2 border-bottom flex-wrap align-items-start">

                <%-- Checkboxes: ticket nature --%>
                <div class="d-flex flex-column gap-1">
                    <div class="form-check mb-0">
                        <input class="form-check-input" type="checkbox" id="chkCritical" />
                        <label class="form-check-label small" for="chkCritical">Critically Urgent</label>
                    </div>
                    <div class="form-check mb-0">
                        <input class="form-check-input" type="checkbox" id="chkImportant" checked />
                        <label class="form-check-label small" for="chkImportant">Important</label>
                    </div>
                    <div class="form-check mb-0">
                        <input class="form-check-input" type="checkbox" id="chkRegular" />
                        <label class="form-check-label small" for="chkRegular">Regular</label>
                    </div>
                    <div class="form-check mb-0">
                        <input class="form-check-input" type="checkbox" id="chkAll" />
                        <label class="form-check-label small" for="chkAll">All</label>
                    </div>
                </div>

                <%-- Radio buttons: ticket type + status --%>
                <div class="d-flex flex-column gap-2">
                    <div class="d-flex gap-3 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="radTicketType" id="radAllTickets" checked />
                            <label class="form-check-label small" for="radAllTickets">All Tickets</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="radTicketType" id="radMachineMaint" />
                            <label class="form-check-label small" for="radMachineMaint">Machine Maintanance Tickets</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="radTicketType" id="radMaintenance" />
                            <label class="form-check-label small" for="radMaintenance">Maintanance Tickets</label>
                        </div>
                    </div>
                    <div class="d-flex gap-3 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="radTicketType" id="radERP" />
                            <label class="form-check-label small" for="radERP">ERP Tickets</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="radTicketType" id="radProduct" />
                            <label class="form-check-label small" for="radProduct">Product Tickets</label>
                        </div>
                    </div>
                    <div class="d-flex gap-3 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="radTicketStatus" id="radOpen" checked />
                            <label class="form-check-label small" for="radOpen">Open</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="radTicketStatus" id="radClosed" />
                            <label class="form-check-label small" for="radClosed">Closed</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="radTicketStatus" id="radDeffered" />
                            <label class="form-check-label small" for="radDeffered">Deffered</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="radTicketStatus" id="radDelayed" />
                            <label class="form-check-label small" for="radDelayed">Delayed</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="radTicketStatus" id="radAllStatus" />
                            <label class="form-check-label small" for="radAllStatus">All</label>
                        </div>
                    </div>
                </div>

            </div>

            <%-- Ticket grid --%>
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
                            <td class="fw-bold">2345</td>
                            <td class="text-nowrap fw-bold">Jan 01, 2016</td>
                            <td class="fw-bold">Property Id<br />Flr &amp; Room#<br />Hardware Id</td>
                            <td class="fw-bold">Building<br />Corrective<br />Maintanance</td>
                            <td class="fw-bold">Asst Manger<br />Maintanance<br />Zaman Khan</td>
                            <td class="fw-bold">Asst Manger<br />Production<br />Saleem Ahmed</td>
                            <td>In Process</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>2346</td>
                            <td class="text-nowrap">Jan 01, 2016</td>
                            <td>Machine Id<br />Location</td>
                            <td>Machine<br />Corrective<br />Maintanance</td>
                            <td>Asst Manger<br />Maintanance<br />Zaman Khan</td>
                            <td>Asst Manger<br />Production<br />Saleem Ahmed</td>
                            <td>Respose<br />Required</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>2347</td>
                            <td class="text-nowrap">Jan 03, 2016</td>
                            <td>Form HR27</td>
                            <td>ERP<br />Ticket</td>
                            <td>Asst Manger<br />ERP Tickets<br />Kaleem</td>
                            <td>Asst Manger<br />Production<br />Saleem Ahmed</td>
                            <td>Delayed</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>2348</td>
                            <td class="text-nowrap">Jan 05, 2016</td>
                            <td>VN/Extractor</td>
                            <td>Product<br />Ticket</td>
                            <td>Asst Manger<br />D&amp;P D<br />Adnan Khan</td>
                            <td>Asst Manger<br />Production<br />Saleem Ahmed</td>
                            <td>In Process</td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
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
    </script>

</asp:Content>
