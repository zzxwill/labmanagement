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

public class DelUser extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public DelUser() {
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
		String Mn=request.getParameter("mn");//��ȡҪɾ����С����

		response.setContentType("text/html;charset=GB2312");
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		try
	    {
	      Connection conn=null;
	      Statement stmt;
	      ResultSet res = null;
	      //����Connector/J����
	      //��һ��Ҳ��дΪ��Class.forName("com.mysql.jdbc.Driver");
	      Class.forName("com.mysql.jdbc.Driver").newInstance();
	      //������MySQL������
	      conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement?useUnicode=true&characterEncoding=GB2312",
	                                         "root", "zzxwill");
	      //ִ��SQL���
	      //out.print(Grn);
	      stmt = (Statement) conn.createStatement();
	      int  gi=0;
	   res=stmt.executeQuery("select memID from labmem where memName='"+Mn+"'");
	   
	   while(res.next()){
		   gi=res.getInt(1);
	   }
	   System.out.print(gi);
	   int number=stmt.executeUpdate("delete from labmem where memID='"+gi+"'");
	   stmt.executeUpdate("delete from groupmem where memID='"+gi+"'");
	    stmt.executeUpdate("delete from rightassign where memID='"+gi+"'");
	   
	   
	  stmt.executeUpdate("delete from releaseres where memID='"+gi+"'");
	  stmt.executeUpdate("delete from projectmem where memID='"+gi+"'");
	  stmt.executeUpdate("delete from equmanage where memID='"+gi+"'");
	  if(number==1){
		  out.println("��ϲ����ɾ����Ա�ɹ���<br>");
		  out.println("<a href='/labmanagement/jsp/allUser.jsp'>���س�Ա����ҳ��</a>");
	  }
	  else{
		  out.println("�Բ���ɾ����Աʧ�ܣ��뷵�ؼ���������");
		  out.println("<a href='/labmanagement/jsp/allUser.jsp'>���س�Ա����ҳ��</a>");
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
