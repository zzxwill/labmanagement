<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@include file="userhead.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>ʵ���ҳ�Ա����ҳ��</title>

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

		<table width="900" align="center" border="0">
			<tr>
				<hr>
			</tr>
			<tr>
				<td>
					<table align=left width="50%">
						<tr>
							<th height="50" align=center>
								��ӳ�Ա
							</th>
						</tr>
						<tr>
							<td align=center>
								<form action="/labmanagement/servlet/AddUser" method=post>
									<table>
										<tr>
											<td>
												������
												<input type=text name=na>
											</td>
										</tr>
										<tr>
											<td>
												ѧ�ţ�
												<input type=text name=sn>
											</td>
										</tr>
										<tr>
											<td>
												���룺
												<input type=password name=pd>
											</td>
										</tr>
										<tr>
											<td>
												�ٴ��������룺
												<input type=password name=pd2>
											</td>
										</tr>
										<tr>
											<td>
												
												<input type=submit value=��ӳ�Ա>
											</td>
										</tr>
									</table>
								</form>
								
							</td>
						</tr>
					</table>
				</td>
				<td>
					<table align=left width="50%">
						<tr>
							<th height="50" align=left>
								ɾ����Ա
							</th>
						</tr>
						<tr>
							<td>
								<%
								Object id = session.getAttribute("memID");
									session.setAttribute("memID", id);

									//if(i1.toString().equals("1")){
									//Object id2=session.getAttribute("memid");
									//id=Integer.parseInt(id2.toString());
									//}
									//int  id=1;
									Connection conn = null;
									Statement stmt;
								
									//����Connector/J����
									//��һ��Ҳ��дΪ��Class.forName("com.mysql.jdbc.Driver");
									Class.forName("com.mysql.jdbc.Driver").newInstance();
									//������MySQL������
									conn = (Connection) DriverManager
											.getConnection(
													"jdbc:mysql://localhost:3306/labmanagement?useUnicode=true&characterEncoding=GB2312",
													"root", "zzxwill");
									stmt = (Statement) conn.createStatement();
								
									ResultSet st = null;

									String[] gn = new String[100]; //����
									int k = 0;
									st = stmt.executeQuery("select * from labmem ");
									while (st.next()) {
										//out.print("<td width=75>"+t.getString(1)+"</td>");
											gn[k] = st.getString(2);//��ȡ���г�Ա����
											k++;
										}
								
									//out.print("</tr>");

									out
											.print("<form action='/labmanagement/servlet/DelUser' method='post'><table >");
									out.print("<tr><td height='50'>");
									out.print("<select name=mn>");
									for (k = 0; gn[k] != null; k++) {
										out.print("<option>" + gn[k]);
									}
									out.print("</select></td>");
									out
											.print("<td height='50'><input type='submit' value='ɾ����Ա'></td></tr></table></form>");
								%>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<a href="/labmanagement/jsp/superAdmin.jsp">���س�������Աҳ��</a>
				</td>
			</tr>
		</table>


	</body>
</html>
