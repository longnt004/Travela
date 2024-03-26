<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<div class="container-fluid bg-breadcrumb">
	<div class="container text-center py-5" style="max-width: 900px">
		<h3 class="text-white display-3 mb-4">${param.title}</h3>
		<jsp:include page="./Breadcrumb.jsp">
			<jsp:param name="breadcrumb" value="${param.breadcrumb}" />
		</jsp:include>
	</div>
</div>