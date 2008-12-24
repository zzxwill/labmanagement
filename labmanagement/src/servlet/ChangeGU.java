package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChangeGU extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ChangeGU() {
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
	 * @throws IOException 
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
	 request.setCharacterEncoding("gb2312"); 
	String Gu=request.getParameter("gu");

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
      //out.print(Gu);
      stmt = (Statement) conn.createStatement();
    int mi=0;//原组长的memID
      res=stmt.executeQuery("select memID from group1 where groupID=(select groupID from group1 where memName='"+Gu+"') and  rightID='2'");
  
 while(res.next()){
	  
	//out.print(res.getInt(1));
	 mi=res.getInt(1);
	  //out.print(mi);
 }
 //out.print(mi);
 ResultSet re=null;

  re=stmt.executeQuery("select memID from group1 where memName='"+Gu+"'");
 int ni=0;//新组长的memID
 while(re.next()){
	 //out.print(re.getInt(1)); 
	ni=re.getInt(1);
	}
 //out.print(ni);
    stmt.executeUpdate("Update rightassign set rightID='1' where memID='"+mi+"'");
   int number=stmt.executeUpdate("Update rightassign set rightID='2' where memID='"+ni+"'");
  
//  out.print("添加的条数："+number);
  /*
   * 如果添加的条数为一，则表示成功插入了数据，因此，可以用这来判断数据库是否成功插入了数据。
   */
  
  if(number==1){
	  out.println("恭喜您，组长修改成功！<br>");
	  out.println("<a href='/labmanagement/jsp/superUser.jsp'>返回组管理页面</a>");
  }
  else{
	  out.println("对不起，组长修改失败，请返回继续操作！");
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
