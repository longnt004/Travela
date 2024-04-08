<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Travela</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta content="" name="keywords" />
<meta content="" name="description" />

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600&family=Roboto&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet" />
<link href="./views/src/css/bootstrap.min.css" rel="stylesheet" />
<link href="./views/src/css/style.css" rel="stylesheet" />
</head>

<body>

	<%@ include file="./src/App.jsp"%>

	<!-- JavaScript Libraries -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Template Javascript -->
	<script src="./views/src/js/main.js"></script>
	<script type="text/javascript">
		var successBokingModal = new bootstrap.Modal(document.getElementById("statusSuccessModal"), {});
		var errorBokingModal = new bootstrap.Modal(document.getElementById("statusErrorsModal"), {});
		var paymentModal = new bootstrap.Modal(document.getElementById("statusPaymentModal"), {});
		
		/* var totalPrice = ${sessionScope.totalPrice}+0;

		function reload(url, component) {
			var xhr = new XMLHttpRequest();
			xhr.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					component.html(xhr.responseText);
					$('#totalPrice').html(
							"Total price: "
									+ totalPrice.toLocaleString('it-IT', {
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

		function bookingRoom() {
			if($('#checkIn').val() != "" || $('#checkOut').val() != ""){
				$.ajax(
						{
							url : "/Travela/room/booking?checkIn="
									+ $('#checkIn').val() + "&checkOut="
									+ $('#checkOut').val()
						}).then(
						function(data) {
							reload("./views/src/component/BookingDetail.jsp",
									$("#bookingDetail"));
							totalPrice = 0;
							successBokingModal.show();
						})
			} else {
				errorBokingModal.show();
			}
		} */
		
		/* function detailBooking(bdId) {
			$.ajax({
				url : "/Travela/booking-history/detail-booking?bdId=" + bdId
			}).then(
					function(data) {
						reload("./views/src/component/BookingDetail.jsp",
								$("#bookingDetail"));
					})
		} */
	</script>
</body>
</html>
