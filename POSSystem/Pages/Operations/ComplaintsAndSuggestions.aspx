<%@ Page Title="Complaints &amp; Suggestions" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ComplaintsAndSuggestions.aspx.vb" Inherits="POSSystem.Pages.Operations.ComplaintsAndSuggestions" %>

<%@ Register Src="~/Pages/Operations/ComplaintsAndSuggestionsControls/ComplainsStatusTab.ascx" TagPrefix="cs" TagName="ComplainsStatusTab" %>
<%@ Register Src="~/Pages/Operations/ComplaintsAndSuggestionsControls/NewComplainTab.ascx"          TagPrefix="cs" TagName="NewComplainTab" %>
<%@ Register Src="~/Pages/Operations/ComplaintsAndSuggestionsControls/ResponseOnComplainTab.ascx" TagPrefix="cs" TagName="ResponseOnComplainTab" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Heading + Toolbar --%>
    <div class="d-flex align-items-center gap-2 mb-2 px-3 py-2 border flex-wrap" style="background-color:#f8f9fa;">
        <strong class="fs-5 me-2">Complains &amp; Suggestions Manager</strong>
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
        #csTabs {
            flex-wrap: nowrap;
            overflow-x: auto;
        }
        #csTabs .nav-link {
            background-color: #e9ecef;
            color: #495057;
            border-color: #dee2e6;
            border-radius: 0;
            font-size: 0.78rem;
            white-space: nowrap;
            padding-left: 0.55rem;
            padding-right: 0.55rem;
        }
        #csTabs .nav-link.active {
            background-color: #6c757d;
            color: #fff;
            border-color: #6c757d #6c757d #fff;
        }
        #csTabs .nav-link:focus {
            box-shadow: none;
        }
    </style>

    <%-- Tab Navigation --%>
    <ul class="nav nav-tabs" id="csTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active rounded-0" id="tab-complainsstatus"
                    data-bs-toggle="tab" data-bs-target="#pane-complainsstatus"
                    type="button" role="tab" aria-controls="pane-complainsstatus" aria-selected="true">
                Complains Status
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link rounded-0" id="tab-newcomplain"
                    data-bs-toggle="tab" data-bs-target="#pane-newcomplain"
                    type="button" role="tab" aria-controls="pane-newcomplain" aria-selected="false">
                New Complain
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link rounded-0" id="tab-responseoncomplain"
                    data-bs-toggle="tab" data-bs-target="#pane-responseoncomplain"
                    type="button" role="tab" aria-controls="pane-responseoncomplain" aria-selected="false">
                Response on Complains &amp; Suggestions
            </button>
        </li>
    </ul>

    <%-- Tab Content --%>
    <div class="tab-content border border-top-0" id="csTabContent">

        <div class="tab-pane fade show active p-3" id="pane-complainsstatus" role="tabpanel" aria-labelledby="tab-complainsstatus">
            <cs:ComplainsStatusTab runat="server" ID="ComplainsStatusTab1" />
        </div>

        <div class="tab-pane fade p-3" id="pane-newcomplain" role="tabpanel" aria-labelledby="tab-newcomplain">
            <cs:NewComplainTab runat="server" ID="NewComplainTab1" />
        </div>

        <div class="tab-pane fade p-3" id="pane-responseoncomplain" role="tabpanel" aria-labelledby="tab-responseoncomplain">
            <cs:ResponseOnComplainTab runat="server" ID="ResponseOnComplainTab1" />
        </div>

    </div>

</asp:Content>
