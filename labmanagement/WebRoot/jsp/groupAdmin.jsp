<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@include file="head.jsp"%>
<%@page import="java.sql.*;"%>
<!--��ҳ����servlet ManageGroup��ֵ -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>ע���û�ҳ��</title>

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
						<span class="STYLE61"><a href="/labmanagement/jsp/index.jsp">��ҳ</a> | <a
							href="/labmanagement/jsp/labmem.jsp">�޸ĸ�����Ϣ</a> | <a href="/labmanagement/jsp/resrouse.jsp">��Դ</a>
							| <a href="/labmanagement/jsp/memproject.jsp">����</a> | <a href="/labmanagement/jsp/morePubInfo.jsp">
								������Ϣ</a> | <a href="/labmanagement/jsp/equipment.jsp">�豸</a> | <a href="mailto:zzxwill@buaa.edu.cn">��ϵ����</a> |<a href="/labmanagement/jsp/logout.jsp">ע��</a>
						</span> 
					</td>
				</tr>
			</table>
			<br>
	<table border="1" width="900"  align="center">		
	<tr ><td width="20%"><table border="0" align="left">
			<tr>
			<th align=left>������Ŀ����</th>
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
		      //����Connector/J����
		      //��һ��Ҳ��дΪ��Class.forName("com.mysql.jdbc.Driver");
		      Class.forName("com.mysql.jdbc.Driver").newInstance();
		      //������MySQL������
		      conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
		                                         "root", "zzxwill");
		      //ִ��SQL���
		      
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
			<th align=left>������Ϣ</th>
			</tr>
			<%
			try{
			  ResultSet ewq = null;
		      ewq = stmt.executeQuery("select * from  labmem where memID='"+id+"'");
		        while (ewq.next()){    
		       out.print("<tr><td>������"+ewq.getString(2)+"</td></tr>");//memName
		       out.print("<tr><td>ѧ�ţ�"+ewq.getString(4)+"</td></tr>");//studentNo.
		       out.print("<tr><td>ʵ���Һţ�"+ewq.getString(5)+"</td></tr>");//labNo.
		       out.print("<tr><td>QQ��"+ewq.getString(6)+"</td></tr>");//QQ
		       out.print("<tr><td>MSN��"+ewq.getString(7)+"</td></tr>");//MSN
		       out.print("<tr><td>�绰��"+ewq.getString(8)+"</td></tr>");//telephone
		       }
		       }
		       catch (Exception ex){
		       }
