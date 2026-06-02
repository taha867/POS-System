<%@ Page Title="Meeting Management" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Meeting.aspx.vb" Inherits="POSSystem.Pages.Operations.Meeting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Heading + Toolbar --%>
    <div class="d-flex align-items-center gap-2 mb-2 px-3 py-2 border flex-wrap" style="background-color:#f8f9fa;">
        <strong class="fs-5 me-2">Meeting Management</strong>
        <asp:Button ID="BtnCreater" runat="server" Text="Creater" UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
        <asp:Button ID="BtnSave"    runat="server" Text="Save"    UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
        <asp:Button ID="BtnNew"     runat="server" Text="New"     UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
        <div class="ms-auto d-flex gap-2">
            <asp:Button ID="BtnDelete" runat="server" Text="Delete" UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
            <asp:Button ID="BtnEdit"   runat="server" Text="Edit"   UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
            <asp:Button ID="BtnPrint"  runat="server" Text="Print"  UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="return false;" />
        </div>
    </div>

    <style>
        .mm-tabs { display:flex; list-style:none; margin:0; padding:0; border-bottom:1px solid #dee2e6; flex-wrap:nowrap; overflow-x:auto; }
        .mm-tabs .mm-tab-btn { padding:0.25rem 0.55rem; cursor:pointer; background:#e9ecef; color:#495057; border:1px solid #dee2e6; border-bottom:none; margin-right:2px; font-size:0.78rem; white-space:nowrap; }
        .mm-tabs .mm-tab-btn.active { background:#6c757d; color:#fff; border-color:#6c757d; }
        .mm-tab-content { border:1px solid #dee2e6; border-top:none; }
        .mm-pane { display:none; padding:1rem; }
        .mm-pane.active { display:block; }
    </style>

    <%-- Tab Navigation --%>
    <ul class="mm-tabs" id="mmTabNav">
        <li><asp:Button runat="server" Text="Meeting Management"             UseSubmitBehavior="false" CssClass="mm-tab-btn active" OnClientClick="showTab('pane-meetingmgmt',this);      return false;" /></li>
        <li><asp:Button runat="server" Text="New Meeting"                    UseSubmitBehavior="false" CssClass="mm-tab-btn"        OnClientClick="showTab('pane-newmeeting',this);         return false;" /></li>
        <li><asp:Button runat="server" Text="Response on Meeting Invitation" UseSubmitBehavior="false" CssClass="mm-tab-btn"        OnClientClick="showTab('pane-responsemeeting',this);    return false;" /></li>
        <li><asp:Button runat="server" Text="Response on Meeting by Caller"  UseSubmitBehavior="false" CssClass="mm-tab-btn"        OnClientClick="showTab('pane-responsecaller',this);     return false;" /></li>
        <li><asp:Button runat="server" Text="Meeting String"                 UseSubmitBehavior="false" CssClass="mm-tab-btn"        OnClientClick="showTab('pane-meetingstring',this);      return false;" /></li>
        <li><asp:Button runat="server" Text="Meetings Status"                UseSubmitBehavior="false" CssClass="mm-tab-btn"        OnClientClick="showTab('pane-meetingsstatus',this);     return false;" /></li>
    </ul>

    <%-- Tab Content --%>
    <div class="mm-tab-content" id="mmTabContent">

        <%-- Meeting Management Tab --%>
        <div class="mm-pane active" id="pane-meetingmgmt">

            <div class="row g-0 mb-3" style="align-items:stretch;">
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
                        <asp:Button runat="server" UseSubmitBehavior="false" Text="+ Add New" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="showAddPanel('meetingtype'); return false;" />
                        <div id="addPanel_meetingtype" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                            <asp:TextBox ID="txtAdd_meetingtype" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" style="width:200px;"
                                   oninput="document.getElementById('btnAdd_meetingtype').disabled = this.value.trim() === '';" />
                            <asp:Button ID="btnAdd_meetingtype" runat="server" ClientIDMode="Static" UseSubmitBehavior="false" Enabled="false" Text="Add" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="addItem('meetingtype'); return false;" />
                            <a href="#" class="text-secondary small" onclick="hideAddPanel('meetingtype'); return false;">Cancel</a>
                        </div>
                    </div>
                </div>
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
                        <asp:Button runat="server" UseSubmitBehavior="false" Text="+ Add New" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="showAddPanel('meetingresponse'); return false;" />
                        <div id="addPanel_meetingresponse" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                            <asp:TextBox ID="txtAdd_meetingresponse" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" style="width:200px;"
                                   oninput="document.getElementById('btnAdd_meetingresponse').disabled = this.value.trim() === '';" />
                            <asp:Button ID="btnAdd_meetingresponse" runat="server" ClientIDMode="Static" UseSubmitBehavior="false" Enabled="false" Text="Add" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="addItem('meetingresponse'); return false;" />
                            <a href="#" class="text-secondary small" onclick="hideAddPanel('meetingresponse'); return false;">Cancel</a>
                        </div>
                    </div>
                </div>
            </div>

            <%-- Meeting Called By --%>
            <div class="border d-flex flex-column" style="height:270px; overflow:hidden;">
                <div class="px-3 py-2 border-bottom"><h6 class="fw-bold mb-0">Meeting Called By</h6></div>
                <div class="d-flex" style="flex:1; min-height:0;">
                    <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Type</div>
                        <ul id="list_calledby_type" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                            <li>Sales Meeting</li><li>Management Meeting</li><li>Board Meeting</li><li>Vendor Meeting</li>
                        </ul>
                    </div>
                    <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Designation</div>
                        <ul id="list_calledby_desig" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                            <li>Sales Manager</li><li>General Manager</li><li>Board Chairman</li><li>Procurement Manager</li>
                        </ul>
                    </div>
                    <div class="d-flex flex-column" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Name</div>
                        <ul id="list_calledby_name" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                            <li>Adnan Khan</li><li>Saleem Khan</li><li>Ahsaan Ahmed</li><li>Abdul Haq</li>
                        </ul>
                    </div>
                </div>
                <div class="border-top px-2 py-1">
                    <asp:Button runat="server" UseSubmitBehavior="false" Text="+ Add New" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="showAdd3Col('calledby'); return false;" />
                    <div id="addPanel_calledby" class="d-flex gap-2 align-items-center flex-wrap mt-1" style="display:none !important">
                        <asp:TextBox ID="txtAdd_calledby_type"  runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" placeholder="Type"        style="width:180px;" oninput="checkAdd3Col('calledby')" />
                        <asp:TextBox ID="txtAdd_calledby_desig" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" placeholder="Designation" style="width:180px;" oninput="checkAdd3Col('calledby')" />
                        <asp:TextBox ID="txtAdd_calledby_name"  runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" placeholder="Name"        style="width:180px;" oninput="checkAdd3Col('calledby')" />
                        <asp:Button ID="btnAdd_calledby" runat="server" ClientIDMode="Static" UseSubmitBehavior="false" Enabled="false" Text="Add" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="addItem3Col('calledby'); return false;" />
                        <a href="#" class="text-secondary small" onclick="hideAddPanel('calledby'); return false;">Cancel</a>
                    </div>
                </div>
            </div>

        </div>

        <%-- New Meeting Tab --%>
        <div class="mm-pane" id="pane-newmeeting">

            <div class="d-flex justify-content-end gap-4 mb-3">
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0" for="TxtNmMeetingId">Meeting Id:</label>
                    <asp:TextBox ID="TxtNmMeetingId" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:130px;" />
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0" for="TxtNmDate">Date:</label>
                    <asp:TextBox ID="TxtNmDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:130px;" placeholder="mm/dd/yyyy" />
                </div>
            </div>

            <div class="d-flex gap-4 mb-2 flex-wrap align-items-start">

                <div class="d-flex flex-column gap-1">
                    <div class="form-check mb-0">
                        <asp:CheckBox ID="ChkNmUrgent"    runat="server" ClientIDMode="Static" CssClass="form-check-input" />
                        <label class="form-check-label small" for="ChkNmUrgent">Urgent</label>
                    </div>
                    <div class="form-check mb-0">
                        <asp:CheckBox ID="ChkNmImportant" runat="server" ClientIDMode="Static" CssClass="form-check-input" Checked="true" />
                        <label class="form-check-label small" for="ChkNmImportant">Important</label>
                    </div>
                    <div class="form-check mb-0">
                        <asp:CheckBox ID="ChkNmRegular"   runat="server" ClientIDMode="Static" CssClass="form-check-input" />
                        <label class="form-check-label small" for="ChkNmRegular">Regular</label>
                    </div>
                    <div class="form-check mb-0">
                        <asp:CheckBox ID="ChkNmAll"       runat="server" ClientIDMode="Static" CssClass="form-check-input" />
                        <label class="form-check-label small" for="ChkNmAll">All</label>
                    </div>
                </div>

                <div class="d-flex flex-column gap-2">
                    <div class="d-flex gap-4 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="nmSingle"    runat="server" ClientIDMode="Static" GroupName="nmRecurrence" CssClass="form-check-input" Checked="true" />
                            <label class="form-check-label small" for="nmSingle">Single Meeting Event</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="nmRecurring" runat="server" ClientIDMode="Static" GroupName="nmRecurrence" CssClass="form-check-input" />
                            <label class="form-check-label small" for="nmRecurring">Raccuring Meetings</label>
                        </div>
                    </div>
                    <div class="d-flex gap-3 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="nmManagement"  runat="server" ClientIDMode="Static" GroupName="nmMeetingType" CssClass="form-check-input" />
                            <label class="form-check-label small" for="nmManagement">Management Meeting</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="nmGeneral"     runat="server" ClientIDMode="Static" GroupName="nmMeetingType" CssClass="form-check-input" />
                            <label class="form-check-label small" for="nmGeneral">Genral Meeting</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="nmProcurement" runat="server" ClientIDMode="Static" GroupName="nmMeetingType" CssClass="form-check-input" />
                            <label class="form-check-label small" for="nmProcurement">Procurement Meeting</label>
                        </div>
                    </div>
                    <div class="d-flex gap-3 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="nmSales"  runat="server" ClientIDMode="Static" GroupName="nmMeetingType" CssClass="form-check-input" />
                            <label class="form-check-label small" for="nmSales">Sales Meeting</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="nmVender" runat="server" ClientIDMode="Static" GroupName="nmMeetingType" CssClass="form-check-input" />
                            <label class="form-check-label small" for="nmVender">Vender Meeting</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="nmBoard"  runat="server" ClientIDMode="Static" GroupName="nmMeetingType" CssClass="form-check-input" />
                            <label class="form-check-label small" for="nmBoard">Board Meeting</label>
                        </div>
                    </div>
                </div>

            </div>

            <div class="border p-2 mb-3" style="font-size:0.83rem;">
                <span class="fw-semibold small">Raccuring Meetings</span>
                <div class="mt-2 d-flex flex-column gap-1">
                    <div class="d-flex gap-4 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="nmEveryDay"   runat="server" ClientIDMode="Static" GroupName="nmFrequency" CssClass="form-check-input" Checked="true" />
                            <label class="form-check-label small" for="nmEveryDay">Every Day</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="nmEveryWeek"  runat="server" ClientIDMode="Static" GroupName="nmFrequency" CssClass="form-check-input" />
                            <label class="form-check-label small" for="nmEveryWeek">Every Week</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="nmEveryMonth" runat="server" ClientIDMode="Static" GroupName="nmFrequency" CssClass="form-check-input" />
                            <label class="form-check-label small" for="nmEveryMonth">Every Month</label>
                        </div>
                    </div>
                    <div class="d-flex gap-4 flex-wrap align-items-center">
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="nmEveryMonday" runat="server" ClientIDMode="Static" GroupName="nmFrequency" CssClass="form-check-input" />
                            <label class="form-check-label small" for="nmEveryMonday">Every Monday</label>
                        </div>
                        <span class="small text-muted">- - - - - - - - - - - - - - -</span>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="nmEverySunday" runat="server" ClientIDMode="Static" GroupName="nmFrequency" CssClass="form-check-input" />
                            <label class="form-check-label small" for="nmEverySunday">Every Sunday</label>
                        </div>
                    </div>
                    <div class="d-flex gap-4 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="nmFirstWeek" runat="server" ClientIDMode="Static" GroupName="nmFrequency" CssClass="form-check-input" />
                            <label class="form-check-label small" for="nmFirstWeek">First Day of the Week</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="nmLastWeek"  runat="server" ClientIDMode="Static" GroupName="nmFrequency" CssClass="form-check-input" />
                            <label class="form-check-label small" for="nmLastWeek">Last Day of the Week</label>
                        </div>
                    </div>
                    <div class="d-flex gap-4 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="nmFirstMonth" runat="server" ClientIDMode="Static" GroupName="nmFrequency" CssClass="form-check-input" />
                            <label class="form-check-label small" for="nmFirstMonth">First Day of the Month</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="nmLastMonth"  runat="server" ClientIDMode="Static" GroupName="nmFrequency" CssClass="form-check-input" />
                            <label class="form-check-label small" for="nmLastMonth">Last Day of the Month</label>
                        </div>
                    </div>
                    <div class="d-flex gap-4 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="nmFirstYear" runat="server" ClientIDMode="Static" GroupName="nmFrequency" CssClass="form-check-input" />
                            <label class="form-check-label small" for="nmFirstYear">First Day of the Year</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="nmLastYear"  runat="server" ClientIDMode="Static" GroupName="nmFrequency" CssClass="form-check-input" />
                            <label class="form-check-label small" for="nmLastYear">Last Day of the Yeay</label>
                        </div>
                    </div>
                </div>
            </div>

            <div class="border p-2 mb-3" style="font-size:0.83rem;">
                <div class="d-flex align-items-center gap-2 mb-2 flex-wrap">
                    <span class="fw-semibold">Meeting Proposed Time</span>
                    <asp:TextBox ID="TxtNmPropTime" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" />
                    <asp:TextBox ID="TxtNmPropDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
                </div>
                <div class="d-flex align-items-center gap-2 flex-wrap">
                    <span class="fw-semibold">Meeting Proposed Venue</span>
                    <label class="small mb-0">Location ID</label>
                    <asp:TextBox ID="TxtNmLocationId"       runat="server" CssClass="form-control form-control-sm rounded-0" style="width:100px;" />
                    <label class="small mb-0">Outdoor Premises</label>
                    <asp:TextBox ID="TxtNmOutdoorPremises"  runat="server" CssClass="form-control form-control-sm rounded-0" style="width:130px;" />
                    <label class="small mb-0">Address</label>
                    <asp:TextBox ID="TxtNmAddress"          runat="server" CssClass="form-control form-control-sm rounded-0 flex-grow-1" />
                </div>
            </div>

            <div class="border p-2 mb-3" style="font-size:0.83rem;">
                <div class="row g-1 mb-2 align-items-center">
                    <div class="col-auto" style="min-width:130px;"><span class="fw-semibold">Participants</span></div>
                    <div class="col">
                        <div class="row g-1 align-items-center">
                            <div class="col-auto"><label class="small mb-0">Designation</label></div>
                            <div class="col"><asp:TextBox ID="TxtNmDesig"   runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Name</label></div>
                            <div class="col"><asp:TextBox ID="TxtNmName"    runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Department</label></div>
                            <div class="col"><asp:TextBox ID="TxtNmDept"    runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Company</label></div>
                            <div class="col"><asp:TextBox ID="TxtNmCompany" runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                        </div>
                    </div>
                </div>
                <div class="row g-1 align-items-center">
                    <div class="col-auto" style="min-width:130px;"><span class="fw-semibold">Outside Participants</span></div>
                    <div class="col">
                        <div class="row g-1 align-items-center">
                            <div class="col-auto"><label class="small mb-0">Company</label></div>
                            <div class="col"><asp:TextBox ID="TxtNmOutsideCompany" runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Name</label></div>
                            <div class="col"><asp:TextBox ID="TxtNmOutsideName"    runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Relation</label></div>
                            <div class="col"><asp:TextBox ID="TxtNmRelation"       runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">e-mail</label></div>
                            <div class="col"><asp:TextBox ID="TxtNmEmail"          runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row g-2 align-items-start">
                <div class="col-auto"><label class="small fw-semibold mb-0 mt-1">Meeting Agenda &amp; Details:</label></div>
                <div class="col"><asp:TextBox ID="TxtNmAgenda" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="4" style="resize:vertical; width:100%;" /></div>
            </div>

        </div>

        <%-- Response on Meeting Invitation Tab --%>
        <div class="mm-pane" id="pane-responsemeeting">

            <div class="d-flex justify-content-end gap-4 mb-3 flex-wrap">
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0" for="TxtRmiMeetingId">Meeting ID:</label>
                    <asp:TextBox ID="TxtRmiMeetingId" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:130px;" />
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0">Date:</label>
                    <span class="small">Jan 01-2026</span>
                </div>
            </div>

            <div class="border p-2 mb-3" style="background-color:#f8f9fa; font-size:0.83rem;">
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Meeting ID:</span></div>
                    <div class="col-auto"><asp:TextBox ID="TxtRmiMeetingIdInfo" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Assigned To:</span></div>
                    <div class="col"><asp:TextBox ID="TxtRmiAssignedTo"         runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-2 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Type of Meeting:</span></div>
                    <div class="col-auto"><asp:TextBox ID="TxtRmiTypeOfMeeting" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Venue:</span></div>
                    <div class="col"><asp:TextBox ID="TxtRmiVenue"              runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto" style="min-width:130px;"><span class="fw-semibold">List of Participants</span></div>
                    <div class="col">
                        <div class="row g-1 mb-1 align-items-center">
                            <div class="col-auto"><label class="small mb-0">Name</label></div>
                            <div class="col"><asp:TextBox ID="TxtRmiP1Name"   runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Designation</label></div>
                            <div class="col"><asp:TextBox ID="TxtRmiP1Desig"  runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Organization</label></div>
                            <div class="col"><asp:TextBox ID="TxtRmiP1Org"    runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                        </div>
                        <div class="row g-1 mb-1 align-items-center">
                            <div class="col-auto"><label class="small mb-0">Name</label></div>
                            <div class="col"><asp:TextBox ID="TxtRmiP2Name"   runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Designation</label></div>
                            <div class="col"><asp:TextBox ID="TxtRmiP2Desig"  runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Organization</label></div>
                            <div class="col"><asp:TextBox ID="TxtRmiP2Org"    runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                        </div>
                        <div class="row g-1 align-items-center">
                            <div class="col-auto"><label class="small mb-0">Name</label></div>
                            <div class="col"><asp:TextBox ID="TxtRmiP3Name"   runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Designation</label></div>
                            <div class="col"><asp:TextBox ID="TxtRmiP3Desig"  runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                        </div>
                    </div>
                </div>
                <div class="row g-1 align-items-center">
                    <div class="col-auto" style="min-width:130px;"><span class="fw-semibold">Organization</span></div>
                    <div class="col"><asp:TextBox ID="TxtRmiOrg" runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                </div>
            </div>

            <div class="border p-2" style="font-size:0.83rem;">
                <h6 class="fw-bold mb-3">Actions</h6>

                <%-- Response by In House Receiver --%>
                <div class="row g-0 mb-3">
                    <div class="col-auto pe-3 pt-1" style="min-width:150px;"><span class="small fw-semibold">Response<br />by In House<br />Receiver</span></div>
                    <div class="col d-flex flex-column gap-2">
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <asp:RadioButton ID="ih1" runat="server" ClientIDMode="Static" GroupName="inHouseResponse" CssClass="form-check-input" Checked="true" />
                                <label class="form-check-label small" for="ih1">Confirm</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtIh1Time" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtIh1Date" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <asp:RadioButton ID="ih2" runat="server" ClientIDMode="Static" GroupName="inHouseResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="ih2">Please change Venue</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtIh2Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtIh2Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtIh2Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <asp:RadioButton ID="ih3" runat="server" ClientIDMode="Static" GroupName="inHouseResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="ih3">Please Deffer Until</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtIh3Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtIh3Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtIh3Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <asp:RadioButton ID="ih4" runat="server" ClientIDMode="Static" GroupName="inHouseResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="ih4">I am Unavailabe</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtIh4Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtIh4Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtIh4Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                    </div>
                </div>

                <hr class="my-2" />

                <%-- Response by Outside Participant --%>
                <div class="row g-0 mb-3">
                    <div class="col-auto pe-3 pt-1" style="min-width:150px;"><span class="small fw-semibold">Response<br />by Outside<br />Participant</span></div>
                    <div class="col d-flex flex-column gap-2">
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <asp:RadioButton ID="out1" runat="server" ClientIDMode="Static" GroupName="outsideResponse" CssClass="form-check-input" Checked="true" />
                                <label class="form-check-label small" for="out1">Confirmed by Email</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtOut1Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtOut1Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtOut1Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <asp:RadioButton ID="out2" runat="server" ClientIDMode="Static" GroupName="outsideResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="out2">Deffer requested</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtOut2Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtOut2Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtOut2Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <asp:RadioButton ID="out3" runat="server" ClientIDMode="Static" GroupName="outsideResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="out3">Please change Venue</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtOut3Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtOut3Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtOut3Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                    </div>
                </div>

                <hr class="my-2" />

                <%-- Final Confirmation --%>
                <div class="row g-0">
                    <div class="col-auto pe-3 pt-1" style="min-width:150px;"><span class="small fw-semibold">Final<br />Confirmation</span></div>
                    <div class="col d-flex flex-column gap-2">
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <asp:RadioButton ID="fc1" runat="server" ClientIDMode="Static" GroupName="finalConfirmation" CssClass="form-check-input" Checked="true" />
                                <label class="form-check-label small" for="fc1">Rescheduled</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtFc1Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtFc1Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtFc1Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <asp:RadioButton ID="fc2" runat="server" ClientIDMode="Static" GroupName="finalConfirmation" CssClass="form-check-input" />
                                <label class="form-check-label small" for="fc2">New Venue</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtFc2Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtFc2Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtFc2Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap mt-1">
                            <span class="small fw-semibold" style="min-width:120px;">Date, Time &amp; Venue</span>
                            <label class="small mb-0">Final Time</label>
                            <asp:TextBox ID="TxtFcFinalTime"  runat="server" CssClass="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtFcFinalDate"  runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Venue</label>
                            <asp:TextBox ID="TxtFcFinalVenue" runat="server" CssClass="form-control form-control-sm rounded-0 flex-grow-1" />
                        </div>
                    </div>
                </div>

            </div>

            <div class="row g-2 justify-content-end mt-3">
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Upload Outside Participant's email response</span>
                        <asp:FileUpload ID="FuRmiAttach" runat="server" CssClass="form-control form-control-sm rounded-0" style="font-size:0.8rem;" />
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Note</span>
                        <asp:TextBox ID="TxtRmiNote" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="2" style="flex:1; resize:none;" />
                    </div>
                </div>
            </div>

        </div>

        <%-- Response on Meeting by Caller Tab --%>
        <div class="mm-pane" id="pane-responsecaller">

            <div class="d-flex justify-content-end gap-4 mb-3 flex-wrap">
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0" for="TxtRmcMeetingId">Meeting ID:</label>
                    <asp:TextBox ID="TxtRmcMeetingId" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:130px;" />
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0">Date:</label>
                    <span class="small">Jan 01-2026</span>
                </div>
            </div>

            <div class="border p-2 mb-3" style="background-color:#f8f9fa; font-size:0.83rem;">
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Meeting ID:</span></div>
                    <div class="col-auto"><asp:TextBox ID="TxtRmcMeetingIdInfo"  runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Called By:</span></div>
                    <div class="col"><asp:TextBox ID="TxtRmcCalledBy"             runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-2 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Type of Meeting:</span></div>
                    <div class="col-auto"><asp:TextBox ID="TxtRmcTypeOfMeeting"   runat="server" CssClass="form-control form-control-sm rounded-0" style="width:160px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Time</span></div>
                    <div class="col-auto"><asp:TextBox ID="TxtRmcTime"            runat="server" CssClass="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" /></div>
                    <div class="col-auto"><span class="fw-semibold">Date</span></div>
                    <div class="col-auto"><asp:TextBox ID="TxtRmcDate"            runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" /></div>
                    <div class="col-auto ms-2"><span class="fw-semibold">Venue</span></div>
                    <div class="col"><asp:TextBox ID="TxtRmcVenue"                runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto" style="min-width:130px;"><span class="fw-semibold">List of Participants</span></div>
                    <div class="col">
                        <div class="row g-1 mb-1 align-items-center">
                            <div class="col-auto"><label class="small mb-0">Name</label></div>
                            <div class="col"><asp:TextBox ID="TxtRmcP1Name"  runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Designation</label></div>
                            <div class="col"><asp:TextBox ID="TxtRmcP1Desig" runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Organization</label></div>
                            <div class="col"><asp:TextBox ID="TxtRmcP1Org"   runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                        </div>
                        <div class="row g-1 mb-1 align-items-center">
                            <div class="col-auto"><label class="small mb-0">Name</label></div>
                            <div class="col"><asp:TextBox ID="TxtRmcP2Name"  runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Designation</label></div>
                            <div class="col"><asp:TextBox ID="TxtRmcP2Desig" runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Organization</label></div>
                            <div class="col"><asp:TextBox ID="TxtRmcP2Org"   runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                        </div>
                        <div class="row g-1 align-items-center">
                            <div class="col-auto"><label class="small mb-0">Name</label></div>
                            <div class="col"><asp:TextBox ID="TxtRmcP3Name"  runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                            <div class="col-auto"><label class="small mb-0">Designation</label></div>
                            <div class="col"><asp:TextBox ID="TxtRmcP3Desig" runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                        </div>
                    </div>
                </div>
                <div class="row g-1 align-items-center">
                    <div class="col-auto" style="min-width:130px;"><span class="fw-semibold">Organization</span></div>
                    <div class="col"><asp:TextBox ID="TxtRmcOrg" runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                </div>
            </div>

            <div class="border p-2" style="font-size:0.83rem;">
                <h6 class="fw-bold mb-3">Actions</h6>
                <div class="row g-0">
                    <div class="col-auto pe-3 pt-1" style="min-width:160px;"><span class="small fw-semibold">Closing Action or<br />Ammendements<br />by Meeting<br />Caller</span></div>
                    <div class="col d-flex flex-column gap-2">
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <asp:RadioButton ID="ca1" runat="server" ClientIDMode="Static" GroupName="callerAction" CssClass="form-check-input" Checked="true" />
                                <label class="form-check-label small" for="ca1">Rescheduled</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtCa1Time" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtCa1Date" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <asp:RadioButton ID="ca2" runat="server" ClientIDMode="Static" GroupName="callerAction" CssClass="form-check-input" />
                                <label class="form-check-label small" for="ca2">New changed Venue</label>
                            </div>
                            <label class="small mb-0">Location Id</label>
                            <asp:TextBox ID="TxtCa2LocationId" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:90px;" />
                            <label class="small mb-0">Address</label>
                            <asp:TextBox ID="TxtCa2Address"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:140px;" />
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtCa2Remarks"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:160px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <asp:RadioButton ID="ca3" runat="server" ClientIDMode="Static" GroupName="callerAction" CssClass="form-check-input" />
                                <label class="form-check-label small" for="ca3">Add Participants</label>
                            </div>
                            <label class="small mb-0">Name</label>
                            <asp:TextBox ID="TxtCa3Name"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" />
                            <label class="small mb-0">Company</label>
                            <asp:TextBox ID="TxtCa3Company" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" />
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtCa3Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:160px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <asp:RadioButton ID="ca4" runat="server" ClientIDMode="Static" GroupName="callerAction" CssClass="form-check-input" />
                                <label class="form-check-label small" for="ca4">Drop Participants</label>
                            </div>
                            <label class="small mb-0">Name</label>
                            <asp:TextBox ID="TxtCa4Name"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" />
                            <label class="small mb-0">Company</label>
                            <asp:TextBox ID="TxtCa4Company" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" />
                            <label class="small mb-0">email</label>
                            <asp:TextBox ID="TxtCa4Email"   runat="server" CssClass="form-control form-control-sm rounded-0" style="width:130px;" />
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtCa4Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:130px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <asp:RadioButton ID="ca5" runat="server" ClientIDMode="Static" GroupName="callerAction" CssClass="form-check-input" />
                                <label class="form-check-label small" for="ca5">Un Finished &amp; Rescheduled</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtCa5Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Venue Id</label>
                            <asp:TextBox ID="TxtCa5VenueId" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:100px;" />
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtCa5Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:160px;" />
                        </div>
                        <div class="d-flex align-items-center gap-2 flex-wrap">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <asp:RadioButton ID="ca6" runat="server" ClientIDMode="Static" GroupName="callerAction" CssClass="form-check-input" />
                                <label class="form-check-label small" for="ca6">Closed &amp; Finished</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtCa6Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtCa6Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtCa6Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:160px;" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="row g-2 justify-content-end mt-3">
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Upload Miniutes &amp; Picture (PDF)</span>
                        <asp:FileUpload ID="FuRmcAttach" runat="server" CssClass="form-control form-control-sm rounded-0" style="font-size:0.8rem;" />
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Note</span>
                        <asp:TextBox ID="TxtRmcNote" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="2" style="flex:1; resize:none;" />
                    </div>
                </div>
            </div>

        </div>

        <%-- Meeting String Tab --%>
        <div class="mm-pane" id="pane-meetingstring">

            <div class="d-flex justify-content-end gap-4 mb-3 flex-wrap">
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0" for="DdlMsMeetingName">Select Meeting Name</label>
                    <asp:DropDownList ID="DdlMsMeetingName" runat="server" CssClass="form-select form-select-sm rounded-0" style="width:180px;">
                        <asp:ListItem Value="">-- Select --</asp:ListItem>
                        <asp:ListItem>Sales Meeting</asp:ListItem>
                        <asp:ListItem>Management Meeting</asp:ListItem>
                        <asp:ListItem>Board Meeting</asp:ListItem>
                        <asp:ListItem>Vendor Meeting</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0">Date:</label>
                    <span class="small">Jan 01-2026</span>
                </div>
            </div>

            <div class="border p-2 mb-3" style="background-color:#f8f9fa; font-size:0.83rem;">
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Meeting ID:</span></div>
                    <div class="col-auto"><asp:TextBox ID="TxtMsMeetingId"        runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Assigned To:</span></div>
                    <div class="col"><asp:TextBox ID="TxtMsAssignedTo"             runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Field Assignment To:</span></div>
                    <div class="col"><asp:TextBox ID="TxtMsFieldAssignment"        runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Type of Meeting:</span></div>
                    <div class="col-auto"><asp:TextBox ID="TxtMsTypeOfMeeting"     runat="server" CssClass="form-control form-control-sm rounded-0" style="width:200px;" /></div>
                    <div class="col-auto ms-3"><span class="fw-semibold">Meeting Name:</span></div>
                    <div class="col"><asp:TextBox ID="TxtMsMeetingName"            runat="server" CssClass="form-control form-control-sm rounded-0" /></div>
                </div>
                <div class="row g-1 mb-1 align-items-center">
                    <div class="col-auto"><span class="fw-semibold">Meeting Closing Target Time &amp; Date:</span></div>
                    <div class="col-auto"><asp:TextBox ID="TxtMsTargetTime"        runat="server" CssClass="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" /></div>
                    <div class="col-auto"><asp:TextBox ID="TxtMsTargetDate"        runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" /></div>
                </div>
                <div class="row g-1 align-items-start">
                    <div class="col-auto"><span class="fw-semibold">Remarks &amp; Details:</span></div>
                    <div class="col"><asp:TextBox ID="TxtMsDetails" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="2" style="resize:vertical; width:100%;" /></div>
                </div>
            </div>

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
                        <tr><td class="text-nowrap">12:34 Pm</td><td class="text-nowrap">Jan 01, 2026</td><td>Created</td><td>-</td><td>Created</td></tr>
                        <tr><td class="text-nowrap">12:39 Pm</td><td class="text-nowrap">Jan 01, 2026</td><td>Responsed</td><td>Meeting Accepted</td><td>-</td></tr>
                        <tr><td class="text-nowrap">3:05 Pm</td><td class="text-nowrap">Jan 01, 2026</td><td>Delayed</td><td>Changed Meeting Time</td><td>-</td></tr>
                        <tr><td class="text-nowrap">4:10 Pm</td><td class="text-nowrap">Jan 01, 2026</td><td>Delay Accepted</td><td>-</td><td>Delay Accepted</td></tr>
                        <tr><td class="text-nowrap">10:19 Am</td><td class="text-nowrap">Jan 02, 2026</td><td>Meeting Finished</td><td>Meeting Finished Submitted</td><td>-</td></tr>
                        <tr><td class="text-nowrap">11:10 Am</td><td class="text-nowrap">Jan 02, 2026</td><td>Meeting Finished Accepted</td><td>-</td><td>Meeting Closed</td></tr>
                    </tbody>
                </table>
            </div>

            <div class="row g-2 justify-content-end mt-3">
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Attached File / Picture</span>
                        <asp:FileUpload ID="FuMsAttach" runat="server" CssClass="form-control form-control-sm rounded-0" style="font-size:0.8rem;" />
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Note</span>
                        <asp:TextBox ID="TxtMsNote" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="2" style="flex:1; resize:none;" />
                    </div>
                </div>
            </div>

        </div>

        <%-- Meetings Status Tab --%>
        <div class="mm-pane" id="pane-meetingsstatus">

            <div class="d-flex gap-4 mb-2 pb-2 border-bottom flex-wrap align-items-start">

                <div class="d-flex flex-column gap-1">
                    <div class="form-check mb-0">
                        <asp:CheckBox ID="ChkMsUrgent"    runat="server" ClientIDMode="Static" CssClass="form-check-input" />
                        <label class="form-check-label small" for="ChkMsUrgent">Urgent</label>
                    </div>
                    <div class="form-check mb-0">
                        <asp:CheckBox ID="ChkMsImportant" runat="server" ClientIDMode="Static" CssClass="form-check-input" Checked="true" />
                        <label class="form-check-label small" for="ChkMsImportant">Important</label>
                    </div>
                    <div class="form-check mb-0">
                        <asp:CheckBox ID="ChkMsRegular"   runat="server" ClientIDMode="Static" CssClass="form-check-input" />
                        <label class="form-check-label small" for="ChkMsRegular">Regular</label>
                    </div>
                    <div class="form-check mb-0">
                        <asp:CheckBox ID="ChkMsAll"       runat="server" ClientIDMode="Static" CssClass="form-check-input" />
                        <label class="form-check-label small" for="ChkMsAll">All</label>
                    </div>
                </div>

                <div class="d-flex flex-column gap-2">
                    <div class="d-flex gap-4 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="radMsSingle"    runat="server" ClientIDMode="Static" GroupName="radMsRecurrence" CssClass="form-check-input" Checked="true" />
                            <label class="form-check-label small" for="radMsSingle">Single Meeting Event</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="radMsRecurring" runat="server" ClientIDMode="Static" GroupName="radMsRecurrence" CssClass="form-check-input" />
                            <label class="form-check-label small" for="radMsRecurring">Raccuring Meetings</label>
                        </div>
                    </div>
                    <div class="d-flex gap-3 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="radMsAllMeetings"  runat="server" ClientIDMode="Static" GroupName="radMsMeetingType" CssClass="form-check-input" Checked="true" />
                            <label class="form-check-label small" for="radMsAllMeetings">All Meetings</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="radMsManagement"   runat="server" ClientIDMode="Static" GroupName="radMsMeetingType" CssClass="form-check-input" />
                            <label class="form-check-label small" for="radMsManagement">Management Meeting</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="radMsGeneral"      runat="server" ClientIDMode="Static" GroupName="radMsMeetingType" CssClass="form-check-input" />
                            <label class="form-check-label small" for="radMsGeneral">Genral Meeting</label>
                        </div>
                    </div>
                    <div class="d-flex gap-3 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="radMsSales"       runat="server" ClientIDMode="Static" GroupName="radMsMeetingType" CssClass="form-check-input" />
                            <label class="form-check-label small" for="radMsSales">Sales Meeting</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="radMsVender"      runat="server" ClientIDMode="Static" GroupName="radMsMeetingType" CssClass="form-check-input" />
                            <label class="form-check-label small" for="radMsVender">Vender Meeting</label>
                        </div>
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="radMsProcurement" runat="server" ClientIDMode="Static" GroupName="radMsMeetingType" CssClass="form-check-input" />
                            <label class="form-check-label small" for="radMsProcurement">Procurement Meeting</label>
                        </div>
                    </div>
                    <div class="d-flex gap-3 flex-wrap">
                        <div class="form-check form-check-inline mb-0">
                            <asp:RadioButton ID="radMsBoard" runat="server" ClientIDMode="Static" GroupName="radMsMeetingType" CssClass="form-check-input" />
                            <label class="form-check-label small" for="radMsBoard">Board Meeting</label>
                        </div>
                    </div>
                </div>

            </div>

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
                            <td class="fw-bold">2345</td><td class="text-nowrap fw-bold">Jan 01, 2016</td>
                            <td class="fw-bold">Board Meeting</td>
                            <td class="fw-bold">Asst Manager<br />Maintanance<br />Zaman Khan</td>
                            <td class="fw-bold">Company Premises Id</td><td></td>
                        </tr>
                        <tr>
                            <td>2346</td><td class="text-nowrap">Jan 01, 2016</td>
                            <td>Management Meeting</td>
                            <td>Asst Manager<br />Maintanance<br />Zaman Khan</td>
                            <td>Outdoor Address</td><td></td>
                        </tr>
                        <tr>
                            <td>2347</td><td class="text-nowrap">Jan 03, 2016</td>
                            <td>Sales Meeting</td>
                            <td>Asst Manager<br />ERP Tickets<br />Kaleem</td>
                            <td>Inter Company</td><td></td>
                        </tr>
                        <tr>
                            <td>2348</td><td class="text-nowrap">Jan 05, 2016</td>
                            <td>Vender Meeting</td>
                            <td>Asst Manager<br />D&amp;P D<br />Adnan Khan</td>
                            <td>Out Side Participants</td><td></td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>

    </div>

    <script type="text/javascript">
        function showTab(paneid, clickedBtn) {
            var panes = document.querySelectorAll('#mmTabContent .mm-pane');
            for (var i = 0; i < panes.length; i++) { panes[i].classList.remove('active'); }
            var btns = document.querySelectorAll('#mmTabNav .mm-tab-btn');
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
