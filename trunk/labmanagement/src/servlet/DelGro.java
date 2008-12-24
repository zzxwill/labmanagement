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

public class DelGro extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DelGro() {
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

		request.setCharacterEncoding("gb2312"); 
		String Grn=request.getParameter("grn");//获取要删除的小组名

		response.setContentType("text/html;charset=GB2312");
		PrintWriter out = response.getWriter();
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
	      conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement?useUnicode=true&characterEncoding=GB2312",
	                                         "root", "zzxwill");
	      //执行SQL语句
	      //out.print(Grn);
	      stmt = (Statement) conn.createStatement();
	      int  gi=0;
	   res=stmt.executeQuery("select groupID from grou where groupName='"+Grn+"'");
	   
	   while(res.next()){
		   gi=res.getInt(1);
	   }
	   //out.print(gi);
	   ResultSet x=null;
	   x=stmt.executeQuery("select memID from group1 where groupName='"+Grn+"' and rightID='2'");
	   int t=0;
	   while(x.next()){
		   t=x.getInt(1);
	   }
	   stmt.executeUpdate("Update rightassign set rightID='1', memID='"+t+"' where memID='"+t+"' ");
	   stmt.executeUpdate("Update groupmem set groupID='0' where groupID='"+gi+"'");
	  // stmt.executeUpdate("delete from groupmem where groupID='"+gi+"'");
	   int number=stmt.executeUpdate("delete from grou where groupID='"+gi+"'");
	   //int number=stmt.executeUpdate("delete from groupmem where groupID='"+gi+"'");
	  if(number==1){
		  out.println("恭喜您，删除组成功！<br>");
		  out.println("<a href='/labmanagement/jsp/superUser.jsp'>返回组管理页面</a>");
	  }
	  else{
		  out.println("对不起，删除组失败，请返回继续操作！");
		  out.println("<a href='/labmanagement/jsp/superUser.jsp'>返回组管理页面</a>");
	  }
	      res.close();

	    }
	    catch (Exception ex)
	    {
	      System.out.println("Error : " + ex.toString());
	    }



	    out.println("</body></html>");

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
