<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 



<html>
  <head>
  	<title></title>
    

  </head>
  
  <body>

			<tr>
			
			</tr>
			<tr>
				<form action="/labmanagement/servlet/AddProject" method="post">
					��������<input type="text" name="projectName"><br>
					��������<input type="text" name="projectCon"><br>
					����ʱ��<input type="text" name="projectPub"><br>
					��ֹʱ��<input type="text" name="deadline"><br>
					<input type=submit value="���">
					<input type=reset value="���� ">
				</form>
				
				
				
			</tr>
		
  
    

//		<%session.setAttribute("g2","123"); %>
		<%session.setAttribute("name","will"); %>

   

  </body>
</html>
