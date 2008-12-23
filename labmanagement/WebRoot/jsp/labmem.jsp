<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@include file="head.jsp"%>
<%@page import="java.sql.*;"  %>

<html>
  <head>
    
    <title>修改个人信息</title>
    
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
  <%
			  Object id=session.getAttribute("memID");
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
            
		     res = stmt.executeQuery("select * from  labmem where memID='"+id+"'");
		     int memId=0;
		     String stuNo=null;
             String memName=null;
             String labNo=null;
             String QQ=null;
             String MSN=null;
             String telephone=null;
             String password=null;
             while (res.next()){
             password=res.getString(3);
             stuNo=res.getString(4);
             memName=res.getString(2);
             labNo=res.getString(5);
             QQ=res.getString(6);
             MSN=res.getString(7);
             telephone=res.getString(8);
             }
%>
 <%   request.setCharacterEncoding("gb2312");   %>
  <h2> 修改个人信息</h2>
    <form action="/labmanagement/servlet/LabMem" method="post"> 
    <input name="password" type="hidden"  value=<%=password%> ><br />
     实验室ID：<input name="memID" type="text" value=<%=id %> size="20" readonly><br />
       学号：<input name="stuNo" type="text" value=<%=stuNo %> size="25"  readonly><br />
	姓名:<input name="memName" type="text"  value=<%=memName%> size="26"  ><br />
	QQ：<input name="QQ"  type="text" value=<%=QQ %> size="27" ><br />
	MSN：<input name="MSN"  type="text" value=<%=MSN %> size="26" ><br />
	实验室号：<input name="labNo"  type="text" value=<%=labNo %> size="20" ><br />
	联系电话：<input name="telephone"  type="text" value=<%=telephone %> size="20" ><br />
	<input type="submit" value="确认更改" /><br />
	</form>
	<a href="index.jsp">返回首页</a>
  </body>
</html>
