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
	      //����Connector/J����
	      //��һ��Ҳ��дΪ��Class.forName("com.mysql.jdbc.Driver");
	      Class.forName("com.mysql.jdbc.Driver").newInstance();
	      //������MySQL������
	      conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement?useUnicode=true&characterEncoding=GB2312",
	                                         "root", "zzxwill");
	      //ִ��SQL���
	      
	      stmt = (Statement) conn.createStatement();
//	  int number=stmt.executeUpdate("insert into manageproject(projectName,projectCon,projectPub,deadline,memID) values('"+projectName+"','"+projectCon+"','"+projectPub+"','"+deadline+"','"+groupAdminID+"')");
		  int number=stmt.executeUpdate("insert into manageproject(projectName,projectCon,projectPub,deadline) values('"+projectName+"','"+projectCon+"','"+projectPub+"','"+deadline+"')");
	  //age�����ݿ��еı�����int,����,������, '"+age+"' ��"+age+"����
	  
		  res=stmt.executeQuery("select projectID from project where projectName='"+projectName+"';");
		  String projectID=null;
		  while(res.next()){
			  projectID=res.getString("projectID");
			  System.out.println("projectID:"+projectID);
			  
		  }
		  //	  out.print("��ӵ�������"+number);
	  /*
	   * �����ӵ�����Ϊһ�����ʾ�ɹ����������ݣ���ˣ������������ж����ݿ��Ƿ�ɹ����������ݡ�
	   */
//	  int number2=stmt.executeUpdate("insert into projectmem values('"+groupAdminID+"','"++"')";);
	  
		  int number2=0;
	  if(number==1){
		  number2=stmt.executeUpdate("insert into projectmem(projectID,memID) values('"+projectID+"','"+groupAdminID+"')");
		  if(number2==1){
		  
		  out.println("��ϲ������������ӳɹ���<br>");
		  out.println("<a href='/labmanagement/jsp/groupAdmin.jsp'>����</a>");
		  }
	  }
	  else{
		  out.println("�Բ������������ʧ�ܣ��뷵�ؼ���������");
		   out.println("<a href='/labmanagement/jsp/groupAdmin.jsp'>����</a>");
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
