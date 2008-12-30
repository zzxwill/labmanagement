<%@ page language="java" contentType="text/html charset=gb2312" %> 
<%@ page pageEncoding="gb2312"%>
<%@ page import="java.sql.*"%>
<%@ include file="head.jsp"%>
<html>
	<body>
	<%
   		try
	    {
	    String projectName=request.getParameter("projectName");
//	    System.out.println(projectName);
	    String projectCon=request.getParameter("projectCon");
	    String projectPub=request.getParameter("projectPub");
	    String deadline=request.getParameter("deadline");
	    System.out.println("projectName:"+projectName);
	    System.out.println("projectCon:"+projectCon);
	    System.out.println("projectPub:"+projectPub);
	    System.out.println("deadline:"+deadline);
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
	      
	      stmt = (Statement) conn.createStatement();
	  int number=stmt.executeUpdate("insert into project(projectName,projectCon,projectPub,deadline) values('"+projectName+"','"+projectCon+"','"+projectPub+"','"+deadline+"')");
	  //age在数据库中的表现是int,但是,在这里, '"+age+"' 或"+age+"都行
	  

	  /*
	   * 如果添加的条数为一，则表示成功插入了数据，因此，可以用这来判断数据库是否成功插入了数据。
	   */
	  
	  if(number==1){
		  out.println("恭喜您，新任务添加成功！<br>");
		  out.println("<a href='/labmanagement/jsp/groupAdmin.jsp'>返回</a>");
	  }
	  else{
		  out.println("对不起，新任务添加失败，请返回继续操作！");
		   out.println("<a href='/labmanagement/jsp/groupAdmin.jsp'>返回</a>");
	  }
	  


	    }
	    catch (Exception ex)
	    {
	      System.out.println("Error : " + ex.toString());
	    }
   	 %>
	</body>
</html>
