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
      //����Connector/J����
      //��һ��Ҳ��дΪ��Class.forName("com.mysql.jdbc.Driver");
      Class.forName("com.mysql.jdbc.Driver").newInstance();
      //������MySQL������
      conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement?useUnicode=true&characterEncoding=GB2312",
                                         "root", "zzxwill");
      //ִ��SQL���
      //out.print(Gu);
      stmt = (Statement) conn.createStatement();
    int mi=0;//ԭ�鳤��memID
      res=stmt.executeQuery("select memID from group1 where groupID=(select groupID from group1 where memName='"+Gu+"') and  rightID='2'");
  
 while(res.next()){
	  
	//out.print(res.getInt(1));
	 mi=res.getInt(1);
	  //out.print(mi);
 }
 //out.print(mi);
 ResultSet re=null;

  re=stmt.executeQuery("select memID from group1 where memName='"+Gu+"'");
 int ni=0;//���鳤��memID
 while(re.next()){
	 //out.print(re.getInt(1)); 
	ni=re.getInt(1);
	}
 //out.print(ni);
    stmt.executeUpdate("Update rightassign set rightID='1' where memID='"+mi+"'");
   int number=stmt.executeUpdate("Update rightassign set rightID='2' where memID='"+ni+"'");
  
//  out.print("��ӵ�������"+number);
  /*
   * �����ӵ�����Ϊһ�����ʾ�ɹ����������ݣ���ˣ������������ж����ݿ��Ƿ�ɹ����������ݡ�
   */
  
  if(number==1){
	  out.println("��ϲ�����鳤�޸ĳɹ���<br>");
	  out.println("<a href='/labmanagement/jsp/superUser.jsp'>���������ҳ��</a>");
  }
  else{
	  out.println("�Բ����鳤�޸�ʧ�ܣ��뷵�ؼ���������");
	  out.println("<a href='/labmanagement/jsp/superUser.jsp'>���������ҳ��</a>");
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
