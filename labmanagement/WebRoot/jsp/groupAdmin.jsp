<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@include file="head.jsp"%>
<%@page import="java.sql.*;"  %>
<!--此页面向servlet ManageGroup传值 -->
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
  	<table width="900px" align="center">
  	
  	<%
  		Object groupAdminID=session.getAttribute("memID");
  		out.print("您是组用户."+"<br>您的ID:");
  		Object rightID=session.getAttribute("rightID");
  		out.print("您的权限ID:"+rightID);
  	 %>
  	 
  	 
  	 	<br><br><br><br><br><br><br>
  	 	<div align="center"><font size="5">成员管理</font></div> 
		<table border="1" width="60%"  align="center">
		
		<td>
			<!-- 下面这一列这个table是显示成员所在的组 -->
		
		<table border="1"  align="left">
		<tr>成员组状态</tr>
		<th>组员姓名</th>
		<th> 所在组</th>	
		<%
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			/*
				加载驱动程序并注册驱动程序
			*/
			Connection conn3=DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
		                                         "root", "zzxwill");
		        /*
		        建立 数据库
		        */

		      Statement stmt3=conn3.createStatement();
		      //创建一个jdbc申明
		      ResultSet res3 = null;
		      //现在是申明一个Result实例化,后面用来包装返回的结果
//		      res = stmt.executeQuery("select * from notice where id<='6'");
		  	 res3=stmt3.executeQuery("SELECT memName,groupName from managegroup, grou where (manageGroup.groupID='0' or manageGroup.groupID='"+groupAdminID+"') and managegroup.groupID=grou.groupID;");
		 
		      while (res3.next())
		      {
			   	
		       out.print("<tr><td>"+res3.getString(1)+"</td>");//ID 
		       out.print("<td>"+res3.getString(2)+"</td>");//ID 
				
//			int noticeID=Integer.parseInt(res.getString(1));

%>

 				<!-- 这里通过超链接传值特别经典! -->
 				<!-- 这样,将noticeID传到了页面 changeNotice.jsp中-->
	<%
	out.print(			"</tr>");

	//这是第二列
	}
	
	res3.close();
	stmt3.close();
	conn3.close();
%>	
	</table>
	</td>
		
	<td>
	<!-- 下面这一列这个table是将成员移出组的操作 -->
	<!-- 移出跳到servlet MoveMemIn -->
		<table border="1"  align="center">
		<tr>移出组</tr>
		<th>组员姓名</th>
		<th> 移出操作</th>	
		<%
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			/*
				加载驱动程序并注册驱动程序
			*/
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
		                                         "root", "zzxwill");
		        /*
		        建立 数据库
		        */

		      Statement stmt=conn.createStatement();
		      //创建一个jdbc申明
		      ResultSet res = null;
		      //现在是申明一个Result实例化,后面用来包装返回的结果
//		      res = stmt.executeQuery("select * from notice where id<='6'");
		  res=stmt.executeQuery("select memID,memName from managegroup where groupID=(select groupID from groupmem where memID='"+groupAdminID+"');");
//		  out.print("<tr>");
//		  out.print("<td>");
		  //一个表格三列,这是第一列
		      while (res.next())
		      {
		       out.print("<tr><td>"+res.getString(2)+"</td>");//ID      
				
//			int noticeID=Integer.parseInt(res.getString(1));

%>

 				<!-- 这里通过超链接传值特别经典! -->
 				<!-- 这样,将noticeID传到了页面 changeNotice.jsp中-->
	<td><a href="/labmanagement/servlet/MoveMemOut?memID=<%=res.getString(1)%>">移出组</a></td>
	<%
	out.print("</tr>");
//	out.print("</td><td>");
	//后面一个td是每二列
	}
	
//	res.close();
	stmt.close();
	conn.close();
%>			
	</table>
	</td>
	<td>
		<!-- 下面这一列这个table是将成员移入组的操作 -->
	
		<table border="1"  align="right">
		<tr>移入组</tr>	
		<th>组员姓名</th>
		<th> 移入操作</th>	
		<%
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			/*
				加载驱动程序并注册驱动程序
			*/
			Connection conn2=DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
		                                         "root", "zzxwill");
		        /*
		        建立 数据库
		        */

		      Statement stmt2=conn2.createStatement();
		      //创建一个jdbc申明
		      ResultSet res2 = null;
		      //现在是申明一个Result实例化,后面用来包装返回的结果
