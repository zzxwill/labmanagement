<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@include file="head.jsp"%>
<%@page import="java.sql.*;"  %>

<html>
  <head>
    
    <title>�޸ĸ�����Ϣ</title>
    
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
  <%
			  Object id=session.getAttribute("memID");
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
            
		     res = stmt.executeQuery("select * from  labmem where memID='"+id+"'");
		     int memId=0;
		     String stuNo=null;
             String memName=null;
             String labNo=null;
             String QQ=null;
             String MSN=null;
             String telephone=null;
             String password=null;
             while (res.next()){
             password=res.getString(3);
             stuNo=res.getString(4);
             memName=res.getString(2);
             labNo=res.getString(5);
             QQ=res.getString(6);
             MSN=res.getString(7);
             telephone=res.getString(8);
             }
%>
 <%   request.setCharacterEncoding("gb2312");   %>
  
  <table align="center" width="900">

  <h2> �޸ĸ�����Ϣ</h2>
  
    <form action="/labmanagement/servlet/LabMem" method="post"> 
    <input name="password" type="hidden"  value=<%=password%> ><br />
     ʵ����ID��<input name="memID" type="text" value=<%=id %> size="20" readonly><br />
     ѧ��: <input name="stuNo" type="text" value=<%=stuNo %> size="25"  readonly><br />
     ����:<input name="memName" type="text"  value=<%=memName%> size="25"  ><br />
    QQ��<input name="QQ"  type="text" value=<%=QQ %> size="25" ><br />
	MSN��<input name="MSN"  type="text" value=<%=MSN %> size="25" ><br />
	ʵ���Һţ�<input name="labNo"  type="text" value=<%=labNo %> size="25" ><br />
	��ϵ�绰��<input name="telephone"  type="text" value=<%=telephone %> size="25" ><br />
	<input type="submit" value="ȷ�ϸ���" /><br />
	</form>
	
	
	
	</table>
	
  </body>
</html>
