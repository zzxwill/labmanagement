<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@include file="head.jsp"%>
<%@page import="java.sql.*;"  %>

<!--��ҳ����servlet ManageGroup��ֵ -->
<html>
  <head>
    
    <title>ע���û�ҳ��</title>
    

  </head>
  
  <body>
  	<table width="900px" align="center">
  	
  	<%
  		Object groupAdminID=session.getAttribute("memID");
  		out.print("�������û�."+"<br>����ID:");
  		Object rightID=session.getAttribute("rightID");
  		out.print("����Ȩ��ID:"+rightID);
  	 %>
  	 
  	 
  	 	<br><br><br><br><br><br><br>
  	 	<div align="center"><font size="5">��Ա����</font></div> 
		<table border="1" width="60%"  align="center">
		
		<td>
<!------------------------------- ������һ�����table����ʾ��Ա���ڵ���---------------------------------------- -->
<!------------------------------- ������һ�����table����ʾ��Ա���ڵ���---------------------------------------- -->
<!------------------------------- ������һ�����table����ʾ��Ա���ڵ���---------------------------------------- -->
<!------------------------------- ������һ�����table����ʾ��Ա���ڵ���---------------------------------------- -->
		
		<table border="1"  align="left">
		<tr>��Ա��״̬</tr>
		<th>��Ա����</th>
		<th> ������</th>	
		<%
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			/*
				������������ע����������
			*/
			Connection conn3=DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
		                                         "root", "zzxwill");
		        /*
		        ���� ���ݿ�
		        */

		      Statement stmt3=conn3.createStatement();
		      //����һ��jdbc����
		      ResultSet res3 = null;
		      //����������һ��Resultʵ����,����������װ���صĽ��
//		      res = stmt.executeQuery("select * from notice where id<='6'");
		  	 res3=stmt3.executeQuery("SELECT memName,groupName from managegroup, grou where (managegroup.groupID='0' or managegroup.groupID =(select groupID from groupmem where memID='"+groupAdminID+"')) and managegroup.groupID=grou.groupID;");
		 
		      while (res3.next())
		      {
			   	
		       out.print("<tr><td>"+res3.getString(1)+"</td>");//ID 
		       out.print("<td>"+res3.getString(2)+"</td>");//ID 
				
//			int noticeID=Integer.parseInt(res.getString(1));

%>

 				<!-- ����ͨ�������Ӵ�ֵ�ر𾭵�! -->
 				<!-- ����,��noticeID������ҳ�� changeNotice.jsp��-->
	<%
	out.print(			"</tr>");

	//���ǵڶ���
	}
	
	res3.close();
	stmt3.close();
	conn3.close();
%>	
	</table>
	</td>
<!----------- ������һ�����table�ǽ���Ա�Ƴ���Ĳ��� ------------------------------------------------->
<!----------- ������һ�����table�ǽ���Ա�Ƴ���Ĳ��� ------------------------------------------------->
<!----------- ������һ�����table�ǽ���Ա�Ƴ���Ĳ��� ------------------------------------------------->
<!----------- ������һ�����table�ǽ���Ա�Ƴ���Ĳ��� ------------------------------------------------->
<!----------- ������һ�����table�ǽ���Ա�Ƴ���Ĳ��� ------------------------------------------------->
			
	<td>
	<!-- ������һ�����table�ǽ���Ա�Ƴ���Ĳ��� -->
	<!-- �Ƴ�����servlet MoveMemIn -->
		<table border="1"  align="center">
		<tr>�Ƴ���</tr>
		<th>��Ա����</th>
		<th> �Ƴ�����</th>	
		<%
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			/*
				������������ע����������
			*/
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
		                                         "root", "zzxwill");
		        /*
		        ���� ���ݿ�
		        */

		      Statement stmt=conn.createStatement();
		      //����һ��jdbc����
		      ResultSet res = null;
		      //����������һ��Resultʵ����,����������װ���صĽ��
