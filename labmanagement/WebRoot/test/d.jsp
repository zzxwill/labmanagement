<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>


  <body>
     <script   language="JavaScript">   
  function   noregist(){   
  alert("Stop logging in!");   
  open("http://localhost:8080/labmanagement/jsp/applyLink.jsp","");
  window.opener=null;self.close();
  
  }   
  </script> 
  
  <input type="button" value="submit" onclick="noregist();">
    <a   href="javascript:noregist();">login</a>
  </body>
</html>