//		      res = stmt.executeQuery("select * from notice where id<='6'");
//		  	res2=stmt2.executeQuery("SELECT memID,memName from manageGroup where groupID='0' or groupID='"+groupAdminID+"';");
		  	res2=stmt2.executeQuery("SELECT memID,memName from manageGroup where groupID='0';");
	
		      while (res2.next())
		      {

		       out.print("<tr><td>"+res2.getString(2)+"</td>");//ID 
				
//			int noticeID=Integer.parseInt(res.getString(1));

%>

 				<!-- 这里通过超链接传值特别经典! -->
 				<!-- 这样,将noticeID传到了页面 changeNotice.jsp中-->
		<td><a href="/labmanagement/servlet/MoveMemIn?userMemID=<%=res2.getString(1)%>&groupAdminID=<%=groupAdminID%>">移入组<%=res2.getString(1)%></a></td>
		<!--groupAdminID是组用户的ID.  -->

	<%

	out.print(			"</tr>");
//	out.print("</td>");
	//这是第二列
	}
	
	res2.close();
	stmt2.close();
	conn2.close();
%>	
	</table>
	</td>
	
	
	
	
<!-- **********************以下是任务发布部分******************************************** -->
<!-- **********************以下是任务发布部分******************************************** -->
<!-- **********************以下是任务发布部分******************************************** -->
<!-- **********************以下是任务发布部分******************************************** -->
	
	<table border="1" width="80%"  align="center">
	<div align="center"><font size="5">任务管理</font></div> 
		<table border="1" width="60%"  align="center">
		
		<td>
			<!-- 下面这一列这个table是显示成员所在的组 -->
		
		<table border="1"  align="left">
		<tr>成员组状态</tr>
		<th>任务</th>
		<th>发布时间</th>
		<th>截止时间</th>
		<th>任务成员</th>
		<th>移出成员</th>	
		<%
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			/*
				加载驱动程序并注册驱动程序
			*/
			Connection conn4=DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
		                                         "root", "zzxwill");
		        /*
		        建立 数据库
		        */

		      Statement stmt4=conn4.createStatement();
		      //创建一个jdbc申明
		      ResultSet res4 = null;
		      //现在是申明一个Result实例化,后面用来包装返回的结果
//		      res = stmt.executeQuery("select * from notice where id<='6'");
//		  	 res4=stmt4.executeQuery("SELECT * from manageproject where memID!='"+groupAdminID+"';");
			//上面不包括组长
		  	 res4=stmt4.executeQuery("SELECT * from manageproject ;");
			//上面不包括组长		 
		    String projectName=null;
		    String projectPub=null;
		    String deadline=null;
	      	while (res4.next())
	      	{
	   		if(!res4.getString(2).equals(projectName)){
	   				out.print("</td>");//ID
	out.print(			"</tr>");
		        out.print("<tr><td>"+res4.getString(2)+"</td>");//ID 
		    }  else{
		    	out.print("<td>"+"</td>");//ID 
		
		    }
		       projectName=res4.getString(2);
		       
		     if(!res4.getString(3).equals(projectPub)){
		       out.print("<td>"+res4.getString(3)+"</td>");//ID 
		    }
		    else{
	
		    	out.print("<td>"+"</td>");//ID 
		    }
		    
		    
		       projectPub=res4.getString(3);
		       
		        if(!res4.getString(4).equals(deadline)){
		       out.print("<td>"+res4.getString(4)+"</td>");//ID 
		    } else{

		    	out.print("<td>"+"</td>");//ID 
		    }
		    
		 
		       deadline=res4.getString(4);
		       out.print("<td width=\"20%\">"+res4.getString(6)+"</td>");//ID
		       %>
		       <td><a href="/labmanagement/servlet/MoveProjectMemOut?projectID=<%=res4.getString(1)%>&memID=<%=res4.getString(5)%>">移出</a></td>
		       <%
		        out.print("<tr>"+"</tr>");//ID
		        //输出一个空行
			
//			int noticeID=Integer.parseInt(res.getString(1));
 		
%>

 				<!-- 这里通过超链接传值特别经典! -->
 				<!-- 这样,将noticeID传到了页面 changeNotice.jsp中-->
	<%


	//这是第二列
	}
	
	res4.close();
	stmt4.close();
	conn4.close();
