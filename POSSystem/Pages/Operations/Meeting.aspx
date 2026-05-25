<%@ Page Title="Meeting Management" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Meeting.aspx.vb" Inherits="POSSystem.Pages.Operations.Meeting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Heading + Toolbar --%>
    <div class="d-flex align-items-center gap-2 mb-2 px-3 py-2 border flex-wrap" style="background-color:#f8f9fa;">
        <strong class="fs-5 me-2">Meeting Management</strong>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Creater</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Save</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">New</button>
        <div class="ms-auto d-flex gap-2">
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Delete</button>
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Edit</button>
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Print</button>
        </div>
    </div>

    <style>
        #meetingMgmtTabs {
            flex-wrap: nowrap;
            overflow-x: auto;
        }
        #meetingMgmtTabs .nav-link {
            background-color: #e9ecef;
            color: #495057;
            border-color: #dee2e6;
            border-radius: 0;
            font-size: 0.78rem;
            white-space: nowrap;
            padding-left: 0.55rem;
            padding-right: 0.55rem;
        }
        #meetingMgmtTabs .nav-link.active {
            background-color: #6c757d;
            color: #fff;
            border-color: #6c757d #6c757d #fff;
        }
        #meetingMgmtTabs .nav-link:focus {
            box-shadow: none;
        }
    </style>

    <%-- Tab Navigation --%>
    <ul class="nav nav-tabs" id="meetingMgmtTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active rounded-0" id="tab-meetingmgmt"
                    data-bs-toggle="tab" data-bs-target="#pane-meetingmgmt"
                    type="button" role="tab" aria-controls="pane-meetingmgmt" aria-selected="true">
                Meeting Management
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link rounded-0" id="tab-newmeeting"
                    data-bs-toggle="tab" data-bs-target="#pane-newmeeting"
                    type="button" role="tab" aria-controls="pane-newmeeting" aria-selected="false">
                New Meeting
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link rounded-0" id="tab-responsemeeting"
                    data-bs-toggle="tab" data-bs-target="#pane-responsemeeting"
                    type="button" role="tab" aria-controls="pane-responsemeeting" aria-selected="false">
                Response on Meeting Invitation
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link rounded-0" id="tab-responsecaller"
                    data-bs-toggle="tab" data-bs-target="#pane-responsecaller"
                    type="button" role="tab" aria-controls="pane-responsecaller" aria-selected="false">
                Response on Meeting by Caller
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link rounded-0" id="tab-meetingstring"
                    data-bs-toggle="tab" data-bs-target="#pane-meetingstring"
                    type="button" role="tab" aria-controls="pane-meetingstring" aria-selected="false">
                Meeting String
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link rounded-0" id="tab-meetingsstatus"
                    data-bs-toggle="tab" data-bs-target="#pane-meetingsstatus"
                    type="button" role="tab" aria-controls="pane-meetingsstatus" aria-selected="false">
                Meetings Status
            </button>
        </li>
    </ul>

    <%-- Tab Content --%>
    <div class="tab-content border border-top-0" id="meetingMgmtTabContent">

        <%-- Meeting Management Tab --%>
        <div class="tab-pane fade show active p-3" id="pane-meetingmgmt" role="tabpanel" aria-labelledby="tab-meetingmgmt">

            <%-- Section 1: Type of Meeting + Meeting Response --%>
            <div class="row g-0 mb-3" style="align-items:stretch;">

                <%-- Type of Meeting --%>
                <div class="col-md-6">
                    <div class="border p-3 me-md-2 d-flex flex-column" style="height:220px;">
                        <h6 class="fw-bold mb-2">Type of Meeting</h6>
                        <ul id="list_meetingtype" class="list-unstyled mb-2" style="overflow-y:auto; flex:1; min-height:0;">
                            <li>Sales Meeting</li>
                            <li>Meeting with Vendor</li>
                            <li>Procurement Meeting</li>
                            <li>Scheduled Regular Meetings</li>
                            <li>Management Meeting</li>
                            <li>General Meetings</li>
                            <li>Board Meeting</li>
                        </ul>
                        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0" onclick="showAddPanel('meetingtype')">+ Add New</button>
                        <div id="addPanel_meetingtype" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                            <input type="text" id="txtAdd_meetingtype" class="form-control form-control-sm rounded-0" style="width:200px;"
                                   oninput="document.getElementById('btnAdd_meetingtype').disabled = this.value.trim() === '';" />
                            <button type="button" id="btnAdd_meetingtype" class="btn btn-sm btn-outline-secondary rounded-0" disabled onclick="addItem('meetingtype')">Add</button>
                            <a href="#" class="text-secondary small" onclick="hideAddPanel('meetingtype'); return false;">Cancel</a>
                        </div>
                    </div>
                </div>

                <%-- Meeting Response --%>
                <div class="col-md-6">
                    <div class="border p-3 ms-md-2 d-flex flex-column" style="height:220px;">
                        <h6 class="fw-bold mb-2">Meeting Response</h6>
                        <ul id="list_meetingresponse" class="list-unstyled mb-2" style="overflow-y:auto; flex:1; min-height:0;">
                            <li>Meeting Scheduled</li>
                            <li>Meeting Accepted</li>
                            <li>Meeting Declined</li>
                            <li>Meeting Postponed</li>
                            <li>Meeting Cancelled</li>
                            <li>Meeting Completed</li>
                            <li>Meeting Rescheduled</li>
                            <li>Meeting In Progress</li>
                        </ul>
                        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0" onclick="showAddPanel('meetingresponse')">+ Add New</button>
                        <div id="addPanel_meetingresponse" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                            <input type="text" id="txtAdd_meetingresponse" class="form-control form-control-sm rounded-0" style="width:200px;"
                                   oninput="document.getElementById('btnAdd_meetingresponse').disabled = this.value.trim() === '';" />
                            <button type="button" id="btnAdd_meetingresponse" class="btn btn-sm btn-outline-secondary rounded-0" disabled onclick="addItem('meetingresponse')">Add</button>
                            <a href="#" class="text-secondary small" onclick="hideAddPanel('meetingresponse'); return false;">Cancel</a>
                        </div>
                    </div>
                </div>

            </div>

            <%-- Section 2: Meeting Called By --%>
            <div class="border d-flex flex-column" style="height:270px; overflow:hidden;">
                <div class="px-3 py-2 border-bottom">
                    <h6 class="fw-bold mb-0">Meeting Called By</h6>
                </div>
                <div class="d-flex" style="flex:1; min-height:0;">
                    <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Type</div>
                        <ul id="list_calledby_type" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                            <li>Sales Meeting</li>
                            <li>Management Meeting</li>
                            <li>Board Meeting</li>
                            <li>Vendor Meeting</li>
                        </ul>
                    </div>
                    <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Designation</div>
                        <ul id="list_calledby_desig" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                            <li>Sales Manager</li>
                            <li>General Manager</li>
                            <li>Board Chairman</li>
                            <li>Procurement Manager</li>
                        </ul>
                    </div>
                    <div class="d-flex flex-column" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Name</div>
                        <ul id="list_calledby_name" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                            <li>Adnan Khan</li>
                            <li>Saleem Khan</li>
                            <li>Ahsaan Ahmed</li>
                            <li>Abdul Haq</li>
                        </ul>
                    </div>
                </div>
                <div class="border-top px-2 py-1">
                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-0" onclick="showAdd3Col('calledby')">+ Add New</button>
                    <div id="addPanel_calledby" class="d-flex gap-2 align-items-center flex-wrap mt-1" style="display:none !important">
                        <input type="text" id="txtAdd_calledby_type"  class="form-control form-control-sm rounded-0" placeholder="Type"        style="width:180px;" oninput="checkAdd3Col('calledby')" />
                        <input type="text" id="txtAdd_calledby_desig" class="form-control form-control-sm rounded-0" placeholder="Designation" style="width:180px;" oninput="checkAdd3Col('calledby')" />
                        <input type="text" id="txtAdd_calledby_name"  class="form-control form-control-sm rounded-0" placeholder="Name"        style="width:180px;" oninput="checkAdd3Col('calledby')" />
                        <button type="button" id="btnAdd_calledby" class="btn btn-sm btn-outline-secondary rounded-0" disabled onclick="addItem3Col('calledby')">Add</button>
                        <a href="#" class="text-secondary small" onclick="hideAddPanel('calledby'); return false;">Cancel</a>
                    </div>
                </div>
            </div>

        </div>

        <%-- New Meeting Tab --%>
        <div class="tab-pane fade p-3" id="pane-newmeeting" role="tabpanel" aria-labelledby="tab-newmeeting">

            <%-- Meeting Id + Date --%>
            <div class="d-flex justify-content-end gap-4 mb-3">
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0">Meeting Id:</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:130px;" />
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0">Date:</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:130px;" placeholder="mm/dd/yyyy" />
                </div>
            </div>

            <%-- Filter Row: Checkboxes + radios --%>
            <div class="d-flex gap-4 mb-2 flex-wrap align-items-start">

                <%-- Checkboxes: urgency --%>
                <div class="d-flex flex-column gap-1">
                    <div class="form-check mb-0">
                        <input class="form-check-input" type="checkbox" id="nmUrgent" />
                        <label class="form-check-label small" for="nmUrgent">Urgent</label>
                    </div>
                    <div class="form-check mb-0">
                        <input class="form-check-input" type="checkbox" id="nmImportant" checked />
                        <label class="form-check-label small" for="nmImportant">Important</label>
                    </div>
                    <div class="form-check mb-0">
                        <input class="form-check-input" type="checkbox" id="nmRegular" />
                        <label class="form-check-label small" for="nmRegular">Regular</label>
                    </div>
                    <div class="form-check mb-0">
                        <input class="form-check-input" type="checkbox" id="nmAll" />
                        <label class="form-check-label small" for="nmAll">All</label>
                    </div>
                </div>

                <%-- Radios: recurrence + meeting type --%>
                <div class="d-flex flex-column gap-2">
                    <div class="d-flex gap-4 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="nmRecurrence" id="nmSingle" checked />
                            <label class="form-check-label small" for="nmSingle">Single Meeting Event</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="nmRecurrence" id="nmRecurring" />
                            <label class="form-check-label small" for="nmRecurring">Raccuring Meetings</label>
                        </div>
                    </div>
                    <div class="d-flex gap-3 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="nmMeetingType" id="nmManagement" />
                            <label class="form-check-label small" for="nmManagement">Management Meeting</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="nmMeetingType" id="nmGeneral" />
                            <label class="form-check-label small" for="nmGeneral">Genral Meeting</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="nmMeetingType" id="nmProcurement" />
                            <label class="form-check-label small" for="nmProcurement">Procurement Meeting</label>
                        </div>
                    </div>
                    <div class="d-flex gap-3 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="nmMeetingType" id="nmSales" />
                            <label class="form-check-label small" for="nmSales">Sales Meeting</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="nmMeetingType" id="nmVender" />
                            <label class="form-check-label small" for="nmVender">Vender Meeting</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="nmMeetingType" id="nmBoard" />
                            <label class="form-check-label small" for="nmBoard">Board Meeting</label>
                        </div>
                    </div>
                </div>

            </div>

            <%-- Recurring Meetings sub-section --%>
            <div class="border p-2 mb-3" style="font-size:0.83rem;">
                <span class="fw-semibold small">Raccuring Meetings</span>
                <div class="mt-2 d-flex flex-column gap-1">
                    <div class="d-flex gap-4 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="nmFrequency" id="nmEveryDay" checked />
                            <label class="form-check-label small" for="nmEveryDay">Every Day</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="nmFrequency" id="nmEveryWeek" />
                            <label class="form-check-label small" for="nmEveryWeek">Every Week</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="nmFrequency" id="nmEveryMonth" />
                            <label class="form-check-label small" for="nmEveryMonth">Every Month</label>
                        </div>
                    </div>
                    <div class="d-flex gap-4 flex-wrap align-items-center">
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="nmFrequency" id="nmEveryMonday" />
                            <label class="form-check-label small" for="nmEveryMonday">Every Monday</label>
                        </div>
                        <span class="small text-muted">- - - - - - - - - - - - - - -</span>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="nmFrequency" id="nmEverySunday" />
                            <label class="form-check-label small" for="nmEverySunday">Every Sunday</label>
                        </div>
                    </div>
                    <div class="d-flex gap-4 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="nmFrequency" id="nmFirstWeek" />
                            <label class="form-check-label small" for="nmFirstWeek">First Day of the Week</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="nmFrequency" id="nmLastWeek" />
                            <label class="form-check-label small" for="nmLastWeek">Last Day of the Week</label>
                        </div>
                    </div>
                    <div class="d-flex gap-4 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="nmFrequency" id="nmFirstMonth" />
                            <label class="form-check-label small" for="nmFirstMonth">First Day of the Month</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="nmFrequency" id="nmLastMonth" />
                            <label class="form-check-label small" for="nmLastMonth">Last Day of the Month</label>
                        </div>
                    </div>
                    <div class="d-flex gap-4 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="nmFrequency" id="nmFirstYear" />
                            <label class="form-check-label small" for="nmFirstYear">First Day of the Year</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="nmFrequency" id="nmLastYear" />
                            <label class="form-check-label small" for="nmLastYear">Last Day of the Yeay</label>
                        </div>
                    </div>
                </div>
            </div>

            <%-- Meeting Proposed Time & Venue --%>
            <div class="border p-2 mb-3" style="font-size:0.83rem;">
                <div class="d-flex align-items-center gap-2 mb-2 flex-wrap">
                    <span class="fw-semibold">Meeting Proposed Time</span>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" />
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
                </div>
                <div class="d-flex align-items-center gap-2 flex-wrap">
                    <span class="fw-semibold">Meeting Proposed Venue</span>
                    <label class="small mb-0">Location ID</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:100px;" />
                    <label class="small mb-0">Outdoor Premises</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:130px;" />
                    <label class="small mb-0">Address</label>
                    <input type="text" class="form-control form-control-sm rounded-0 flex-grow-1" />
                </div>
            </div>

            <%-- Participants --%>
            <div class="border p-2 mb-3" style="font-size:0.83rem;">
                <div class="row g-1 mb-2 align-items-center">
                    <div class="col-auto" style="min-width:130px;">
                        <span class="fw-semibold">Participants</span>
                    </div>
                    <div class="col">
                        <div class="row g-1 align-items-center">
                            <div class="col-auto"><label class="small mb-0">Designation</label></div>
                            <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Name</label></div>
                            <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Department</label></div>
                            <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Company</label></div>
                            <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                        </div>
                    </div>
                </div>
                <div class="row g-1 align-items-center">
                    <div class="col-auto" style="min-width:130px;">
                        <span class="fw-semibold">Outside Participants</span>
                    </div>
                    <div class="col">
                        <div class="row g-1 align-items-center">
                            <div class="col-auto"><label class="small mb-0">Company</label></div>
                            <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Name</label></div>
                            <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Relation</label></div>
                            <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">e-mail</label></div>
                            <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                        </div>
                    </div>
                </div>
            </div>

            <%-- Meeting Agenda & Details --%>
            <div class="row g-2 align-items-start">
                <div class="col-auto">
                    <label class="small fw-semibold mb-0 mt-1">Meeting Agenda &amp; Details:</label>
                </div>
                <div class="col">
                    <textarea class="form-control form-control-sm rounded-0" rows="4" style="resize:vertical;"></textarea>
                </div>
            </div>

        </div>

        <%-- Response on Meeting Invitation Tab --%>
        <div class="tab-pane fade p-3" id="pane-responsemeeting" role="tabpanel" aria-labelledby="tab-responsemeeting">

            <%-- Meeting ID + Date --%>
            <div class="d-flex justify-content-end gap-4 mb-3 flex-wrap">
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0">Meeting ID:</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:130px;" />
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0">Date:</label>
                    <span class="small">Jan 01-2026</span>
                </div>
            </div>

            <%-- Meeting Info --%>
            <div class="border p-2 mb-3" style="background-color:#f8f9fa; font-size:0.83rem;">
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Meeting ID:</span></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Assigned To:</span></div>
                    <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-2 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Type of Meeting:</span></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Venue:</span></div>
                    <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto" style="min-width:130px;"><span class="fw-semibold">List of Participants</span></div>
                    <div class="col">
                        <div class="row g-1 mb-1 align-items-center">
                            <div class="col-auto"><label class="small mb-0">Name</label></div>
                            <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Designation</label></div>
                            <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Organization</label></div>
                            <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                        </div>
                        <div class="row g-1 mb-1 align-items-center">
                            <div class="col-auto"><label class="small mb-0">Name</label></div>
                            <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Designation</label></div>
                            <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Organization</label></div>
                            <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                        </div>
                        <div class="row g-1 align-items-center">
                            <div class="col-auto"><label class="small mb-0">Name</label></div>
                            <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Designation</label></div>
                            <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                        </div>
                    </div>
                </div>
                <div class="row g-1 align-items-center">
                    <div class="col-auto" style="min-width:130px;"><span class="fw-semibold">Organization</span></div>
                    <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                </div>
            </div>

            <%-- Actions --%>
            <div class="border p-2" style="font-size:0.83rem;">
                <h6 class="fw-bold mb-3">Actions</h6>

                <%-- Response by In House Receiver --%>
                <div class="row g-0 mb-3">
                    <div class="col-auto pe-3 pt-1" style="min-width:150px;">
                        <span class="small fw-semibold">Response<br />by In House<br />Receiver</span>
                    </div>
                    <div class="col d-flex flex-column gap-2">

                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <input class="form-check-input" type="radio" name="inHouseResponse" id="ih1" value="confirm" checked />
                                <label class="form-check-label small" for="ih1">Confirm</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                        </div>

                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <input class="form-check-input" type="radio" name="inHouseResponse" id="ih2" value="change_venue" />
                                <label class="form-check-label small" for="ih2">Please change Venue</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>

                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <input class="form-check-input" type="radio" name="inHouseResponse" id="ih3" value="deffer_until" />
                                <label class="form-check-label small" for="ih3">Please Deffer Until</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>

                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <input class="form-check-input" type="radio" name="inHouseResponse" id="ih4" value="unavailable" />
                                <label class="form-check-label small" for="ih4">I am Unavailabe</label>
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

                <%-- Response by Outside Participant --%>
                <div class="row g-0 mb-3">
                    <div class="col-auto pe-3 pt-1" style="min-width:150px;">
                        <span class="small fw-semibold">Response<br />by Outside<br />Participant</span>
                    </div>
                    <div class="col d-flex flex-column gap-2">

                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <input class="form-check-input" type="radio" name="outsideResponse" id="out1" value="confirmed_email" checked />
                                <label class="form-check-label small" for="out1">Confirmed by Email</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>

                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <input class="form-check-input" type="radio" name="outsideResponse" id="out2" value="deffer_requested" />
                                <label class="form-check-label small" for="out2">Deffer requested</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>

                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <input class="form-check-input" type="radio" name="outsideResponse" id="out3" value="change_venue" />
                                <label class="form-check-label small" for="out3">Please change Venue</label>
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

                <%-- Final Confirmation --%>
                <div class="row g-0">
                    <div class="col-auto pe-3 pt-1" style="min-width:150px;">
                        <span class="small fw-semibold">Final<br />Confirmation</span>
                    </div>
                    <div class="col d-flex flex-column gap-2">

                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <input class="form-check-input" type="radio" name="finalConfirmation" id="fc1" value="rescheduled" checked />
                                <label class="form-check-label small" for="fc1">Rescheduled</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>

                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <input class="form-check-input" type="radio" name="finalConfirmation" id="fc2" value="new_venue" />
                                <label class="form-check-label small" for="fc2">New Venue</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>

                        <div class="d-flex align-items-center gap-2 flex-wrap mt-1">
                            <span class="small fw-semibold" style="min-width:120px;">Date, Time &amp; Venue</span>
                            <label class="small mb-0">Final Time</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Venue</label>
                            <input type="text" class="form-control form-control-sm rounded-0 flex-grow-1" />
                        </div>

                    </div>
                </div>

            </div>

            <%-- Upload Outside Participant email response + Note --%>
            <div class="row g-2 justify-content-end mt-3">
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Upload Outside Participant's email response</span>
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

        <%-- Response on Meeting by Caller Tab --%>
        <div class="tab-pane fade p-3" id="pane-responsecaller" role="tabpanel" aria-labelledby="tab-responsecaller">

            <%-- Meeting ID + Date --%>
            <div class="d-flex justify-content-end gap-4 mb-3 flex-wrap">
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0">Meeting ID:</label>
                    <input type="text" class="form-control form-control-sm rounded-0" style="width:130px;" />
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0">Date:</label>
                    <span class="small">Jan 01-2026</span>
                </div>
            </div>

            <%-- Meeting Info --%>
            <div class="border p-2 mb-3" style="background-color:#f8f9fa; font-size:0.83rem;">
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Meeting ID:</span></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Called By:</span></div>
                    <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-2 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Type of Meeting:</span></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:160px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Time</span></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" /></div>
                    <div class="col-auto"><span class="fw-semibold">Date</span></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" /></div>
                    <div class="col-auto ms-2"><span class="fw-semibold">Venue</span></div>
                    <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto" style="min-width:130px;"><span class="fw-semibold">List of Participants</span></div>
                    <div class="col">
                        <div class="row g-1 mb-1 align-items-center">
                            <div class="col-auto"><label class="small mb-0">Name</label></div>
                            <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Designation</label></div>
                            <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Organization</label></div>
                            <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                        </div>
                        <div class="row g-1 mb-1 align-items-center">
                            <div class="col-auto"><label class="small mb-0">Name</label></div>
                            <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Designation</label></div>
                            <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Organization</label></div>
                            <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                        </div>
                        <div class="row g-1 align-items-center">
                            <div class="col-auto"><label class="small mb-0">Name</label></div>
                            <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Designation</label></div>
                            <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                        </div>
                    </div>
                </div>
                <div class="row g-1 align-items-center">
                    <div class="col-auto" style="min-width:130px;"><span class="fw-semibold">Organization</span></div>
                    <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                </div>
            </div>

            <%-- Actions --%>
            <div class="border p-2" style="font-size:0.83rem;">
                <h6 class="fw-bold mb-3">Actions</h6>

                <div class="row g-0">
                    <div class="col-auto pe-3 pt-1" style="min-width:160px;">
                        <span class="small fw-semibold">Closing Action or<br />Ammendements<br />by Meeting<br />Caller</span>
                    </div>
                    <div class="col d-flex flex-column gap-2">

                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <input class="form-check-input" type="radio" name="callerAction" id="ca1" value="rescheduled" checked />
                                <label class="form-check-label small" for="ca1">Rescheduled</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                        </div>

                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <input class="form-check-input" type="radio" name="callerAction" id="ca2" value="new_venue" />
                                <label class="form-check-label small" for="ca2">New changed Venue</label>
                            </div>
                            <label class="small mb-0">Location Id</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:90px;" />
                            <label class="small mb-0">Address</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:140px;" />
                            <label class="small mb-0">Remarks</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:160px;" />
                        </div>

                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <input class="form-check-input" type="radio" name="callerAction" id="ca3" value="add_participants" />
                                <label class="form-check-label small" for="ca3">Add Participants</label>
                            </div>
                            <label class="small mb-0">Name</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" />
                            <label class="small mb-0">Company</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" />
                            <label class="small mb-0">Remarks</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:160px;" />
                        </div>

                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <input class="form-check-input" type="radio" name="callerAction" id="ca4" value="drop_participants" />
                                <label class="form-check-label small" for="ca4">Drop Participants</label>
                            </div>
                            <label class="small mb-0">Name</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" />
                            <label class="small mb-0">Company</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" />
                            <label class="small mb-0">email</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:130px;" />
                            <label class="small mb-0">Remarks</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:130px;" />
                        </div>

                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <input class="form-check-input" type="radio" name="callerAction" id="ca5" value="unfinished_rescheduled" />
                                <label class="form-check-label small" for="ca5">Un Finished &amp; Rescheduled</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Venue Id</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:100px;" />
                            <label class="small mb-0">Remarks</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:160px;" />
                        </div>

                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <input class="form-check-input" type="radio" name="callerAction" id="ca6" value="closed_finished" />
                                <label class="form-check-label small" for="ca6">Closed &amp; Finished</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <input type="text" class="form-control form-control-sm rounded-0" style="width:160px;" />
                        </div>

                    </div>
                </div>

            </div>

            <%-- Upload Minutes & Picture + Note --%>
            <div class="row g-2 justify-content-end mt-3">
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Upload Miniutes &amp; Picture (PDF)</span>
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

        <%-- Meeting String Tab --%>
        <div class="tab-pane fade p-3" id="pane-meetingstring" role="tabpanel" aria-labelledby="tab-meetingstring">

            <%-- Select Meeting Name + Date --%>
            <div class="d-flex justify-content-end gap-4 mb-3 flex-wrap">
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0" for="selMsName">Select Meeting Name</label>
                    <select id="selMsName" class="form-select form-select-sm rounded-0" style="width:180px;">
                        <option value="">-- Select --</option>
                        <option>Sales Meeting</option>
                        <option>Management Meeting</option>
                        <option>Board Meeting</option>
                        <option>Vendor Meeting</option>
                    </select>
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0">Date:</label>
                    <span class="small">Jan 01-2026</span>
                </div>
            </div>

            <%-- Meeting Info --%>
            <div class="border p-2 mb-3" style="background-color:#f8f9fa; font-size:0.83rem;">
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Meeting ID:</span></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:110px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Assigned To:</span></div>
                    <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Field Assignment To:</span></div>
                    <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Type of Meeting:</span></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:200px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Meeting Name:</span></div>
                    <div class="col"><input type="text" class="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Meeting Closing Target Time &amp; Date:</span></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" /></div>
                    <div class="col-auto"><input type="text" class="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" /></div>
                </div>
                <div class="row g-1 align-items-start">
                    <div class="col-auto"><span class="fw-semibold">Remarks &amp; Details:</span></div>
                    <div class="col"><textarea class="form-control form-control-sm rounded-0" rows="2" style="resize:vertical;"></textarea></div>
                </div>
            </div>

            <%-- Meeting String Timeline Grid --%>
            <h6 class="fw-bold mb-2">Meeting String</h6>
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
                            <td>Meeting Accepted</td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td class="text-nowrap">3:05 Pm</td>
                            <td class="text-nowrap">Jan 01, 2026</td>
                            <td>Delayed</td>
                            <td>Changed Meeting Time</td>
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
                            <td>Meeting Finished</td>
                            <td>Meeting Finished Submitted</td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td class="text-nowrap">11:10 Am</td>
                            <td class="text-nowrap">Jan 02, 2026</td>
                            <td>Meeting Finished Accepted</td>
                            <td>-</td>
                            <td>Meeting Closed</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <%-- Attached File / Picture + Note --%>
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

        <%-- Meetings Status Tab --%>
        <div class="tab-pane fade p-3" id="pane-meetingsstatus" role="tabpanel" aria-labelledby="tab-meetingsstatus">

            <%-- Filter Row --%>
            <div class="d-flex gap-4 mb-2 pb-2 border-bottom flex-wrap align-items-start">

                <%-- Checkboxes: meeting urgency --%>
                <div class="d-flex flex-column gap-1">
                    <div class="form-check mb-0">
                        <input class="form-check-input" type="checkbox" id="chkUrgent" />
                        <label class="form-check-label small" for="chkUrgent">Urgent</label>
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

                <%-- Radio buttons: recurrence + meeting type --%>
                <div class="d-flex flex-column gap-2">
                    <div class="d-flex gap-4 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="radRecurrence" id="radSingle" checked />
                            <label class="form-check-label small" for="radSingle">Single Meeting Event</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="radRecurrence" id="radRecurring" />
                            <label class="form-check-label small" for="radRecurring">Raccuring Meetings</label>
                        </div>
                    </div>
                    <div class="d-flex gap-3 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="radMeetingType" id="radAllMeetings" checked />
                            <label class="form-check-label small" for="radAllMeetings">All Meetings</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="radMeetingType" id="radManagement" />
                            <label class="form-check-label small" for="radManagement">Management Meeting</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="radMeetingType" id="radGeneral" />
                            <label class="form-check-label small" for="radGeneral">Genral Meeting</label>
                        </div>
                    </div>
                    <div class="d-flex gap-3 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="radMeetingType" id="radSales" />
                            <label class="form-check-label small" for="radSales">Sales Meeting</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="radMeetingType" id="radVender" />
                            <label class="form-check-label small" for="radVender">Vender Meeting</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="radMeetingType" id="radProcurement" />
                            <label class="form-check-label small" for="radProcurement">Procurement Meeting</label>
                        </div>
                    </div>
                    <div class="d-flex gap-3 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <input class="form-check-input" type="radio" name="radMeetingType" id="radBoard" />
                            <label class="form-check-label small" for="radBoard">Board Meeting</label>
                        </div>
                    </div>
                </div>

            </div>

            <%-- Meetings Grid --%>
            <div class="table-responsive">
                <table class="table table-bordered table-sm mb-0" style="font-size:0.82rem;">
                    <thead style="background-color:#f8f9fa;">
                        <tr>
                            <th class="rounded-0 text-nowrap">Meeting Id</th>
                            <th class="rounded-0 text-nowrap">Meeting Final Time &amp; Date</th>
                            <th class="rounded-0 text-nowrap">Meeting Type</th>
                            <th class="rounded-0 text-nowrap">Meeting Called By</th>
                            <th class="rounded-0 text-nowrap">Meeting Final Location</th>
                            <th class="rounded-0">Remarks</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="fw-bold">2345</td>
                            <td class="text-nowrap fw-bold">Jan 01, 2016</td>
                            <td class="fw-bold">Board Meeting</td>
                            <td class="fw-bold">Asst Manager<br />Maintanance<br />Zaman Khan</td>
                            <td class="fw-bold">Company Premises Id</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>2346</td>
                            <td class="text-nowrap">Jan 01, 2016</td>
                            <td>Management Meeting</td>
                            <td>Asst Manager<br />Maintanance<br />Zaman Khan</td>
                            <td>Outdoor Address</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>2347</td>
                            <td class="text-nowrap">Jan 03, 2016</td>
                            <td>Sales Meeting</td>
                            <td>Asst Manager<br />ERP Tickets<br />Kaleem</td>
                            <td>Inter Company</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>2348</td>
                            <td class="text-nowrap">Jan 05, 2016</td>
                            <td>Vender Meeting</td>
                            <td>Asst Manager<br />D&amp;P D<br />Adnan Khan</td>
                            <td>Out Side Participants</td>
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

        var MM_COLS = ['_type', '_desig', '_name'];
        function showAdd3Col(id) {
            document.getElementById('addPanel_' + id).setAttribute('style', 'display:flex !important');
            MM_COLS.forEach(function (s) { document.getElementById('txtAdd_' + id + s).value = ''; });
            document.getElementById('btnAdd_' + id).disabled = true;
            document.getElementById('txtAdd_' + id + '_type').focus();
        }
        function checkAdd3Col(id) {
            var any = MM_COLS.some(function (s) {
                return document.getElementById('txtAdd_' + id + s).value.trim() !== '';
            });
            document.getElementById('btnAdd_' + id).disabled = !any;
        }
        function addItem3Col(id) {
            MM_COLS.forEach(function (s) {
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
