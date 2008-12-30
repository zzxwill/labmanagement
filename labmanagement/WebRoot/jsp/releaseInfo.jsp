<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@include file="userhead.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>信息管理页面</title>

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
		<h2 align="center">  
			信息管理  
		</h2>
		
		<table width="900" align="center" border=1>
		<tr><hr></tr>
		<tr><td>
           <table width='100%' height='100%'  border=1>
           <tr><th width='50%'>信息标题</th><th width='50%' >发布日期</th></tr>
				<%
			 Object id=session.getAttribute("memID");
			 session.setAttribute("memID",id);
			 
			
		      Connection conn=null;
		      Statement stmt;
		      ResultSet res = null;
		      //加载Connector/J驱动
		      //这一句也可写为：Class.forName("com.mysql.jdbc.Driver");
		      Class.forName("com.mysql.jdbc.Driver").newInstance();
		      //建立到MySQL的连接
		      conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement?useUnicode=true&characterEncoding=GB2312",
		                                         "root", "zzxwill");
		      //执行SQL语句
		      
		      int[] gd=new int[100];
		      int i=0;
		      stmt = (Statement) conn.createStatement();

			  res = stmt.executeQuery("select * from  pubinfo ");
                while (res.next())
		      {	
		              
		       out.print("<tr><td >"+res.getString(2)+"</td><td>"+res.getString(4)+"</td></tr>");//projectName
		       gd[i]=res.getInt(1);
		       i++;
		       
		       }
		       %>
		       </table>
		       </td>
		       </tr>
		       <tr>
		       <td>
		       <table  width="100%" >
				<tr>
					<th align=center>
						删除信息
					</th>
				</tr>
				<tr>
					<td align=center>
						<%
							ResultSet st = null;

							String[] in = new String[100]; //组名
							int k = 0;
							st = stmt.executeQuery("select infoTitle from pubinfo ");
							while (st.next()) {
								in[k] = st.getString(1);
								k++;
							}

							out
									.print("<form action='/labmanagement/servlet/DelInfo?id' method='post'><table >");
							out.print("<tr><td height='50'>");
							out.print("<select name=infon>");
							for (k = 0; in[k] != null; k++) {
								out.print("<option>" + in[k]);
							}
							out.print("</select></td>");
							out
									.print("<td height='50'><input type='submit' value='删除信息'></td></tr></table></form>");
						%>
					</td>
				</tr>
			</table>
		       </td></tr>
		       <tr>
		       <td>
		       <table  width="100%" >
				<tr>
					<th align=center width='100%'>
						添加信息
					</th>
				</tr>
				<tr>
					<td align=center width='100%'>
						<%
							
							

							out.print("<form action='/labmanagement/servlet/NewInfo' method='post'><table  width='100%'>");
							out.print("<tr><td >");
							out.print("信息标题:<input type=text name=infoti></td></tr>");
							out.print("<tr><td >");
							out.print("信息内容:<textarea rows=5 cols=60 name=infoco></textarea></td></tr>");
							out.print("<tr><td ><input type='submit' value='添加信息'></td></tr></table></form>");
						%>
					</td>
				</tr>
			</table>
		       </td></tr>
		       <tr><td><a href="/labmanagement/jsp/superAdmin.jsp">返回超级管理员页面</a></td></tr>
			</table>
			
			 </body>
</html>
 