<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@include file="head.jsp"%>
<%@page import="java.sql.*;"  %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>��Դҳ��</title>
    
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
								������Ϣ</a> | <a href="/labmanagement/jsp/equipment.jsp">�豸</a> | <a href="mailto:zzxwill@buaa.edu.cn">��ϵ����</a> | <a href="/labmanagement/jsp/logout.jsp">ע��</a>
						</span> 
					</td>
				</tr>
			</table>
  <table width="900" align="center">
  <tr><th width="20%" align=left>��Դ����</th><th width="20%" align=left>��Դ����</th><th width="20%" align=left>����ʱ��</th><th  width="20%" align=left>������</th><th  width="20%" align=left>ɾ����Դ</th></tr>

		<% Object id=session.getAttribute("memID");
		    
			 session.setAttribute("memID",id);
		      Connection conn=null;
		      Statement stmt;
		      ResultSet res = null;
		      ResultSet r=null;
		      //����Connector/J����
		      //��һ��Ҳ��дΪ��Class.forName("com.mysql.jdbc.Driver");
		      Class.forName("com.mysql.jdbc.Driver").newInstance();
		      //������MySQL������
		      conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
		                                         "root", "zzxwill");
		      //ִ��SQL���
		       stmt = (Statement) conn.createStatement();
		      r=stmt.executeQuery("select rightID from rightassign where memID='"+id+"'");
		      int  rightID=0;
		      while(r.next()){
		      rightID=r.getInt(1);
		      }
		      
		      
		      
		     
		       res = stmt.executeQuery("select * from  res1 ");
		       
		     int resID=0;
		     String resDes=null;
             String resCat=null;
             String resPub=null;
             String url=null;
             String memName=null;
            
             while (res.next()){
             out.print("<tr><td><a href='/labmanagement"+res.getString(5)+"'>"+res.getString(2)+"</a></td>");//resDes
		       out.print("<td>"+res.getString(3)+"�ĵ�</td>");//resCat
		       out.print("<td>"+res.getString(4)+"</td>");//resPub
		       out.print("<td>"+res.getString(6)+"</td>");//memName
		       if(rightID>=2){
			   %>
			   <td><a href="/labmanagement/servlet/DeleteResource?resourceID=<%=res.getString(1) %>">ɾ��</a></td></tr>
			   <%
			   }
             resID=res.getInt(1);
             resDes=res.getString(2);
             resCat=res.getString(3);
             resPub=res.getString(4);
             url=res.getString(5);
             memName=res.getString(6);
             }
		      
%></table>

<p align="center">�ϴ��ļ�ѡ��</p> 
<form method="post" action="do_upload.jsp" 
enctype="multipart/form-data"> 
<input type="hidden" name="test" value="good"> 
<table width="900" border="1" align="center"> 
<tr> 
<td><div align="center">
<input type="file" name="file1" size="30"> 
</div></td> 
</tr> 
<tr> 
<td><div align="center"> ��Դ����
<input type="text" name="resDes" size="30" value=""> 
</div></td> 
</tr> 
<tr>
<td><div align="center"> 
<input type="submit" name="submit" value="�ϴ�����"> 
</div></td> 
</tr> 
</table> 
</form> 
  
  </body>
</html>
