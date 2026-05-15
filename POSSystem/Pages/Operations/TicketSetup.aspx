<%@ Page Title="Ticket Setup" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TicketSetup.aspx.vb" Inherits="POSSystem.Pages.Operations.TicketSetup" %>

<%@ Register Src="~/Pages/Operations/TicketSetupControls/TicketSetupTab.ascx"  TagPrefix="tc" TagName="TicketSetupTab" %>
<%@ Register Src="~/Pages/Operations/TicketSetupControls/NewTicketTab.ascx"          TagPrefix="tc" TagName="NewTicketTab" %>
<%@ Register Src="~/Pages/Operations/TicketSetupControls/ResponseOnTicketTab.ascx"  TagPrefix="tc" TagName="ResponseOnTicketTab" %>
<%@ Register Src="~/Pages/Operations/TicketSetupControls/TicketStringTab.ascx"      TagPrefix="tc" TagName="TicketStringTab" %>
<%@ Register Src="~/Pages/Operations/TicketSetupControls/TicketStatusTab.ascx"      TagPrefix="tc" TagName="TicketStatusTab" %>

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

        <div class="tab-pane fade show active p-3" id="pane-ticketsetup" role="tabpanel" aria-labelledby="tab-ticketsetup">
            <tc:TicketSetupTab runat="server" ID="TicketSetupTab1" />
        </div>

        <div class="tab-pane fade p-3" id="pane-newticket" role="tabpanel" aria-labelledby="tab-newticket">
            <tc:NewTicketTab runat="server" ID="NewTicketTab1" />
        </div>

        <div class="tab-pane fade p-3" id="pane-responseticket" role="tabpanel" aria-labelledby="tab-responseticket">
            <tc:ResponseOnTicketTab runat="server" ID="ResponseOnTicketTab1" />
        </div>

        <div class="tab-pane fade p-3" id="pane-ticketstring" role="tabpanel" aria-labelledby="tab-ticketstring">
            <tc:TicketStringTab runat="server" ID="TicketStringTab1" />
        </div>

        <div class="tab-pane fade p-3" id="pane-ticketstatus" role="tabpanel" aria-labelledby="tab-ticketstatus">
            <tc:TicketStatusTab runat="server" ID="TicketStatusTab1" />
        </div>

    </div>

</asp:Content>
