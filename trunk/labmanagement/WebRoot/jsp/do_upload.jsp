<%@ page contentType="text/html; charset=gb2312" language="java"
              import="java.util.*,com.jspsmart.upload.*" errorPage="" %>
<%@include file="head.jsp"%>
<%@page import="java.sql.*,java.text.*;"%>
             <html>
              <head>
              <title>�ļ��ϴ�����ҳ��</title>
              <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
              </head>
              <body>
              
              <table width="900px" align="center">
              
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
        //      out.println("TEST="+su.getRequest().getParameter("TEST")
             // +"<BR><BR>");
              // ��һ��ȡ�ϴ��ļ���Ϣ��ͬʱ�ɱ����ļ���
              String rC=null;
              String fn=null;
             
              
              
             for (int i=0;i<su.getFiles().getCount();i++)
              {
              com.jspsmart.upload.File file = su.getFiles().getFile(i);
              // ���ļ������������
              //if (file.isMissing()) continue;
              // ��ʾ��ǰ�ļ���Ϣ
              //out.println("<TABLE BORDER=1>");
             // out.println("<TR><TD>�ļ�����FileName��</TD><TD>"
              //+ file.getFileName() + "</TD></TR>");
             // out.println("<TR><TD>�ļ���չ����FileExt��</TD><TD>"
             // + file.getFileExt() + "</TD></TR>");
             // out.println("<TR><TD>�ļ�ȫ����FilePathName��</TD><TD>"
             // + file.getFilePathName() + "</TD></TR>");
             // out.println("</TABLE><BR>");
              
              rC=file.getFileExt();//ȡ���ļ���չ�������ļ�����
              fn=file.getFileName();//ȡ���ļ�ȫ�������ڴ��ļ���ַ
              
              // ���ļ����
              // file.saveAs("/upload/" + myFile.getFileName());
              // ��浽��WEBӦ�ó���ĸ�Ŀ¼Ϊ�ļ���Ŀ¼��Ŀ¼��
              // file.saveAs("/upload/" + myFile.getFileName(),su.SAVE_VIRTUAL);
              // ��浽����ϵͳ�ĸ�Ŀ¼Ϊ�ļ���Ŀ¼��Ŀ¼��
              // file.saveAs("c:\\temp\\" + myFile.getFileName(),su.SAVE_PHYSICAL);
              }
                
              String rD=null;
              rD=su.getRequest().getParameter("resDes");    //ȡ����Դ���� 

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
	                                         "root", "zzxwill");
	      //ִ��SQL���
	      
	      stmt = (Statement) conn.createStatement();
	      String rp=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //��ȡϵͳʱ�� 
	    
          //com.jspsmart.upload.File file = su.getFiles().getFile(0);
     // stmt.executeUpdate("insert into contract(developer,user,signedDate,deadline,status,house) values("+a+","+userid+",'"+s+"','"+d+"','1',"+hid+")");
	  int number=stmt.executeUpdate("insert into resource(resDes,resCat,resPub,url) values('"+rD+"','"+rC+"','"+rp+"','/upload/"+fn+"')");
	  //����Դ��Ϣ�������ݿ�ı�resource
	  ResultSet r = null;
	  r=stmt.executeQuery("select * from resource where resDes='"+rD+"'");
	  int x=0;
	  while (r.next()){
	  x=r.getInt(1);
	  }
	  Object y=session.getAttribute("memID");

	 //Object y=session.getAttribute("memID");
	  //out.print("x"+x+"y"+y);
      stmt.executeUpdate("insert into releaseres(resID,memID) values ('"+x+"','"+y+"')");
      //�����ݴ������ݿ�ı�releaseres
      
	if(number==1){
		  out.println("��ϲ�����ļ��ϴ��ɹ���<br>");
		  out.println("<a href='/labmanagement/jsp/resrouse.jsp'>������Դҳ��</a><a href='user.jsp'>���ظ�����ҳ</a><br>");
	  }
	  else{
		  out.println("�Բ����ļ��ϴ�ʧ�ܣ��뷵�ؼ���������");
		  out.println("<a href='/labmanagement/jsp/resrouse.jsp'>������Դҳ��</a><a href='user.jsp'>���ظ�����ҳ</a>");
	  }
	      res.close();

	    }
	    catch (Exception ex)
	    {
	      System.out.println("Error : " + ex.toString());
	    }
              %>
              </table>
              </body>
              </html>
