<%@   page   contentType="text/html;   charset=gb2312"   language="java"%>  
<%@page pageEncoding="GB2312"%>
<% request.setCharacterEncoding("GB2312"); %>
<%@page import="java.sql.*;"  %>
<html>
	<head></head>
		<body>
			<%
			    Object reid=session.getAttribute("memID");
				String   abc=(String)reid;
				
				
				int x=Integer.parseInt(abc);
				
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
		      stmt = (Statement) conn.createStatement();
		      int y=0;//�������û�ID
		      res=stmt.executeQuery("select rightID from rightassign where memID='"+x+"'");
		      while(res.next()){
		      y=res.getInt(1);
		      }
			  if(y==1)
			    response.sendRedirect("/labmanagement/jsp/user.jsp") ;
				else if(y==3)
				response.sendRedirect("/labmanagement/jsp/superAdmin.jsp") ;
				else
			   response.sendRedirect("/labmanagement/jsp/groupAdmin.jsp") ;
			 %>
			<!--%=memID %  -->
		</body>
</html>