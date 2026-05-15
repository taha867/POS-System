<%@ Control Language="VB" AutoEventWireup="true" CodeBehind="TicketStatusTab.ascx.vb" Inherits="POSSystem.Pages.Operations.TicketSetupControls.TicketStatusTab" %>

<%-- Filter Row 1: Ticket Nature (left) + Ticket Type radio buttons (right) --%>
<div class="d-flex gap-4 mb-2 pb-2 border-bottom flex-wrap align-items-start">

    <%-- Checkboxes: ticket nature --%>
    <div class="d-flex flex-column gap-1">
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="chkCritical" />
            <label class="form-check-label small" for="chkCritical">Critically Urgent</label>
        </div>
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="chkImportant" checked />
            <label class="form-check-label small" for="chkImportant">Important</label>
        </div>
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="chkRegular" />
            <label class="form-check-label small" for="chkRegular">Regular</label>
        </div>
        <div class="form-check mb-0">
            <input class="form-check-input" type="checkbox" id="chkAll" />
            <label class="form-check-label small" for="chkAll">All</label>
        </div>
    </div>

    <%-- Radio buttons: ticket type + status --%>
    <div class="d-flex flex-column gap-2">
        <%-- Ticket type row 1 --%>
        <div class="d-flex gap-3 flex-wrap">
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radTicketType" id="radAllTickets" checked />
                <label class="form-check-label small" for="radAllTickets">All Tickets</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radTicketType" id="radMachineMaint" />
                <label class="form-check-label small" for="radMachineMaint">Machine Maintanance Tickets</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radTicketType" id="radMaintenance" />
                <label class="form-check-label small" for="radMaintenance">Maintanance Tickets</label>
            </div>
        </div>
        <%-- Ticket type row 2 --%>
        <div class="d-flex gap-3 flex-wrap">
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radTicketType" id="radERP" />
                <label class="form-check-label small" for="radERP">ERP Tickets</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radTicketType" id="radProduct" />
                <label class="form-check-label small" for="radProduct">Product Tickets</label>
            </div>
        </div>
        <%-- Status filter row --%>
        <div class="d-flex gap-3 flex-wrap">
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radTicketStatus" id="radOpen" checked />
                <label class="form-check-label small" for="radOpen">Open</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radTicketStatus" id="radClosed" />
                <label class="form-check-label small" for="radClosed">Closed</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radTicketStatus" id="radDeffered" />
                <label class="form-check-label small" for="radDeffered">Deffered</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radTicketStatus" id="radDelayed" />
                <label class="form-check-label small" for="radDelayed">Delayed</label>
            </div>
            <div class="form-check form-check-inline mb-0">
                <input class="form-check-input" type="radio" name="radTicketStatus" id="radAllStatus" />
                <label class="form-check-label small" for="radAllStatus">All</label>
            </div>
        </div>
    </div>

</div>

<%-- Ticket grid --%>
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
                    <td class="fw-bold">2345</td>
                    <td class="text-nowrap fw-bold">Jan 01, 2016</td>
                    <td class="fw-bold">Property Id<br />Flr &amp; Room#<br />Hardware Id</td>
                    <td class="fw-bold">Building<br />Corrective<br />Maintanance</td>
                    <td class="fw-bold">Asst Manger<br />Maintanance<br />Zaman Khan</td>
                    <td class="fw-bold">Asst Manger<br />Production<br />Saleem Ahmed</td>
                    <td>In Process</td>
                    <td></td>
                </tr>
                <tr>
                    <td>2346</td>
                    <td class="text-nowrap">Jan 01, 2016</td>
                    <td>Machine Id<br />Location</td>
                    <td>Machine<br />Corrective<br />Maintanance</td>
                    <td>Asst Manger<br />Maintanance<br />Zaman Khan</td>
                    <td>Asst Manger<br />Production<br />Saleem Ahmed</td>
                    <td>Respose<br />Required</td>
                    <td></td>
                </tr>
                <tr>
                    <td>2347</td>
                    <td class="text-nowrap">Jan 03, 2016</td>
                    <td>Form HR27</td>
                    <td>ERP<br />Ticket</td>
                    <td>Asst Manger<br />ERP Tickets<br />Kaleem</td>
                    <td>Asst Manger<br />Production<br />Saleem Ahmed</td>
                    <td>Delayed</td>
                    <td></td>
                </tr>
                <tr>
                    <td>2348</td>
                    <td class="text-nowrap">Jan 05, 2016</td>
                    <td>VN/Extractor</td>
                    <td>Product<br />Ticket</td>
                    <td>Asst Manger<br />D&amp;P D<br />Adnan Khan</td>
                    <td>Asst Manger<br />Production<br />Saleem Ahmed</td>
                    <td>In Process</td>
                    <td></td>
                </tr>
            </tbody>
        </table>
</div>
