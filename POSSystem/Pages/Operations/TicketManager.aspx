<%@ Page Title="Ticket Manager" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TicketManager.aspx.vb" Inherits="POSSystem.Pages.Operations.TicketManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .ticket-form { background:#f2f2f2; font-family:Arial,sans-serif; padding:0 0 12px; }
        .ticket-form label,
        .ticket-form span,
        .ticket-form .fw-semibold,
        .ticket-form .fw-bold { font-style:italic; }
        .ts-header { background:#d9d9d9; border:1px solid #555; min-height:76px; }
        .ts-title { color:#666; font-size:2rem; font-style:italic; font-weight:700; line-height:1; }
        .ts-toolbar { gap:14px; padding:0 8px; }
        .ts-command-btn { color:#002d62; font-size:10px; font-weight:700; height:46px; line-height:1.1; white-space:normal; width:74px; }
        .ts-tabs { display:flex; list-style:none; margin:20px 0 0; padding:0; flex-wrap:nowrap; overflow-x:auto; }
        .ts-tabs .ts-tab-btn {
            background:#a8a8a8; border:2px solid #000; border-bottom:none; color:#111; cursor:pointer;
            font-size:14px; font-style:italic; font-weight:700; height:86px; line-height:1.15; margin:0 4px 0 0;
            min-width:210px; padding:0 20px; white-space:normal;
        }
        .ts-tabs .ts-tab-btn.active { background:#b0b0b0; color:#111; border-color:#000; }
        .ts-tab-content { background:#f2f2f2; border:2px solid #000; min-height:520px; }
        .ts-pane { display:none; padding:28px 30px 34px; }
        .ts-pane.active { display:block; }
        .ticket-form .form-control,
        .ticket-form .form-select { border-color:#555; border-radius:0 !important; font-size:12px; font-style:italic; max-width:none; }
        .ticket-form .table { border-color:#000; }
        .ticket-form .table th { background:#c9c9c9; border-color:#000; font-style:italic; text-align:center; vertical-align:middle; }
        .ticket-form .table td { border-color:#000; vertical-align:top; }
        .ticket-form .border,
        .ticket-form .border-top,
        .ticket-form .border-bottom,
        .ticket-form .border-end { border-color:#000 !important; }
        .ticket-form #TxtNtRemarks,
        .ticket-form #TxtNtNote,
        .ticket-form #TxtRtDetails,
        .ticket-form #TxtRtNote,
        .ticket-form #TxtTsDetails,
        .ticket-form #TxtTsNote { width:100% !important; }
        .ticket-form [id*="Remarks"] { min-width:180px; }
        .ticket-form .ts-choice {
            align-items:center;
            display:flex;
            min-height:28px;
            min-width:0;
            padding-left:1.45rem;
        }
        .ticket-form .ts-choice .form-check-input { flex:0 0 auto; margin-top:0; }
        .ticket-form .ts-choice .form-check-label { line-height:1.2; white-space:nowrap; }
        .ts-nt-nature-grid {
            column-gap:34px;
            display:grid;
            grid-template-columns:repeat(3, minmax(150px, 190px));
            justify-content:center;
            margin-bottom:16px;
            row-gap:10px;
        }
        .ts-nt-close-grid,
        .ts-newticket-row,
        .ts-nt-remarks-grid {
            align-items:center;
            column-gap:10px;
            display:grid;
            row-gap:8px;
        }
        .ts-nt-close-grid {
            grid-template-columns:260px minmax(80px, 120px) minmax(110px, 150px) minmax(0, 1fr);
            margin-bottom:16px;
        }
        .ts-newticket-info { font-size:0.83rem; overflow:hidden; }
        .ts-newticket-info label { white-space:nowrap; }
        .ts-newticket-info .form-control { height:34px; width:100% !important; }
        .ts-newticket-row {
            grid-template-columns:minmax(230px, 250px) 120px minmax(70px, 1fr) 70px minmax(60px, 1fr) 60px minmax(60px, 1fr) 90px minmax(70px, 1fr);
            margin-bottom:8px;
        }
        .ts-newticket-row:last-child { margin-bottom:0; }
        .ts-nt-remarks-grid {
            align-items:start;
            grid-template-columns:190px minmax(0, 1fr);
            margin-bottom:16px;
        }
        .ts-nt-remarks-grid .form-control { width:100% !important; }
        .ts-string-info { background-color:#f8f9fa; font-size:0.83rem; overflow:hidden; }
        .ts-string-info span { white-space:nowrap; }
        .ts-string-info .form-control { height:34px; width:100% !important; }
        .ts-string-grid,
        .ts-string-target-grid,
        .ts-string-details-grid {
            align-items:center;
            column-gap:10px;
            display:grid;
            row-gap:8px;
        }
        .ts-string-grid { grid-template-columns:180px minmax(110px, 180px) 115px minmax(220px, 1fr); }
        .ts-string-target-grid {
            grid-template-columns:180px minmax(80px, 120px) minmax(110px, 150px) minmax(0, 1fr);
            margin-top:8px;
        }
        .ts-string-details-grid {
            align-items:start;
            grid-template-columns:180px minmax(0, 1fr);
            margin-top:8px;
        }
        .ts-response-info,
        .ts-response-actions { font-size:0.83rem; overflow:hidden; }
        .ts-response-info { background-color:#f8f9fa; }
        .ts-response-info span,
        .ts-response-action-row label { white-space:nowrap; }
        .ts-response-info .form-control,
        .ts-response-action-row .form-control { height:34px; width:100% !important; }
        .ts-response-grid,
        .ts-response-target-grid,
        .ts-response-details-grid,
        .ts-response-action-row {
            align-items:center;
            column-gap:10px;
            display:grid;
            row-gap:8px;
        }
        .ts-response-grid { grid-template-columns:190px minmax(110px, 180px) 115px minmax(220px, 1fr); }
        .ts-response-target-grid {
            grid-template-columns:260px minmax(80px, 120px) minmax(110px, 150px) minmax(0, 1fr);
            margin-top:8px;
        }
        .ts-response-details-grid {
            align-items:start;
            grid-template-columns:190px minmax(0, 1fr);
            margin-top:8px;
        }
        .ts-response-action-row {
            grid-template-columns:minmax(280px, 300px) 45px minmax(80px, 120px) 45px minmax(110px, 150px) 75px minmax(160px, 1fr);
        }
        .ts-response-action-row .form-check { min-width:0 !important; }
        .ts-response-action-row [id*="Remarks"] { min-width:0; }
        .ts-status-options {
            align-items:start;
            column-gap:34px;
            display:grid;
            grid-template-columns:190px minmax(0, 1fr);
        }
        .ts-status-priority-grid,
        .ts-status-type-grid,
        .ts-status-state-grid {
            align-items:center;
            display:grid;
            row-gap:12px;
        }
        .ts-status-priority-grid { grid-template-columns:1fr; }
        .ts-status-type-grid {
            column-gap:30px;
            grid-template-columns:minmax(170px, 200px) minmax(270px, 300px) minmax(220px, 250px);
        }
        .ts-status-state-grid {
            column-gap:24px;
            grid-template-columns:minmax(90px, 110px) minmax(100px, 120px) minmax(115px, 130px) minmax(105px, 120px) minmax(80px, 100px);
            margin-top:12px;
        }
        .ts-grid-spacer { min-height:28px; }
        @media (max-width: 1199.98px) {
            .ts-nt-nature-grid,
            .ts-nt-close-grid,
            .ts-newticket-row,
            .ts-nt-remarks-grid,
            .ts-string-grid,
            .ts-string-target-grid,
            .ts-string-details-grid,
            .ts-response-grid,
            .ts-response-target-grid,
            .ts-response-details-grid,
            .ts-response-action-row,
            .ts-status-options,
            .ts-status-priority-grid,
            .ts-status-type-grid,
            .ts-status-state-grid { display:block; }
            .ticket-form .ts-choice { margin-bottom:8px; }
            .ts-grid-spacer { display:none; }
            .ts-newticket-info label { display:block; margin:8px 0 4px; }
            .ts-newticket-info .form-control,
            .ts-nt-close-grid .form-control,
            .ts-nt-remarks-grid .form-control { margin-bottom:8px; }
            .ts-string-info span,
            .ts-response-info span,
            .ts-response-action-row label { display:block; margin:8px 0 4px; }
            .ts-string-info .form-control,
            .ts-response-info .form-control,
            .ts-response-action-row .form-control { margin-bottom:8px; }
        }
    </style>

    <div class="ticket-form">
        <%-- Heading + Toolbar --%>
        <div class="row g-0 align-items-stretch ts-header">
            <div class="col d-flex align-items-center px-4">
                <strong class="ts-title">Ticket Manager</strong>
            </div>
            <div class="col-auto d-flex align-items-center justify-content-end flex-wrap ts-toolbar">
                <asp:Button ID="BtnTransmit" runat="server" Text="Transmit" UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ts-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnPost"     runat="server" Text="Post"     UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ts-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnNew"      runat="server" Text="New"      UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ts-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnSave"     runat="server" Text="Save"     UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ts-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnDelete"   runat="server" Text="Delete"   UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ts-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnEdit"     runat="server" Text="Edit"     UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ts-command-btn" OnClientClick="return false;" />
                <asp:Button ID="BtnPrint"    runat="server" Text="Print"    UseSubmitBehavior="false" CssClass="btn btn-sm btn-outline-secondary rounded-0 ts-command-btn" OnClientClick="return false;" />
            </div>
        </div>

    <%-- Tab Navigation --%>
    <ul class="ts-tabs" id="tsTabNav">
        <li><asp:Button runat="server" Text="New Ticket"         UseSubmitBehavior="false" CssClass="ts-tab-btn active" OnClientClick="showTab('pane-newticket',this);      return false;" /></li>
        <li><asp:Button runat="server" Text="Response on Ticket" UseSubmitBehavior="false" CssClass="ts-tab-btn"        OnClientClick="showTab('pane-responseticket',this); return false;" /></li>
        <li><asp:Button runat="server" Text="Ticket String"      UseSubmitBehavior="false" CssClass="ts-tab-btn"        OnClientClick="showTab('pane-ticketstring',this);   return false;" /></li>
        <li><asp:Button runat="server" Text="Ticket Status"      UseSubmitBehavior="false" CssClass="ts-tab-btn"        OnClientClick="showTab('pane-ticketstatus',this);   return false;" /></li>
    </ul>

    <%-- Tab Content --%>
    <div class="ts-tab-content" id="tsTabContent">

        <%-- New Ticket Tab --%>
        <div class="ts-pane active" id="pane-newticket">

            <div class="d-flex justify-content-end gap-4 mb-3">
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0" for="TxtNtId">Ticket ID:</label>
                    <asp:TextBox ID="TxtNtId" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:130px;" />
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0" for="TxtNtDate">Date:</label>
                    <asp:TextBox ID="TxtNtDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:130px;" placeholder="mm/dd/yyyy" />
                </div>
            </div>

            <div class="ts-nt-nature-grid">
                <div class="form-check form-check-inline mb-0 ts-choice">
                    <asp:RadioButton ID="ntCritical"  runat="server" ClientIDMode="Static" GroupName="ntNature" CssClass="form-check-input" />
                    <label class="form-check-label small" for="ntCritical">Critically Urgent</label>
                </div>
                <div class="form-check form-check-inline mb-0 ts-choice">
                    <asp:RadioButton ID="ntImportant" runat="server" ClientIDMode="Static" GroupName="ntNature" CssClass="form-check-input" Checked="true" />
                    <label class="form-check-label small" for="ntImportant">Important</label>
                </div>
                <div class="form-check form-check-inline mb-0 ts-choice">
                    <asp:RadioButton ID="ntRegular"   runat="server" ClientIDMode="Static" GroupName="ntNature" CssClass="form-check-input" />
                    <label class="form-check-label small" for="ntRegular">Regular</label>
                </div>
            </div>

            <div class="ts-nt-close-grid">
                <label class="small fw-semibold mb-0">Ticket Closing Time Requested (Time &amp; Date):</label>
                <asp:TextBox ID="TxtNtCloseTime" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" />
                <asp:TextBox ID="TxtNtCloseDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
                <span></span>
            </div>

            <div class="border p-2 mb-3 ts-newticket-info">

                <div class="ts-newticket-row">
                    <div class="form-check mb-0 ts-choice" style="min-width:210px;">
                        <asp:RadioButton ID="ntMaintenance" runat="server" ClientIDMode="Static" GroupName="ntTicketType" CssClass="form-check-input" />
                        <label class="form-check-label" for="ntMaintenance">Maintanance Ticket Location:</label>
                    </div>
                    <label class="mb-0 small">Building</label>
                    <asp:TextBox ID="TxtNtBuilding"   runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" />
                    <label class="mb-0 small">Floor</label>
                    <asp:TextBox ID="TxtNtFloor"      runat="server" CssClass="form-control form-control-sm rounded-0" style="width:65px;" />
                    <label class="mb-0 small">Room</label>
                    <asp:TextBox ID="TxtNtRoom"       runat="server" CssClass="form-control form-control-sm rounded-0" style="width:65px;" />
                    <label class="mb-0 small">Hardware Id</label>
                    <asp:TextBox ID="TxtNtHardwareId" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:85px;" />
                </div>

                <div class="ts-newticket-row">
                    <div class="form-check mb-0 ts-choice" style="min-width:210px;">
                        <asp:RadioButton ID="ntMachine" runat="server" ClientIDMode="Static" GroupName="ntTicketType" CssClass="form-check-input" />
                        <label class="form-check-label" for="ntMachine">Machine Ticket Location:</label>
                    </div>
                    <label class="mb-0 small">Factory</label>
                    <asp:TextBox ID="TxtNtFactory"   runat="server" CssClass="form-control form-control-sm rounded-0" style="width:90px;" />
                    <label class="mb-0 small">Machine Id</label>
                    <asp:TextBox ID="TxtNtMachineId" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:90px;" />
                </div>

                <div class="ts-newticket-row">
                    <div class="form-check mb-0 ts-choice" style="min-width:210px;">
                        <asp:RadioButton ID="ntERP" runat="server" ClientIDMode="Static" GroupName="ntTicketType" CssClass="form-check-input" Checked="true" />
                        <label class="form-check-label" for="ntERP">ERP Ticket:</label>
                    </div>
                    <label class="mb-0 small">Module</label>
                    <asp:TextBox ID="TxtNtModule"  runat="server" CssClass="form-control form-control-sm rounded-0" style="width:100px;" />
                    <label class="mb-0 small">Form #</label>
                    <asp:TextBox ID="TxtNtFormNum" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:90px;" />
                </div>

                <div class="ts-newticket-row">
                    <div class="form-check mb-0 ts-choice" style="min-width:210px;">
                        <asp:RadioButton ID="ntProduct" runat="server" ClientIDMode="Static" GroupName="ntTicketType" CssClass="form-check-input" />
                        <label class="form-check-label" for="ntProduct">Product Ticket:</label>
                    </div>
                    <label class="mb-0 small">Product Category</label>
                    <asp:TextBox ID="TxtNtProductCat" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:95px;" />
                    <label class="mb-0 small">Product</label>
                    <asp:TextBox ID="TxtNtProduct"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:85px;" />
                    <label class="mb-0 small">Model</label>
                    <asp:TextBox ID="TxtNtModel"      runat="server" CssClass="form-control form-control-sm rounded-0" style="width:75px;" />
                    <label class="mb-0 small">Part</label>
                    <asp:TextBox ID="TxtNtPart"       runat="server" CssClass="form-control form-control-sm rounded-0" style="width:75px;" />
                </div>

            </div>

            <div class="ts-nt-remarks-grid">
                <label class="small fw-semibold mb-0 mt-1">Ticket Remarks &amp; Details:</label>
                <asp:TextBox ID="TxtNtRemarks" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="4" style="resize:vertical; width:100%;" />
            </div>

            <div class="row g-2 justify-content-end">
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Attach File / Picture</span>
                        <asp:FileUpload ID="FuNtAttach" runat="server" CssClass="form-control form-control-sm rounded-0" style="font-size:0.8rem;" />
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Note</span>
                        <asp:TextBox ID="TxtNtNote" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="2" style="flex:1; resize:none;" />
                    </div>
                </div>
            </div>

        </div>

        <%-- Response on Ticket Tab --%>
        <div class="ts-pane" id="pane-responseticket">

            <div class="d-flex justify-content-end gap-4 mb-3 flex-wrap">
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0" for="DdlRtTicketName">Select Ticket Name</label>
                    <asp:DropDownList ID="DdlRtTicketName" runat="server" CssClass="form-select form-select-sm rounded-0" style="width:180px;">
                        <asp:ListItem Value="">-- Select --</asp:ListItem>
                        <asp:ListItem>Building Maintanance</asp:ListItem>
                        <asp:ListItem>Machine Maintanance</asp:ListItem>
                        <asp:ListItem>ERP Ticket</asp:ListItem>
                        <asp:ListItem>Product Ticket</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0" for="TxtRtDate">Date:</label>
                    <asp:TextBox ID="TxtRtDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:130px;" placeholder="mm/dd/yyyy" />
                </div>
            </div>

            <div class="border p-2 mb-3 ts-response-info">
                <div class="ts-response-grid">
                    <span class="fw-semibold">Ticket ID:</span>
                    <asp:TextBox ID="TxtRtTicketId" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" />
                    <span class="fw-semibold">Assigned To:</span>
                    <asp:TextBox ID="TxtRtAssignedTo" runat="server" CssClass="form-control form-control-sm rounded-0" />
                </div>
                <div class="ts-response-grid mt-2">
                    <span class="fw-semibold">Type of Ticket:</span>
                    <asp:TextBox ID="TxtRtTicketType" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:200px;" />
                    <span class="fw-semibold">Ticket Name:</span>
                    <asp:TextBox ID="TxtRtTicketName" runat="server" CssClass="form-control form-control-sm rounded-0" />
                </div>
                <div class="ts-response-target-grid">
                    <span class="fw-semibold">Ticket Completion Target Time &amp; Date:</span>
                    <asp:TextBox ID="TxtRtTargetTime" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" />
                    <asp:TextBox ID="TxtRtTargetDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
                    <span></span>
                </div>
                <div class="ts-response-details-grid">
                    <span class="fw-semibold">Remarks &amp; Details:</span>
                    <asp:TextBox ID="TxtRtDetails" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="2" style="resize:vertical; width:100%;" />
                </div>
            </div>

            <div class="border p-2 ts-response-actions">
                <h6 class="fw-bold mb-3">Actions</h6>

                <%-- Response by Receiver --%>
                <div class="row g-0 mb-3">
                    <div class="col-auto pe-3 pt-1" style="min-width:140px;"><span class="small fw-semibold">Response<br />by Receiver</span></div>
                    <div class="col d-flex flex-column gap-2">
                        <div class="ts-response-action-row">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <asp:RadioButton ID="rcvr1" runat="server" ClientIDMode="Static" GroupName="rcvrResponse" CssClass="form-check-input" Checked="true" />
                                <label class="form-check-label small" for="rcvr1">Received well and will Finished up by</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtRcvr1Time" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtRcvr1Date" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                        </div>
                        <div class="ts-response-action-row">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <asp:RadioButton ID="rcvr2" runat="server" ClientIDMode="Static" GroupName="rcvrResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="rcvr2">Please Deffer Ticket until</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtRcvr2Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtRcvr2Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtRcvr2Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="ts-response-action-row">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <asp:RadioButton ID="rcvr3" runat="server" ClientIDMode="Static" GroupName="rcvrResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="rcvr3">Please Cancel the Ticket</label>
                            </div>
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtRcvr3Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="ts-response-action-row">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <asp:RadioButton ID="rcvr4" runat="server" ClientIDMode="Static" GroupName="rcvrResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="rcvr4">Ticket Finished</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtRcvr4Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtRcvr4Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtRcvr4Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                    </div>
                </div>

                <hr class="my-2" />

                <%-- Response by Creater --%>
                <div class="row g-0 mb-3">
                    <div class="col-auto pe-3 pt-1" style="min-width:140px;"><span class="small fw-semibold">Response<br />by Creater</span></div>
                    <div class="col d-flex flex-column gap-2">
                        <div class="ts-response-action-row">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <asp:RadioButton ID="creater1" runat="server" ClientIDMode="Static" GroupName="createrResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="creater1">Please Deffer until</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtCrtr1Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtCrtr1Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtCrtr1Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="ts-response-action-row">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <asp:RadioButton ID="creater2" runat="server" ClientIDMode="Static" GroupName="createrResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="creater2">Deffer request accepted</label>
                            </div>
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtCrtr2Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="ts-response-action-row">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <asp:RadioButton ID="creater3" runat="server" ClientIDMode="Static" GroupName="createrResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="creater3">Please Explain the Delay</label>
                            </div>
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtCrtr3Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="ts-response-action-row">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <asp:RadioButton ID="creater4" runat="server" ClientIDMode="Static" GroupName="createrResponse" CssClass="form-check-input" Checked="true" />
                                <label class="form-check-label small" for="creater4">Ticket Closed but having issues</label>
                            </div>
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtCrtr4Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                        <div class="ts-response-action-row">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <asp:RadioButton ID="creater5" runat="server" ClientIDMode="Static" GroupName="createrResponse" CssClass="form-check-input" />
                                <label class="form-check-label small" for="creater5">Ticket Closed</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtCrtr5Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtCrtr5Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtCrtr5Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                    </div>
                </div>

                <hr class="my-2" />

                <%-- Forwarded to Concerned Technicians --%>
                <div class="row g-0">
                    <div class="col-auto pe-3 pt-1" style="min-width:140px;"><span class="small fw-semibold">Forwarded<br />to Concerned<br />Technicians &amp;<br />Supervisors</span></div>
                    <div class="col d-flex flex-column gap-2">
                        <div class="ts-response-action-row">
                            <div class="form-check mb-0" style="min-width:280px;">
                                <asp:RadioButton ID="fwd1" runat="server" ClientIDMode="Static" GroupName="fwdResponse" CssClass="form-check-input" Checked="true" />
                                <label class="form-check-label small" for="fwd1">Please Carry on the Ticket</label>
                            </div>
                            <label class="small mb-0">Time</label>
                            <asp:TextBox ID="TxtFwd1Time"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:80px;" placeholder="HH:MM" />
                            <label class="small mb-0">Date</label>
                            <asp:TextBox ID="TxtFwd1Date"    runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" placeholder="mm/dd/yyyy" />
                            <label class="small mb-0">Remarks</label>
                            <asp:TextBox ID="TxtFwd1Remarks" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:180px;" />
                        </div>
                    </div>
                </div>

            </div>

            <div class="row g-2 justify-content-end mt-3">
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Upload Picture or File</span>
                        <asp:FileUpload ID="FuRtAttach" runat="server" CssClass="form-control form-control-sm rounded-0" style="font-size:0.8rem;" />
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Note</span>
                        <asp:TextBox ID="TxtRtNote" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="2" style="flex:1; resize:none;" />
                    </div>
                </div>
            </div>

        </div>

        <%-- Ticket String Tab --%>
        <div class="ts-pane" id="pane-ticketstring">

            <div class="d-flex justify-content-end gap-4 mb-3 flex-wrap">
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0" for="DdlTsTicketName">Select Task Name</label>
                    <asp:DropDownList ID="DdlTsTicketName" runat="server" CssClass="form-select form-select-sm rounded-0" style="width:180px;">
                        <asp:ListItem Value="">-- Select --</asp:ListItem>
                        <asp:ListItem>Building Maintanance</asp:ListItem>
                        <asp:ListItem>Machine Maintanance</asp:ListItem>
                        <asp:ListItem>ERP Ticket</asp:ListItem>
                        <asp:ListItem>Product Ticket</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="d-flex align-items-center gap-2">
                    <label class="small fw-semibold mb-0" for="TxtTsDate">Date:</label>
                    <asp:TextBox ID="TxtTsDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:130px;" placeholder="mm/dd/yyyy" />
                </div>
            </div>

            <div class="border p-2 mb-3 ts-string-info">
                <div class="ts-string-grid">
                    <span class="fw-semibold">Ticket ID:</span>
                    <asp:TextBox ID="TxtTsTicketId" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:110px;" />
                    <span class="fw-semibold">Assigned To:</span>
                    <asp:TextBox ID="TxtTsAssignedTo" runat="server" CssClass="form-control form-control-sm rounded-0" />
                </div>
                <div class="ts-string-grid mt-2">
                    <span class="fw-semibold">Field Assignment To:</span>
                    <asp:TextBox ID="TxtTsFieldAssignment" runat="server" CssClass="form-control form-control-sm rounded-0" style="grid-column:2 / 5;" />
                </div>
                <div class="ts-string-grid mt-2">
                    <span class="fw-semibold">Type of Ticket:</span>
                    <asp:TextBox ID="TxtTsTicketType" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:200px;" />
                    <span class="fw-semibold">Ticket Name:</span>
                    <asp:TextBox ID="TxtTsTicketName" runat="server" CssClass="form-control form-control-sm rounded-0" />
                </div>
                <div class="ts-string-target-grid">
                    <span class="fw-semibold">Ticket Closing Target Time:</span>
                    <asp:TextBox ID="TxtTsTargetTime" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" />
                    <asp:TextBox ID="TxtTsTargetDate" runat="server" CssClass="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
                    <span></span>
                </div>
                <div class="ts-string-details-grid">
                    <span class="fw-semibold">Remarks &amp; Details:</span>
                    <asp:TextBox ID="TxtTsDetails" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="2" style="resize:vertical; width:100%;" />
                </div>
            </div>

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
                        <tr><td class="text-nowrap">12:34 Pm</td><td class="text-nowrap">Jan 01, 2026</td><td>Created</td><td>-</td><td>Created</td></tr>
                        <tr><td class="text-nowrap">12:39 Pm</td><td class="text-nowrap">Jan 01, 2026</td><td>Responsed</td><td>Ticket Accepted</td><td>-</td></tr>
                        <tr><td class="text-nowrap">3:05 Pm</td><td class="text-nowrap">Jan 01, 2026</td><td>Delayed</td><td>Changed Completion Time</td><td>-</td></tr>
                        <tr><td class="text-nowrap">4:10 Pm</td><td class="text-nowrap">Jan 01, 2026</td><td>Delay Accepted</td><td>-</td><td>Delay Accepted</td></tr>
                        <tr><td class="text-nowrap">10:19 Am</td><td class="text-nowrap">Jan 02, 2026</td><td>Task Finished</td><td>Ticket Finished Submitted</td><td>-</td></tr>
                        <tr><td class="text-nowrap">11:10 Am</td><td class="text-nowrap">Jan 02, 2026</td><td>Task Finished Accepted</td><td>-</td><td>Ticket Closed</td></tr>
                    </tbody>
                </table>
            </div>

            <div class="row g-2 justify-content-end mt-3">
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Attached File / Picture</span>
                        <asp:FileUpload ID="FuTsAttach" runat="server" CssClass="form-control form-control-sm rounded-0" style="font-size:0.8rem;" />
                    </div>
                </div>
                <div class="col-md-5">
                    <div class="border p-2 d-flex flex-column" style="height:90px;">
                        <span class="small fw-semibold mb-1">Note</span>
                        <asp:TextBox ID="TxtTsNote" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm rounded-0" Rows="2" style="flex:1; resize:none;" />
                    </div>
                </div>
            </div>

        </div>

        <%-- Ticket Status Tab --%>
        <div class="ts-pane" id="pane-ticketstatus">

            <div class="ts-status-options pb-2 border-bottom">

                <div class="ts-status-priority-grid">
                    <div class="form-check mb-0 ts-choice">
                        <asp:CheckBox ID="ChkTsCritical"  runat="server" ClientIDMode="Static" CssClass="form-check-input" />
                        <label class="form-check-label small" for="ChkTsCritical">Critically Urgent</label>
                    </div>
                    <div class="form-check mb-0 ts-choice">
                        <asp:CheckBox ID="ChkTsImportant" runat="server" ClientIDMode="Static" CssClass="form-check-input" Checked="true" />
                        <label class="form-check-label small" for="ChkTsImportant">Important</label>
                    </div>
                    <div class="form-check mb-0 ts-choice">
                        <asp:CheckBox ID="ChkTsRegular"   runat="server" ClientIDMode="Static" CssClass="form-check-input" />
                        <label class="form-check-label small" for="ChkTsRegular">Regular</label>
                    </div>
                    <div class="form-check mb-0 ts-choice">
                        <asp:CheckBox ID="ChkTsAll"       runat="server" ClientIDMode="Static" CssClass="form-check-input" />
                        <label class="form-check-label small" for="ChkTsAll">All</label>
                    </div>
                </div>

                <div>
                    <div class="ts-status-type-grid">
                        <div class="form-check form-check-inline mb-0 ts-choice">
                            <asp:RadioButton ID="radAllTickets"   runat="server" ClientIDMode="Static" GroupName="radTicketType" CssClass="form-check-input" Checked="true" />
                            <label class="form-check-label small" for="radAllTickets">All Tickets</label>
                        </div>
                        <div class="form-check form-check-inline mb-0 ts-choice">
                            <asp:RadioButton ID="radMachineMaint" runat="server" ClientIDMode="Static" GroupName="radTicketType" CssClass="form-check-input" />
                            <label class="form-check-label small" for="radMachineMaint">Machine Maintanance Tickets</label>
                        </div>
                        <div class="form-check form-check-inline mb-0 ts-choice">
                            <asp:RadioButton ID="radMaintenance"  runat="server" ClientIDMode="Static" GroupName="radTicketType" CssClass="form-check-input" />
                            <label class="form-check-label small" for="radMaintenance">Maintanance Tickets</label>
                        </div>
                        <div class="form-check form-check-inline mb-0 ts-choice">
                            <asp:RadioButton ID="radERP"     runat="server" ClientIDMode="Static" GroupName="radTicketType" CssClass="form-check-input" />
                            <label class="form-check-label small" for="radERP">ERP Tickets</label>
                        </div>
                        <div class="form-check form-check-inline mb-0 ts-choice">
                            <asp:RadioButton ID="radProduct" runat="server" ClientIDMode="Static" GroupName="radTicketType" CssClass="form-check-input" />
                            <label class="form-check-label small" for="radProduct">Product Tickets</label>
                        </div>
                        <span class="ts-grid-spacer"></span>
                    </div>
                    <div class="ts-status-state-grid">
                        <div class="form-check form-check-inline mb-0 ts-choice">
                            <asp:RadioButton ID="radOpen"      runat="server" ClientIDMode="Static" GroupName="radTicketStatus" CssClass="form-check-input" Checked="true" />
                            <label class="form-check-label small" for="radOpen">Open</label>
                        </div>
                        <div class="form-check form-check-inline mb-0 ts-choice">
                            <asp:RadioButton ID="radClosed"    runat="server" ClientIDMode="Static" GroupName="radTicketStatus" CssClass="form-check-input" />
                            <label class="form-check-label small" for="radClosed">Closed</label>
                        </div>
                        <div class="form-check form-check-inline mb-0 ts-choice">
                            <asp:RadioButton ID="radDeffered"  runat="server" ClientIDMode="Static" GroupName="radTicketStatus" CssClass="form-check-input" />
                            <label class="form-check-label small" for="radDeffered">Deffered</label>
                        </div>
                        <div class="form-check form-check-inline mb-0 ts-choice">
                            <asp:RadioButton ID="radDelayed"   runat="server" ClientIDMode="Static" GroupName="radTicketStatus" CssClass="form-check-input" />
                            <label class="form-check-label small" for="radDelayed">Delayed</label>
                        </div>
                        <div class="form-check form-check-inline mb-0 ts-choice">
                            <asp:RadioButton ID="radAllStatus" runat="server" ClientIDMode="Static" GroupName="radTicketStatus" CssClass="form-check-input" />
                            <label class="form-check-label small" for="radAllStatus">All</label>
                        </div>
                    </div>
                </div>

            </div>

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
                            <td class="fw-bold">2345</td><td class="text-nowrap fw-bold">Jan 01, 2016</td>
                            <td class="fw-bold">Property Id<br />Flr &amp; Room#<br />Hardware Id</td>
                            <td class="fw-bold">Building<br />Corrective<br />Maintanance</td>
                            <td class="fw-bold">Asst Manger<br />Maintanance<br />Zaman Khan</td>
                            <td class="fw-bold">Asst Manger<br />Production<br />Saleem Ahmed</td>
                            <td>In Process</td><td></td>
                        </tr>
                        <tr>
                            <td>2346</td><td class="text-nowrap">Jan 01, 2016</td>
                            <td>Machine Id<br />Location</td><td>Machine<br />Corrective<br />Maintanance</td>
                            <td>Asst Manger<br />Maintanance<br />Zaman Khan</td>
                            <td>Asst Manger<br />Production<br />Saleem Ahmed</td>
                            <td>Respose<br />Required</td><td></td>
                        </tr>
                        <tr>
                            <td>2347</td><td class="text-nowrap">Jan 03, 2016</td>
                            <td>Form HR27</td><td>ERP<br />Ticket</td>
                            <td>Asst Manger<br />ERP Tickets<br />Kaleem</td>
                            <td>Asst Manger<br />Production<br />Saleem Ahmed</td>
                            <td>Delayed</td><td></td>
                        </tr>
                        <tr>
                            <td>2348</td><td class="text-nowrap">Jan 05, 2016</td>
                            <td>VN/Extractor</td><td>Product<br />Ticket</td>
                            <td>Asst Manger<br />D&amp;P D<br />Adnan Khan</td>
                            <td>Asst Manger<br />Production<br />Saleem Ahmed</td>
                            <td>In Process</td><td></td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>

    </div>

    <script type="text/javascript">
        function showTab(paneid, clickedBtn) {
            var panes = document.querySelectorAll('#tsTabContent .ts-pane');
            for (var i = 0; i < panes.length; i++) { panes[i].classList.remove('active'); }
            var btns = document.querySelectorAll('#tsTabNav .ts-tab-btn');
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

    </div>

</asp:Content>
