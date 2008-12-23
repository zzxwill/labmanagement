<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@include file="head.jsp"%>
<%@page import="java.sql.*;"  %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>资源页面</title>
    
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
  <table width="100%">
  <tr><th width="20%" align=left>资源描述</th><th width="20%" align=left>资源范畴</th><th width="20%" align=left>发布时间</th><th  width="20%" align=left>发布者</th></tr>

		<%	  Object id=session.getAttribute("memID");
		      Connection conn=null;
		      Statement stmt;
		      ResultSet res = null;
		      //加载Connector/J驱动
		      //这一句也可写为：Class.forName("com.mysql.jdbc.Driver");
		      Class.forName("com.mysql.jdbc.Driver").newInstance();
		      //建立到MySQL的连接
		      conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
		                                         "root", "zzxwill");
		      //执行SQL语句
		      
		      stmt = (Statement) conn.createStatement();
		       res = stmt.executeQuery("select * from  res1 ");
		       
		     int resID=0;
		     String resDes=null;
             String resCat=null;
             String resPub=null;
             String url=null;
             String memName=null;
            
             while (res.next()){
             out.print("<tr><td><a href='/labmanagement"+res.getString(5)+"'>"+res.getString(2)+"</a></td>");//resDes
		       out.print("<td>"+res.getString(3)+"文档</td>");//resCat
		       out.print("<td>"+res.getString(4)+"</td>");//resPub
		       out.print("<td>"+res.getString(6)+"</td></tr>");//memName
	
             resID=res.getInt(1);
             resDes=res.getString(2);
             resCat=res.getString(3);
             resPub=res.getString(4);
             url=res.getString(5);
             memName=res.getString(6);
             }
		      
%></table>

<p> </p> 
<p align="center">上传文件选择</p> 
<form method="post" action="do_upload.jsp" 
>  
<table width="75%" border="1" align="center"> 
<tr> 
<td><div align="center">选择文件
<input type="file" name="file1" size="30"> 
</div></td> 
</tr> 
<tr><td><div align="center">文件描述
<input type="text"  size="30" name="resDes"> 
</div></td> 
</tr> 
<tr><td><div align="center">文件范畴
<input type="text"  size="30" name="resCat"> 
</div></td> 
</tr> 
<tr> 
<td><div align="center"> 
<input type="submit" name="submit" value="上传它！"> 
</div></td> 
</tr> 
</table> 
</form> 
   
  </body>
</html>
