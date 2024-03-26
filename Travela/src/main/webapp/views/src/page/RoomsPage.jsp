<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/views/src/component/Header.jsp">
	<jsp:param name="title" value="Travel Destination" />
	<jsp:param name="breadcrumb" value="Rooms" />
</jsp:include>

<div class="container-fluid destination py-5">
	<div class="row g-4">
		<jsp:include page="/views/src/component/Room.jsp">
			<jsp:param name="imgURL" value="./views/src/img/sgr3.jpg" />
			<jsp:param name="title" value="Single Room" />
			<jsp:param name="price" value="1500" />
			<jsp:param name="description" value="Single rooms are assigned to one people;
							expect one double bed, or two twin beds depending on the hotel." />
		</jsp:include>
	</div>
</div>