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

public class DeleteResource extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DeleteResource() {
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

		String resourceID=request.getParameter("resourceID");
		System.out.print(resourceID);
		response.setContentType("text/html;charset=GB2312");
		response.setContentType("text/html");
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
	stmt.executeUpdate("delete from releaseres where resID='"+resourceID+"'");
	int num=stmt.executeUpdate("delete from resource where resID='"+resourceID+"'");
	if(num==1){
		out.print("删除资源操作成功!\n ");
	}
	else{
		out.print("删除资源操作失败!\n ");
	}
}catch(Exception e){};

out.print("<a href=\"/labmanagement/jsp/resrouse.jsp\">请返回</a>");
//out.print("    This is ");
//out.print(this.getClass());
//out.println(", using the GET method");
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
