<%@ Control Language="VB" AutoEventWireup="true" CodeBehind="NewTicketTab.ascx.vb" Inherits="POSSystem.Pages.Operations.TicketSetupControls.NewTicketTab" %>

<%-- Ticket ID + Date (top-right) --%>
<div class="d-flex justify-content-end gap-4 mb-3">
    <div class="d-flex align-items-center gap-2">
        <label class="small fw-semibold mb-0">Ticket ID:</label>
        <input type="text" class="form-control form-control-sm rounded-0" style="width:130px;" />
    </div>
    <div class="d-flex align-items-center gap-2">
        <label class="small fw-semibold mb-0">Date:</label>
        <input type="text" class="form-control form-control-sm rounded-0" style="width:130px;" placeholder="mm/dd/yyyy" />
    </div>
</div>

<%-- Radio Row: Ticket Nature --%>
<div class="d-flex justify-content-center gap-4 mb-3">
    <div class="form-check form-check-inline mb-0">
        <input class="form-check-input" type="radio" name="ntNature" id="ntCritical" />
        <label class="form-check-label small" for="ntCritical">Critically Urgent</label>
    </div>
    <div class="form-check form-check-inline mb-0">
        <input class="form-check-input" type="radio" name="ntNature" id="ntImportant" checked />
        <label class="form-check-label small" for="ntImportant">Important</label>
    </div>
    <div class="form-check form-check-inline mb-0">
        <input class="form-check-input" type="radio" name="ntNature" id="ntRegular" />
        <label class="form-check-label small" for="ntRegular">Regular</label>
    </div>
</div>

<%-- Ticket Closing Time Requested --%>
<div class="d-flex align-items-center gap-2 mb-3">
    <label class="small fw-semibold mb-0">Ticket Closing Time Requested (Time &amp; Date):</label>
    <input type="text" class="form-control form-control-sm rounded-0" style="width:90px;" placeholder="HH:MM" />
    <input type="text" class="form-control form-control-sm rounded-0" style="width:120px;" placeholder="mm/dd/yyyy" />
</div>

<%-- Ticket Type Rows (radio + inline location / id fields) --%>
<div class="border p-2 mb-3" style="font-size:0.83rem;">

    <%-- Maintenance Ticket --%>
    <div class="d-flex align-items-center gap-2 mb-2 flex-wrap">
        <div class="form-check mb-0" style="min-width:210px;">
            <input class="form-check-input" type="radio" name="ntTicketType" id="ntMaintenance" />
            <label class="form-check-label" for="ntMaintenance">Maintanance Ticket Location:</label>
        </div>
        <label class="mb-0 small">Building</label>
        <input type="text" class="form-control form-control-sm rounded-0" style="width:80px;" />
        <label class="mb-0 small">Floor</label>
        <input type="text" class="form-control form-control-sm rounded-0" style="width:65px;" />
        <label class="mb-0 small">Room</label>
        <input type="text" class="form-control form-control-sm rounded-0" style="width:65px;" />
        <label class="mb-0 small">Hardware Id</label>
        <input type="text" class="form-control form-control-sm rounded-0" style="width:85px;" />
    </div>

    <%-- Machine Ticket --%>
    <div class="d-flex align-items-center gap-2 mb-2 flex-wrap">
        <div class="form-check mb-0" style="min-width:210px;">
            <input class="form-check-input" type="radio" name="ntTicketType" id="ntMachine" />
            <label class="form-check-label" for="ntMachine">Machine Ticket Location:</label>
        </div>
        <label class="mb-0 small">Factory</label>
        <input type="text" class="form-control form-control-sm rounded-0" style="width:90px;" />
        <label class="mb-0 small">Machine Id</label>
        <input type="text" class="form-control form-control-sm rounded-0" style="width:90px;" />
    </div>

    <%-- ERP Ticket --%>
    <div class="d-flex align-items-center gap-2 mb-2 flex-wrap">
        <div class="form-check mb-0" style="min-width:210px;">
            <input class="form-check-input" type="radio" name="ntTicketType" id="ntERP" checked />
            <label class="form-check-label" for="ntERP">ERP Ticket:</label>
        </div>
        <label class="mb-0 small">Module</label>
        <input type="text" class="form-control form-control-sm rounded-0" style="width:100px;" />
        <label class="mb-0 small">Form #</label>
        <input type="text" class="form-control form-control-sm rounded-0" style="width:90px;" />
    </div>

    <%-- Product Ticket --%>
    <div class="d-flex align-items-center gap-2 flex-wrap">
        <div class="form-check mb-0" style="min-width:210px;">
            <input class="form-check-input" type="radio" name="ntTicketType" id="ntProduct" />
            <label class="form-check-label" for="ntProduct">Product Ticket:</label>
        </div>
        <label class="mb-0 small">Product Category</label>
        <input type="text" class="form-control form-control-sm rounded-0" style="width:95px;" />
        <label class="mb-0 small">Product</label>
        <input type="text" class="form-control form-control-sm rounded-0" style="width:85px;" />
        <label class="mb-0 small">Model</label>
        <input type="text" class="form-control form-control-sm rounded-0" style="width:75px;" />
        <label class="mb-0 small">Part</label>
        <input type="text" class="form-control form-control-sm rounded-0" style="width:75px;" />
    </div>

</div>

<%-- Ticket Remarks & Details --%>
<div class="row g-2 mb-3 align-items-start">
    <div class="col-auto">
        <label class="small fw-semibold mb-0 mt-1">Ticket Remarks &amp; Details:</label>
    </div>
    <div class="col">
        <textarea class="form-control form-control-sm rounded-0" rows="4" style="resize:vertical;"></textarea>
    </div>
</div>

<%-- Attach File + Note (bottom-right) --%>
<div class="row g-2 justify-content-end">
    <div class="col-md-5">
        <div class="border p-2 d-flex flex-column" style="height:90px;">
            <span class="small fw-semibold mb-1">Attach File / Picture</span>
            <input type="file" class="form-control form-control-sm rounded-0" style="font-size:0.8rem;" />
        </div>
    </div>
    <div class="col-md-5">
        <div class="border p-2 d-flex flex-column" style="height:90px;">
            <span class="small fw-semibold mb-1">Note</span>
            <textarea class="form-control form-control-sm rounded-0" rows="2" style="flex:1; resize:none;"></textarea>
        </div>
    </div>
</div>
