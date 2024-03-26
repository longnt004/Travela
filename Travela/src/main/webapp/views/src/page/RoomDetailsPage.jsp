<%@page import="java.util.ArrayList"%>
<%@page import="java.security.Provider.Service"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<jsp:include page="/views/src/component/Header.jsp">
	<jsp:param name="title" value="Travel Destination" />
	<jsp:param name="breadcrumb" value="Room Details" />
</jsp:include>

<%@ include file="/views/src/component/RoomDetails.jsp"%>
