<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@include file="head.jsp"%>
<%@page import="java.sql.*;"  %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>ע���û�ҳ��</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<table width="900px" align="center">
  	
  	<%
  		Object memID=session.getAttribute("memID");
  		out.print("���ǳ����û�."+"<br>����ID:"+memID+"<br>");
  		Object rightID=session.getAttribute("rightID");
  		out.print("����Ȩ��ID:"+rightID);
  	 %>

	</table>
  </body>
</html>
