<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.sql.*" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>ʵ���ҹ���ϵͳ��վ</title>
		
<style type="text/css">
.relatedLinks h3 {
	padding: 10px 0px 2px 0px;
}

.STYLE14 {
	color: #000099;
	font-size: 14px;
	font-family: "΢���ź�";
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
	font-family: "΢���ź�";
	font-weight: bold;
	background-color: #FFFF99;
}

.STYLE61 {
	font-family: "΢���ź�";
	font-size: 18px;
	color: #006699;
}

.style1 {
	background-color: #FFFFFF;
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
								alt="ʵ���ҹ���ϵͳ">
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
									<a href="developing.jsp">��վ��ͼ</a>
								</td>
								<td>
									<a href="developing.jsp">RSS����</a>
								</td>
							</tr>
							<tr align="center" height="20">
								<td>
									<a href="developing.jsp">�߼�����</a>
								</td>
								<td>
									<a href='#'
										onClick="javascript:window.external.AddFavorite('http://localhost:8080/labmanagement/jsp/index.htm','ʵ���ҹ���ϵͳ');">
										�ղر�վ</a>
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
						<span class="STYLE61"><a href="index.jsp">��ҳ</a> | <a
							href="labIntro.jsp"> ʵ���Ҹſ�</a> | <a href="teachers.jsp">
						��Ա����</a>
							| <a href="project.jsp">������Ŀ</a> | <a href="product.jsp">
								�ɹ�չʾ</a> | <a href="mailto:zzxwill@buaa.edu.cn">��ϵ����</a>
						</span> 
					</td>
				</tr>
			</table>
			
			
			<table width="900" border="0" cellspacing="0" cellpadding="0">
				<tr>
				<%int 	FLAG=6;//���ڿ�����Ϣ������ %>
					<td width="222" valign='top' 
						background='/labmanagement/images/ibg.gif'>
						<!--Split-->
						<table width="96%" align="center" cellpadding="0" cellspacing="0">
							<tr>
								<td height="24">
									<table cellSpacing="0" cellPadding="0" border="0"
										style="width: 115px">
										<tr>
											<td vAlign="top" width="222" background="/labmanagement/images/ibg.gif"
												>
												<!--Split-->
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
							cellspacing="1" bgcolor="#BCC1B3" style="background-color: rgb(255, 255, 255);">
							<tr>
								<td valign="top" >
								<%      //Object id=null;
								        Object id=session.getAttribute("memID");
								        String y=(String)id;
								        //out.print(y);
								        //int x=Integer.parseInt(y);
								        //out.print(x);
								        if(y!=null){
										out.print("���Ѿ���½<br>");
										
										
										out.print("<a href='/labmanagement/jsp/reload.jsp'>�������ҳ��</a><br>");
										out.print("<a href='/labmanagement/jsp/logout.jsp'>ע��</a>");
										}
										else{
										out.print("<table width=100% border=0 cellspacing=0 cellpadding=0>");
										out.print("<form action='/labmanagement/servlet/Login' method='post'>");
											out.print("ѧ�ţ�<input type=text name=stuNO>");
											out.print("���룺<input type=password name=password >");
											out.print("<input type=submit value=��½> ");
											out.print("<input type=reset value=����>");
											out.print("</form>");
										out.print("</table>");
										}
										%>
								</td>
							</tr>
						</table>
						
						<!--Split-->
						<table width="221" align="center" cellpadding="0" cellspacing="0" height="23">
							
							
							<tr><td valign="top">&nbsp;</td></tr>
						</table>
						
						<!--Split-->
						
						<!--Split-->
						<table align="center" cellpadding="0" cellspacing="0"
							style="width: 98%">
							
							<tr>
							<td>
								
								
								<!-- SiteSearch Google -->
<form method=get action="http://www.google.com/search" target="_blank">
<table bgcolor="#FFFFFF" width="285" height="125" style=""><tr>
	<td valign="top" bgcolor="#E6F2CC" style="width: 287px"><img width="41" height="23" border="0" src="../images/search.png" align="absbottom">������վ</td></tr><tr> 
<td style="width: 287px">
<input type=text name=q size=31 maxlength=255 value="">
<input type=hidden name=ie value=GB2312>
<input type=hidden name=oe value=GB2312>
<input type=hidden name=hl value=zh-CN> <input type=submit name=btnG value="����" >
<font size=-1>
<input type=hidden name=domains value="YOUR DOMAIN NAME"><br>
<input type=radio name=sitesearch value=""> Google
<input type=radio name=sitesearch value="http://zzxwill.blog.sohu.com/" checked>ʵ���ҹ���ϵͳ
</font>
</td></tr></table>
<br>
<br>
</form>
						<table border="0" align="center" cellpadding="2"
							cellspacing="1" style="width: 278px; height: 139px">
							
							<tr>
								<!--  td valign="top" bgcolor="#E6F2CC" class="style1"-->
									<td bgcolor="#E6F2CC"><img width="11" height="11" alt="" src="/labmanagement/images/pic_arrow.gif"> ��������</td>
								</tr> 
							
							<tr>
								<td><strong><font color="#004080"> 
								�������պ����ѧ��ҳ</font></strong> 
								 
									<a href="http://www.buaa.edu.cn">
									http://www.buaa.edu.cn</a>
								</td>
								</tr> 
							
							<tr>
								<td><strong><font color="#004080"> 
								�������պ����ѧ������ʵ������ϵͳ�����ص�ʵ����</font></strong>  
									<a href="http://www.vrlab.buaa.edu.cn/">
									http://www.buaa.edu.cn</a>
								</td>
								</tr> 
							
							
							<tr>
								<td>
									<a href="applyLink.jsp"><h3 class="STYLE14">[��������]  </h3></a>
								</td>
								</tr> 
							
							<tr>
								<td></td>
								</tr> 
							
							
									</td>
							</tr>
							</table>
						

								
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
											<td style="height: 2px" bgcolor="#E6F2CC">
												<img height="16" src="/labmanagement/images/channellist.gif" width="14">
												������Ϣ
											</td>
											<td style="height: 2px" bgcolor="#E6F2CC">
												<a
													href="morePubInfo.jsp">
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
		      //����Connector/J����
		      //��һ��Ҳ��дΪ��Class.forName("com.mysql.jdbc.Driver");
		      Class.forName("com.mysql.jdbc.Driver").newInstance();
		      //������MySQL������
		      conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
		                                         "root", "zzxwill");
		      //ִ��SQL���
		      
		      stmt = (Statement) conn.createStatement();
		  res=stmt.executeQuery("select * from pubinfo");
              int[] x=new int[100]; //��ϢID
              int i=0;
              String[] inTi=new String[100];//��Ϣ����
              String[] inTm=new String[100];//����ʱ��

              //����������ʾ����Ϣ����
		      while (res.next())
		      {

		      	if(i<=FLAG+2){
		        x[i]=res.getInt(1);
		        inTi[i]=res.getString(2);
		        inTm[i]=res.getString(4);
		        i++;
		        }
		      }
		      for(i=0;x[i]!=0;i++){
		  
		      out.print("<tr><td width=40% class=indl1 >");
		      System.out.print(x[i]);
		      out.print("<a href='/labmanagement/jsp/info_detail.jsp?inid="+x[i]+"'>"+inTi[i]+"</a></td>");
		      out.print("<td width=50% align=right class=indl1 >"+inTm[i]+"</td></tr>");
		     
		      }
		      
		  
		      res.close();

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
																								��Դ�б�
																							</td>
																							<td width='30%' align='right'>
																								<a
																									href="moreResource.jsp">
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
		      //����Connector/J����
		      //��һ��Ҳ��дΪ��Class.forName("com.mysql.jdbc.Driver");
		      Class.forName("com.mysql.jdbc.Driver").newInstance();
		      //������MySQL������
		      conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
		                                         "root", "zzxwill");
		      //ִ��SQL���
		      
		      stmt = (Statement) conn.createStatement();
		  res=stmt.executeQuery("select * from resource");
				int j=0;
		      while (res.next())
		      {
		      j++;
		      if(j<=FLAG){
		    %>
		    <tr height="22">
				<td width="70%" class="indl1">[<%=res.getString(3) %>] <a href="http://localhost:8080/labmanagement/<%=res.getString(5)%>" target="_blank"><%=res.getString(2) %></a></td>
				<td width="30%" align="left" class="indl1"><%=res.getString(4)%></td>
			</tr>
		   
		    	<!--  a href="http://localhost:8080/labmanagement/<%=res.getString(5)%>" target="_blank"/><%=res.getString(2) %></td><td width="30%" align="right" class="indl1"-->
		
		    <%}
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
																								�����б�
																							</td>
																							<td width='40%' align='right'>
																								<a
																									href="moreProject.jsp">
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
		      //����Connector/J����
		      //��һ��Ҳ��дΪ��Class.forName("com.mysql.jdbc.Driver");
		      Class.forName("com.mysql.jdbc.Driver").newInstance();
		      //������MySQL������
		      conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
		                                         "root", "zzxwill");
		      //ִ��SQL���
		      
		      stmt = (Statement) conn.createStatement();