%>	

	<tr></tr>
	
	
	
	</table>
	</td>
<!-- **********************以下是任务添加任务和成员部分******************************************** -->
<!-- **********************以下是任务添加任务和成员部分******************************************** -->
<!-- **********************以下是任务添加任务和成员部分******************************************** -->
<!-- **********************以下是任务添加任务和成员部分******************************************** -->
	
	
	<tr>
	<table border="1" width="80%"  align="center">
	<tr></tr>
	<tr>
	<td>
			<table border="1" width="60%"  align="center">
			<tr>
			
			</tr>
			<tr>
				<form action="/labmanagement/servlet/AddProject" method="get">
					任务名称<input type="text" name="projectName"><br>
					任务内容<textarea type="textfield" name="projectCon"></textarea><br>
					发布时间<input type="text" name="projectPub"><br>
					截止时间<input type="text" name="deadline"><br>
					<input type="submit" value="添加">
					<input type="reset" value="重填 ">
				</form>
			</tr>
			</table>
	</td>
	
	
	
		
<!-- **********************以下是添加成员部分******************************************** -->
		
		<td>
<table border="1"  align="right">
		<tr>添加成员</tr>	
		<th>成员姓名</th>
		<th>请按排其任务</th>
		<%
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			/*
				加载驱动程序并注册驱动程序
			*/
			Connection conn5=DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
		                                         "root", "zzxwill");
		        /*
		        建立 数据库
		        */

		      Statement stmt5=conn5.createStatement();
		      //创建一个jdbc申明
		      ResultSet res5 = null;
		      //现在是申明一个Result实例化,后面用来包装返回的结果
//		      res = stmt.executeQuery("select * from notice where id<='6'");
//		  	res2=stmt2.executeQuery("SELECT memID,memName from manageGroup where groupID='0' or groupID='"+groupAdminID+"';");
		  	res5=stmt5.executeQuery("SELECT memID,memName from manageGroup where groupID='0';");
	
		      while (res5.next())
		      {
			   
		       out.print("<tr><td>"+res5.getString(2)+"</td>");//ID 
		       
/************************************************************************************************************
*应该在下面输入任务,让组长来给他分配任务************************************************************************
*******************************************************************************************/		       
				out.print("<td>");
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection conn7=DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
	    	                                     "root", "zzxwill");
	   			 Statement stmt7=conn7.createStatement();
	   		 ResultSet res7 = null;
	  		res7=stmt7.executeQuery("SELECT distinct projectID,projectName from manageproject;");
	      
	       %>
	       <form action="/labmanagement/servlet/AddMem"  method="get">
	      <select name="project">
	      <%
	      
//	      String projectMemID=res7.getString(1);
	      while (res7.next())
	      {
	      %>
	      	<option value=<%=res7.getString(1) %>> <%=res7.getString(2) %>
	      <%
	  
		   System.out.print("<tr>"+res7.getString(1)+"</td>");//ID 
	       System.out.print("<td>"+res7.getString(2)+"</td>\n");//ID 
			
     }
	
	  %>
	      </select>
	      <input type="hidden" name="projectMemID" value=<%=res5.getString(1) %> >
	      <input type="submit" value="送出">
	      </form>
	      <%
				
				
//			int noticeID=Integer.parseInt(res.getString(1));

%>

 				<!-- 这里通过超链接传值特别经典! -->
 				<!-- 这样,将noticeID传到了页面 changeNotice.jsp中-->
		
		<!--groupAdminID是组用户的ID.  -->

	<%
	

	out.print(			"</tr>");
//	out.print("</td>");
	//这是第二列
	}
	
	res5.close();
	stmt5.close();
	conn5.close();
%>	
	</table>
	</td>
	
			
			
	
	添加任务
	</tr>
	</table>
	</tr>
	
	
	
	
	
	</table>
	</table>
  </body>
</html>
