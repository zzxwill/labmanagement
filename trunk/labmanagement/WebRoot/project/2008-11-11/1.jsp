<%@   page   contentType="text/html;   charset=gb2312"   language="java"%>  
<%@page pageEncoding="GB2312"%>
<% request.setCharacterEncoding("GB2312"); %>
<%@ include file="/jsp/head.jsp" %>
<%@page import="java.sql.*;"  %>
<html>
	<head></head>
		<body>
		<table width="900px" align="center">
		<tr>
		
			<%
				String projectID=request.getParameter("projectID");
				out.print(projectID);
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
		      String sql="select projectCon from project where projectID='"+projectID+"'";
//		      res = stmt.executeQuery(sql);
		      res=stmt.executeQuery(sql);
		
			 while(res.next()){
			 	out.print(res.getString("projectCon"));
			 }
			 
//		     out.println(deleteNum);
//		      res.close();
			
			 %>
			 </tr>
		</table>
		</body>
</html>