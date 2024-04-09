<%@page import="com.travela.dao.impl.BookingDAOImpl"%>
<%@page import="com.travela.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
User user = (User) request.getSession().getAttribute("user");
BookingDAOImpl bookingDAOImpl = new BookingDAOImpl();
%>

<table class="table">
	<thead>
		<tr>
			<th scope="col">#</th>
			<th scope="col">Booking Date</th>
			<th scope="col">Check In</th>
			<th scope="col">Check Out</th>
			<th scope="col">Total Price (VND)</th>
			<th scope="col" class="text-center">Status</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="booking"
			items="<%=bookingDAOImpl.findByUserId(user.getUserId())%>"
			varStatus="loop">
			<c:if test="${booking.getStatus() eq 'CANCEL' == false }">
				<c:choose>
					<c:when test="${booking.getPaymentStatus()}">
						<tr class="text-dark" style="background: rgba(201, 255, 229, 0.8)">
					</c:when>
					<c:otherwise>
						<tr class="text-dark" style="background: rgba(124, 185, 232, 0.3)">
					</c:otherwise>
				</c:choose>
				<td class="align-middle fw-bolder" scope="row">${loop.index + 1}</td>
				<td class="align-middle"><fmt:formatDate pattern="yyyy-MM-dd"
						value="${booking.getBookingDate()}" /></td>
				<td class="align-middle"><fmt:formatDate pattern="yyyy-MM-dd"
						value="${booking.getCheckIn()}" /></td>
				<td class="align-middle"><fmt:formatDate pattern="yyyy-MM-dd"
						value="${booking.getCheckOut()}" /></td>
				<c:set var="totalPrice" value="0" />
				<c:forEach var="bookingDetail"
					items="${booking.getBookingDetails()}">
					<c:set var="totalPrice"
						value="${bookingDetail.getPrice() * bookingDetail. getQuantityBookingRoom() + totalPrice}" />
				</c:forEach>
				<td class="align-middle text-end fw-bold"><fmt:formatNumber type="number"
						pattern="###,###" value="${totalPrice}" /></td>
				<td class="align-middle text-center" ><c:choose>
						<c:when test="${booking.getStatus() eq 'PENDING' }">
							<span class="badge bg-warning text-dark p-2">${booking.getStatus()}</span>
						</c:when>
						<c:when test="${booking.getStatus() eq 'APPROVED' }">
							<span class="badge bg-success p-2">${booking.getStatus()}</span>
						</c:when>
						<c:when test="${booking.getStatus() eq 'CANCEL' }">
							<span class="badge bg-danger p-2">${booking.getStatus()}</span>
						</c:when>
					</c:choose></td>
				<td class="align-middle">
					<button type="button" class="btn btn-secondary"
						style="padding: 2px 10px 2px 10px !important"
						onclick="detailBooking('${booking.getBookingId()}')">Details</button>
					<button type="button" class="btn btn-danger"
						style="padding: 2px 10px 2px 10px !important"
						onclick="cancelBooking('${booking.getBookingId()}')">Cancel</button>
				</td>
				</tr>
			</c:if>
		</c:forEach>
	</tbody>
</table>