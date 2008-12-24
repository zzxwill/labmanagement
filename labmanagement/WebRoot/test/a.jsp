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
					任务名称<input type="text" name="projectName"><br>
					任务内容<input type="text" name="projectCon"><br>
					发布时间<input type="text" name="projectPub"><br>
					截止时间<input type="text" name="deadline"><br>
					<input type=submit value="添加">
					<input type=reset value="重填 ">
				</form>
				
				
				
			</tr>
		
  
    

//		<%session.setAttribute("g2","123"); %>
		<%session.setAttribute("name","will"); %>

   

  </body>
</html>
