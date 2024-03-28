<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Spinner Start -->
<%@ include file="./component/Spinner.jsp"%>
<!-- Spinner End -->

<c:choose>
	<c:when test="${requestScope.LoginPage || requestScope.RegisterPage}">
		<%@ include file="./page/auth/AuthPage.jsp"%>
	</c:when>
	<c:otherwise>
		<!-- Topbar Start -->
		<%@ include file="./component/Topbar.jsp"%>
		<!-- Topbar End -->

		<!-- Navbar Start -->
		<%@ include file="./component/Navbar.jsp"%>
		<!-- Navbar End -->

		<!-- Container Start -->
		<c:choose>
			<c:when test="${requestScope.HomePage}">
				<%@ include file="./page/HomePage.jsp"%>
			</c:when>
			<c:when test="${requestScope.RoomsPage}">
				<%@ include file="./page/RoomsPage.jsp"%>
			</c:when>
			<c:when test="${requestScope.RoomDetailsPage}">
				<%@ include file="./page/RoomDetailsPage.jsp"%>
			</c:when>
			<c:when test="${requestScope.TourPage}">
				<%@ include file="./page/TourPage.jsp"%>
			</c:when>
			<c:when test="${requestScope.ProfilePage}">
				<%@ include file="./page/ProfilePage.jsp"%>
			</c:when>
		</c:choose>
		<!-- Container End -->

		<!-- Back to Top -->
		<a href="#"
			class="btn btn-primary btn-primary-outline-0 btn-md-square back-to-top"><i
			class="fa fa-arrow-up"></i></a>


		<!-- Footer Start -->
		<%@ include file="./component/Footer.jsp"%>
		<!-- Footer End -->
	</c:otherwise>
</c:choose>



