<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/views/src/component/Header.jsp">
	<jsp:param name="title" value="Booking History" />
	<jsp:param name="breadcrumb" value="My Booking History" />
</jsp:include>

<%
request.getSession().setAttribute("historybookingDetailList", null);
%>


<div class="container-fluid destination py-5">
	<div class="row">
		<div class="col-lg-7">
			<div class="mb-2">
				<div class="border d-inline-block p-2 rounded-2">
					<div>
						<h6>Payment Status:</h6>
					</div>
					<span class="badge text-dark fs-5"
						style="background: rgba(201, 255, 229, 0.8)">Paid</span> <span
						class="badge text-dark fs-5"
						style="background: rgba(124, 185, 232, 0.3)">UnPaid</span>
				</div>
			</div>
			<div id="historyBookingTable">
			</div>
		</div>
		<div class="col-lg-5">
			<div class="border rounded-1 sticky-lg-top p-2"
				style="top: 4.5rem; z-index: 1">
				<div class="row px-3">
					<div class="col-lg-12 border-bottom mb-3">
						<h3>Booking Details</h3>
					</div>

					<div class="col-lg-12 mb-2">
						<h4>Rooms</h4>
						<div class="row">
							<div class="col-lg-12 d-flex flex-column gap-2 overflow-auto"
								id="historyBookingDetail" style="max-height: 18rem"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script type="text/javascript">
	function reload(url, component) {
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				component.html(xhr.responseText);
			}
		};

		xhr.open("GET", url, true);
		xhr.send();

	}

	reload("./views/src/component/HistoryBookingDetail.jsp",
			$("#historyBookingDetail"));
	reload("./views/src/component/HistoryBookingTable.jsp",
			$("#historyBookingTable"));

	function detailBooking(bId) {
		$.ajax({
			url : "/Travela/booking-history/detail-booking?bId=" + bId
		}).then(
				function(data) {
					reload("./views/src/component/HistoryBookingDetail.jsp",
							$("#historyBookingDetail"));
				})
	}
	function cancelBooking(bId) {
		$.ajax({
			url : "/Travela/booking-history/cancel-booking?bId=" + bId
		}).then(
				function(data) {
					reload("./views/src/component/HistoryBookingTable.jsp",
							$("#historyBookingTable"));
					reload("./views/src/component/HistoryBookingDetail.jsp",
							$("#historyBookingDetail"));
				})
	}
	
</script>