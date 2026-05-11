<%@ Page Title="Meeting Management" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Meeting.aspx.vb" Inherits="POSSystem.Pages.Operations.Meeting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%-- Heading + Toolbar --%>
    <div class="d-flex align-items-center gap-2 mb-2 px-3 py-2 border flex-wrap" style="background-color:#f8f9fa;">
        <strong class="fs-5 me-2">Meeting Management</strong>
        <button type="button" id="btnManagerHR" class="btn btn-sm btn-outline-secondary rounded-0" onclick="setManager('hr')">Manager HR</button>
        <button type="button" id="btnManagerDept" class="btn btn-sm btn-outline-secondary rounded-0" onclick="setManager('dept')">Manager Department</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Verified</button>
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Save</button>
        <div class="ms-auto d-flex gap-2">
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">New</button>
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Delete</button>
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Edit</button>
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0">Print</button>
        </div>
    </div>

    <%-- Main content area --%>
    <div class="border p-3">
        <div class="row g-0" style="align-items:stretch;">

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
                        <input type="text" id="txtAdd_meetingtype" class="form-control form-control-sm rounded-0" style="width:200px"
                               oninput="document.getElementById('btnAdd_meetingtype').disabled = this.value.trim() === '';" />
                        <button type="button" id="btnAdd_meetingtype" class="btn btn-sm btn-outline-secondary rounded-0" disabled onclick="addItem('meetingtype')">Add</button>
                        <a href="#" class="text-secondary small" onclick="hideAddPanel('meetingtype'); return false;">Cancel</a>
                    </div>
                </div>
            </div>

            <%-- Ticket Response --%>
            <div class="col-md-6">
                <div class="border p-3 ms-md-2 d-flex flex-column" style="height:220px;">
                    <h6 class="fw-bold mb-2">Ticket Response</h6>
                    <ul id="list_response" class="list-unstyled mb-2" style="overflow-y:auto; flex:1; min-height:0;">
                        <li>Ticket Created</li>
                        <li>Rectification in Process</li>
                        <li>Ticket Accepted</li>
                        <li>Ticket Completion Time Request</li>
                        <li>CTicket Completion Time</li>
                        <li>Ticket Deffer Requested</li>
                        <li>Ticket Deffer Accepted</li>
                        <li>Ticket Deffer Rejected</li>
                        <li>Ticket Delay Requested</li>
                        <li>Ticket Delay Rejected</li>
                        <li>Ticket bDelay Accepted</li>
                        <li>Ticket Task Closed</li>
                        <li>Ticket Canceled By Creater</li>
                        <li>Ticket Cancel Request by Receiver</li>
                    </ul>
                    <button type="button" class="btn btn-sm btn-outline-secondary rounded-0" onclick="showAddPanel('response')">+ Add New</button>
                    <div id="addPanel_response" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                        <input type="text" id="txtAdd_response" class="form-control form-control-sm rounded-0" style="width:200px"
                               oninput="document.getElementById('btnAdd_response').disabled = this.value.trim() === '';" />
                        <button type="button" id="btnAdd_response" class="btn btn-sm btn-outline-secondary rounded-0" disabled onclick="addItem('response')">Add</button>
                        <a href="#" class="text-secondary small" onclick="hideAddPanel('response'); return false;">Cancel</a>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <script type="text/javascript">
        function setManager(type) {
            document.getElementById('btnManagerHR').className   = 'btn btn-sm rounded-0' + (type === 'hr'   ? ' btn-primary' : ' btn-outline-secondary');
            document.getElementById('btnManagerDept').className = 'btn btn-sm rounded-0' + (type === 'dept' ? ' btn-primary' : ' btn-outline-secondary');
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
    </script>

</asp:Content>
