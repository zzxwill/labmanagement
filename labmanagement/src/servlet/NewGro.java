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

public class NewGro extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public NewGro() {
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
		String Ngrn=request.getParameter("ngrn");//获取要删除的小组名
		String Gna=request.getParameter("gna");
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
	   
	   stmt.executeUpdate("insert into grou(groupName) values('"+Gna+"')");
	   int gi=0;
	   res=stmt.executeQuery("select groupID from grou where groupName='"+Gna+"'");
	   
	   while(res.next()){
		   gi=res.getInt(1);
	   }
	   //out.print(gi);
	   ResultSet re = null;
	   re=stmt.executeQuery("select memID,groupID from group1 where memName='"+Ngrn+"'");
	   int xi=0;
	   int yi=0;
	   while(re.next()){
		   xi=re.getInt(1);
		   yi=re.getInt(2);
	   }
	   
	   //out.print(yi);
	   if(yi==0){
		   ResultSet x = null;
		   x=stmt.executeQuery("select memID from labmem where memName='"+Ngrn+"'");
		   int zi=0;
		   
		   while(x.next()){
			   zi=x.getInt(1);
			   
		   }
		   out.print(zi);
		  //stmt.executeUpdate("insert into groupmem(groupID,memID) values('4','4')");
		   stmt.executeUpdate("Update groupmem set groupID='"+gi+"' where memID='"+zi+"'");
		  //stmt.executeUpdate("insert into groupmem(groupID,memID) values('"+gi+"','"+zi+"')");
		   stmt.executeUpdate("Update rightassign set rightID='2', memID='"+zi+"' where memID='"+zi+"' ");
	   }
	   else{
		   stmt.executeUpdate("update  groupmem set groupID='"+gi+"',memID='"+xi+"' where memID='"+xi+"'");
		   stmt.executeUpdate("Update rightassign set rightID='2', memID='"+xi+"' where memID='"+xi+"' ");
	   }
	  
	  
	   
	   
	  
		  out.println("恭喜您,添加组成功！<br>");
		  out.println("<a href='/labmanagement/jsp/superUser.jsp'>返回组管理页面</a>");
	  
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
