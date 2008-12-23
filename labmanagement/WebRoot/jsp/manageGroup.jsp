<%@ page language="java" contentType="text/html charset=gb2312" %> 
<%@ page pageEncoding="gb2312"%>
<%@ page import="java.sql.*"%>
<%@ include file="head.jsp"%>
<html>
	<body>
			<%
   		out.print(request.getParameter("groupID"));
   	 %>
	</body>
</html>
