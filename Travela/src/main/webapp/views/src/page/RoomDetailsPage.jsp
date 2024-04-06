<%@page import="jakarta.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@page import="com.travela.dao.impl.RoomDAOImpl"%>
<%@page import="com.travela.entity.Room"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/views/src/component/Header.jsp">
	<jsp:param name="title" value="Room Classes" />
	<jsp:param name="breadcrumb" value="Room Details" />
</jsp:include>

<%@ include file="/views/src/component/RoomDetails.jsp"%>
