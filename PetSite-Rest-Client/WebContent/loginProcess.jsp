<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true"%>
<%
	String id = request.getParameter("id");
	String type = request.getParameter("type");
	
	System.out.println("request.getParameter1 >>>>> "+id);
	System.out.println("request.getParameter2 >>>>> "+type);
	
	session.setAttribute("id", id);
	session.setAttribute("type", type);
	
	String id1 = (String) session.getAttribute("id");
	String type1 = (String) session.getAttribute("type");
	
	System.out.println("session.getAttribute >>>>> "+id1);
	System.out.println("session.getAttribute >>>>> "+type1);
%>