//		      res = stmt.executeQuery("select * from notice where id<='6'");
		  res=stmt.executeQuery("select memID,memName from managegroup where memID!='"+groupAdminID+"' and groupID =(select groupID from groupmem where memID='"+groupAdminID+"');");
//		  out.print("<tr>");
//		  out.print("<td>");
		  //һ���������,���ǵ�һ��
		      while (res.next())
		      {
		       out.print("<tr><td>"+res.getString(2)+"</td>");//ID      
				
//			int noticeID=Integer.parseInt(res.getString(1));

%>

 				<!-- ����ͨ�������Ӵ�ֵ�ر𾭵�! -->
 				<!-- ����,��noticeID������ҳ�� changeNotice.jsp��-->
	<td><a href="/labmanagement/servlet/MoveMemOut?groupUserID=<%=res.getString(1)%>">�Ƴ���</a></td>
	<%
	out.print("</tr>");
//	out.print("</td><td>");
	//����һ��td��ÿ����
	}
	
//	res.close();
	stmt.close();
	conn.close();
%>			
	</table>
	</td>
	<td>
<!----------- ������һ�����table�ǽ���Ա������Ĳ��� ------------------------------------------------->
<!----------- ������һ�����table�ǽ���Ա������Ĳ��� ------------------------------------------------->
<!----------- ������һ�����table�ǽ���Ա������Ĳ��� ------------------------------------------------->
<!----------- ������һ�����table�ǽ���Ա������Ĳ��� ------------------------------------------------->
<!----------- ������һ�����table�ǽ���Ա������Ĳ��� ------------------------------------------------->
	
		<table border="1"  align="right">
		<tr>������</tr>	
		<th>��Ա����</th>
		<th> �������</th>	
		<%
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			/*
				������������ע����������
			*/
			Connection conn2=DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
		                                         "root", "zzxwill");
		        /*
		        ���� ���ݿ�
		        */

		      Statement stmt2=conn2.createStatement();
		      //����һ��jdbc����
		      ResultSet res2 = null;
		      //����������һ��Resultʵ����,����������װ���صĽ��
//		      res = stmt.executeQuery("select * from notice where id<='6'");
//		  	res2=stmt2.executeQuery("SELECT memID,memName from manageGroup where groupID='0' or groupID='"+groupAdminID+"';");
		  	res2=stmt2.executeQuery("SELECT memID,memName from manageGroup where groupID='0';");
	
		      while (res2.next())
		      {
			
		       out.print("<tr><td>"+res2.getString(2)+"</td>");//ID 
				
//			int noticeID=Integer.parseInt(res.getString(1));

%>

 				<!-- ����ͨ�������Ӵ�ֵ�ر𾭵�! -->
 				<!-- ����,��noticeID������ҳ�� changeNotice.jsp��-->
 				<%//System.out.print("���ڵ���:"+groupAdminID); %>
		<td><a href="/labmanagement/servlet/MoveMemIn">������<%=res2.getString(1)%></a></td>
		<!--groupAdminID�����û���ID.  -->

	<%
	
	session.setAttribute("userMemID",res2.getString(1));
	session.setAttribute("groupAdminID",groupAdminID);
	

	out.print(			"</tr>");
//	out.print("</td>");
	//���ǵڶ���
	}
	
	res2.close();
	stmt2.close();
	conn2.close();
%>	
	</table>
	</td>
	
	
	
	
