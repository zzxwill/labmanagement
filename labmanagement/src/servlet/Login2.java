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
 * ������ӹ��棡
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
		      //����Connector/J����
		      //��һ��Ҳ��дΪ��Class.forName("com.mysql.jdbc.Driver");
		      Class.forName("com.mysql.jdbc.Driver").newInstance();
		      //������MySQL������
		      conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
		                                         "root", "zzxwill");
		      //ִ��SQL���
		      
		      stmt = (Statement) conn.createStatement();
//		      res = stmt.executeQuery("select * from notice");
//		      stmt.executeUpdate("insert into notice(developer,content,submitTime,deadline,rank,title) values('developer','content','submitTime','deadline','rank','title')");
//		  int number=stmt.executeUpdate("update notice set developer="+developer+",content='"+content+"',submitTime='"+strSubmitTime+"',deadline='"+strDeadline+"',rank="+rank+",title='"+title+"' where id='"+strID+"'");
		  res=stmt.executeQuery("select memID from labmem where stuNO='"+stuNO+"' and password='"+password+"'");
			  
//		  out.print("��ӵ�������"+number);
		  /*
		   * �����ӵ�����Ϊһ�����ʾ�ɹ����������ݣ���ˣ������������ж����ݿ��Ƿ�ɹ����������ݡ�
		   */
		  
//		  if(number==1){
//			  out.println("��ϲ����������ĳɹ���<br>");
//			  out.println("<a href='manageNotice-jsp.jsp'>���ع������ҳ��</a>");
//		  }
//		  else{
//			  out.println("�Բ��𣬹������ʧ�ܣ��뷵�ؼ���������");
//			  out.println("<a href='changeNotice.jsp'>���ع������ҳ��</a>");
//		  }  
		  
//		      stmt.executeUpdate("insert into notice(developer,content,submitTime,deadline,rank,title) values('2','4','2008-11-22','2009-1-1','55','What the hell are you doing?')");
		      //��������

		      while (res.next())
		      {
		        String memID = res.getString("1");
		        out.println(memID);
		        out.println("��ϲ����������ĳɹ���<br>");
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