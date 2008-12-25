<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@include file="head.jsp"%>
<%@page import="java.sql.*;"%>
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
			//int  id=Integer.parseInt((String)request.getAttribute("memID"));
			 Object id=session.getAttribute("memID");
			 session.setAttribute("memID",id);
			 
			 //if(i1.toString().equals("1")){
			 //Object id2=session.getAttribute("memid");
			 //id=Integer.parseInt(id2.toString());
			//}
			  //int  id=1;
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
		
		
		<table width="900px" align="center">

			<%
				Object groupAdminID = session.getAttribute("memID");
				//out.print("您是组用户."+"<br>您的ID:");
				Object rightID = session.getAttribute("rightID");
				//out.print("您的权限ID:"+rightID);
			%>



			<div align="center">
				<font size="5"><br><br><strong><font size="7">成员管理</font></strong></font>
			</div>

			<table border="1" width="900px" align="center">
				<tr>
					<td>
						<!------------------------------- 下面这一列这个table是显示成员所在的组---------------------------------------- -->
						<!------------------------------- 下面这一列这个table是显示成员所在的组---------------------------------------- -->
						<!------------------------------- 下面这一列这个table是显示成员所在的组---------------------------------------- -->
						<!------------------------------- 下面这一列这个table是显示成员所在的组---------------------------------------- -->

						<table border="1" align="left" width="250px">
							<tr>
								成员组状态
							</tr>
							<tr>
								<th>
									组员姓名
								</th>
								<th>
									所在组
								</th>
							</tr>
							<%
								Class.forName("com.mysql.jdbc.Driver").newInstance();
								/*
									加载驱动程序并注册驱动程序
								 */
								Connection conn3 = DriverManager
										.getConnection(
												"jdbc:mysql://localhost:3306/labmanagement?useUnicode=true&characterEncoding=GB2312",
												"root", "zzxwill");
								/*
								建立 数据库
								 */

								Statement stmt3 = conn3.createStatement();
								//创建一个jdbc申明
								ResultSet res3 = null;
								//现在是申明一个Result实例化,后面用来包装返回的结果
								//		      res = stmt.executeQuery("select * from notice where id<='6'");
								res3 = stmt3
										.executeQuery("SELECT memName,groupName from managegroup, grou where (managegroup.groupID='0' or managegroup.groupID =(select groupID from groupmem where memID='"
												+ groupAdminID
												+ "')) and managegroup.groupID=grou.groupID;");

								while (res3.next()) {

									out.print("<tr><td>" + res3.getString(1) + "</td>");//ID 
									out.print("<td>" + res3.getString(2) + "</td>");//ID 

									//			int noticeID=Integer.parseInt(res.getString(1));

									out.print("</tr>");

									//这是第二列
								}

								res3.close();
								stmt3.close();
								conn3.close();
							%>
						</table>
					</td>
					<!----------- 下面这一列这个table是将成员移出组的操作 ------------------------------------------------->
					<!----------- 下面这一列这个table是将成员移出组的操作 ------------------------------------------------->
					<!----------- 下面这一列这个table是将成员移出组的操作 ------------------------------------------------->
					<!----------- 下面这一列这个table是将成员移出组的操作 ------------------------------------------------->
					<!----------- 下面这一列这个table是将成员移出组的操作 ------------------------------------------------->

					<td>
						<!-- 下面这一列这个table是将成员移出组的操作 -->
						<!-- 移出跳到servlet MoveMemIn -->
						<table border="1" align="center" width="250px">
							<tr>
								移出组
							</tr>
							<tr>
								<th>
									组员姓名
								</th>
								<th>
									移出操作
								</th>
							</tr>
							<%
								

							
								//创建一个jdbc申明
								ResultSet res = null;
								//现在是申明一个Result实例化,后面用来包装返回的结果
								//		      res = stmt.executeQuery("select * from notice where id<='6'");
								res = stmt
										.executeQuery("select memID,memName from managegroup where memID!='"
												+ groupAdminID
												+ "' and groupID =(select groupID from groupmem where memID='"
												+ groupAdminID + "');");
								//		  out.print("<tr>");
								//		  out.print("<td>");
								//一个表格三列,这是第一列
								while (res.next()) {
									out.print("<tr><td>" + res.getString(2) + "</td>");//ID      

									//			int noticeID=Integer.parseInt(res.getString(1));
							%>

							<!-- 这里通过超链接传值特别经典! -->
							<!-- 这样,将noticeID传到了页面 changeNotice.jsp中-->
							<td>
								<a
									href="/labmanagement/servlet/MoveMemOut?groupUserID=<%=res.getString(1)%>">移出组</a>
							</td>
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
						<!----------- 下面这一列这个table是将成员移入组的操作 ------------------------------------------------->
						<!----------- 下面这一列这个table是将成员移入组的操作 ------------------------------------------------->
						<!----------- 下面这一列这个table是将成员移入组的操作 ------------------------------------------------->
						<!----------- 下面这一列这个table是将成员移入组的操作 ------------------------------------------------->
						<!----------- 下面这一列这个table是将成员移入组的操作 ------------------------------------------------->

						<table border="1" align="right" width="250px">
							<tr>
								移入组
							</tr>
							<tr>
								<th>
									组员姓名
								</th>
								<th>
									移入操作
								</th>
							</tr>
							<%
								Class.forName("com.mysql.jdbc.Driver").newInstance();
								/*
									加载驱动程序并注册驱动程序
								 */
								Connection conn2 = DriverManager
										.getConnection(
												"jdbc:mysql://localhost:3306/labmanagement?useUnicode=true&characterEncoding=GB2312",
												"root", "zzxwill");
								/*
								建立 数据库
								 */

								Statement stmt2 = conn2.createStatement();
								//创建一个jdbc申明
								ResultSet res2 = null;
								//现在是申明一个Result实例化,后面用来包装返回的结果
								//		      res = stmt.executeQuery("select * from notice where id<='6'");
								//		  	res2=stmt2.executeQuery("SELECT memID,memName from manageGroup where groupID='0' or groupID='"+groupAdminID+"';");
								res2 = stmt2
										.executeQuery("SELECT memID,memName from manageGroup where groupID='0';");

								while (res2.next()) {

									out.print("<tr><td>" + res2.getString(2) + "</td>");//ID 

									//			int noticeID=Integer.parseInt(res.getString(1));
							%>

							<!-- 这里通过超链接传值特别经典! -->
							<!-- 这样,将noticeID传到了页面 changeNotice.jsp中-->
							<%
								//System.out.print("所在的组:"+groupAdminID);
							%>
							<td>
								<a href="/labmanagement/servlet/MoveMemIn">移入组<%=res2.getString(1)%></a>
							</td>
							<!--groupAdminID是组用户的ID.  -->

							<%
								session.setAttribute("userMemID", res2.getString(1));
									session.setAttribute("groupAdminID", groupAdminID);

									out.print("</tr>");
									//	out.print("</td>");
									//这是第二列
								}

								res2.close();
								stmt2.close();
								conn2.close();
							%>
						</table>
					</td>

				</tr>
				
			</table>
			</table>
			
			


			<!-- **********************以下是任务发布部分******************************************** -->
			<!-- **********************以下是任务发布部分******************************************** -->
			<!-- **********************以下是任务发布部分******************************************** -->
			<!-- **********************以下是任务发布部分******************************************** -->

			<table border="1" width="900px" align="center">
				<tr><div align="center">
					<font size="5"><br><br><font size="7">任务管理</font></font>
				</div></tr>
				<tr><td>
			
					
							<!-- 下面这一列这个table是显示成员所在的组 -->

								<table border="1" width="100%" align="left">
								<tr>
									成员组总体表
								</tr>
								<tr>
									<th>
										任务
									</th>
									<th>
										发布时间
									</th>
									<th>
										截止时间
									</th>
									<th>
										任务成员
									</th>
									<th>
										移出成员
									</th>
								</tr><tr>
								<%
									Class.forName("com.mysql.jdbc.Driver").newInstance();
									/*
										加载驱动程序并注册驱动程序
									 */
									Connection conn4 = DriverManager
											.getConnection(
													"jdbc:mysql://localhost:3306/labmanagement?useUnicode=true&characterEncoding=GB2312",
													"root", "zzxwill");
									/*
									建立 数据库
									 */

									Statement stmt4 = conn4.createStatement();
									//创建一个jdbc申明
									ResultSet res4 = null;
									//现在是申明一个Result实例化,后面用来包装返回的结果
									//		      res = stmt.executeQuery("select * from notice where id<='6'");
									//		  	 res4=stmt4.executeQuery("SELECT * from manageproject where memID!='"+groupAdminID+"';");
									//上面不包括组长
									res4 = stmt4
											.executeQuery("SELECT * from manageproject where projectID in (select projectID from projectmem where memID='"
													+ groupAdminID + "');");
									//上面不包括组长		 
									String projectName = null;
									String projectPub = null;
									String deadline = null;
									while (res4.next()) {
										if (res4.getString(5).equals(groupAdminID)) {
										} else {
											if (!res4.getString(2).equals(projectName)) {
												out.print("</td>");//ID
												out.print("</tr>");
												out.print("<tr><td>" + res4.getString(2) + "</td>");//ID 
											} else {
												out.print("<td>" + "</td>");//ID 

											}
											projectName = res4.getString(2);

											if (!res4.getString(3).equals(projectPub)) {
												out.print("<td>" + res4.getString(3) + "</td>");//ID 
											} else {

												out.print("<td>" + "</td>");//ID 
											}

											projectPub = res4.getString(3);

											if (!res4.getString(4).equals(deadline)) {
												out.print("<td>" + res4.getString(4) + "</td>");//ID 
											} else {

												out.print("<td>" + "</td>");//ID 
											}

											deadline = res4.getString(4);
											out.print("<td width=\"20%\">" + res4.getString(7)
													+ "</td>");//ID
								%>
								<td>
									<a
										href="/labmanagement/servlet/MoveProjectMemOut?projectID=<%=res4.getString(1)%>&projectMemID=<%=res4.getString(6)%>">移出</a>
								</td>
								<%
									//		       session.setAttribute("projectID",res4.getString(1));
											//		       session.setAttribute("projectMemID",res4.getString(5));
											out.print("<tr>" + "</tr>");//ID
											//输出一个空行

											//			int noticeID=Integer.parseInt(res.getString(1));

										}

										//这是第二列
									}

									res4.close();
									stmt4.close();
									conn4.close();
								%>
							</tr>




							</table>
							</td>
						
					
				
				
				<!-- **********************以下是任务添加任务和成员部分******************************************** -->
				<!-- **********************以下是任务添加任务和成员部分******************************************** -->
				<!-- **********************以下是任务添加任务和成员部分******************************************** -->
				<!-- **********************以下是任务添加任务和成员部分******************************************** -->

				<td>
				
					<table border="1" width="400%" align="right" border=0>
						 <tr>	添加任务</tr>
						<tr>
							<td>
								
										<form action="/labmanagement/servlet/AddProject" method="post">
										
											<tr><td>任务名称
											<input type="text" name="projectName"></td></tr>
										<tr><td>
											
											<textarea type="textfield" name="projectCon"></textarea></td></tr>
											<tr><td>
											发布时间
											<input type="text" name="projectPub"></td></tr>
											<tr><td>
											截止时间
											<input type="text" name="deadline"></td></tr>
											<tr><td>
											<!--组长ID  -->
											<input type="hidden" name="groupAdminID" value=<%=groupAdminID %> ></td></tr>
											
											<tr><td>
											<input type=submit value="添加"></td><td>
											<input type=reset value="重填 "></td></tr>
											
										</form>


                                         </td>
									</tr>
								</table>
								</td>
								</tr>
								</table>
								
								
							




							<!-- **********************以下是添加成员部分********************************************************************** -->
							<!-- **********************以下是添加成员部分********************************************************************** -->
							<!-- **********************以下是添加成员部分********************************************************************** -->
							
							<!-- **********************以下是添加成员部分********************************************************************** --><!-- **********************以下是添加成员部分********************************************************************** -->
							<!-- **********************以下是添加成员部分********************************************************************** -->
			
						
								
								<table border="1" align="center" width="600px" >
									<tr>
										添加成员
									</tr>
									<tr>
									<th>
										成员姓名
									</th>
									<th>
										请按排其任务
									</th>
									</tr>
									<%
										Class.forName("com.mysql.jdbc.Driver").newInstance();
										/*
											加载驱动程序并注册驱动程序
										 */
										Connection conn5 = DriverManager.getConnection(
												"jdbc:mysql://localhost:3306/labmanagement", "root",
												"zzxwill");
										/*
										建立 数据库
										 */

										Statement stmt5 = conn5.createStatement();
										//创建一个jdbc申明
										ResultSet res5 = null;
										//现在是申明一个Result实例化,后面用来包装返回的结果
										//		      res = stmt.executeQuery("select * from notice where id<='6'");
										//		  	res2=stmt2.executeQuery("SELECT memID,memName from manageGroup where groupID='0' or groupID='"+groupAdminID+"';");
										res5 = stmt5
												.executeQuery("SELECT memID,memName from managegroup where groupID=(select groupID from groupmem where memID='"
														+ groupAdminID + "') ;");

										while (res5.next()) {
											if(!res5.getString("memID").equals(groupAdminID)){
										//不输出组长本人
											out.print("<tr><td>" + res5.getString("memName") + "</td>");//ID 

											/************************************************************************************************************
											 *应该在下面输入任务,让组长来给他分配任务************************************************************************
											 *应该在下面输入任务,让组长来给他分配任务************************************************************************
											 *应该在下面输入任务,让组长来给他分配任务************************************************************************
											 *应该在下面输入任务,让组长来给他分配任务************************************************************************
											 *******************************************************************************************/
											out.print("<td>");
											Class.forName("com.mysql.jdbc.Driver").newInstance();
											Connection conn7 = DriverManager.getConnection(
													"jdbc:mysql://localhost:3306/labmanagement?useUnicode=true&characterEncoding=GB2312", "root",
													"zzxwill");
											Statement stmt7 = conn7.createStatement();
											ResultSet res7 = null;
											res7 = stmt7
													.executeQuery("SELECT distinct projectID,projectName from manageproject where memID='"+groupAdminID+"' ;");
									%>
									<form action="/labmanagement/servlet/AddMem" method="get">
										<select name="project">
											<%
												//	      String projectMemID=res7.getString(1);
													while (res7.next()) {
											%>
											<option value=<%=res7.getString(1)%>>
												<%=res7.getString(2)%>
												<%
													System.out.print("<tr>" + res7.getString(1) + "</td>");//ID 
															System.out.print("<td>" + res7.getString(2) + "</td>\n");//ID 

														}
												%>
											
										</select>
										<input type="hidden" name="memID"
											value=<%=res5.getString("memID")%>>
											
									  
										<input type="submit" value="添加">
									</form>
									

									<!-- 这里通过超链接传值特别经典! -->
									<!-- 这样,将noticeID传到了页面 changeNotice.jsp中-->

									<!--groupAdminID是组用户的ID.  -->

									<%
										out.print("</tr>");
											//	out.print("</td>");
											//这是第二列
										}
										}

										res5.close();
										stmt5.close();
										conn5.close();
									%>
								</table>
								
						


			

					
				
				





			
		
	</body>
</html>
