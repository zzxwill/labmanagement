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
  <h2> �޸ĸ�����Ϣ</h2>
    <form action="/labmanagement/servlet/LabMem" method="post"> 
    <input name="password" type="hidden"  value=<%=password%> ><br />
     ʵ����ID��<input name="memID" type="text" value=<%=id %> size="20" readonly><br />
       ѧ�ţ�<input name="stuNo" type="text" value=<%=stuNo %> size="25"  readonly><br />
	����:<input name="memName" type="text"  value=<%=memName%> size="26"  ><br />
	QQ��<input name="QQ"  type="text" value=<%=QQ %> size="27" ><br />
	MSN��<input name="MSN"  type="text" value=<%=MSN %> size="26" ><br />
	ʵ���Һţ�<input name="labNo"  type="text" value=<%=labNo %> size="20" ><br />
	��ϵ�绰��<input name="telephone"  type="text" value=<%=telephone %> size="20" ><br />
	<input type="submit" value="ȷ�ϸ���" /><br />
	</form>
	<a href="index.jsp">������ҳ</a>
  </body>
</html>