<!-- **********************���������񷢲�����******************************************** -->
<!-- **********************���������񷢲�����******************************************** -->
<!-- **********************���������񷢲�����******************************************** -->
<!-- **********************���������񷢲�����******************************************** -->
	
	<table border="1" width="80%"  align="center">
	<div align="center"><font size="5">�������</font></div> 
		<table border="1" width="60%"  align="center">
		
		<td>
			<!-- ������һ�����table����ʾ��Ա���ڵ��� -->
		
		<table border="1"  align="left">
		<tr>��Ա��״̬</tr>
		<th>����</th>
		<th>����ʱ��</th>
		<th>��ֹʱ��</th>
		<th>�����Ա</th>
		<th>�Ƴ���Ա</th>	
		<%
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			/*
				������������ע����������
			*/
			Connection conn4=DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
		                                         "root", "zzxwill");
		        /*
		        ���� ���ݿ�
		        */

		      Statement stmt4=conn4.createStatement();
		      //����һ��jdbc����
		      ResultSet res4 = null;
		      //����������һ��Resultʵ����,����������װ���صĽ��
//		      res = stmt.executeQuery("select * from notice where id<='6'");
//		  	 res4=stmt4.executeQuery("SELECT * from manageproject where memID!='"+groupAdminID+"';");
			//���治�����鳤
		  	 res4=stmt4.executeQuery("SELECT * from manageproject where projectID in (select projectID from projectmem where memID='"+groupAdminID+"');");
			//���治�����鳤		 
		    String projectName=null;
		    String projectPub=null;
		    String deadline=null;
	      	while (res4.next())
	      	{
	      	if(res4.getString(5).equals(groupAdminID)){
	      	}
	      	else{
	   		if(!res4.getString(2).equals(projectName)){
	   				out.print("</td>");//ID
	out.print(			"</tr>");
		        out.print("<tr><td>"+res4.getString(2)+"</td>");//ID 
		    }  else{
		    	out.print("<td>"+"</td>");//ID 
		
		    }
		       projectName=res4.getString(2);
		       
		     if(!res4.getString(3).equals(projectPub)){
		       out.print("<td>"+res4.getString(3)+"</td>");//ID 
		    }
		    else{
	
		    	out.print("<td>"+"</td>");//ID 
		    }
		    
		    
		       projectPub=res4.getString(3);
		       
		        if(!res4.getString(4).equals(deadline)){
		       out.print("<td>"+res4.getString(4)+"</td>");//ID 
		    } else{

		    	out.print("<td>"+"</td>");//ID 
		    }
		    
		 
		       deadline=res4.getString(4);
		       out.print("<td width=\"20%\">"+res4.getString(6)+"</td>");//ID
		       %>
		       <td><a href="/labmanagement/servlet/MoveProjectMemOut?projectID=<%=res4.getString(1) %>&projectMemID=<%=res4.getString(5) %>">�Ƴ�</a></td>
		       <%
//		       session.setAttribute("projectID",res4.getString(1));
//		       session.setAttribute("projectMemID",res4.getString(5));
		        out.print("<tr>"+"</tr>");//ID
		        //���һ������
			
//			int noticeID=Integer.parseInt(res.getString(1));
 		
%>

 				<!-- ����ͨ�������Ӵ�ֵ�ر𾭵�! -->
 				<!-- ����,��noticeID������ҳ�� changeNotice.jsp��-->
	<%
}

	//���ǵڶ���
	}
	
	res4.close();
	stmt4.close();
	conn4.close();
%>	

	<tr></tr>
	
	
	
	</table>
	</td>
<!-- **********************�����������������ͳ�Ա����******************************************** -->
<!-- **********************�����������������ͳ�Ա����******************************************** -->
<!-- **********************�����������������ͳ�Ա����******************************************** -->
<!-- **********************�����������������ͳ�Ա����******************************************** -->
	
	
	<tr>
	<table border="1" width="80%"  align="center">
	<tr></tr>
	<tr>
	<td>
			<table border="1" width="60%"  align="center">
			<tr>
			
			</tr>
			<tr>
		<form action="/labmanagement/servlet/AddProject" method="post" name="form1">		
		��������<input type="text" name="projectName"><br>
		��������<textarea type="textfield" name="projectCon"></textarea><br>
		����ʱ��<input type="text" name="projectPub"><br>
		��ֹʱ��<input type="text" name="deadline"><br>
		<input type="submit" value="���"><br>
		<input type="reset" value="���� ">
	</form>
				
				
				
			</tr>
			</table>
	</td>
	
	
	
		
