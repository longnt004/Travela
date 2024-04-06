<%@page import="com.travela.entity.User"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.travela.entity.BookingDetail"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
User user = (User) request.getSession().getAttribute("user");

Map<String, Map<String, BookingDetail>> allBookingDetailMap = (Map<String, Map<String, BookingDetail>>) request
		.getSession().getAttribute("allBookingDetailMap");
if (allBookingDetailMap == null) {
	allBookingDetailMap = new HashMap<>();
}

Map<String, BookingDetail> bookingDetailMap = allBookingDetailMap.get(user.getUserId());

int totalPrice = 0;
if (bookingDetailMap != null) {
	for (BookingDetail bd : bookingDetailMap.values()) {
		totalPrice += bd.getQuantityBookingRoom() * bd.getPrice();
	}
}

request.getSession().setAttribute("totalPrice", totalPrice);
%>


<c:if test="<%=bookingDetailMap != null%>">
	<c:forEach var="bookingRoom" items="<%=bookingDetailMap%>">
		<div class="border rounded gap-2 py-3">
			<div class="d-flex justify-content-between px-3">
				<div class="row">
					<div class="col-xl-5">
						<a href=""> <img class="img-fluid rounded" height="100"
							src="${bookingRoom.value.room.image}" alt="" />
						</a>
					</div>
					<div class="col-lg-7">
						<div class="d-flex flex-column justify-content-between px-2">
							<div>
								<h5>
									${bookingRoom.value.room.title}
									</h6>
							</div>
							<div class="align-self-end">
								<h6>
									<fmt:formatNumber type="number" pattern="###,###"
										value="${bookingRoom.value.room.price}" />
									<span class="fs-6">VND</span>/Night
								</h6>
							</div>
						</div>
						<span class="d-block border border-2 rounded"></span>
						<div class="p-2 pt-1 pb-0 row mt-auto">
							<div class="col-lg-6 d-flex gap-1">
								<a
									onclick="addRoom('${bookingRoom.value.room.roomId}', parseInt('${bookingRoom.value.room.price}'))"
									class="btn btn-primary">+</a> <input type="text"
									class="form-control text-center"
									placeholder="${bookingRoom.value.quantityBookingRoom}" disabled />
								<a
									onclick="minusRoom('${bookingRoom.value.room.roomId}', parseInt('${bookingRoom.value.room.price}'))"
									class="btn btn-primary">-</a>
							</div>
							<div class="col-lg-6">
								<a
									onclick="cancelRoom('${bookingRoom.value.room.roomId}',parseInt('${bookingRoom.value.room.price}'), parseInt('${bookingRoom.value.quantityBookingRoom}'))"
									class="btn btn-primary">Cancel</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</c:if>