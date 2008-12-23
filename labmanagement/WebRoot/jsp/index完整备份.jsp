<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.sql.*" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>实验室管理系统网站</title>
		
<style type="text/css">
.relatedLinks h3 {
	padding: 10px 0px 2px 0px;
}

.STYLE14 {
	color: #000099;
	font-size: 14px;
	font-family: "微软雅黑";
	font-weight: bold;
}

h3 {
	font-size: 100%;
	color: #334d55;
}

h3 {
	font-family: Arial, sans-serif;
	margin: 0px;
	padding: 0px;
}

.STYLE26 {
	font-family: "微软雅黑";
	font-weight: bold;
	background-color: #FFFF99;
}

.STYLE61 {
	font-family: "微软雅黑";
	font-size: 18px;
	color: #006699;
}

</style>
</head>

	<body leftmargin="0" topmargin="0">
		<center>
		
			<table width="900" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tbspan">
				<tr>
					<td width="616" height="78" align="center">
						<a href='http://localhost:8080/labmanagement/jsp/index.jsp' target='_blank'> <img
								src="/labmanagement/images/title.jpg" width="680" height="72" border='0'
								alt="实验室管理系统">
						</a>
					</td>
					<td width="10" align="center">
						&nbsp;
					</td>
					<td width="112" align="center"></td>
					<td width="165" align="center">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr align="center" height="20">
								<td height="24">
									<a href="developing.jsp">网站地图</a>
								</td>
								<td>
									<a href="developing.jsp">RSS订阅</a>
								</td>
							</tr>
							<tr align="center" height="20">
								<td>
									<a href="developing.jsp">高级搜索</a>
								</td>
								<td>
									<a href='#'
										onClick="javascript:window.external.AddFavorite('http://localhost:8080/labmanagement/jsp/index.htm','实验室管理系统');">
										收藏本站</a>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			
			
			<table width="900" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tbspan">
				<tr>
					<td width="880" background="/templets/img/31bg1.gif">
						<span class="STYLE61"><a href="index.jsp">首页</a> | <a
							href="labIntro.jsp"> 实验室概况</a> | <a href="teachers.jsp">
						人员构成</a>
							| <a href="project.jsp">科研项目</a> | <a href="product.jsp">
								成果展示</a> | <a href='/jsp/index.jsp'>联系我们</a>
						</span> 
					</td>
				</tr>
			</table>
			
			
			<table width="900" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="222" valign='top' bgcolor='#EAF2E5'
						background='/labmanagement/images/ibg.gif'>
						<!--Split-->
						<table width="100%" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td height="7" background="/labmanagement/images/ic1.gif"
									style="font-size: 1px">
									&nbsp;
								</td>
							</tr>
						</table>
						<table width="96%" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td height="24">
									<table cellSpacing="0" cellPadding="0" border="0"
										style="width: 115px">
										<tr>
											<td vAlign="top" width="222" background="/labmanagement/images/ibg.gif"
												bgColor="#eaf2e5">
												<!--Split-->
												<table cellSpacing="0" cellPadding="0" width="100%"
													align="center">
													<tr>
														<td background="/labmanagement/images/ic1.gif" height="7">
															&nbsp;
														</td>
													</tr>
												</table>
												<table cellSpacing="0" cellPadding="0" width="96%"
													align="center">
													<tr>
														<td height="24">
															<img height="25" src="/labmanagement/images/login.gif" width="105">
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td height="4"></td>
							</tr>
						</table>
						
						
						<!--Split-->
						<table width="96%" border="0" align="center" cellpadding="2"
							cellspacing="1" bgcolor="#BCC1B3">
							<tr>
								<td valign="top" bgcolor="#FFFFFF">
								
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<form action="/labmanagement/servlet/Login" method="post">
											学号：<input type="text" name="stuNO" >
											密码：<input type="password" name="password" >
											<input type=submit value=登陆> 
											<input type=reset value=重填>
											</form>
										</table>
								</td>
							</tr>
						</table>
						
						<!--Split-->
						<table width="96%" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td height="4"></td>
							</tr>
							<tr>
								<td height="2">
									<img alt="" src="/labmanagement/images/pic_arrow.gif" width="11" height="11">
									友情链接
								</td>
							</tr>
						</table>
						
						<!--Split-->
						<table width="96%" border="0" align="center" cellpadding="2"
							cellspacing="1" bgcolor="#BCC1B3">
							<tr>
								<td valign="top" bgcolor="#FFFFFF" style="height: 107px">
									北京航空航天大学
											<font size="2"><a href="http://www.buaa.edu.cn">
									http://www.buaa.edu.cn</a> 
									</font><br /> 
									北京航空航天大学虚拟现实<br>技术与系统国家重点实验室 
									<font size="2"><a href="http://www.vrlab.buaa.edu.cn/">
									http://www.vrlab.buaa.edu.cn/</a></font>
									<br> <br> 
									<br />
								</td>
							</tr>
						</table>
						
						<!--Split-->
						<table align="center" cellpadding="0" cellspacing="0"
							style="width: 98%">
							<tr>
								<td height="4">
									<a href='applyLink.jsp'>[申请链接]</a>
								</td>
							</tr>
						</table>
						<!--Split-->
						<!--Split-->
						<!--Split-->
						<!--Split-->

					</td>
					<td width="8">
					</td>
					<td valign="top" width="670">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							style="height: 508px">
							<tr>
								<td width="98%" height="365" valign="top">
									<table width="100%" border="0" cellspacing="1" cellpadding="0">
										<tr>
											<td style="height: 2px">
												<img height="16" src="/labmanagement/images/channellist.gif" width="14">
												最新信息
											</td>
											<td style="height: 2px">
												<a
													href="http://www.hlarti.com/html/xiangmugaikuang/index.html">
													<img height="14" src="/labmanagement/images/more.gif" width="43" border="0"
														style="float: right">
												</a>
											</td>
										</tr>
										<tr>
											<td width="85%" valign="top" style="padding-left: 6px"
												colspan="2">
												<table width="100%" border="0" cellspacing="1"
													cellpadding="1">
												
												
													
		<%
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
//		      res = stmt.executeQuery("select * from notice");
//		      stmt.executeUpdate("insert into notice(developer,content,submitTime,deadline,rank,title) values('developer','content','submitTime','deadline','rank','title')");
//		  int number=stmt.executeUpdate("update notice set developer="+developer+",content='"+content+"',submitTime='"+strSubmitTime+"',deadline='"+strDeadline+"',rank="+rank+",title='"+title+"' where id='"+strID+"'");
		  res=stmt.executeQuery("select * from pubinfo");