%>		
		</table></td></tr>  
		
			<tr><td td width="20%"><table border="0"  align="left">
			<tr>
			<th align=left>����С���Ա</th>
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
				//out.print("�������û�."+"<br>����ID:");
				Object rightID = session.getAttribute("rightID");
				//out.print("����Ȩ��ID:"+rightID);
			%>



			<div align="center">
				<font size="5"><br><br><strong><font size="7">��Ա����</font></strong></font>
			</div>

			<table border="1" width="900px" align="center">
				<tr>
					<td>
						<!------------------------------- ������һ�����table����ʾ��Ա���ڵ���---------------------------------------- -->
						<!------------------------------- ������һ�����table����ʾ��Ա���ڵ���---------------------------------------- -->
						<!------------------------------- ������һ�����table����ʾ��Ա���ڵ���---------------------------------------- -->
						<!------------------------------- ������һ�����table����ʾ��Ա���ڵ���---------------------------------------- -->

						<table border="1" align="left" width="250px">
							<tr>
								��Ա��״̬
							</tr>
							<tr>
								<th>
									��Ա����
								</th>
								<th>
									������
								</th>
							</tr>
							<%
								Class.forName("com.mysql.jdbc.Driver").newInstance();
								/*
									������������ע����������
								 */
								Connection conn3 = DriverManager
										.getConnection(
												"jdbc:mysql://localhost:3306/labmanagement?useUnicode=true&characterEncoding=GB2312",
												"root", "zzxwill");
								/*
								���� ���ݿ�
								 */

								Statement stmt3 = conn3.createStatement();
								//����һ��jdbc����
								ResultSet res3 = null;
								//����������һ��Resultʵ����,����������װ���صĽ��
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

									//���ǵڶ���
								}

								res3.close();
								stmt3.close();
								conn3.close();
							%>
						</table>
					</td>
					<!----------- ������һ�����table�ǽ���Ա�Ƴ���Ĳ��� ------------------------------------------------->
					<!----------- ������һ�����table�ǽ���Ա�Ƴ���Ĳ��� ------------------------------------------------->
					<!----------- ������һ�����table�ǽ���Ա�Ƴ���Ĳ��� ------------------------------------------------->
					<!----------- ������һ�����table�ǽ���Ա�Ƴ���Ĳ��� ------------------------------------------------->
					<!----------- ������һ�����table�ǽ���Ա�Ƴ���Ĳ��� ------------------------------------------------->

					<td>
						<!-- ������һ�����table�ǽ���Ա�Ƴ���Ĳ��� -->
						<!-- �Ƴ�����servlet MoveMemIn -->
						<table border="1" align="center" width="250px">
							<tr>
								�Ƴ���
							</tr>
							<tr>
								<th>
									��Ա����
								</th>
								<th>
									�Ƴ�����
								</th>
							</tr>
							<%
								

							
								//����һ��jdbc����
								ResultSet res = null;
								//����������һ��Resultʵ����,����������װ���صĽ��
								//		      res = stmt.executeQuery("select * from notice where id<='6'");
								res = stmt
										.executeQuery("select memID,memName from managegroup where memID!='"
												+ groupAdminID
												+ "' and groupID =(select groupID from groupmem where memID='"
												+ groupAdminID + "');");
								//		  out.print("<tr>");
								//		  out.print("<td>");
								//һ���������,���ǵ�һ��
								while (res.next()) {
									out.print("<tr><td>" + res.getString(2) + "</td>");//ID      

									//			int noticeID=Integer.parseInt(res.getString(1));
							%>

							<!-- ����ͨ�������Ӵ�ֵ�ر𾭵�! -->
							<!-- ����,��noticeID������ҳ�� changeNotice.jsp��-->
							<td>
								<a
									href="/labmanagement/servlet/MoveMemOut?groupUserID=<%=res.getString(1)%>">�Ƴ���</a>
							</td>
							<%
								out.print("</tr>");
									//	out.print("</td><td>");
									//����һ��td��ÿ����
								}

								//	res.close();
								stmt.close();
								conn.close();
							%>
						</table>
					</td>
					
					<td>
						<!----------- ������һ�����table�ǽ���Ա������Ĳ��� ------------------------------------------------->
						<!----------- ������һ�����table�ǽ���Ա������Ĳ��� ------------------------------------------------->
						<!----------- ������һ�����table�ǽ���Ա������Ĳ��� ------------------------------------------------->
						<!----------- ������һ�����table�ǽ���Ա������Ĳ��� ------------------------------------------------->
						<!----------- ������һ�����table�ǽ���Ա������Ĳ��� ------------------------------------------------->

						<table border="1" align="right" width="250px">
							<tr>
								������
							</tr>
							<tr>
								<th>
									��Ա����
								</th>
								<th>
									�������
								</th>
							</tr>
							<%
								Class.forName("com.mysql.jdbc.Driver").newInstance();
								/*
									������������ע����������
								 */
								Connection conn2 = DriverManager
										.getConnection(
												"jdbc:mysql://localhost:3306/labmanagement?useUnicode=true&characterEncoding=GB2312",
												"root", "zzxwill");
								/*
								���� ���ݿ�
								 */

								Statement stmt2 = conn2.createStatement();
								//����һ��jdbc����
								ResultSet res2 = null;
								//����������һ��Resultʵ����,����������װ���صĽ��
								//		      res = stmt.executeQuery("select * from notice where id<='6'");
								//		  	res2=stmt2.executeQuery("SELECT memID,memName from manageGroup where groupID='0' or groupID='"+groupAdminID+"';");
								res2 = stmt2
										.executeQuery("SELECT memID,memName from manageGroup where groupID='0';");

								while (res2.next()) {

									out.print("<tr><td>" + res2.getString(2) + "</td>");//ID 

									//			int noticeID=Integer.parseInt(res.getString(1));
							%>

							<!-- ����ͨ�������Ӵ�ֵ�ر𾭵�! -->
							<!-- ����,��noticeID������ҳ�� changeNotice.jsp��-->
							<%
								//System.out.print("���ڵ���:"+groupAdminID);
							%>
							<td>
								<a href="/labmanagement/servlet/MoveMemIn">������<%=res2.getString(1)%></a>
							</td>
							<!--groupAdminID�����û���ID.  -->

							<%
								session.setAttribute("userMemID", res2.getString(1));
									session.setAttribute("groupAdminID", groupAdminID);

									out.print("</tr>");
									//	out.print("</td>");
									//���ǵڶ���
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
			
			


			<!-- **********************���������񷢲�����******************************************** -->
			<!-- **********************���������񷢲�����******************************************** -->
			<!-- **********************���������񷢲�����******************************************** -->
			<!-- **********************���������񷢲�����******************************************** -->

			<table border="1" width="900px" align="center">
				<tr><div align="center">
					<font size="5"><br><br><font size="7">�������</font></font>
				</div></tr>
				<tr><td>
			
					
							<!-- ������һ�����table����ʾ��Ա���ڵ��� -->

								<table border="1" width="100%" align="left">
								<tr>
									��Ա�������
								</tr>
								<tr>
									<th>
										����
									</th>
									<th>
										����ʱ��
									</th>
									<th>
										��ֹʱ��
									</th>
									<th>
										�����Ա
									</th>
									<th>
										�Ƴ���Ա
									</th>
								</tr><tr>
								<%
									Class.forName("com.mysql.jdbc.Driver").newInstance();
									/*
										������������ע����������
									 */
									Connection conn4 = DriverManager
											.getConnection(
													"jdbc:mysql://localhost:3306/labmanagement?useUnicode=true&characterEncoding=GB2312",
													"root", "zzxwill");
									/*
									���� ���ݿ�
									 */

									Statement stmt4 = conn4.createStatement();
									//����һ��jdbc����
									ResultSet res4 = null;
									//����������һ��Resultʵ����,����������װ���صĽ��
									//		      res = stmt.executeQuery("select * from notice where id<='6'");
									//		  	 res4=stmt4.executeQuery("SELECT * from manageproject where memID!='"+groupAdminID+"';");
									//���治�����鳤
									res4 = stmt4
											.executeQuery("SELECT * from manageproject where projectID in (select projectID from projectmem where memID='"
													+ groupAdminID + "');");
									//���治�����鳤		 
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
										href="/labmanagement/servlet/MoveProjectMemOut?projectID=<%=res4.getString(1)%>&projectMemID=<%=res4.getString(6)%>">�Ƴ�</a>
								</td>
								<%
									//		       session.setAttribute("projectID",res4.getString(1));
											//		       session.setAttribute("projectMemID",res4.getString(5));
											out.print("<tr>" + "</tr>");//ID
											//���һ������

											//			int noticeID=Integer.parseInt(res.getString(1));

										}

										//���ǵڶ���
									}

									res4.close();
									stmt4.close();
									conn4.close();
								%>
							</tr>




							</table>
							</td>
						
					
				
				
				<!-- **********************�����������������ͳ�Ա����******************************************** -->
				<!-- **********************�����������������ͳ�Ա����******************************************** -->
				<!-- **********************�����������������ͳ�Ա����******************************************** -->
				<!-- **********************�����������������ͳ�Ա����******************************************** -->

				<td>
				
					<table border="1" width="400%" align="right" border=0>
						 <tr>	�������</tr>
						<tr>
							<td>
								
										<form action="/labmanagement/servlet/AddProject" method="post">
										
											<tr><td>��������
											<input type="text" name="projectName"></td></tr>
										<tr><td>
											
											<textarea type="textfield" name="projectCon"></textarea></td></tr>
											<tr><td>
											����ʱ��
											<input type="text" name="projectPub"></td></tr>
											<tr><td>
											��ֹʱ��
											<input type="text" name="deadline"></td></tr>
											<tr><td>
											<!--�鳤ID  -->
											<input type="hidden" name="groupAdminID" value=<%=groupAdminID %> ></td></tr>
											
											<tr><td>
											<input type=submit value="���"></td><td>
											<input type=reset value="���� "></td></tr>
											
										</form>


                                         </td>
									</tr>
								</table>
								</td>
								</tr>
								</table>
								
								
							




							<!-- **********************��������ӳ�Ա����********************************************************************** -->
							<!-- **********************��������ӳ�Ա����********************************************************************** -->
							<!-- **********************��������ӳ�Ա����********************************************************************** -->
							
							<!-- **********************��������ӳ�Ա����********************************************************************** --><!-- **********************��������ӳ�Ա����********************************************************************** -->
							<!-- **********************��������ӳ�Ա����********************************************************************** -->
			
						
								
								<table border="1" align="center" width="600px" >
									<tr>
										��ӳ�Ա
									</tr>
									<tr>
									<th>
										��Ա����
									</th>
									<th>
										�밴��������
									</th>
									</tr>
									<%
										Class.forName("com.mysql.jdbc.Driver").newInstance();
										/*
											������������ע����������
										 */
										Connection conn5 = DriverManager.getConnection(
												"jdbc:mysql://localhost:3306/labmanagement", "root",
												"zzxwill");
										/*
										���� ���ݿ�
										 */

										Statement stmt5 = conn5.createStatement();
										//����һ��jdbc����
										ResultSet res5 = null;
										//����������һ��Resultʵ����,����������װ���صĽ��
										//		      res = stmt.executeQuery("select * from notice where id<='6'");
										//		  	res2=stmt2.executeQuery("SELECT memID,memName from manageGroup where groupID='0' or groupID='"+groupAdminID+"';");
										res5 = stmt5
												.executeQuery("SELECT memID,memName from managegroup where groupID=(select groupID from groupmem where memID='"
														+ groupAdminID + "') ;");

										while (res5.next()) {
											if(!res5.getString("memID").equals(groupAdminID)){
										//������鳤����
											out.print("<tr><td>" + res5.getString("memName") + "</td>");//ID 

											/************************************************************************************************************
											 *Ӧ����������������,���鳤��������������************************************************************************
											 *Ӧ����������������,���鳤��������������************************************************************************
											 *Ӧ����������������,���鳤��������������************************************************************************
											 *Ӧ����������������,���鳤��������������************************************************************************
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
											
									  
										<input type="submit" value="���">
									</form>
									

									<!-- ����ͨ�������Ӵ�ֵ�ر𾭵�! -->
									<!-- ����,��noticeID������ҳ�� changeNotice.jsp��-->

									<!--groupAdminID�����û���ID.  -->

									<%
										out.print("</tr>");
											//	out.print("</td>");
											//���ǵڶ���
										}
										}

										res5.close();
										stmt5.close();
										conn5.close();
									%>
								</table>
								
						


			

					
				
				





			
		
	</body>
</html>
