<%@ page contentType="text/html; charset=gb2312" language="java"
              import="java.util.*,com.jspsmart.upload.*" errorPage="" %>
<%@include file="head.jsp"%>
<%@page import="java.sql.*,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,javax.servlet.http.HttpServlet,javax.servlet.ServletException,java.io.PrintWriter,java.io.IOException"  %>
 <%@ page import="java.text.*"%>             
              <html>
              <head>
              <title>�ļ��ϴ�����ҳ��</title>
              <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
              </head>
              <body>
              <%
              // �½�һ��SmartUpload����
              SmartUpload su = new SmartUpload();
              // �ϴ���ʼ��
              su.initialize(pageContext);
              // �趨�ϴ�����
              // 1.����ÿ���ϴ��ļ�����󳤶ȡ�
              // su.setMaxFileSize(10000);
              // 2.�������ϴ����ݵĳ��ȡ�
              // su.setTotalMaxFileSize(20000);
              // 3.�趨�����ϴ����ļ���ͨ����չ�����ƣ�,������doc,txt�ļ���
              // su.setAllowedFilesList("doc,txt");
              // 4.�趨��ֹ�ϴ����ļ���ͨ����չ�����ƣ�,��ֹ�ϴ�����exe,bat,jsp,htm,html��չ�����ļ���û����չ�����ļ���
             
              // su.setDeniedFilesList("exe,bat,jsp,htm,html,,");
              // �ϴ��ļ�
              su.upload();
              // ���ϴ��ļ�ȫ�����浽ָ��Ŀ¼
              su.save("/upload");
            // int count=su.save("/upload");
              //out.println(count+"���ļ��ϴ��ɹ���<br>");
              // ����Request�����ȡ����ֵ֮
              String resDes=null;
              String resCat=null;
              resDes=request.getParameter("resDes");
              resCat=request.getParameter("resCat");

       try
	    {
	      Connection conn=null;
	      Statement stmt;
	      ResultSet res = null;
	      //����Connector/J����
	      //��һ��Ҳ��дΪ��Class.forName("com.mysql.jdbc.Driver");
	      Class.forName("com.mysql.jdbc.Driver").newInstance();
	      //������MySQL������
	      conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
	                                         "root", "088215");
	      //ִ��SQL���
	      
	      stmt = (Statement) conn.createStatement();
	      String resPub=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //��ȡϵͳʱ�� 
	      
          //com.jspsmart.upload.File file = su.getFiles().getFile(0);
     
	  int number=stmt.executeUpdate("insert into resource(resDes,resCat,resPub,url) values('"+resDes+"','"+resCat+"','"+resPub+"','/upload/'");
	  

	if(number==1){
		  out.println("��ϲ�����ļ��ϴ��ɹ���<br>");
		  out.println("<a href='/labmanagement/jsp/resrouse.jsp'>������Դҳ��</a>");
	  }
	  else{
		  out.println("�Բ����ļ��ϴ�ʧ�ܣ��뷵�ؼ���������");
		  out.println("<a href='/labmanagement/jsp/resrouse.jsp'>������Դҳ��</a>");
	  }
	      res.close();

	    }
	    catch (Exception ex)
	    {
	      System.out.println("Error : " + ex.toString());
	    }
              %>
              </body>
              </html>