//		      res=stmt.executeQuery("select * from labmem ");
				  
//		  out.print("添加的条数："+number);
		  /*
		   * 如果添加的条数为一，则表示成功插入了数据，因此，可以用这来判断数据库是否成功插入了数据。
		   */
		  
//		  if(number==1){
//			  out.println("恭喜您，公告更改成功！<br>");
//			  out.println("<a href='manageNotice-jsp.jsp'>返回公告管理页面</a>");
//		  }
//		  else{
//			  out.println("对不起，公告更新失败，请返回继续操作！");
//			  out.println("<a href='changeNotice.jsp'>返回公告管理页面</a>");
//		  }  
		  
//		      stmt.executeUpdate("insert into notice(developer,content,submitTime,deadline,rank,title) values('2','4','2008-11-22','2009-1-1','55','What the hell are you doing?')");
		      //处理结果集

		      while (res.next())
		      {
		    	out.print("<tr><td width=\"40%\" class=\"indl1\">");
		    %>
		   
		    	<a href="http://localhost:8080/labmanagement/<%=res.getString(5)%>" target="_blank"><%=res.getString(2) %></td><td width="30%" align="right" class="indl1">
		
		    <%
//		    	out.print(res.getString(3)+"</td><td width=\"50%\" align=\"right\" class=\"indl1\">");
				out.print(res.getString(4)+"</td></tr>");
//		        request.setAttribute("memID",   memID);   
//		        getServletContext().getRequestDispatcher("/jsp/test.jsp").forward(request,   response); 
//		        response.sendRedirect("http://localhost:8080/labmanagement/jsp/test.jsp") ;

		        
//		        out.println(res.getString(2));
//		        out.println(res.getString(3));
//		        out.println("恭喜您，公告更改成功！<br>");
		      }
		      
		  
		      res.close();
