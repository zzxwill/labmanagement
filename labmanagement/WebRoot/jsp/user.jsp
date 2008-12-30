<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@include file="head.jsp"%>
<%@page import="java.sql.*;"  %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>注册用户页面</title>
    
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
   <table width="900" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tbspan">
				<tr>
					<td width="880" background="/templets/img/31bg1.gif">
						<span class="STYLE61"><a href="/labmanagement/jsp/index.jsp">首页</a> | <a
							href="/labmanagement/jsp/labmem.jsp">修改个人信息</a> | <a href="/labmanagement/jsp/resrouse.jsp">资源</a>
							| <a href="/labmanagement/jsp/memproject.jsp">任务</a> | <a href="/labmanagement/jsp/morePubInfo.jsp">
								公共信息</a> | <a href="/labmanagement/jsp/equipment.jsp">设备</a> | <a href="mailto:zzxwill@buaa.edu.cn">联系我们</a> |<a href="/labmanagement/jsp/logout.jsp">注销</a>
						</span> 
					</td>
				</tr>
			</table>
			<br>
	<table border="1" width="900"  align="center">		
	<tr ><td width="20%"><table border="0" align="left">
			<tr>
			<th align=left>参与项目名称</th>
			</tr>
			<%
			 Object id=session.getAttribute("memID");
			 session.setAttribute("memID",id);
			 
			
		      Connection conn=null;
		      Statement stmt;
		      ResultSet qwe = null;
		      //加载Connector/J驱动
		      //这一句也可写为：Class.forName("com.mysql.jdbc.Driver");
		      Class.forName("com.mysql.jdbc.Driver").newInstance();
		      //建立到MySQL的连接
		      conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
		                                         "root", "zzxwill");
		      //执行SQL语句
		      
		      stmt = (Statement) conn.createStatement();

				qwe = stmt.executeQuery("select projectName from  mem_pro where memID='"+id+"'");

		      while (qwe.next())
		      {	        
		       out.print("<tr><td>"+qwe.getString(1)+"</td></tr>");//projectName
		       }
%>		
		</table></td>
		<td rowspan=2>
		<table border="0" width="80%" align="left">
			<tr>
			<th align=left>个人信息</th>
			</tr>
			<%
			try{
			  ResultSet ewq = null;
		      ewq = stmt.executeQuery("select * from  labmem where memID='"+id+"'");
		        while (ewq.next()){    
		       out.print("<tr><td>姓名："+ewq.getString(2)+"</td></tr>");//memName
		       out.print("<tr><td>学号："+ewq.getString(4)+"</td></tr>");//studentNo.
		       out.print("<tr><td>实验室号："+ewq.getString(5)+"</td></tr>");//labNo.
		       out.print("<tr><td>QQ："+ewq.getString(6)+"</td></tr>");//QQ
		       out.print("<tr><td>MSN："+ewq.getString(7)+"</td></tr>");//MSN
		       out.print("<tr><td>电话："+ewq.getString(8)+"</td></tr>");//telephone
		       }
		       }
		       catch (Exception ex){
		       }
%>		
		</table></td></tr>  
		
			<tr><td td width="20%"><table border="0"  align="left">
			<tr>
			<th align=left>所在小组成员</th>
			</tr>
			<%
			
		      ResultSet weq = null;
		      weq = stmt.executeQuery("select memName from  group1 where groupID=(select groupID from group1 where memID='"+id+"')");

		      while (weq.next())
		      {	        
		       out.print("<tr><td>"+weq.getString(1)+"</td></tr>");//groupMemberName
		       }
%>		
		</table></td></tr>
		</table>
		
  </body>
</html>
