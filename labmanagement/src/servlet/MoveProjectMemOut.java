package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MoveProjectMemOut extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public MoveProjectMemOut() {
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
//		session.setAttribute("projectID",res4.getString(1));
//        session.setAttribute("projectMemID",res4.getString(5));
		
//		String projectID=request.getParameter("projectID");
//		String memID=request.getParameter("memID");
		
//		Object projectID=request.getSession().getAttribute("projectID");
//		Object projectMemID=request.getSession().getAttribute("projectMemID");
//		System.out.print("projectID:"+projectID);
//		System.out.println("projectMemID:"+projectMemID);
		
		String projectID=request.getParameter("projectID");
		String projectMemID=request.getParameter("projectMemID");
		System.out.println("m:"+projectID);
		System.out.println("m:"+projectMemID);
		
		response.setContentType("text/html;charset=GB2312");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
                "root", "zzxwill");
			Statement stmt=conn.createStatement();
			int num=stmt.executeUpdate("delete from projectmem where memID='"+projectMemID+"' and projectID='"+projectID+"';");
			if(num==1){
				out.print("移出组员操作成功!\n 请返回");
			}
			else{
				out.print("移出组员操作失败!\n 请返回");
			}
		}catch(Exception e){};
		
		out.print("<a href=\"/labmanagement/jsp/groupAdmin.jsp\">返回</a>");
		
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
