<%@ Control Language="VB" AutoEventWireup="true" CodeBehind="MeetingManagementTab.ascx.vb" Inherits="POSSystem.Pages.Operations.MeetingManagementControls.MeetingManagementTab" %>

<%-- Section 1: Type of Meeting + Meeting Response --%>
<div class="row g-0 mb-3" style="align-items:stretch;">

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
                <input type="text" id="txtAdd_meetingtype" class="form-control form-control-sm rounded-0" style="width:200px;"
                       oninput="document.getElementById('btnAdd_meetingtype').disabled = this.value.trim() === '';" />
                <button type="button" id="btnAdd_meetingtype" class="btn btn-sm btn-outline-secondary rounded-0" disabled onclick="addItem('meetingtype')">Add</button>
                <a href="#" class="text-secondary small" onclick="hideAddPanel('meetingtype'); return false;">Cancel</a>
            </div>
        </div>
    </div>

    <%-- Meeting Response --%>
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
            <button type="button" class="btn btn-sm btn-outline-secondary rounded-0" onclick="showAddPanel('meetingresponse')">+ Add New</button>
            <div id="addPanel_meetingresponse" class="d-flex gap-2 align-items-center mt-2" style="display:none !important">
                <input type="text" id="txtAdd_meetingresponse" class="form-control form-control-sm rounded-0" style="width:200px;"
                       oninput="document.getElementById('btnAdd_meetingresponse').disabled = this.value.trim() === '';" />
                <button type="button" id="btnAdd_meetingresponse" class="btn btn-sm btn-outline-secondary rounded-0" disabled onclick="addItem('meetingresponse')">Add</button>
                <a href="#" class="text-secondary small" onclick="hideAddPanel('meetingresponse'); return false;">Cancel</a>
            </div>
        </div>
    </div>

</div>

<%-- Section 2: Meeting Called By --%>
<div class="border d-flex flex-column" style="height:270px; overflow:hidden;">
    <div class="px-3 py-2 border-bottom">
        <h6 class="fw-bold mb-0">Meeting Called By</h6>
    </div>
    <div class="d-flex" style="flex:1; min-height:0;">
        <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
            <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Type</div>
            <ul id="list_calledby_type" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                <li>Sales Meeting</li>
                <li>Management Meeting</li>
                <li>Board Meeting</li>
                <li>Vendor Meeting</li>
            </ul>
        </div>
        <div class="d-flex flex-column border-end" style="flex:1; min-width:0;">
            <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Designation</div>
            <ul id="list_calledby_desig" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                <li>Sales Manager</li>
                <li>General Manager</li>
                <li>Board Chairman</li>
                <li>Procurement Manager</li>
            </ul>
        </div>
        <div class="d-flex flex-column" style="flex:1; min-width:0;">
            <div class="small fw-semibold px-2 py-1 border-bottom" style="background:#f8f9fa;">Name</div>
            <ul id="list_calledby_name" class="list-unstyled mb-0 px-2 py-1" style="overflow-y:auto; flex:1; min-height:0;">
                <li>Adnan Khan</li>
                <li>Saleem Khan</li>
                <li>Ahsaan Ahmed</li>
                <li>Abdul Haq</li>
            </ul>
        </div>
    </div>
    <div class="border-top px-2 py-1">
        <button type="button" class="btn btn-sm btn-outline-secondary rounded-0" onclick="showAdd3Col('calledby')">+ Add New</button>
        <div id="addPanel_calledby" class="d-flex gap-2 align-items-center flex-wrap mt-1" style="display:none !important">
            <input type="text" id="txtAdd_calledby_type"  class="form-control form-control-sm rounded-0" placeholder="Type"        style="width:180px;" oninput="checkAdd3Col('calledby')" />
            <input type="text" id="txtAdd_calledby_desig" class="form-control form-control-sm rounded-0" placeholder="Designation" style="width:180px;" oninput="checkAdd3Col('calledby')" />
            <input type="text" id="txtAdd_calledby_name"  class="form-control form-control-sm rounded-0" placeholder="Name"        style="width:180px;" oninput="checkAdd3Col('calledby')" />
            <button type="button" id="btnAdd_calledby" class="btn btn-sm btn-outline-secondary rounded-0" disabled onclick="addItem3Col('calledby')">Add</button>
            <a href="#" class="text-secondary small" onclick="hideAddPanel('calledby'); return false;">Cancel</a>
        </div>
    </div>
</div>

<script type="text/javascript">
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
