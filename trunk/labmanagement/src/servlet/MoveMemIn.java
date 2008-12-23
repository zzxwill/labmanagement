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

public class MoveMemIn extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public MoveMemIn() {
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


		String userMemID=request.getParameter("userMemID");
		String groupAdminID=request.getParameter("groupAdminID");
		System.out.print(userMemID);
		System.out.print(groupAdminID);
		
		response.setContentType("text/html;charset=GB2312");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
		.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		
		//得到组长所在的组
		String adminGroupID=null;
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			ResultSet res = null;
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
					"root", "zzxwill");
			Statement stmt=conn.createStatement();
			res=stmt.executeQuery("select groupID from groupmem where memID='"+groupAdminID+"';");
			
			while(res.next()){
				adminGroupID=res.getString("groupID");
//				System.out.print("adminGroupID"+adminGroupID);
			}
			
		}catch(Exception e){};
		
		
		
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection conn2=DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
					"root", "zzxwill");
			Statement stmt2=conn2.createStatement();
		int num=stmt2.executeUpdate("update groupmem set groupID='"+adminGroupID+"' where memID='"+userMemID+"';");

			if(num==1){
				out.print("移出组员操作成功!\n ");
			}
			else{
				out.print("移出组员操作失败!\n");
			}
		}catch(Exception e){};

		out.print("<a href=\"/labmanagement/jsp/groupAdmin.jsp\">返回</a>");
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
