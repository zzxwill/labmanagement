<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@ include file="indexhead.jsp" %>
<%@ page import="java.sql.*"  %>
<html xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
	
	<head>
	<style type="text/css">
.style1 {
	text-align: center;
}
</style>
	</head>

	<body>
	
		<table width="600" border="0" align="center" cellpadding="0"
				cellspacing="0" class="tbspan" style="height: 19px">
				<tr>
											<td width="85%" valign="top" style="padding-left: 6px"
												colspan="2">
												<table width="100%" border="0" cellspacing="1"
													cellpadding="1" align="center">
												<tr>
													最新信息 <br><br>
												</tr>
												
												
													
		<%
		try
		    {
		      Connection conn=null;
		      Statement stmt;
		      ResultSet res = null;
		      //加载Connector/J驱动
		      //这一句也可写为：Class.forName("com.mysql.jdbc.Driver");
		      Class.forName("com.mysql.jdbc.Driver").newInstance();
		      //建立到MySQL的连接
		      conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
		                                         "root", "zzxwill");
		      //执行SQL语句
		      
		      stmt = (Statement) conn.createStatement();
		  res=stmt.executeQuery("select * from pubinfo");
              int[] x=new int[100]; //信息ID
              int i=0;
              String[] inTi=new String[100];//信息标题
              String[] inTm=new String[100];//发布时间
		      while (res.next())
		      {
		        x[i]=res.getInt(1);
		        inTi[i]=res.getString(2);
		        inTm[i]=res.getString(4);
		        i++;
		      }
		      for(i=0;x[i]!=0;i++){
		  
		      out.print("<tr><td width=40% class=indl1 >");
		      System.out.print(x[i]);
		      out.print("<a href='/labmanagement/jsp/info_detail.jsp?inid="+x[i]+"'>"+inTi[i]+"</a></td>");
	      out.print("<td width=50% align=right class=indl1 >"+inTm[i]+"</td></tr>");
		     
		      }
		      
		  
		      res.close();

		    }
		    catch (Exception ex)
		    {
		      System.out.println("Error : " + ex.toString());
		    }

	
	%>
			</table>
		
	</body>
</html>

			
			
			

