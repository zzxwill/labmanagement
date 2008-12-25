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

public class AddProject extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddProject() {
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
		response.setContentType("text/html charset=gb2312");
		
		
		
   String projectName=request.getParameter("projectName");
//	    System.out.println(projectName);
	    String projectCon=request.getParameter("projectCon");
	    String projectPub=request.getParameter("projectPub");
	    String deadline=request.getParameter("deadline");
	    
	    String groupAdminID=request.getParameter("groupAdminID");
	    
	    System.out.println("projectName:"+projectName);
	    System.out.println("projectCon:"+projectCon);
	    System.out.println("projectPub:"+projectPub);
	    System.out.println("deadline:"+deadline);
	    System.out.println("groupAdminID"+groupAdminID);
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
	      
	      stmt = (Statement) conn.createStatement();
//	  int number=stmt.executeUpdate("insert into manageproject(projectName,projectCon,projectPub,deadline,memID) values('"+projectName+"','"+projectCon+"','"+projectPub+"','"+deadline+"','"+groupAdminID+"')");
		  int number=stmt.executeUpdate("insert into manageproject(projectName,projectCon,projectPub,deadline) values('"+projectName+"','"+projectCon+"','"+projectPub+"','"+deadline+"')");
	  //age在数据库中的表现是int,但是,在这里, '"+age+"' 或"+age+"都行
	  
		  res=stmt.executeQuery("select projectID from project where projectName='"+projectName+"';");
		  String projectID=null;
		  while(res.next()){
			  projectID=res.getString("projectID");
			  System.out.println("projectID:"+projectID);
			  
		  }
		  //	  out.print("添加的条数："+number);
	  /*
	   * 如果添加的条数为一，则表示成功插入了数据，因此，可以用这来判断数据库是否成功插入了数据。
	   */
//	  int number2=stmt.executeUpdate("insert into projectmem values('"+groupAdminID+"','"++"')";);
	  
		  int number2=0;
	  if(number==1){
		  number2=stmt.executeUpdate("insert into projectmem(projectID,memID) values('"+projectID+"','"+groupAdminID+"')");
		  if(number2==1){
		  
		  out.println("恭喜您，新任务添加成功！<br>");
		  out.println("<a href='/labmanagement/jsp/groupAdmin.jsp'>返回</a>");
		  }
	  }
	  else{
		  out.println("对不起，新任务添加失败，请返回继续操作！");
		   out.println("<a href='/labmanagement/jsp/groupAdmin.jsp'>返回</a>");
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