//		      out.println("Successful!");

		    }
		    catch (Exception ex)
		    {
		      System.out.println("Error : " + ex.toString());
		    }

	
	%>
														
														
														
														
														
														
													
													<tr height="22">
														<td width="85%" class="indl1"><br></td>
														<td width="15%" align="right" class="indl1"><br></td>
													</tr>
													<tr height="22">
														<td width="85%" class="indl1"><br></td>
														<td width="15%" align="right" class="indl1"><br></td>
													</tr>

												</table>
											</td>
										</tr>
									</table>
									<table width="100%" border="0" cellspacing="1" cellpadding="0"
										style="height: 315px">
										<tr>
											<td colspan="2">
												<table width="100%" border="0" align="center"
													cellpadding="0" cellspacing="1" style="height: 244px">
													<tr>
														<td height="24" valign="top">
															<table width="100%" border="0" cellspacing="0"
																cellpadding="0" style="border-bottom: 1px solid #CDCDCD">
																<tr>
																	<td height="4"></td>
																</tr>
															</table>
														</td>
													</tr>
													<tr>
														<td valign="top" style="height: 80px">
															<table width='100%' border='0' cellspacing='0'
																cellpadding='0'>
																<tr>
																	<td width='50%' valign='top'>

																		<table width="99%" border="0" cellpadding="3"
																			cellspacing="1" bgcolor="#E1EBD3"
																			style="margin-bottom: 3px">
																			<tr>
																				<td height="26" bgcolor="#E6F2CC"
																					background="/labmanagement/images/indbg1i.gif">

																					<table border="0" cellpadding="0" cellspacing="0"
																						width="98%">
																						<tr>
																							<td width='10%' align="center">
																								<img height="16" src="/labmanagement/images/channellist.gif"
																									width="14">
																							</td>
																							<td width='60%'>
																								资源列表
																							</td>
																							<td width='30%' align='right'>
																								<a
																									href="http://www.hlarti.com/html/xiangmugaikuang/index.html">
																									<img height="14" src="/labmanagement/images/more.gif" width="43"
																										border="0">
																								</a>
																							</td>
																						</tr>
																					</table>
																				</td>
																			</tr>
																			<tr>
																				<td height="50" valign="top" bgcolor="#FFFFFF">
																					<table width="100%" border="0" cellspacing="0"
																						cellpadding="0">
																						
		<%
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
//		      res = stmt.executeQuery("select * from notice");
//		      stmt.executeUpdate("insert into notice(developer,content,submitTime,deadline,rank,title) values('developer','content','submitTime','deadline','rank','title')");
//		  int number=stmt.executeUpdate("update notice set developer="+developer+",content='"+content+"',submitTime='"+strSubmitTime+"',deadline='"+strDeadline+"',rank="+rank+",title='"+title+"' where id='"+strID+"'");
		  res=stmt.executeQuery("select * from resource");
//		      res=stmt.executeQuery("select * from labmem ");
				  
//		  out.print("添加的条数："+number);
		  /*
		   * 如果添加的条数为一，则表示成功插入了数据，因此，可以用这来判断数据库是否成功插入了数据。
		   */
		  
//		  if(number==1){
//			  out.println("恭喜您，公告更改成功！<br>");
//			  out.println("<a href='manageNotice-jsp.jsp'>返回公告管理页面</a>");
//		  }
//		  else{
//			  out.println("对不起，公告更新失败，请返回继续操作！");
//			  out.println("<a href='changeNotice.jsp'>返回公告管理页面</a>");
//		  }  
		  