<!-- **********************��������ӳ�Ա����********************************************************************** -->
<!-- **********************��������ӳ�Ա����********************************************************************** -->
<!-- **********************��������ӳ�Ա����********************************************************************** -->
<!-- **********************��������ӳ�Ա����********************************************************************** -->
<!-- **********************��������ӳ�Ա����********************************************************************** -->
<!-- **********************��������ӳ�Ա����********************************************************************** -->
		
		<td>
<table border="1"  align="right">
		<tr>��ӳ�Ա</tr>	
		<th>��Ա����</th>
		<th>�밴��������</th>
		<%
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			/*
				������������ע����������
			*/
			Connection conn5=DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
		                                         "root", "zzxwill");
		        /*
		        ���� ���ݿ�
		        */

		      Statement stmt5=conn5.createStatement();
		      //����һ��jdbc����
		      ResultSet res5 = null;
		      //����������һ��Resultʵ����,����������װ���صĽ��
//		      res = stmt.executeQuery("select * from notice where id<='6'");
//		  	res2=stmt2.executeQuery("SELECT memID,memName from manageGroup where groupID='0' or groupID='"+groupAdminID+"';");
		  	res5=stmt5.executeQuery("SELECT memID,memName from managegroup where groupID=(select groupID from groupmem where memID='"+groupAdminID+"');");
	
		      while (res5.next())
		      {
			   
		       out.print("<tr><td>"+res5.getString(2)+"</td>");//ID 
		       
/************************************************************************************************************
*Ӧ����������������,���鳤��������������************************************************************************
*Ӧ����������������,���鳤��������������************************************************************************
*Ӧ����������������,���鳤��������������************************************************************************
*Ӧ����������������,���鳤��������������************************************************************************
*******************************************************************************************/		       
				out.print("<td>");
				
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				Connection conn7=DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
	    	                                     "root", "zzxwill");
	   			 Statement stmt7=conn7.createStatement();
	   		 ResultSet res7 = null;
	  		res7=stmt7.executeQuery("SELECT distinct projectID,projectName from manageproject;");
	      
	       %>
	       <form action="/labmanagement/servlet/AddMem"  method="get" name="form2">
	      <select name="project">
	      <%
	      
//	      String projectMemID=res7.getString(1);
	      while (res7.next())
	      {
	      %>
	      	<option value=<%=res7.getString(1) %>> <%=res7.getString(2) %>
	      <%
	  
		   System.out.print("<tr>"+res7.getString(1)+"</td>");//ID 
	       System.out.print("<td>"+res7.getString(2)+"</td>\n");//ID 
			
     }
     
//*******************************����µ���Ŀ*************************************
//*******************************����µ���Ŀ*************************************	
//*******************************����µ���Ŀ*************************************
	  %>
	  
	  
	      </select>
	      <input type="hidden" name="projectMemID" value=<%=res5.getString(1) %> >
	      <input type="submit" value="����">
	      </form>
	      <%
				
				
//			int noticeID=Integer.parseInt(res.getString(1));

%>

 				<!-- ����ͨ�������Ӵ�ֵ�ر𾭵�! -->
 				<!-- ����,��noticeID������ҳ�� changeNotice.jsp��-->
		
		<!--groupAdminID�����û���ID.  -->

	<%
	

	out.print(			"</tr>");
//	out.print("</td>");
	//���ǵڶ���
	}
	
	res5.close();
	stmt5.close();
	conn5.close();
%>	
	</table>
	</td>
	
			
			
	
	�������
	</tr>
	</table>
	</tr>
	
	
	
	
	
	</table>
	</table>
  </body>
</html>
