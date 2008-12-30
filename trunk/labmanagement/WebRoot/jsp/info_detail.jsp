<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@ include file="head.jsp" %>
<%@ page import="java.sql.*"  %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>详细信息</title>
    
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
						<span class="STYLE61"><a href="/labmanagement/jsp/index.jsp">首页</a>| <a
							href="/labmanagement/jsp/morePubInfo.jsp">公共信息</a>
						</span> 
					</td>
				</tr>
			</table>
 
  <%  String   Inid=(String)request.getParameter("inid");
       // out.print(abc);
       
       try
		    {
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
		  res=stmt.executeQuery("select * from pubinfo where infoID='"+Inid+"'");
		    while (res.next())
		     { out.print("<table width=900 align=center border=0><tr><td align=center>");
		       out.print("<h2>"+res.getString(2)+"</h2></td></tr>");
		       out.print("<tr><td><p>"+res.getString(3)+"</p></td></tr>");
		       out.print("<tr><td align=right>"+res.getString(4)+"</td></tr>");
		       out.print("</table>");
		      }
		      
		  
		      res.close();

		    }
		    catch (Exception ex)
		    {
		      System.out.println("Error : " + ex.toString());
		    }

	%>
	
  </body>
</html>
