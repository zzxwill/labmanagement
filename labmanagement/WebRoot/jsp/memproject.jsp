<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@include file="head.jsp"%>
<%@page import="java.sql.*;"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��������ҳ��</title>

  </head>
  
  <body>
    <table width="900" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tbspan">
				<tr>
					<td width="880" background="/templets/img/31bg1.gif">
						<span class="STYLE61"><a href="/labmanagement/jsp/index.jsp">��ҳ</a> | <a
							href="/labmanagement/jsp/labmem.jsp">�޸ĸ�����Ϣ</a> | <a href="/labmanagement/jsp/resrouse.jsp">��Դ</a>
							| <a href="/labmanagement/jsp/memproject.jsp">����</a> | <a href="/labmanagement/jsp/morePubInfo.jsp">
								������Ϣ</a> | <a href="/labmanagement/jsp/equipment.jsp">�豸</a> | <a href="mailto:zzxwill@buaa.edu.cn">��ϵ����</a> | <a href="/labmanagement/jsp/logout.jsp">ע��</a>
						</span> 
					</td>
				</tr>
			</table>
  <table width="900" align="center" border="1"><tr><th width="40%">��������</th><th width="40%">��������</th><th width="20%">�������</th></tr>
  <h2>���������б�</h2>
  <% 
    try
	    {
	      Object x=session.getAttribute("memID");
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
	      int id=1;
	      stmt = (Statement) conn.createStatement();
          
			res = stmt.executeQuery("select * from mem_pro where memID='"+x+"'");
          
     
        
	      while (res.next())
	      {	
	         
	       out.print("<tr><td >"+res.getString(1)+"</td><td>"+res.getString(4)+"</td><td>"+res.getString(3)+"</td></tr>");//projectName
	   
	      }
	      }

	    catch (Exception ex)
	    {
	      System.out.println("Error : " + ex.toString());
	    }
              %>
              </table>
               
  </body>
</html>
