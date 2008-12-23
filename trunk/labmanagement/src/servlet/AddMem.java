package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
public class AddMem extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddMem() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		
		Object projectMemID=request.getParameter("projectMemID");
		System.out.print("projectMemID:"+projectMemID);
		response.setContentType("text/html;charset=GB2312");

//		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		
		String   a[]=request.getParameterValues( "project");
		int count=0;
		String projectID=null;
		try{
			count=a.length;
		}catch(Exception e){};
		
		for(int i=0;i<count;i++){
			projectID=a[i];
			System.out.print(a[i]);
		}
		
		
		try{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection conn7=DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
	                                         "root", "zzxwill");
	    Statement stmt7=conn7.createStatement();
	    ResultSet res7 = null;
	  	int num=stmt7.executeUpdate("insert into projectmem values('"+projectMemID+"','"+projectID+"')");
	  	if(num==1){
			out.print("为任务添加成员操作成功!\n ");
		}
		else{
			out.print("对不起,用记已在该任务中!\n");
		}
	}catch(Exception e){};

	out.print("<a href=\"/labmanagement/jsp/groupAdmin.jsp\">返回</a>");
	
	

		
//		String   b[]=a.split( "& ") ;
//		String   sql= "select   cust_gp,sum(charge)   from   serv1   where   area   in   ( ' "+b[0]+ " ', ' "+b[1]+ ")   group   by   cust_gp "; 

		
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * Returns information about the servlet, such as 
	 * author, version, and copyright. 
	 *
	 * @return String information about this servlet
	 */
	public String getServletInfo() {
		return "This is my default servlet created by Eclipse";
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
