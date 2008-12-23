package servlet;
import javax.servlet.ServletException;
import javax.servlet.ServletContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import java.io.IOException;

import java.util.*;
import java.util.Date;
import java.sql.*;
import java.io.*;
import java.text.*;

/*
 * 用于添加公告！
 */
public class Login2 extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public void service (HttpServletRequest request,HttpServletResponse response)throws IOException{
		request.setCharacterEncoding("GBK");
		
		String stuNO=request.getParameter("memID");
		String password=request.getParameter("password");
		
//		Login notice=new Login(stuNO,password);
        response.setContentType("text/html;charset=GBK");
		PrintWriter out=response.getWriter();
		out.println("<html><body>");
		
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
//		      res = stmt.executeQuery("select * from notice");
//		      stmt.executeUpdate("insert into notice(developer,content,submitTime,deadline,rank,title) values('developer','content','submitTime','deadline','rank','title')");
//		  int number=stmt.executeUpdate("update notice set developer="+developer+",content='"+content+"',submitTime='"+strSubmitTime+"',deadline='"+strDeadline+"',rank="+rank+",title='"+title+"' where id='"+strID+"'");
		  res=stmt.executeQuery("select memID from labmem where stuNO='"+stuNO+"' and password='"+password+"'");
			  
//		  out.print("添加的条数："+number);
		  /*
		   * 如果添加的条数为一，则表示成功插入了数据，因此，可以用这来判断数据库是否成功插入了数据。
		   */
		  
//		  if(number==1){
//			  out.println("恭喜您，公告更改成功！<br>");
//			  out.println("<a href='manageNotice-jsp.jsp'>返回公告管理页面</a>");
//		  }
//		  else{
//			  out.println("对不起，公告更新失败，请返回继续操作！");
//			  out.println("<a href='changeNotice.jsp'>返回公告管理页面</a>");
//		  }  
		  
//		      stmt.executeUpdate("insert into notice(developer,content,submitTime,deadline,rank,title) values('2','4','2008-11-22','2009-1-1','55','What the hell are you doing?')");
		      //处理结果集

		      while (res.next())
		      {
		        String memID = res.getString("1");
		        out.println(memID);
		        out.println("恭喜您，公告更改成功！<br>");
		      }
		      
		  
		      res.close();
//		      out.println("Successful!");

		    }
		    catch (Exception ex)
		    {
		      System.out.println("Error : " + ex.toString());
		    }

		
		
		    out.println("</body></html>");
		
		
		
		
	}
	public void destroy(){
		super.destroy();
	}
}