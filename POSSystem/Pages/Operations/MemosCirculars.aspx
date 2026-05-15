<%@ Page Title="Memos &amp; Circulars" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MemosCirculars.aspx.vb" Inherits="POSSystem.Pages.Operations.MemosCirculars" %>

<%@ Register Src="~/Pages/Operations/MemosCircularsControls/MemoCircularStatusTab.ascx" TagPrefix="mc" TagName="MemoCircularStatusTab" %>
<%@ Register Src="~/Pages/Operations/MemosCircularsControls/NewMemoCircularTab.ascx"   TagPrefix="mc" TagName="NewMemoCircularTab" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Heading + Toolbar --%>
    <div class="d-flex align-items-center gap-2 mb-2 px-3 py-2 border flex-wrap" style="background-color:#f8f9fa;">
        <strong class="fs-5 me-2">Memos &amp; Circulars</strong>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Asst Manager Administration</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Asst Manager HR</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Department Manager</button>
        <div class="ms-auto d-flex gap-2">
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Edit</button>
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Print</button>
        </div>
    </div>

    <style>
        #memoCircularTabs {
            flex-wrap: nowrap;
            overflow-x: auto;
        }
        #memoCircularTabs .nav-link {
            background-color: #e9ecef;
            color: #495057;
            border-color: #dee2e6;
            border-radius: 0;
            font-size: 0.78rem;
            white-space: nowrap;
            padding-left: 0.55rem;
            padding-right: 0.55rem;
        }
        #memoCircularTabs .nav-link.active {
            background-color: #6c757d;
            color: #fff;
            border-color: #6c757d #6c757d #fff;
        }
        #memoCircularTabs .nav-link:focus {
            box-shadow: none;
        }
    </style>

    <%-- Tab Navigation --%>
    <ul class="nav nav-tabs" id="memoCircularTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active rounded-0" id="tab-memocircularstatus"
                    data-bs-toggle="tab" data-bs-target="#pane-memocircularstatus"
                    type="button" role="tab" aria-controls="pane-memocircularstatus" aria-selected="true">
                Memo Circular Status
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link rounded-0" id="tab-newmemocircular"
                    data-bs-toggle="tab" data-bs-target="#pane-newmemocircular"
                    type="button" role="tab" aria-controls="pane-newmemocircular" aria-selected="false">
                New Memo Circular
            </button>
        </li>
    </ul>

    <%-- Tab Content --%>
    <div class="tab-content border border-top-0" id="memoCircularTabContent">

        <div class="tab-pane fade show active p-3" id="pane-memocircularstatus" role="tabpanel" aria-labelledby="tab-memocircularstatus">
            <mc:MemoCircularStatusTab runat="server" ID="MemoCircularStatusTab1" />
        </div>

        <div class="tab-pane fade p-3" id="pane-newmemocircular" role="tabpanel" aria-labelledby="tab-newmemocircular">
            <mc:NewMemoCircularTab runat="server" ID="NewMemoCircularTab1" />
        </div>

    </div>

</asp:Content>
