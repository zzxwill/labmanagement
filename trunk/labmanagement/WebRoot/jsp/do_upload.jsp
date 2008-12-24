<%@ page contentType="text/html; charset=gb2312" language="java"
              import="java.util.*,com.jspsmart.upload.*" errorPage="" %>
<%@include file="head.jsp"%>
<%@page import="java.sql.*,java.text.*;"%>
             <html>
              <head>
              <title>文件上传处理页面</title>
              <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
              </head>
              <body>
              
              <table width="900px" align="center">
              
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
        //      out.println("TEST="+su.getRequest().getParameter("TEST")
             // +"<BR><BR>");
              // 逐一提取上传文件信息，同时可保存文件。
              String rC=null;
              String fn=null;
             
              
              
             for (int i=0;i<su.getFiles().getCount();i++)
              {
              com.jspsmart.upload.File file = su.getFiles().getFile(i);
              // 若文件不存在则继续
              //if (file.isMissing()) continue;
              // 显示当前文件信息
              //out.println("<TABLE BORDER=1>");
             // out.println("<TR><TD>文件名（FileName）</TD><TD>"
              //+ file.getFileName() + "</TD></TR>");
             // out.println("<TR><TD>文件扩展名（FileExt）</TD><TD>"
             // + file.getFileExt() + "</TD></TR>");
             // out.println("<TR><TD>文件全名（FilePathName）</TD><TD>"
             // + file.getFilePathName() + "</TD></TR>");
             // out.println("</TABLE><BR>");
              
              rC=file.getFileExt();//取得文件扩展名，即文件类型
              fn=file.getFileName();//取得文件全名，用于存文件地址
              
              // 将文件另存
              // file.saveAs("/upload/" + myFile.getFileName());
              // 另存到以WEB应用程序的根目录为文件根目录的目录下
              // file.saveAs("/upload/" + myFile.getFileName(),su.SAVE_VIRTUAL);
              // 另存到操作系统的根目录为文件根目录的目录下
              // file.saveAs("c:\\temp\\" + myFile.getFileName(),su.SAVE_PHYSICAL);
              }
                
              String rD=null;
              rD=su.getRequest().getParameter("resDes");    //取得资源描述 

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
	                                         "root", "zzxwill");
	      //执行SQL语句
	      
	      stmt = (Statement) conn.createStatement();
	      String rp=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime()); //获取系统时间 
	    
          //com.jspsmart.upload.File file = su.getFiles().getFile(0);
     // stmt.executeUpdate("insert into contract(developer,user,signedDate,deadline,status,house) values("+a+","+userid+",'"+s+"','"+d+"','1',"+hid+")");
	  int number=stmt.executeUpdate("insert into resource(resDes,resCat,resPub,url) values('"+rD+"','"+rC+"','"+rp+"','/upload/"+fn+"')");
	  //将资源信息存入数据库的表resource
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
      //将数据存入数据库的表releaseres
      
	if(number==1){
		  out.println("恭喜您，文件上传成功！<br>");
		  out.println("<a href='/labmanagement/jsp/resrouse.jsp'>返回资源页面</a><a href='user.jsp'>返回个人首页</a><br>");
	  }
	  else{
		  out.println("对不起，文件上传失败，请返回继续操作！");
		  out.println("<a href='/labmanagement/jsp/resrouse.jsp'>返回资源页面</a><a href='user.jsp'>返回个人首页</a>");
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
