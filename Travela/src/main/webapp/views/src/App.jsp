<%@page import="com.travela.entity.User"%>
<%@page import="com.travela.util.RRShare"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Spinner Start -->
<%@ include file="./component/Spinner.jsp"%>
<!-- Spinner End -->
<!-- SuccessModal Start  -->
<%@ include file="./component/ModalSuccess.jsp"%>
<!-- SuccessModal End  -->

<c:choose>
	<c:when test="${empty sessionScope.user}">
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
		<jsp:include page="${requestScope.views}" />
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



