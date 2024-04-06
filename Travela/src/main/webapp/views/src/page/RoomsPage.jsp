
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
							<button onclick="bookingRoom()" class="btn btn-primary ms-auto" data-bs-toggle="modal"
								data-bs-target="#statusSuccessModal">Booking</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>