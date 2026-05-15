<%@ Page Title="Leave &amp; Late Coming" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LateComingLeaves.aspx.vb" Inherits="POSSystem.Pages.Operations.LateComingLeaves" %>

<%@ Register Src="~/Pages/Operations/LateComingLeavesControls/LateArrivalLeavesTab.ascx" TagPrefix="ll" TagName="LateArrivalLeavesTab" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Heading + Toolbar --%>
    <div class="d-flex align-items-center gap-2 mb-2 px-3 py-2 border flex-wrap" style="background-color:#f8f9fa;">
        <strong class="fs-5 me-2">Leave &amp; Late Coming</strong>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Reporting Manager Approved</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Department Manager Approved</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Dy Manager HR Approved</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Save</button>
        <div class="ms-auto d-flex gap-2">
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Edit</button>
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Print</button>
        </div>
    </div>

    <style>
        #llTabs {
            flex-wrap: nowrap;
            overflow-x: auto;
        }
        #llTabs .nav-link {
            background-color: #e9ecef;
            color: #495057;
            border-color: #dee2e6;
            border-radius: 0;
            font-size: 0.78rem;
            white-space: nowrap;
            padding-left: 0.55rem;
            padding-right: 0.55rem;
        }
        #llTabs .nav-link.active {
            background-color: #6c757d;
            color: #fff;
            border-color: #6c757d #6c757d #fff;
        }
        #llTabs .nav-link:focus {
            box-shadow: none;
        }
    </style>

    <%-- Tab Navigation --%>
    <ul class="nav nav-tabs" id="llTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active rounded-0" id="tab-latearrivalleaves"
                    data-bs-toggle="tab" data-bs-target="#pane-latearrivalleaves"
                    type="button" role="tab" aria-controls="pane-latearrivalleaves" aria-selected="true">
                Late Arrival &amp; Leaves
            </button>
        </li>
    </ul>

    <%-- Tab Content --%>
    <div class="tab-content border border-top-0" id="llTabContent">

        <div class="tab-pane fade show active p-3" id="pane-latearrivalleaves" role="tabpanel" aria-labelledby="tab-latearrivalleaves">
            <ll:LateArrivalLeavesTab runat="server" ID="LateArrivalLeavesTab1" />
        </div>

    </div>

</asp:Content>
