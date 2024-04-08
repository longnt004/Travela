<%@page import="java.util.HashMap"%>
<%@page import="com.travela.entity.BookingDetail"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<c:if test="${not empty historybookingDetailList}">
	<c:forEach var="bookingRoom" items="${historybookingDetailList}">
		<div class="border rounded gap-2 py-3">
			<div class="d-flex justify-content-between px-3">
				<div class="row">
					<div class="col-xl-5">
						<a href=""> <img class="img-fluid rounded" height="100"
							src="${bookingRoom.room.image}" alt="" />
						</a>
					</div>
					<div class="col-lg-7">
						<div class="d-flex flex-column justify-content-between px-2">
							<div>
								<h5>${bookingRoom.room.title}</h5>
							</div>
							<div class="align-self-end">
								<h6>
									<fmt:formatNumber type="number" pattern="###,###"
										value="${bookingRoom.room.price}" />
									<span class="fs-6">VND</span>/Night
								</h6>
							</div>
						</div>
						<span class="d-block border border-2 rounded"></span>
						<div class="p-2 pt-1 pb-0 row mt-auto">
							<div class="col-lg-6 d-flex align-items-center">
								<span class="fs-5">Quantity: </span> 

							</div>
							<div class="col-lg-6 d-flex">
								<input type="text"
									class="form-control text-center"
									placeholder="${bookingRoom.quantityBookingRoom}" disabled />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</c:if>