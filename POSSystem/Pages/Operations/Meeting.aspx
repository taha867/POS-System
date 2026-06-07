<%@ Page Title="Meeting Management" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Meeting.aspx.vb" Inherits="POSSystem.Pages.Operations.Meeting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .meeting-form { background:#f2f2f2; font-family:Arial,sans-serif; padding:0 0 12px; }
        .meeting-form label,
        .meeting-form span,
        .meeting-form .fw-semibold,
        .meeting-form .fw-bold { font-style:italic; }
        .mm-header { background:#d9d9d9; border:1px solid #555; min-height:76px; }
        .mm-title { color:#666; font-size:2rem; font-style:italic; font-weight:700; line-height:1; }
        .mm-toolbar { gap:14px; padding:0 8px; }
        .mm-command-btn { color:#002d62; font-size:10px; font-weight:700; height:46px; line-height:1.1; white-space:normal; width:74px; }
        .mm-tabs { display:flex; list-style:none; margin:20px 0 0; padding:0; flex-wrap:nowrap; overflow-x:auto; }
        .mm-tabs .mm-tab-btn {
            background:#a8a8a8; border:2px solid #000; border-bottom:none; color:#111; cursor:pointer;
            font-size:14px; font-style:italic; font-weight:700; height:86px; line-height:1.15; margin:0 4px 0 0;
            min-width:190px; padding:0 18px; white-space:normal;
        }
        .mm-tabs .mm-tab-btn.active { background:#b0b0b0; color:#111; border-color:#000; }
        .mm-tab-content { background:#f2f2f2; border:2px solid #000; min-height:520px; }
        .mm-pane { display:none; padding:28px 30px 34px; }
        .mm-pane.active { display:block; }
        .meeting-form .form-control,
        .meeting-form .form-select { border-color:#555; border-radius:0 !important; font-size:12px; font-style:italic; max-width:none; }
        .meeting-form .table { border-color:#000; }
        .meeting-form .table th { background:#c9c9c9; border-color:#000; font-style:italic; text-align:center; vertical-align:middle; }
        .meeting-form .table td { border-color:#000; vertical-align:top; }
        .meeting-form .border,
        .meeting-form .border-top,
        .meeting-form .border-bottom,
        .meeting-form .border-end { border-color:#000 !important; }
        .mm-mgmt-panel {
            display:flex;
            flex-direction:column;
            height:220px;
            min-width:0;
            overflow:hidden;
        }
        .mm-mgmt-panel-head {
            align-items:center;
            display:flex;
            gap:10px;
            justify-content:space-between;
            min-height:28px;
        }
        .mm-mgmt-panel h6,
        .mm-mgmt-wide-panel h6 { color:#222; font-size:14px; line-height:1.15; margin:0; }
        .mm-mgmt-add-btn { font-size:10px; font-weight:700; height:26px; min-width:74px; padding:2px 8px; }
        .mm-mgmt-table {
            background:#fff;
            border:1px solid #777;
            display:flex;
            flex:1;
            flex-direction:column;
            min-height:0;
            overflow:hidden;
        }
        .mm-mgmt-table-head {
            background:#555;
            color:#fff;
            display:grid;
            font-size:12px;
            font-style:normal;
            font-weight:700;
            grid-template-columns:1fr 32px;
            min-height:30px;
        }
        .mm-mgmt-table-head span { align-items:center; display:flex; font-style:normal; padding:0 8px; }
        .mm-mgmt-list { flex:1; margin:0; min-height:0; overflow-y:auto; }
        .mm-mgmt-list li {
            align-items:center;
            border-bottom:1px solid #d6d6d6;
            cursor:default;
            display:grid;
            font-size:12px;
            grid-template-columns:1fr 32px;
            min-height:30px;
            padding-left:8px;
        }
        .mm-mgmt-list li::after {
            align-items:center;
            border-left:1px solid #d6d6d6;
            color:#a34d4d;
            content:"x";
            cursor:pointer;
            display:flex;
            font-size:16px;
            justify-content:center;
        }
        .mm-mgmt-wide-panel { background:#f2f2f2; }
        .mm-mgmt-wide-head {
            align-items:center;
            border-bottom:1px solid #777;
            display:flex;
            min-height:36px;
            padding:6px 12px;
        }
        .mm-mgmt-wide-body { background:#fff; }
        .mm-mgmt-column-head {
            background:#555 !important;
            color:#fff;
            font-size:12px;
            font-style:normal;
        }
        .mm-mgmt-column-list {
            background:#fff;
            flex:1;
            margin:0;
            min-height:0;
            overflow-y:auto;
            padding:0 !important;
        }
        .mm-mgmt-column-list li {
            align-items:center;
            border-bottom:1px solid #d6d6d6;
            cursor:default;
            display:grid;
            font-size:12px;
            grid-template-columns:1fr 32px;
            min-height:30px;
            padding-left:8px;
        }
        .mm-mgmt-column-list li::after {
            align-items:center;
            border-left:1px solid #d6d6d6;
            color:#a34d4d;
            content:"x";
            cursor:pointer;
            display:flex;
            font-size:16px;
            justify-content:center;
        }
        .mm-mgmt-wide-add { background:#f2f2f2; border-top:1px solid #777; }
        .mm-mgmt-add-panel { min-height:32px; }
        .meeting-form #TxtNmAddress,
        .meeting-form #TxtNmAgenda,
        .meeting-form #TxtRmiNote,
        .meeting-form #TxtRmcNote,
        .meeting-form #TxtMsDetails,
        .meeting-form #TxtMsNote { width:100% !important; }
        .meeting-form [id*="Remarks"] { min-width:180px; }
        .mm-rmc-info { background-color:#f8f9fa; font-size:0.83rem; overflow:hidden; padding:12px !important; }
        .mm-rmc-main-grid {
            align-items:center;
            column-gap:10px;
            display:grid;
            grid-template-columns:125px minmax(120px, 180px) 95px minmax(220px, 1fr);
            row-gap:8px;
        }
        .mm-rmc-detail-grid {
            align-items:center;
            column-gap:10px;
            display:grid;
            grid-template-columns:125px minmax(130px, 240px) 45px minmax(80px, 120px) 45px minmax(110px, 150px) 55px minmax(180px, 1fr);
            margin-top:8px;
            row-gap:8px;
        }
        .mm-rmc-participant-grid {
            align-items:center;
            column-gap:10px;
            display:grid;
            grid-template-columns:210px 55px minmax(140px, 1fr) 85px minmax(140px, 1fr) 95px minmax(140px, 1fr);
            margin-top:12px;
            row-gap:8px;
        }
        .mm-rmc-info label,
        .mm-rmc-info span { white-space:nowrap; }
        .mm-rmc-info .form-control { height:34px; width:100% !important; }
        .mm-rmc-org-row { margin-top:8px; }
        .mm-rmc-actions { font-size:0.83rem; overflow:hidden; }
        .mm-rmc-action-row {
            align-items:center;
            column-gap:10px;
            display:grid;
            grid-template-columns:minmax(210px, 260px) 80px minmax(80px, 120px) 75px minmax(105px, 150px) 80px minmax(130px, 1fr);
            margin-bottom:8px;
            row-gap:6px;
        }
        .mm-rmc-action-row:last-child { margin-bottom:0; }
        .mm-rmc-action-row > * { min-width:0; }
        .mm-rmc-action-row .form-check { min-width:0 !important; }
        .mm-rmc-action-row label { margin-bottom:0; white-space:nowrap; }
        .mm-rmc-action-row .form-control { height:34px; width:100% !important; }
        .mm-rmc-action-row [id*="Remarks"] { min-width:0; }
        .mm-rmc-action-wide {
            grid-template-columns:minmax(210px, 260px) 55px minmax(90px, 1fr) 75px minmax(90px, 1fr) 45px minmax(90px, 1fr) 75px minmax(90px, 1fr);
        }
        .mm-nm-info { background-color:#f8f9fa; font-size:0.83rem; overflow:hidden; }
        .mm-nm-info label,
        .mm-nm-info span { white-space:nowrap; }
        .mm-nm-info .form-control { height:34px; width:100% !important; }
        .mm-nm-options {
            align-items:start;
            column-gap:34px;
            display:grid;
            grid-template-columns:180px minmax(0, 1fr);
            margin-bottom:12px;
        }
        .mm-nm-priority-grid,
        .mm-nm-type-grid,
        .mm-nm-frequency-grid {
            align-items:center;
            display:grid;
            row-gap:12px;
        }
        .mm-nm-priority-grid { grid-template-columns:1fr; }
        .mm-nm-type-grid {
            column-gap:34px;
            grid-template-columns:minmax(235px, 250px) minmax(230px, 250px) minmax(250px, 270px);
        }
        .mm-nm-frequency-grid {
            column-gap:34px;
            grid-template-columns:minmax(210px, 235px) minmax(220px, 245px) minmax(220px, 245px);
        }
        .mm-nm-choice {
            align-items:center;
            display:flex;
            min-height:26px;
            min-width:0;
            padding-left:1.45rem;
        }
        .mm-nm-choice .form-check-input { flex:0 0 auto; margin-top:0; }
        .mm-nm-choice .form-check-label { line-height:1.2; white-space:nowrap; }
        .mm-nm-grid-spacer { min-height:26px; }
        .mm-nm-frequency-grid .mm-nm-dash { color:#6c757d; text-align:center; white-space:nowrap; }
        .mm-nm-proposed-time,
        .mm-nm-proposed-venue,
        .mm-nm-participant-row,
        .mm-nm-agenda-row {
            align-items:center;
            column-gap:10px;
            display:grid;
            row-gap:8px;
        }
        .mm-nm-proposed-time { grid-template-columns:170px minmax(80px, 120px) minmax(110px, 150px) minmax(0, 1fr); }
        .mm-nm-proposed-venue {
            grid-template-columns:170px 75px minmax(90px, 130px) 125px minmax(110px, 160px) 60px minmax(160px, 1fr);
            margin-top:8px;
        }
        .mm-nm-participant-row {
            grid-template-columns:170px 90px minmax(90px, 1fr) 55px minmax(90px, 1fr) 90px minmax(90px, 1fr) 70px minmax(90px, 1fr);
        }
        .mm-nm-participant-row + .mm-nm-participant-row { margin-top:8px; }
        .mm-nm-agenda-row { grid-template-columns:170px minmax(0, 1fr); }
        .mm-nm-agenda-row .form-control { width:100% !important; }
        @media (max-width: 1199.98px) {
            .mm-rmc-main-grid,
            .mm-rmc-detail-grid,
            .mm-rmc-participant-grid,
            .mm-rmc-action-row,
            .mm-rmc-action-wide,
            .mm-nm-options,
            .mm-nm-priority-grid,
            .mm-nm-type-grid,
            .mm-nm-frequency-grid,
            .mm-nm-proposed-time,
            .mm-nm-proposed-venue,
            .mm-nm-participant-row,
            .mm-nm-agenda-row { display:block; }
            .mm-nm-choice { margin-bottom:8px; }
            .mm-nm-grid-spacer { display:none; }
            .mm-rmc-info label,
            .mm-rmc-action-row label,
            .mm-nm-info label,
            .mm-nm-agenda-row label { display:block; margin:8px 0 4px; }
            .mm-rmc-info .form-control,
            .mm-rmc-action-row .form-control,
            .mm-nm-info .form-control,
            .mm-nm-agenda-row .form-control { margin-bottom:8px; }
        }
    </style>

    <div class="meeting-form">
        <%-- Heading + Toolbar --%>
        <div class="row g-0 align-items-stretch mm-header">
            <div class="col d-flex align-items-center px-4">
                <strong class="mm-title">Meeting Management</strong>
            </div>
            <div class="col-auto d-flex align-items-center justify-content-end flex-wrap mm-toolbar">
                <asp:Button ID="BtnCreater" runat="server" Text="Creater" UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 mm-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnSave"    runat="server" Text="Save"    UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 mm-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnNew"     runat="server" Text="New"     UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 mm-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnDelete"  runat="server" Text="Delete"  UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 mm-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnEdit"    runat="server" Text="Edit"    UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 mm-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnPrint"   runat="server" Text="Print"   UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 mm-command-btn" OnClientClick="return false;" />
            </div>
        </div>

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
                    <div class="mm-mgmt-panel me-md-2">
                        <div class="mm-mgmt-panel-head">
                            <h6 class="fw-bold">Type of Meeting</h6>
                            <asp:Button runat="server" UseSubmitBehavior="false" Text="+ Add New" CssClass="btn btn-sm btn-outline-secondary rounded-0 mm-mgmt-add-btn" OnClientClick="showAddPanel('meetingtype'); return false;" />
                        </div>
                        <div class="mm-mgmt-table">
                            <div class="mm-mgmt-table-head"><span>Name</span><span></span></div>
                            <ul id="list_meetingtype" class="list-unstyled mm-mgmt-list">
                            <li>Sales Meeting</li>
                            <li>Meeting with Vendor</li>
                            <li>Procurement Meeting</li>
                            <li>Scheduled Regular Meetings</li>
                            <li>Management Meeting</li>
                            <li>General Meetings</li>
                            <li>Board Meeting</li>
                            </ul>
                        </div>
                        <div id="addPanel_meetingtype" class="d-flex gap-2 align-items-center mt-2 mm-mgmt-add-panel" style="display:none !important">
                            <asp:TextBox ID="txtAdd_meetingtype" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" style="width:200px;"
                                   oninput="document.getElementById('btnAdd_meetingtype').disabled = this.value.trim() === '';" />
                            <asp:Button ID="btnAdd_meetingtype" runat="server" ClientIDMode="Static" UseSubmitBehavior="false" Enabled="false" Text="Add" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="addItem('meetingtype'); return false;" />
                            <a href="#" class="text-secondary small" onclick="hideAddPanel('meetingtype'); return false;">Cancel</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="mm-mgmt-panel ms-md-2">
                        <div class="mm-mgmt-panel-head">
                            <h6 class="fw-bold">Meeting Response</h6>
                            <asp:Button runat="server" UseSubmitBehavior="false" Text="+ Add New" CssClass="btn btn-sm btn-outline-secondary rounded-0 mm-mgmt-add-btn" OnClientClick="showAddPanel('meetingresponse'); return false;" />
                        </div>
                        <div class="mm-mgmt-table">
                            <div class="mm-mgmt-table-head"><span>Name</span><span></span></div>
                            <ul id="list_meetingresponse" class="list-unstyled mm-mgmt-list">
                            <li>Meeting Scheduled</li>
                            <li>Meeting Accepted</li>
                            <li>Meeting Declined</li>
                            <li>Meeting Postponed</li>
                            <li>Meeting Cancelled</li>
                            <li>Meeting Completed</li>
                            <li>Meeting Rescheduled</li>
                            <li>Meeting In Progress</li>
                            </ul>
                        </div>
                        <div id="addPanel_meetingresponse" class="d-flex gap-2 align-items-center mt-2 mm-mgmt-add-panel" style="display:none !important">
                            <asp:TextBox ID="txtAdd_meetingresponse" runat="server" ClientIDMode="Static" CssClass="form-control form-control-sm rounded-0" style="width:200px;"
                                   oninput="document.getElementById('btnAdd_meetingresponse').disabled = this.value.trim() === '';" />
                            <asp:Button ID="btnAdd_meetingresponse" runat="server" ClientIDMode="Static" UseSubmitBehavior="false" Enabled="false" Text="Add" CssClass="btn btn-sm btn-outline-secondary rounded-0" OnClientClick="addItem('meetingresponse'); return false;" />
                            <a href="#" class="text-secondary small" onclick="hideAddPanel('meetingresponse'); return false;">Cancel</a>
                        </div>
                    </div>
                </div>
            </div>

            <%-- Meeting Called By --%>
            <div class="border d-flex flex-column mm-mgmt-wide-panel" style="height:270px; overflow:hidden;">
                <div class="mm-mgmt-wide-head"><h6 class="fw-bold">Meeting Called By</h6></div>
                <div class="d-flex mm-mgmt-wide-body" style="flex:1; min-height:0;">
                    <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom mm-mgmt-column-head">Type</div>
                        <ul id="list_calledby_type" class="list-unstyled mm-mgmt-column-list">
                            <li>Sales Meeting</li><li>Management Meeting</li><li>Board Meeting</li><li>Vendor Meeting</li>
                        </ul>
                    </div>
                    <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom mm-mgmt-column-head">Designation</div>
                        <ul id="list_calledby_desig" class="list-unstyled mm-mgmt-column-list">
                            <li>Sales Manager</li><li>General Manager</li><li>Board Chairman</li><li>Procurement Manager</li>
                        </ul>
                    </div>
                    <div class="d-flex flex-column" style="flex:1; min-width:0;">
                        <div class="small fw-semibold px-2 py-1 border-bottom mm-mgmt-column-head">Name</div>
                        <ul id="list_calledby_name" class="list-unstyled mm-mgmt-column-list">
                            <li>Adnan Khan</li><li>Saleem Khan</li><li>Ahsaan Ahmed</li><li>Abdul Haq</li>
                        </ul>
                    </div>
                </div>
                <div class="mm-mgmt-wide-add px-2 py-1">
                    <asp:Button runat="server" UseSubmitBehavior="false" Text="+ Add New" CssClass="btn btn-sm btn-outline-secondary rounded-0 mm-mgmt-add-btn" OnClientClick="showAdd3Col('calledby'); return false;" />
                    <div id="addPanel_calledby" class="d-flex gap-2 align-items-center flex-wrap mt-1 mm-mgmt-add-panel" style="display:none !important">
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

            <div class="mm-nm-options">

                <div class="mm-nm-priority-grid">
                    <div class="form-check mb-0 mm-nm-choice">
                        <asp:CheckBox ID="ChkNmUrgent"    runat="server" ClientIDMode="Static" CssClass="form-check-input" />
                        <label class="form-check-label small" for="ChkNmUrgent">Urgent</label>
                    </div>
                    <div class="form-check mb-0 mm-nm-choice">
                        <asp:CheckBox ID="ChkNmImportant" runat="server" ClientIDMode="Static" CssClass="form-check-input" Checked="true" />
                        <label class="form-check-label small" for="ChkNmImportant">Important</label>
                    </div>
                    <div class="form-check mb-0 mm-nm-choice">
                        <asp:CheckBox ID="ChkNmRegular"   runat="server" ClientIDMode="Static" CssClass="form-check-input" />
                        <label class="form-check-label small" for="ChkNmRegular">Regular</label>
                    </div>
                    <div class="form-check mb-0 mm-nm-choice">
                        <asp:CheckBox ID="ChkNmAll"       runat="server" ClientIDMode="Static" CssClass="form-check-input" />
                        <label class="form-check-label small" for="ChkNmAll">All</label>
                    </div>
                </div>

                <div class="mm-nm-type-grid">
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="nmSingle"    runat="server" ClientIDMode="Static" GroupName="nmRecurrence" CssClass="form-check-input" Checked="true" />
                        <label class="form-check-label small" for="nmSingle">Single Meeting Event</label>
                    </div>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="nmRecurring" runat="server" ClientIDMode="Static" GroupName="nmRecurrence" CssClass="form-check-input" />
                        <label class="form-check-label small" for="nmRecurring">Raccuring Meetings</label>
                    </div>
                    <span class="mm-nm-grid-spacer"></span>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="nmManagement"  runat="server" ClientIDMode="Static" GroupName="nmMeetingType" CssClass="form-check-input" />
                        <label class="form-check-label small" for="nmManagement">Management Meeting</label>
                    </div>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="nmGeneral"     runat="server" ClientIDMode="Static" GroupName="nmMeetingType" CssClass="form-check-input" />
                        <label class="form-check-label small" for="nmGeneral">Genral Meeting</label>
                    </div>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="nmProcurement" runat="server" ClientIDMode="Static" GroupName="nmMeetingType" CssClass="form-check-input" />
                        <label class="form-check-label small" for="nmProcurement">Procurement Meeting</label>
                    </div>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="nmSales"  runat="server" ClientIDMode="Static" GroupName="nmMeetingType" CssClass="form-check-input" />
                        <label class="form-check-label small" for="nmSales">Sales Meeting</label>
                    </div>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="nmVender" runat="server" ClientIDMode="Static" GroupName="nmMeetingType" CssClass="form-check-input" />
                        <label class="form-check-label small" for="nmVender">Vender Meeting</label>
                    </div>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="nmBoard"  runat="server" ClientIDMode="Static" GroupName="nmMeetingType" CssClass="form-check-input" />
                        <label class="form-check-label small" for="nmBoard">Board Meeting</label>
                    </div>
                </div>

            </div>

            <div class="border p-2 mb-3" style="font-size:0.83rem;">
                <span class="fw-semibold small">Raccuring Meetings</span>
                <div class="mt-3 mm-nm-frequency-grid">
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="nmEveryDay"   runat="server" ClientIDMode="Static" GroupName="nmFrequency" CssClass="form-check-input" Checked="true" />
                        <label class="form-check-label small" for="nmEveryDay">Every Day</label>
                    </div>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="nmEveryWeek"  runat="server" ClientIDMode="Static" GroupName="nmFrequency" CssClass="form-check-input" />
                        <label class="form-check-label small" for="nmEveryWeek">Every Week</label>
                    </div>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="nmEveryMonth" runat="server" ClientIDMode="Static" GroupName="nmFrequency" CssClass="form-check-input" />
                        <label class="form-check-label small" for="nmEveryMonth">Every Month</label>
                    </div>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="nmEveryMonday" runat="server" ClientIDMode="Static" GroupName="nmFrequency" CssClass="form-check-input" />
                        <label class="form-check-label small" for="nmEveryMonday">Every Monday</label>
                    </div>
                    <span class="small text-muted mm-nm-dash">- - - - - - - - - - - - - - -</span>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="nmEverySunday" runat="server" ClientIDMode="Static" GroupName="nmFrequency" CssClass="form-check-input" />
                        <label class="form-check-label small" for="nmEverySunday">Every Sunday</label>
                    </div>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="nmFirstWeek" runat="server" ClientIDMode="Static" GroupName="nmFrequency" CssClass="form-check-input" />
                        <label class="form-check-label small" for="nmFirstWeek">First Day of the Week</label>
                    </div>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="nmLastWeek"  runat="server" ClientIDMode="Static" GroupName="nmFrequency" CssClass="form-check-input" />
                        <label class="form-check-label small" for="nmLastWeek">Last Day of the Week</label>
                    </div>
                    <span class="mm-nm-grid-spacer"></span>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="nmFirstMonth" runat="server" ClientIDMode="Static" GroupName="nmFrequency" CssClass="form-check-input" />
                        <label class="form-check-label small" for="nmFirstMonth">First Day of the Month</label>
                    </div>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="nmLastMonth"  runat="server" ClientIDMode="Static" GroupName="nmFrequency" CssClass="form-check-input" />
                        <label class="form-check-label small" for="nmLastMonth">Last Day of the Month</label>
                    </div>
                    <span class="mm-nm-grid-spacer"></span>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="nmFirstYear" runat="server" ClientIDMode="Static" GroupName="nmFrequency" CssClass="form-check-input" />
                        <label class="form-check-label small" for="nmFirstYear">First Day of the Year</label>
                    </div>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="nmLastYear"  runat="server" ClientIDMode="Static" GroupName="nmFrequency" CssClass="form-check-input" />
                        <label class="form-check-label small" for="nmLastYear">Last Day of the Yeay</label>
                    </div>
                    <span class="mm-nm-grid-spacer"></span>
                </div>
            </div>

            <div class="border p-2 mb-3 mm-nm-info">
                <div class="mm-nm-proposed-time">
                    <span class="fw-semibold">Meeting Proposed Time</span>
                    <asp:TextBox ID="TxtNmPropTime" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" />
                    <asp:TextBox ID="TxtNmPropDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
                    <span></span>
                </div>
                <div class="mm-nm-proposed-venue">
                    <span class="fw-semibold">Meeting Proposed Venue</span>
                    <label class="small mb-0">Location ID</label>
                    <asp:TextBox ID="TxtNmLocationId"       runat="server" CssClass="form-control form-control-sm rounded-0" style="width:100px;" />
                    <label class="small mb-0">Outdoor Premises</label>
                    <asp:TextBox ID="TxtNmOutdoorPremises"  runat="server" CssClass="form-control form-control-sm rounded-0" style="width:130px;" />
                    <label class="small mb-0">Address</label>
                    <asp:TextBox ID="TxtNmAddress"          runat="server" CssClass="form-control form-control-sm rounded-0 flex-grow-1" />
                </div>
            </div>

            <div class="border p-2 mb-3 mm-nm-info">
                <div class="mm-nm-participant-row">
                    <span class="fw-semibold">Participants</span>
                    <label class="small mb-0">Designation</label>
                    <asp:TextBox ID="TxtNmDesig"   runat="server" CssClass="form-control form-control-sm rounded-0" />
                    <label class="small mb-0">Name</label>
                    <asp:TextBox ID="TxtNmName"    runat="server" CssClass="form-control form-control-sm rounded-0" />
                    <label class="small mb-0">Department</label>
                    <asp:TextBox ID="TxtNmDept"    runat="server" CssClass="form-control form-control-sm rounded-0" />
                    <label class="small mb-0">Company</label>
                    <asp:TextBox ID="TxtNmCompany" runat="server" CssClass="form-control form-control-sm rounded-0" />
                </div>
                <div class="mm-nm-participant-row">
                    <span class="fw-semibold">Outside Participants</span>
                    <label class="small mb-0">Company</label>
                    <asp:TextBox ID="TxtNmOutsideCompany" runat="server" CssClass="form-control form-control-sm rounded-0" />
                    <label class="small mb-0">Name</label>
                    <asp:TextBox ID="TxtNmOutsideName"    runat="server" CssClass="form-control form-control-sm rounded-0" />
                    <label class="small mb-0">Relation</label>
                    <asp:TextBox ID="TxtNmRelation"       runat="server" CssClass="form-control form-control-sm rounded-0" />
                    <label class="small mb-0">e-mail</label>
                    <asp:TextBox ID="TxtNmEmail"          runat="server" CssClass="form-control form-control-sm rounded-0" />
                </div>
            </div>

            <div class="mm-nm-agenda-row">
                <label class="small fw-semibold mb-0 mt-1">Meeting Agenda &amp; Details:</label>
                <asp:TextBox ID="TxtNmAgenda" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="4" style="resize:vertical; width:100%;" />
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
                    <label class="small fw-semibold mb-0" for="TxtRmiDate">Date:</label>
                    <asp:TextBox ID="TxtRmiDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:130px;" placeholder="mm/dd/yyyy" />
                </div>
            </div>

            <div class="border mb-3 mm-rmc-info">
                <div class="mm-rmc-main-grid">
                    <span class="fw-semibold">Meeting ID:</span>
                    <asp:TextBox ID="TxtRmiMeetingIdInfo" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" />
                    <span class="fw-semibold">Assigned To:</span>
                    <asp:TextBox ID="TxtRmiAssignedTo" runat="server" CssClass="form-control form-control-sm rounded-0" />
                </div>
                <div class="mm-rmc-main-grid mm-rmc-org-row">
                    <span class="fw-semibold">Type of Meeting:</span>
                    <asp:TextBox ID="TxtRmiTypeOfMeeting" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                    <span class="fw-semibold">Venue:</span>
                    <asp:TextBox ID="TxtRmiVenue" runat="server" CssClass="form-control form-control-sm rounded-0" />
                </div>
                <div class="mm-rmc-participant-grid">
                    <span class="fw-semibold">List of Participants</span>
                    <label class="small mb-0">Name</label>
                    <asp:TextBox ID="TxtRmiP1Name" runat="server" CssClass="form-control form-control-sm rounded-0" />
                    <label class="small mb-0">Designation</label>
                    <asp:TextBox ID="TxtRmiP1Desig" runat="server" CssClass="form-control form-control-sm rounded-0" />
                    <label class="small mb-0">Organization</label>
                    <asp:TextBox ID="TxtRmiP1Org" runat="server" CssClass="form-control form-control-sm rounded-0" />

                    <span></span>
                    <label class="small mb-0">Name</label>
                    <asp:TextBox ID="TxtRmiP2Name" runat="server" CssClass="form-control form-control-sm rounded-0" />
                    <label class="small mb-0">Designation</label>
                    <asp:TextBox ID="TxtRmiP2Desig" runat="server" CssClass="form-control form-control-sm rounded-0" />
                    <label class="small mb-0">Organization</label>
                    <asp:TextBox ID="TxtRmiP2Org" runat="server" CssClass="form-control form-control-sm rounded-0" />

                    <span></span>
                    <label class="small mb-0">Name</label>
                    <asp:TextBox ID="TxtRmiP3Name" runat="server" CssClass="form-control form-control-sm rounded-0" />
                    <label class="small mb-0">Designation</label>
                    <asp:TextBox ID="TxtRmiP3Desig" runat="server" CssClass="form-control form-control-sm rounded-0" />
                    <span></span>
                    <span></span>
                </div>
                <div class="mm-rmc-main-grid mm-rmc-org-row">
                    <span class="fw-semibold">Organization</span>
                    <asp:TextBox ID="TxtRmiOrg" runat="server" CssClass="form-control form-control-sm rounded-0" style="grid-column:2 / 5;" />
                </div>
            </div>

            <div class="border p-2 mm-rmc-actions">
                <h6 class="fw-bold mb-3">Actions</h6>

                <%-- Response by In House Receiver --%>
                <div class="row g-0 mb-3">
                    <div class="col-auto pe-3 pt-1" style="min-width:150px;"><span class="small fw-semibold">Response<br />by In House<br />Receiver</span></div>
                    <div class="col d-flex flex-column gap-2">
                        <div class="mm-rmc-action-row">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <asp:RadioButton ID="ih1" runat="server" ClientIDMode="Static" GroupName="inHouseResponse" CssClass="form-check-input" Checked="true" />
                                <label class="form-check-label small" for="ih1">Confirm</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtIh1Time" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtIh1Date" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                        </div>
                        <div class="mm-rmc-action-row">
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
                        <div class="mm-rmc-action-row">
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
                        <div class="mm-rmc-action-row">
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
                        <div class="mm-rmc-action-row">
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
                        <div class="mm-rmc-action-row">
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
                        <div class="mm-rmc-action-row">
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
                        <div class="mm-rmc-action-row">
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
                        <div class="mm-rmc-action-row">
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
                        <div class="mm-rmc-action-row mt-1">
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
                    <label class="small fw-semibold mb-0" for="TxtRmcHeaderDate">Date:</label>
                    <asp:TextBox ID="TxtRmcHeaderDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:130px;" placeholder="mm/dd/yyyy" />
                </div>
            </div>

            <div class="border mb-3 mm-rmc-info">
                <div class="mm-rmc-main-grid">
                    <span class="fw-semibold">Meeting ID:</span>
                    <asp:TextBox ID="TxtRmcMeetingIdInfo" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" />
                    <span class="fw-semibold">Called By:</span>
                    <asp:TextBox ID="TxtRmcCalledBy" runat="server" CssClass="form-control form-control-sm rounded-0" />
                </div>
                <div class="mm-rmc-detail-grid">
                    <span class="fw-semibold">Type of Meeting:</span>
                    <asp:TextBox ID="TxtRmcTypeOfMeeting" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:160px;" />
                    <span class="fw-semibold">Time</span>
                    <asp:TextBox ID="TxtRmcTime" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" />
                    <span class="fw-semibold">Date</span>
                    <asp:TextBox ID="TxtRmcDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
                    <span class="fw-semibold">Venue</span>
                    <asp:TextBox ID="TxtRmcVenue" runat="server" CssClass="form-control form-control-sm rounded-0" />
                </div>
                <div class="mm-rmc-participant-grid">
                    <span class="fw-semibold">List of Participants</span>
                    <label class="small mb-0">Name</label>
                    <asp:TextBox ID="TxtRmcP1Name" runat="server" CssClass="form-control form-control-sm rounded-0" />
                    <label class="small mb-0">Designation</label>
                    <asp:TextBox ID="TxtRmcP1Desig" runat="server" CssClass="form-control form-control-sm rounded-0" />
                    <label class="small mb-0">Organization</label>
                    <asp:TextBox ID="TxtRmcP1Org" runat="server" CssClass="form-control form-control-sm rounded-0" />

                    <span></span>
                    <label class="small mb-0">Name</label>
                    <asp:TextBox ID="TxtRmcP2Name" runat="server" CssClass="form-control form-control-sm rounded-0" />
                    <label class="small mb-0">Designation</label>
                    <asp:TextBox ID="TxtRmcP2Desig" runat="server" CssClass="form-control form-control-sm rounded-0" />
                    <label class="small mb-0">Organization</label>
                    <asp:TextBox ID="TxtRmcP2Org" runat="server" CssClass="form-control form-control-sm rounded-0" />

                    <span></span>
                    <label class="small mb-0">Name</label>
                    <asp:TextBox ID="TxtRmcP3Name" runat="server" CssClass="form-control form-control-sm rounded-0" />
                    <label class="small mb-0">Designation</label>
                    <asp:TextBox ID="TxtRmcP3Desig" runat="server" CssClass="form-control form-control-sm rounded-0" />
                    <span></span>
                    <span></span>
                </div>
                <div class="mm-rmc-main-grid mm-rmc-org-row">
                    <span class="fw-semibold">Organization</span>
                    <asp:TextBox ID="TxtRmcOrg" runat="server" CssClass="form-control form-control-sm rounded-0" style="grid-column:2 / 5;" />
                </div>
            </div>

            <div class="border p-2 mm-rmc-actions">
                <h6 class="fw-bold mb-3">Actions</h6>
                <div class="row g-0">
                    <div class="col-auto pe-3 pt-1" style="min-width:160px;"><span class="small fw-semibold">Closing Action or<br />Ammendements<br />by Meeting<br />Caller</span></div>
                    <div class="col d-flex flex-column gap-2">
                        <div class="mm-rmc-action-row">
                            <div class="form-check mb-0" style="min-width:220px;">
                                <asp:RadioButton ID="ca1" runat="server" ClientIDMode="Static" GroupName="callerAction" CssClass="form-check-input" Checked="true" />
                                <label class="form-check-label small" for="ca1">Rescheduled</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtCa1Time" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtCa1Date" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                        </div>
                        <div class="mm-rmc-action-row">
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
                        <div class="mm-rmc-action-row">
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
                        <div class="mm-rmc-action-row mm-rmc-action-wide">
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
                        <div class="mm-rmc-action-row">
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
                        <div class="mm-rmc-action-row">
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
                    <label class="small fw-semibold mb-0" for="TxtMsHeaderDate">Date:</label>
                    <asp:TextBox ID="TxtMsHeaderDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:130px;" placeholder="mm/dd/yyyy" />
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

            <div class="mm-nm-options pb-2 border-bottom">

                <div class="mm-nm-priority-grid">
                    <div class="form-check mb-0 mm-nm-choice">
                        <asp:CheckBox ID="ChkMsUrgent"    runat="server" ClientIDMode="Static" CssClass="form-check-input" />
                        <label class="form-check-label small" for="ChkMsUrgent">Urgent</label>
                    </div>
                    <div class="form-check mb-0 mm-nm-choice">
                        <asp:CheckBox ID="ChkMsImportant" runat="server" ClientIDMode="Static" CssClass="form-check-input" Checked="true" />
                        <label class="form-check-label small" for="ChkMsImportant">Important</label>
                    </div>
                    <div class="form-check mb-0 mm-nm-choice">
                        <asp:CheckBox ID="ChkMsRegular"   runat="server" ClientIDMode="Static" CssClass="form-check-input" />
                        <label class="form-check-label small" for="ChkMsRegular">Regular</label>
                    </div>
                    <div class="form-check mb-0 mm-nm-choice">
                        <asp:CheckBox ID="ChkMsAll"       runat="server" ClientIDMode="Static" CssClass="form-check-input" />
                        <label class="form-check-label small" for="ChkMsAll">All</label>
                    </div>
                </div>

                <div class="mm-nm-type-grid">
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="radMsSingle"    runat="server" ClientIDMode="Static" GroupName="radMsRecurrence" CssClass="form-check-input" Checked="true" />
                        <label class="form-check-label small" for="radMsSingle">Single Meeting Event</label>
                    </div>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="radMsRecurring" runat="server" ClientIDMode="Static" GroupName="radMsRecurrence" CssClass="form-check-input" />
                        <label class="form-check-label small" for="radMsRecurring">Raccuring Meetings</label>
                    </div>
                    <span class="mm-nm-grid-spacer"></span>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="radMsAllMeetings"  runat="server" ClientIDMode="Static" GroupName="radMsMeetingType" CssClass="form-check-input" Checked="true" />
                        <label class="form-check-label small" for="radMsAllMeetings">All Meetings</label>
                    </div>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="radMsManagement"   runat="server" ClientIDMode="Static" GroupName="radMsMeetingType" CssClass="form-check-input" />
                        <label class="form-check-label small" for="radMsManagement">Management Meeting</label>
                    </div>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="radMsGeneral"      runat="server" ClientIDMode="Static" GroupName="radMsMeetingType" CssClass="form-check-input" />
                        <label class="form-check-label small" for="radMsGeneral">Genral Meeting</label>
                    </div>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="radMsSales"       runat="server" ClientIDMode="Static" GroupName="radMsMeetingType" CssClass="form-check-input" />
                        <label class="form-check-label small" for="radMsSales">Sales Meeting</label>
                    </div>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="radMsVender"      runat="server" ClientIDMode="Static" GroupName="radMsMeetingType" CssClass="form-check-input" />
                        <label class="form-check-label small" for="radMsVender">Vender Meeting</label>
                    </div>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="radMsProcurement" runat="server" ClientIDMode="Static" GroupName="radMsMeetingType" CssClass="form-check-input" />
                        <label class="form-check-label small" for="radMsProcurement">Procurement Meeting</label>
                    </div>
                    <div class="form-check form-check-inline mb-0 mm-nm-choice">
                        <asp:RadioButton ID="radMsBoard" runat="server" ClientIDMode="Static" GroupName="radMsMeetingType" CssClass="form-check-input" />
                        <label class="form-check-label small" for="radMsBoard">Board Meeting</label>
                    </div>
                    <span class="mm-nm-grid-spacer"></span>
                    <span class="mm-nm-grid-spacer"></span>
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
        function isMeetingMgmtDeleteClick(evt, item) {
            return evt.clientX >= item.getBoundingClientRect().right - 32;
        }
        document.addEventListener('click', function (evt) {
            var singleItem = evt.target.closest('.mm-mgmt-list li');
            if (singleItem && isMeetingMgmtDeleteClick(evt, singleItem)) {
                singleItem.remove();
                return;
            }

            var columnItem = evt.target.closest('.mm-mgmt-column-list li');
            if (!columnItem || !isMeetingMgmtDeleteClick(evt, columnItem)) return;

            var list = columnItem.parentElement;
            var rowIndex = Array.prototype.indexOf.call(list.children, columnItem);
            var panel = columnItem.closest('.mm-mgmt-wide-panel');
            if (!panel || rowIndex < 0) {
                columnItem.remove();
                return;
            }

            panel.querySelectorAll('.mm-mgmt-column-list').forEach(function (columnList) {
                var row = columnList.children[rowIndex];
                if (row) row.remove();
            });
        });
    </script>

    </div>

</asp:Content>
