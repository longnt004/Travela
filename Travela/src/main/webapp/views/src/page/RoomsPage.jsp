
<%@page import="com.travela.util.RRShare"%>
<%@page import="com.travela.entity.BookingDetail"%>
<%@page import="java.util.List"%>
<%@page import="com.travela.dao.impl.RoomDAOImpl"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/views/src/component/Header.jsp">
	<jsp:param name="title" value="Room Class" />
	<jsp:param name="breadcrumb" value="Room Classes" />
</jsp:include>


<%!RoomDAOImpl roomDAOImpl = new RoomDAOImpl();%>

<div class="container-fluid destination py-5">
	<div class="row g-4">
		<div class="col-lg-7">
			<div class="row gap-2">
				<c:forEach var="room" items="<%=roomDAOImpl.findAll()%>">
					<jsp:include page="/views/src/component/Room.jsp">
						<jsp:param name="roomId" value="${room.getRoomId()}" />
						<jsp:param name="imgURL" value="${room.getImage()}" />
						<jsp:param name="title" value="${room.getTitle()}" />
						<jsp:param name="price" value="${room.getPrice()}" />
						<jsp:param name="area" value="${room.getRoomArea()}" />
						<jsp:param name="bed" value="${room.getRoomBed()}" />
					</jsp:include>
				</c:forEach>
			</div>
		</div>
		<div class="col-lg-5">
			<div class="border rounded-1 sticky-lg-top p-2"
				style="top: 4.5rem; z-index: 1">
				<div class="row px-3">
					<div class="col-lg-12 border-bottom mb-3">
						<h3>Booking Details</h3>
					</div>
					<div class="col-lg-12 border-bottom mb-3">

						<div class="row mb-3">
							<div class="col-lg-6">
								<label for="" class="form-label">Check In</label> <input
									type="date" class="form-control" id="checkIn" />
							</div>
							<div class="col-lg-6">
								<label for="" class="form-label">Check Out</label> <input
									type="date" class="form-control" id="checkOut" />
							</div>
						</div>

					</div>
					<div class="col-lg-12 mb-2">
						<h4>Rooms</h4>
						<div class="row">
							<div class="col-lg-12 d-flex flex-column gap-2 overflow-auto"
								id="bookingDetail" style="max-height: 18rem">
								<%-- Total price: <fmt:formatNumber type='number' pattern='###,###' value='${sessionScope.totalPrice}' /> VND --%>
							</div>
						</div>
					</div>

					<div class="col-lg-12">
						<div class="d-flex">
							<h4 id="totalPrice"></h4>
							<button onclick="bookingRoom()" class="btn btn-primary ms-auto">Booking</button>
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
	var totalPrice = ${sessionScope.totalPrice}+0;
	function reload(url, component) {
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				component.html(xhr.responseText);
				$('#totalPrice').html(
						"Total price: " + totalPrice.toLocaleString('it-IT', {
							style : 'currency',
							currency : 'VND'
						}));
			}
		};

		xhr.open("GET", url, true);
		xhr.send();

	}

	reload("./views/src/component/BookingDetail.jsp", $("#bookingDetail"));

	function addRoom(rId, totalPriceInput) {
		$.ajax({
			url : "/Travela/room/add-room?rId=" + rId
		}).then(
				function(data) {
					reload("./views/src/component/BookingDetail.jsp",
							$("#bookingDetail"));
					totalPrice += totalPriceInput;
				})
	}

	function minusRoom(rId, totalPriceInput) {
		$.ajax({
			url : "/Travela/room/minus-room?rId=" + rId
		}).then(
				function(data) {
					reload("./views/src/component/BookingDetail.jsp",
							$("#bookingDetail"));
					totalPrice -= totalPriceInput;
				})
	}

	function cancelRoom(rId, totalPriceInput, quantityInput) {
		$.ajax({
			url : "/Travela/room/cancel-room?rId=" + rId
		}).then(
				function(data) {
					reload("./views/src/component/BookingDetail.jsp",
							$("#bookingDetail"));
					totalPrice -= (totalPriceInput * quantityInput);
				})
	}

	if (window.location.href.includes("paid=true")) {
		booking(true);
		window.history.replaceState(null, null, "/Travela/rooms");
	}

	function bookingRoom() {
		var checkIn = $('#checkIn').val();
		var checkOut = $('#checkOut').val();
		if (checkIn && checkOut) {
			paymentModal.show();
			$('#paymentVNPay').attr('href',
					"/Travela/payment-vnpay?amount=" + totalPrice)
			$('#paymentPayPal').attr('href',
					"/Travela/payment-paypal?amount=" + totalPrice)
			sessionStorage.setItem("checkIn", checkIn);
			sessionStorage.setItem("checkOut", checkOut);
		} else {
			errorBokingModal.show();
		}
		/* if ($('#checkIn').val() != "" || $('#check Out').val() != "") {
			$.ajax(
					{
						url : "/Travela/room/booking?checkIn="
								+ $('#checkIn').val() + "&checkOut="
								+ $('#checkOut').val()
					}).then(
					function(data) {
						/* reload("./views/src/component/BookingDetail.jsp",
								$("#bookingDetail"));
						totalPrice = 0; 
						paymentModal.show();
						$('#paymentVNPay').attr('href', "/Travela/payment-vnpay?amount="+totalPrice)
					})
		} else {
			errorBokingModal.show();
		} */
	}

	function booking(paid) {
		$.ajax(
				{
					url : "/Travela/room/booking?checkIn="
							+ sessionStorage.getItem("checkIn") + "&checkOut="
							+ sessionStorage.getItem("checkOut") + "&paid="
							+ paid
				}).then(
				function(data) {
					reload("./views/src/component/BookingDetail.jsp",
							$("#bookingDetail"));
					totalPrice = 0;
					successBokingModal.show();
					sessionStorage.clear();
				})
	}
</script>