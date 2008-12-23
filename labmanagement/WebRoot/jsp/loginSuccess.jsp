<%@   page   contentType="text/html;   charset=gb2312"   language="java"%>  
<%@page pageEncoding="GB2312"%>
<% request.setCharacterEncoding("GB2312"); %>
<%@ include file="head.jsp" %>
<%@ page import="java.sql.*"    %>
<html>
	<head></head>
		<body>
			<%
				String   abc=(String)request.getAttribute("memID");
				out.print("用servlet中传过来的值----memID:"+abc);
//				Login login=new Login();
//				out.print(login.returnMemID());

//				String id=(String)request.getAttribute("memID");
//				out.println(id);
				session.setAttribute("memID",abc);
				try{
		      		Connection conn=null;
		     		 Statement stmt;
		     		 ResultSet res = null;
		      //加载Connector/J驱动
		      //这一句也可写为：Class.forName("com.mysql.jdbc.Driver");
		     		 Class.forName("com.mysql.jdbc.Driver").newInstance();
		      //建立到MySQL的连接
		      		conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
		                                         "root", "zzxwill");
		      //执行SQL语句
		      
		      		stmt = (Statement) conn.createStatement();
		      		res=stmt.executeQuery("select rightID from rightassign where memID="+abc+"");
			  int rightID=0;
		      while (res.next())
		      {
		    	rightID=res.getInt("rightID");
		    	System.out.println(rightID);
		      }
		       
		      if(rightID==1){				
					response.sendRedirect("/labmanagement/jsp/user.jsp") ;
		     }
		     else if(rightID==2){
		     	response.sendRedirect("/labmanagement/jsp/groupAdmin.jsp");
		     }else if(rightID==3){
		     	response.sendRedirect("/labmanagement/jsp/superAdmin.jsp");
		     }
		     
		     session.setAttribute("rightID",rightID);
		  
		      res.close();
//		      out.println("Successful!");

		    }
		    catch (Exception ex)
		    {
		      System.out.println("Error : " + ex.toString());
		    }
		    
		   
			
			 %>
			<!--%=memID %  -->
		</body>
</html>