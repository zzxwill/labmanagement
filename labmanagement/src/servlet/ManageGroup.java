package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ManageGroup extends HttpServlet {
//此servlet接收自groupAdmin.jsp传过来的值 ，
		
//	session.setAttribute("name","will");
	/**
	 * Constructor of the object.
	 */
	
	public ManageGroup() {
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

		response.setContentType("text/html");
		
		String groupAdminID=request.getParameter("action");
		System.out.print("groupAdminID"+groupAdminID);
		//得到了组管理员的ID，查到他的组，然后，列出组员。
		
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		
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

			res=stmt.executeQuery("select groupID from groupmem  where memID="+groupAdminID+"");
	  
//	  out.print("添加的条数："+number);
	  /*
	   * 如果添加的条数为一，则表示成功插入了数据，因此，可以用这来判断数据库是否成功插入了数据。
	   */	
			String groupID=null;
			while(res.next()){
				groupID=res.getString("groupID");
				System.out.println("groupID:"+groupID);
//				request.setAttribute("groupID", groupID);  
//	            getServletContext().getRequestDispatcher("/labmanagement/jsp/manageGroup.jsp").forward(request,   response);
//				response.sendRedirect("/labmanagement/jsp/manageGroup.jsp?groupID=<%=groupID %>");
				
			}
			
//			ResultSet res2=null;
//			res2=stmt.executeQuery("select memID,memName from manageGroup where groupID='groupID' and memID!='groupAdminID';");
			
			//查出在组长组的成员的id和姓名。
			//应该跳到另外一个页面，并且将组长的id和memID传过去。
//			while(res2.next()){
				
//			}
			
			
			
			
			request.setAttribute("groupID", groupID);  
			getServletContext().getRequestDispatcher("/jsp/manageGroup.jsp").forward(request,   response);
	  
			
	      res.close();

	    }
	    catch (Exception ex)
	    {
	      System.out.println("Error : " + ex.toString());
	    }
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
