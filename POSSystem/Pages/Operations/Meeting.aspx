<%@ Page Title="Meeting Management" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Meeting.aspx.vb" Inherits="POSSystem.Pages.Operations.Meeting" %>

<%@ Register Src="~/Pages/Operations/MeetingManagementControls/MeetingManagementTab.ascx" TagPrefix="mm" TagName="MeetingManagementTab" %>
<%@ Register Src="~/Pages/Operations/MeetingManagementControls/NewMeetingTab.ascx"          TagPrefix="mm" TagName="NewMeetingTab" %>
<%@ Register Src="~/Pages/Operations/MeetingManagementControls/ResponseOnMeetingTab.ascx"  TagPrefix="mm" TagName="ResponseOnMeetingTab" %>
<%@ Register Src="~/Pages/Operations/MeetingManagementControls/ResponseByCallerTab.ascx"  TagPrefix="mm" TagName="ResponseByCallerTab" %>
<%@ Register Src="~/Pages/Operations/MeetingManagementControls/MeetingStringTab.ascx"     TagPrefix="mm" TagName="MeetingStringTab" %>
<%@ Register Src="~/Pages/Operations/MeetingManagementControls/MeetingsStatusTab.ascx"    TagPrefix="mm" TagName="MeetingsStatusTab" %>

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

        <div class="tab-pane fade show active p-3" id="pane-meetingmgmt" role="tabpanel" aria-labelledby="tab-meetingmgmt">
            <mm:MeetingManagementTab runat="server" ID="MeetingManagementTab1" />
        </div>

        <div class="tab-pane fade p-3" id="pane-newmeeting" role="tabpanel" aria-labelledby="tab-newmeeting">
            <mm:NewMeetingTab runat="server" ID="NewMeetingTab1" />
        </div>

        <div class="tab-pane fade p-3" id="pane-responsemeeting" role="tabpanel" aria-labelledby="tab-responsemeeting">
            <mm:ResponseOnMeetingTab runat="server" ID="ResponseOnMeetingTab1" />
        </div>

        <div class="tab-pane fade p-3" id="pane-responsecaller" role="tabpanel" aria-labelledby="tab-responsecaller">
            <mm:ResponseByCallerTab runat="server" ID="ResponseByCallerTab1" />
        </div>

        <div class="tab-pane fade p-3" id="pane-meetingstring" role="tabpanel" aria-labelledby="tab-meetingstring">
            <mm:MeetingStringTab runat="server" ID="MeetingStringTab1" />
        </div>

        <div class="tab-pane fade p-3" id="pane-meetingsstatus" role="tabpanel" aria-labelledby="tab-meetingsstatus">
            <mm:MeetingsStatusTab runat="server" ID="MeetingsStatusTab1" />
        </div>

    </div>

</asp:Content>