//		      stmt.executeUpdate("insert into notice(developer,content,submitTime,deadline,rank,title) values('2','4','2008-11-22','2009-1-1','55','What the hell are you doing?')");
		      //处理结果集

		      while (res.next())
		      {
//		    	out.print("<tr><td width=\"20%\" class=\"indl1\">");
//		    	out.print("["+res.getString(3)+"]"+"</td><td width=\"30%\" align=\"right\" class=\"indl1\">");
		    %>
		    <tr height="22">
				<td width="70%" class="indl1">[<%=res.getString(3) %>] <a href="http://localhost:8080/labmanagement/<%=res.getString(5)%>" target="_blank"><%=res.getString(2) %></a></td>
				<td width="30%" align="left" class="indl1"><%=res.getString(4)%></td>
			</tr>
		   
		    	<!--  a href="http://localhost:8080/labmanagement/<%=res.getString(5)%>" target="_blank"/><%=res.getString(2) %></td><td width="30%" align="right" class="indl1"-->
		
		    <%
//		    	out.print(res.getString(3)+"</td><td width=\"50%\" align=\"right\" class=\"indl1\">");
//				out.print(res.getString(4)+"</td><td width=\"30%\" align=\"right\" class=\"indl1\">");
//				out.print(res.getString(4)+"</td></tr>");
//		        request.setAttribute("memID",   memID);   
//		        getServletContext().getRequestDispatcher("/jsp/test.jsp").forward(request,   response); 
//		        response.sendRedirect("http://localhost:8080/labmanagement/jsp/test.jsp") ;

		        
//		        out.println(res.getString(2));
//		        out.println(res.getString(3));
//		        out.println("恭喜您，公告更改成功！<br>");
		      }
		      
		  
		      res.close();
//		      out.println("Successful!");

		    }
		    catch (Exception ex)
		    {
		      System.out.println("Error : " + ex.toString());
		    }

	
	%>
																						<tr>
																							<td width="70%" height="22" class="inddline">
																								&#12539;
																								<a href="/html/xiangmugaikuang/20080723/16.html">虚拟现实国家重点实验室概况</a>
																							</td>
																							<td width="30%" class="inddline">
																								2008-07-23
																							</td>
																						</tr>
																						
<tr height="22">
<td width="70%" class="indl1"><br></td>
<td width="30%" align="right" class="indl1"><br></td>
</tr>
																						
																						

																					</table>
																				</td>
																			</tr>
																		</table>
																	</td>
																	<td width='50%' valign='top'>

																		<table width="318" border="0" cellpadding="3"
																			cellspacing="1" bgcolor="#E1EBD3"
																			style="margin-bottom: 3px;" height="167">
																			<tr>
																				<td height="26" bgcolor="#E6F2CC"
																					background="/labmanagement/images/indbg1i.gif">

																					<table border="0" cellpadding="0" cellspacing="0"
																						width="98%">
																						<tr>
																							<td width='10%' align="center">
																								<img height="16" src="/labmanagement/images/channellist.gif"
																									width="14">
																							</td>
																							<td width='60%'>
																								项目列表
																							</td>
																							<td width='30%' align='right'>
																								<a
																									href="http://www.hlarti.com/html/xiangmugaikuang/index.html">
																									<img height="14" src="/labmanagement/images/more.gif" width="43"
																										border="0">
																								</a>
																							</td>
																						</tr>
																					</table>
																				</td>
																			</tr>
																			<tr>
																				<td height="50" valign="top" bgcolor="#FFFFFF">
																					<table width="100%" border="0" cellspacing="0"
																						cellpadding="0">
																		<%
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
//		      res = stmt.executeQuery("select * from notice");
//		      stmt.executeUpdate("insert into notice(developer,content,submitTime,deadline,rank,title) values('developer','content','submitTime','deadline','rank','title')");
//		  int number=stmt.executeUpdate("update notice set developer="+developer+",content='"+content+"',submitTime='"+strSubmitTime+"',deadline='"+strDeadline+"',rank="+rank+",title='"+title+"' where id='"+strID+"'");
		  res=stmt.executeQuery("select * from project");
//		      res=stmt.executeQuery("select * from labmem ");
				  
//		  out.print("添加的条数："+number);
		  /*
		   * 如果添加的条数为一，则表示成功插入了数据，因此，可以用这来判断数据库是否成功插入了数据。
		   */
		  
//		  if(number==1){
//			  out.println("恭喜您，公告更改成功！<br>");
//			  out.println("<a href='manageNotice-jsp.jsp'>返回公告管理页面</a>");
//		  }
//		  else{
//			  out.println("对不起，公告更新失败，请返回继续操作！");
//			  out.println("<a href='changeNotice.jsp'>返回公告管理页面</a>");
//		  }  
		  
