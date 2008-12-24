package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NewInfo extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public NewInfo() {
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
		String Infoti=request.getParameter("infoti");//��ȡ��Ϣ����
		String Infoco=request.getParameter("infoco");//��ȡ��Ϣ����
		
		
		
		response.setContentType("text/html;charset=GB2312");
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		try
	    {
	      Connection conn=null;
	      Statement stmt;
	      ResultSet res = null;
	      
	      Object id=request.getSession().getAttribute("memID");//��ȡsession��ֵ
	     //out.print(id);
			 
	      //����Connector/J����
	      //��һ��Ҳ��дΪ��Class.forName("com.mysql.jdbc.Driver");
	      Class.forName("com.mysql.jdbc.Driver").newInstance();
	      //������MySQL������
	      conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement?useUnicode=true&characterEncoding=GB2312",
	                                         "root", "zzxwill");
	      //ִ��SQL���
	      //out.print(Grn);
	      stmt = (Statement) conn.createStatement();
	   
	   //stmt.executeUpdate("insert into grou(groupName) values('"+Gna+"')");
	  
	      String Infotm=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
	      stmt.executeUpdate("insert into pubinfo(infoTitle,infoCon,infoTime) values('"+Infoti+"','"+Infoco+"','"+Infotm+"')");
	      res=stmt.executeQuery("select infoID from pubinfo where infoTitle='"+Infoti+"'");
	      int x=0;
	      while(res.next()){
	    	  x=res.getInt(1);
	      }
	      stmt.executeUpdate("insert into releaseinfo(inforID,memID) values('"+x+"','"+id+"')");
	      
	      out.println("��ϲ��,�����Ϣ�ɹ���<br>");
		  out.println("<a href='/labmanagement/jsp/releaseInfo.jsp'>������Ϣ����ҳ��</a>");
	      
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
