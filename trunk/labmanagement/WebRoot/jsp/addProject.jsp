<%@ page language="java" contentType="text/html charset=gb2312" %> 
<%@ page pageEncoding="gb2312"%>
<%@ page import="java.sql.*"%>
<%@ include file="head.jsp"%>
<html>
	<body>
	<%
   		try
	    {
	    String projectName=request.getParameter("projectName");
//	    System.out.println(projectName);
	    String projectCon=request.getParameter("projectCon");
	    String projectPub=request.getParameter("projectPub");
	    String deadline=request.getParameter("deadline");
	    System.out.println("projectName:"+projectName);
	    System.out.println("projectCon:"+projectCon);
	    System.out.println("projectPub:"+projectPub);
	    System.out.println("deadline:"+deadline);
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
	  int number=stmt.executeUpdate("insert into project(projectName,projectCon,projectPub,deadline) values('"+projectName+"','"+projectCon+"','"+projectPub+"','"+deadline+"')");
	  //age�����ݿ��еı�����int,����,������, '"+age+"' ��"+age+"����
	  

	  /*
	   * �����ӵ�����Ϊһ�����ʾ�ɹ����������ݣ���ˣ������������ж����ݿ��Ƿ�ɹ����������ݡ�
	   */
	  
	  if(number==1){
		  out.println("��ϲ������������ӳɹ���<br>");
		  out.println("<a href='/labmanagement/jsp/groupAdmin.jsp'>����</a>");
	  }
	  else{
		  out.println("�Բ������������ʧ�ܣ��뷵�ؼ���������");
		   out.println("<a href='/labmanagement/jsp/groupAdmin.jsp'>����</a>");
	  }
	  


	    }
	    catch (Exception ex)
	    {
	      System.out.println("Error : " + ex.toString());
	    }
   	 %>
	</body>
</html>
