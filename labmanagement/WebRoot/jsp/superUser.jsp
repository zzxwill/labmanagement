<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@include file="userhead.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>�����ҳ��</title>

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
			�����  
		</h2>
		
		<table width="900" align="center" border="0">
		<tr><hr></tr>
           <tr><td width=100>
			<table border="0" width="100%" height="100%">
				<tr>
					<th height="50">
						С������
					</th>
				</tr>
				<%
			 Object id=session.getAttribute("memID");
			 session.setAttribute("memID",id);
			 
			
		      Connection conn=null;
		      Statement stmt;
		      ResultSet res = null;
		      //����Connector/J����
		      //��һ��Ҳ��дΪ��Class.forName("com.mysql.jdbc.Driver");
		      Class.forName("com.mysql.jdbc.Driver").newInstance();
		      //������MySQL������
		      conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement?useUnicode=true&characterEncoding=GB2312",
		                                         "root", "zzxwill");
		      //ִ��SQL���
		      int[] gd=new int[100];
		      int z=0;
		      for(z=0;z<100;z++){
		      gd[z]=-1;
		      }
		      
		      int i=0;
		      stmt = (Statement) conn.createStatement();

			  res = stmt.executeQuery("select * from  grou ");

		      while (res.next())
		      {	        
		       out.print("<tr><th height=50>"+res.getString(2)+"</th></tr>");//projectName
		       gd[i]=res.getInt(1);
		       
		       i++;
		       
		       }
		       %>
			</table>
			</td>
			<td width=100>
			<table border="0" width="100%" height="100%">
				<tr>
					<th height="50" align=center>
						�鳤
					</th>
				<tr>
					<%
						ResultSet r = null;
						for (i = 0; gd[i] != -1; i++) {
						 
							out.print("<tr>");
							if(gd[i]==0){
							  out.print("<td height=50 align=center><br></td>");
							  }
							r = stmt
									.executeQuery("select memName from group1 where groupId='"
											+ gd[i] + "' and rightID='2'");
							while (r.next()) {
							
								out.print("<td height=50 align=center>" + r.getString(1) + "</td>");
								
							}
							out.print("</tr>");
						}
					%>
				
			</table>
			</td>
			<td >
			<table border="0" width="100%" height="100%">
				<tr>
					<th height="50" align=left>
						��Ա
					</th>
				<tr>
					<%
						ResultSet t = null;
						for (i = 0; gd[i] != -1; i++) {
							out.print("<tr>");
							t = stmt
									.executeQuery("select memName from group1 where groupId='"
											+ gd[i] + "' and rightID<>'2'");
							while (t.next()) {
								out.print("<td width=75 height=50 align=center>" + t.getString(1)
										+ "</td>");

							}
							out.print("</tr>");
						}
					%>
				
			</table>
			</td>
			<td width=200>
			<table border="0" width="100%" height="100%" align=right>
				<tr>
					<th height="50">
						����ѡ���鳤
					</th>
				</tr>
				
						<%
							ResultSet s = null;
							for (i = 0; gd[i] != -1; i++) {
								//out.print("<tr>");
								int j = 0;
								String[] na = new String[100];
								s = stmt
										.executeQuery("select memName from group1 where groupId='"
												+ gd[i] + "'");
								while (s.next()) {
									na[j] = s.getString(1);
									j++;
								}

								out
										.print("<form action='/labmanagement/servlet/ChangeGU' method='post'>");
								out.print("<tr><td height='50'>");
								out.print("<select name=gu>");
								for (j = 0; na[j] != null; j++) {
									out.print("<option>" + na[j]);
								}
								out.print("</select></td>");
								out
										.print("<td height='50'><input type='submit' value='����鳤'></td></tr></form>");

							}
						%>
					
			</table>
			</td></tr>
		</table>
	
		<table width="900" align="center" border="0">
		<tr><hr></tr>
		<tr><td>
			<table align=left width="50%">
				<tr>
					<th height="50" align=center>
						�½���
					</th>
				</tr>
				<tr>
					<td align=center>
						<%
							ResultSet stet = null;

							String[] mn = new String[100]; //����
							int l = 0;
							stet = stmt
									.executeQuery("select memName from mem_rig where rightID='1'");
							while (stet.next()) {
								mn[l] = stet.getString(1);
								l++;
							}

							out
									.print("<form action='/labmanagement/servlet/NewGro' method='post'><table >");
							out.print("<tr><td height='50'>");
							out.print("ѡ���鳤��<select name=ngrn>");
							for (l = 0; mn[l] != null; l++) {
								out.print("<option>" + mn[l]);
							}
							out.print("</select></td>");
							out.print("����:<input type=text name=gna ></input>");
							out
									.print("<td height='50'><input type='submit' value='�½���'></td></tr></table></form>");
						%>
					</td>
				</tr>
			</table>
</td><td>
			<table align=left width="50%">
				<tr>
					<th height="50" align=left>
						ɾ����
					</th>
				</tr>
				<tr>
					<td>
						<%
							ResultSet st = null;

							String[] gn = new String[100]; //����
							int k = 0;
							st = stmt.executeQuery("select * from grou ");
							while (st.next()) {
								//out.print("<td width=75>"+t.getString(1)+"</td>");
								if(st.getInt(1)==0){
							       ;
								}
								else{
								gn[k] = st.getString(2);
								k++;
								}
							}

							out
									.print("<form action='/labmanagement/servlet/DelGro' method='post'><table >");
							out.print("<tr><td height='50'>");
							out.print("<select name=grn>");
							for (k = 0; gn[k] != null; k++) {
								out.print("<option>" + gn[k]);
							}
							out.print("</select></td>");
							out
									.print("<td height='50'><input type='submit' value='ɾ����'></td></tr></table></form>");
						%>
					</td>
				</tr>
			</table>
			</td></tr>
			<tr><td><a href="/labmanagement/jsp/superAdmin.jsp">���س�������Աҳ��</a></td></tr>
		</table>
		
		
	</body>
</html>
