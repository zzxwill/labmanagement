package test;
import java.sql.*;
import java.util.*;
public class Project {
	public static void main(String args[]) throws Exception{
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection conn7=DriverManager.getConnection("jdbc:mysql://localhost:3306/labmanagement",
	                                         "root", "zzxwill");
	    Statement stmt7=conn7.createStatement();
	    ResultSet res7 = null;
	  	res7=stmt7.executeQuery("SELECT distinct projectID,projectName from manageproject;");
	      while (res7.next())
	      {
	  
		   System.out.print("<tr>"+res7.getString(1)+"</td>");//ID 
	       System.out.print("<td>"+res7.getString(2)+"</td>\n");//ID 
			

	}

		
	}
}

	