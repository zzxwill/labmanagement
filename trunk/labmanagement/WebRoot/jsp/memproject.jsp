<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@include file="head.jsp"%>
<%@page import="java.sql.*;"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人任务页面</title>

  </head>
  
  <body>
    <table width="900" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tbspan">
				<tr>
					<td width="880" background="/templets/img/31bg1.gif">
						<span class="STYLE61"><a href="/labmanagement/jsp/index.jsp">首页</a> | <a
							href="/labmanagement/jsp/labmem.jsp">修改个人信息</a> | <a href="/labmanagement/jsp/resrouse.jsp">资源</a>
							| <a href="/labmanagement/jsp/memproject.jsp">任务</a> | <a href="/labmanagement/jsp/morePubInfo.jsp">
								公共信息</a> | <a href="/labmanagement/jsp/equipment.jsp">设备</a> | <a href="mailto:zzxwill@buaa.edu.cn">联系我们</a> | <a href="/labmanagement/jsp/logout.jsp">注销</a>
						</span> 
					</td>
				</tr>
			</table>
  <table width="900" align="center" border="1"><tr><th width="40%">任务名称</th><th width="40%">任务内容</th><th width="20%">完成期限</th></tr>
  <h2>个人任务列表</h2>
  <% 
    try
	    {
	      Object x=session.getAttribute("memID");
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
	      int id=1;
	      stmt = (Statement) conn.createStatement();
          
			res = stmt.executeQuery("select * from mem_pro where memID='"+x+"'");
          
     
        
	      while (res.next())
	      {	
	         
	       out.print("<tr><td >"+res.getString(1)+"</td><td>"+res.getString(4)+"</td><td>"+res.getString(3)+"</td></tr>");//projectName
	   
	      }
	      }

	    catch (Exception ex)
	    {
	      System.out.println("Error : " + ex.toString());
	    }
              %>
              </table>
               
  </body>
</html>
