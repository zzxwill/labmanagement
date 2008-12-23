<%@ page contentType="text/html; charset=gb2312" language="java"
              import="java.util.*,com.jspsmart.upload.*" errorPage="" %>
<%@include file="head.jsp"%>
<%@page import="java.sql.*,javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse,javax.servlet.http.HttpServlet,javax.servlet.ServletException,java.io.PrintWriter,java.io.IOException"  %>
 <%@ page import="java.text.*"%>             
              <html>
              <head>
              <title>文件上传处理页面</title>
              <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
              </head>
              <body>
              <%
              // 新建一个SmartUpload对象
              SmartUpload su = new SmartUpload();
              // 上传初始化
              su.initialize(pageContext);
              // 设定上传限制
              // 1.限制每个上传文件的最大长度。
              // su.setMaxFileSize(10000);
              // 2.限制总上传数据的长度。
              // su.setTotalMaxFileSize(20000);
              // 3.设定允许上传的文件（通过扩展名限制）,仅允许doc,txt文件。
              // su.setAllowedFilesList("doc,txt");
              // 4.设定禁止上传的文件（通过扩展名限制）,禁止上传带有exe,bat,jsp,htm,html扩展名的文件和没有扩展名的文件。
             
              // su.setDeniedFilesList("exe,bat,jsp,htm,html,,");
              // 上传文件
              su.upload();
              // 将上传文件全部保存到指定目录
              su.save("/upload");
            // int count=su.save("/upload");
              //out.println(count+"个文件上传成功！<br>");
              // 利用Request对象获取参数之值
              String resDes=null;
              String resCat=null;
              resDes=request.getParameter("resDes");
              resCat=request.getParameter("resCat");

       try
	    {
	      Connection conn=null;
	      Statement stmt;
	      ResultSet res = null;
	      //加载Connector/J驱动
	      //这一句也可写为：Class.forName("com.mysql.jdbc.Driver");
	      Class.forName("com.mysql.jdbc.Driver").newInstance();
	      //建立到MySQL的连接
	      conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
	                                         "root", "088215");
	      //执行SQL语句
	      
	      stmt = (Statement) conn.createStatement();
	      String resPub=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间 
	      
          //com.jspsmart.upload.File file = su.getFiles().getFile(0);
     
	  int number=stmt.executeUpdate("insert into resource(resDes,resCat,resPub,url) values('"+resDes+"','"+resCat+"','"+resPub+"','/upload/'");
	  

	if(number==1){
		  out.println("恭喜您，文件上传成功！<br>");
		  out.println("<a href='/labmanagement/jsp/resrouse.jsp'>返回资源页面</a>");
	  }
	  else{
		  out.println("对不起，文件上传失败，请返回继续操作！");
		  out.println("<a href='/labmanagement/jsp/resrouse.jsp'>返回资源页面</a>");
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
