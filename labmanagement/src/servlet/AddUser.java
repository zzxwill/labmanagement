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

public class AddUser extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddUser() {
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
		String Na=null;
		String Sn=null;
		String Pd=null;
		String Pd2=null;
		 Na=request.getParameter("na");//获取要删除的小组名
		 Sn=request.getParameter("sn");
		 Pd=request.getParameter("pd");
		 Pd2=request.getParameter("pd2");
		
		response.setContentType("text/html;charset=GB2312");
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
	    
		System.out.print(request.getParameter("na"));
		System.out.print(request.getParameter("sn"));
		System.out.print(request.getParameter("pd"));
		System.out.print(request.getParameter("pd2"));
	   if(Na.equals("") ){
			out.print("您没有输入用户名<br>");
			out.print("<a href=/labmanagement/jsp/allUser.jsp>返回添加用户页面</a>");
		}
	    else if(Sn.equals("")){
			out.print("您没有输入用户学号<br>");
			out.print("<a href=/labmanagement/jsp/allUser.jsp>返回添加用户页面</a>");
		}
	    else if(Pd.equals("")){
			out.print("您没有输入密码<br>");
			out.print("<a href=/labmanagement/jsp/allUser.jsp>返回添加用户页面</a>");
		}
		else  if(!Pd.equals(Pd2)){
			out.print("您两次输入的密码不一致<br>");
			out.print("<a href=/labmanagement/jsp/allUser.jsp>返回添加用户页面</a>");
		}
		else{
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
	   
	   stmt.executeUpdate("insert into labmem(memName,password,stuNO) values('"+Na+"','"+Sn+"','"+Pd+"')");
	   int mi=0;
	   res=stmt.executeQuery("select memID from labmem where memName='"+Na+"'");
	   
	   while(res.next()){
		   mi=res.getInt(1);
	   }
	   //out.print(gi);
	   
		   // out.print(zi);
		  //stmt.executeUpdate("insert into groupmem(groupID,memID) values('4','4')");
	   stmt.executeUpdate("insert into groupmem(groupID,memID) values('0','"+mi+"')");
		  //stmt.executeUpdate("insert into groupmem(groupID,memID) values('"+gi+"','"+zi+"')");
	   stmt.executeUpdate("insert into rightassign(rightID,memID) values('1','"+mi+"')");
		   
		  out.println("恭喜您,添加成员成功！<br>");
		  out.println("<a href='/labmanagement/jsp/allUser.jsp'>返回添加成员页面</a>");
	  
	      res.close();

	    }
	    catch (Exception ex)
	    {
	      System.out.println("Error : " + ex.toString());
	    }
           //out.print("wronsdfsg!")  ;
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
