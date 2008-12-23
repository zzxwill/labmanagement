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

public class LabMem extends HttpServlet {


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
		String memID=request.getParameter("memID");
		String memName=request.getParameter("memName");
		String stuNo=request.getParameter("stuNo");
		String labNo=request.getParameter("labNo");
		String QQ=request.getParameter("QQ");
		String MSN=request.getParameter("MSN");
		String telephone=request.getParameter("telephone");
		String password=request.getParameter("password");
		int id=Integer.parseInt(memID);
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
	      conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
	                                         "root", "zzxwill");
	      //ִ��SQL���
	      
	      stmt = (Statement) conn.createStatement();

	  int number=stmt.executeUpdate("update labmem set stuNo='"+stuNo+"', memName='"+memName+"',labNo='"+labNo+"',password='"+password+"',QQ='"+QQ+"',MSN='"+MSN+"',telephone='"+telephone+"'  where memID="+id+"");
	  
//	  out.print("��ӵ�������"+number);
	  /*
	   * �����ӵ�����Ϊһ�����ʾ�ɹ����������ݣ���ˣ������������ж����ݿ��Ƿ�ɹ����������ݡ�
	   */
	  
	  if(number==1){
		  out.println("��ϲ����������Ϣ���ĳɹ���<br>");
		  out.println("<a href='/labmanagement/jsp/user.jsp'>����ע���û�ҳ��</a>");
	  }
	  else{
		  out.println("�Բ��𣬸�����Ϣ����ʧ�ܣ��뷵�ؼ���������");
		  out.println("<a href='/labmanagement/jsp/labmem.jsp'>���ظ�����Ϣ�޸�ҳ��</a>");
	  }
	      res.close();

	    }
	    catch (Exception ex)
	    {
	      System.out.println("Error : " + ex.toString());
	    }

	
	
	    out.println("</body></html>");
	
	}


}