//		      res = stmt.executeQuery("select * from notice");
//		      stmt.executeUpdate("insert into notice(developer,content,submitTime,deadline,rank,title) values('developer','content','submitTime','deadline','rank','title')");
//		  int number=stmt.executeUpdate("update notice set developer="+developer+",content='"+content+"',submitTime='"+strSubmitTime+"',deadline='"+strDeadline+"',rank="+rank+",title='"+title+"' where id='"+strID+"'");
		  res=stmt.executeQuery("select * from project");
//		      res=stmt.executeQuery("select * from labmem ");
				  
//		  out.print("��ӵ�������"+number);
		  /*
		   * �����ӵ�����Ϊһ�����ʾ�ɹ����������ݣ���ˣ������������ж����ݿ��Ƿ�ɹ����������ݡ�
		   */
		  
//		  if(number==1){
//			  out.println("��ϲ����������ĳɹ���<br>");
//			  out.println("<a href='manageNotice-jsp.jsp'>���ع������ҳ��</a>");
//		  }
//		  else{
//			  out.println("�Բ��𣬹������ʧ�ܣ��뷵�ؼ���������");
//			  out.println("<a href='changeNotice.jsp'>���ع������ҳ��</a>");
//		  }  
		  
//		      stmt.executeUpdate("insert into notice(developer,content,submitTime,deadline,rank,title) values('2','4','2008-11-22','2009-1-1','55','What the hell are you doing?')");
		      //��������
              int[] x=new int[100]; //��ϢID
              int i=0;
              String[] inTi=new String[100];//��Ϣ����
              String[] inTm=new String[100];//����ʱ��
           
		      while (res.next())
		      {
		      	if(i<FLAG+2){
		        x[i]=res.getInt(1);
		        inTi[i]=res.getString(2);
		        inTm[i]=res.getString(4);
		        i++;
		        }
		      }
		      for(i=0;x[i]!=0;i++){
		  
		      out.print("<tr><td width=40% class=indl1 >&#12539;");
		 
		      System.out.print(x[i]);
		      out.print("<a href='/labmanagement/jsp/pro_detail.jsp?inid="+x[i]+"'>"+inTi[i]+"</a></td>");
		      //request.setAttribute("inid",x[i] );
		     // out.print("</a></td>");
		      out.print("<td width=50% align=right class=indl1 >"+inTm[i]+"</td></tr>");
		     
		      }
		      
		  
		      res.close();
//		      out.println("Successful!");

		    }
		    catch (Exception ex)
		    {
		      System.out.println("Error : " + ex.toString());
		    }

	
	
	%>
																					
																						
																						
																						

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
						Copyright &copy; 2008&nbsp;&nbsp;�������պ����ѧ�����ѧԺ �¾��� ����ϲ
						<br>
						��ַ�������к�����ѧԺ·37��Ժ �ʱࣺ100191
						<br>
						����ά��:�¾��� ����ϲ&nbsp;&nbsp;&nbsp;�绰��8610-82310488
						<br>
						��������:zzxwill@buaa.edu.cn
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