//		      stmt.executeUpdate("insert into notice(developer,content,submitTime,deadline,rank,title) values('2','4','2008-11-22','2009-1-1','55','What the hell are you doing?')");
		      //处理结果集

		      while (res.next())
		      {
//		    	out.print("<tr><td width=\"20%\" class=\"indl1\">");
//		    	out.print("["+res.getString(3)+"]"+"</td><td width=\"30%\" align=\"right\" class=\"indl1\">");
		    %>
		    <tr>
				<td width="60%" style="height: 32px">&#12539; <a href="http://localhost:8080/labmanagement/<%=res.getString(5)%>" target="_blank"><%=res.getString(2) %></a></td>
				<td width="40%" align="left" style="height: 32px"><%=res.getString(4)%></td>
			</tr>
		   
		    	<!--  a href="http://localhost:8080/labmanagement/<%=res.getString(5)%>" target="_blank"/><%=res.getString(2) %></td><td width="30%" align="right" class="indl1"-->
		
		    <%
//		    	out.print(res.getString(3)+"</td><td width=\"50%\" align=\"right\" class=\"indl1\">");
//				out.print(res.getString(4)+"</td><td width=\"30%\" align=\"right\" class=\"indl1\">");
//				out.print(res.getString(4)+"</td></tr>");
//		        request.setAttribute("memID",   memID);   
//		        getServletContext().getRequestDispatcher("/jsp/test.jsp").forward(request,   response); 
//		        response.sendRedirect("http://localhost:8080/labmanagement/jsp/test.jsp") ;

		        
//		        out.println(res.getString(2));
//		        out.println(res.getString(3));
//		        out.println("恭喜您，公告更改成功！<br>");
		      }
		      
		  
		      res.close();
//		      out.println("Successful!");

		    }
		    catch (Exception ex)
		    {
		      System.out.println("Error : " + ex.toString());
		    }

	
	%>
																						<tr>
																							<td width="60%" height="11" class="inddline">
																								&#12539;
																								<a href="/html/news/20080721/13.html"><b><font
																										color='#CC0000'>招聘应用开发员2名</font>
																								</b>
																								</a>
																							</td>
																							<td width="40%" class="inddline">
																								2008-07-21
																							</td>
																						</tr>
																						
																						
																						

																					</table>
																				</td>
																			</tr>
																		</table>
																	</td>
																</tr>
																<tr>
																	<td width='50%' valign='top' colspan="2"
																		style="width: 100%">

																		&nbsp;
																	</td>
																</tr>
															</table>

														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table width="900" border="0" align="center" cellpadding="0"
				cellspacing="0" style="margin-top: 3px; margin-bottom: 6px;">
				<tr align="center">
					<td bgcolor="#F5F5F5" align='right' style="height: 28px">
						<table width=100% border=0 bgcolor=#cccccc cellspacing=1
							cellpadding=1>
							<tr bgcolor='#FFFFFF' height='20'>
								<td></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table width="900" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tbspan" style="margin-top: 3px">
				<tr>
					<td height="51" background="/templets/img/31bg5.gif" valign="top">
						<img src='/templets/img/31c5.gif' width='4' height='49'>
					</td>

					<td background="/templets/img/31bg5.gif" align="center">
						Copyright &copy; 2008&nbsp;&nbsp;北京航空航天大学计算机学院 陈君龙 周正喜
						<br>
						地址：北京市海淀区学院路37号院 邮编：100191
						<br>
						建设维护:陈君龙 周正喜&nbsp;&nbsp;&nbsp;电话：8610-82310488
						<br>
						电子邮箱:zzxwill@buaa.edu.cn
					</td>

					<td background="/templets/img/31bg5.gif" align="right" valign="top">
						<img src='/templets/img/31c6.gif' width='4' height='49'>
					</td>
				</tr>
			</table>

			<table width="900" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tbspan">
				<tr>
					<td height="6"></td>
				</tr>
			</table>
		</center>
	</body>
</html>

