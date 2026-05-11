<%@ Page Title="Task Manager" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TaskManager.aspx.vb" Inherits="POSSystem.Pages.Operations.TaskManager" %>

<%@ Register Src="~/Pages/Operations/TaskManagerControls/TaskStatusTab.ascx"      TagPrefix="tm" TagName="TaskStatusTab" %>
<%@ Register Src="~/Pages/Operations/TaskManagerControls/NewTaskTab.ascx"         TagPrefix="tm" TagName="NewTaskTab" %>
<%@ Register Src="~/Pages/Operations/TaskManagerControls/ResponseOnTaskTab.ascx"  TagPrefix="tm" TagName="ResponseOnTaskTab" %>
<%@ Register Src="~/Pages/Operations/TaskManagerControls/TaskStringTab.ascx"      TagPrefix="tm" TagName="TaskStringTab" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Heading + Toolbar --%>
    <div class="d-flex align-items-center gap-2 mb-2 px-3 py-2 border flex-wrap" style="background-color:#f8f9fa;">
        <strong class="fs-5 me-2">Task Manager</strong>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Transmit</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">New</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Save</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">View</button>
        <div class="ms-auto d-flex gap-2">
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Delete</button>
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Edit</button>
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Print</button>
        </div>
    </div>

    <style>
        /* Tab strip — grey theme, no blue */
        #taskManagerTabs .nav-link {
            background-color: #e9ecef;
            color: #495057;
            border-color: #dee2e6;
            border-radius: 0;
        }
        #taskManagerTabs .nav-link.active {
            background-color: #6c757d;
            color: #fff;
            border-color: #6c757d #6c757d #fff;
        }
        #taskManagerTabs .nav-link:focus {
            box-shadow: none;
        }
    </style>

    <%-- Tab Navigation --%>
    <ul class="nav nav-tabs" id="taskManagerTabs" role="tablist">
        <li class="nav-item" role="presentation">
            <button class="nav-link active rounded-0 px-4" id="tab-taskstatus"
                    data-bs-toggle="tab" data-bs-target="#pane-taskstatus"
                    type="button" role="tab" aria-controls="pane-taskstatus" aria-selected="true">
                Task Status
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link rounded-0 px-4" id="tab-newtask"
                    data-bs-toggle="tab" data-bs-target="#pane-newtask"
                    type="button" role="tab" aria-controls="pane-newtask" aria-selected="false">
                New Task
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link rounded-0 px-4" id="tab-responseontask"
                    data-bs-toggle="tab" data-bs-target="#pane-responseontask"
                    type="button" role="tab" aria-controls="pane-responseontask" aria-selected="false">
                Response on Task
            </button>
        </li>
        <li class="nav-item" role="presentation">
            <button class="nav-link rounded-0 px-4" id="tab-taskstring"
                    data-bs-toggle="tab" data-bs-target="#pane-taskstring"
                    type="button" role="tab" aria-controls="pane-taskstring" aria-selected="false">
                Task String
            </button>
        </li>
    </ul>

    <%-- Tab Content --%>
    <div class="tab-content border border-top-0" id="taskManagerTabContent">

        <div class="tab-pane fade show active p-3" id="pane-taskstatus" role="tabpanel" aria-labelledby="tab-taskstatus">
            <tm:TaskStatusTab runat="server" ID="TaskStatusTab1" />
        </div>

        <div class="tab-pane fade p-3" id="pane-newtask" role="tabpanel" aria-labelledby="tab-newtask">
            <tm:NewTaskTab runat="server" ID="NewTaskTab1" />
        </div>

        <div class="tab-pane fade p-3" id="pane-responseontask" role="tabpanel" aria-labelledby="tab-responseontask">
            <tm:ResponseOnTaskTab runat="server" ID="ResponseOnTaskTab1" />
        </div>

        <div class="tab-pane fade p-3" id="pane-taskstring" role="tabpanel" aria-labelledby="tab-taskstring">
            <tm:TaskStringTab runat="server" ID="TaskStringTab1" />
        </div>

    </div>

</asp:Content>
