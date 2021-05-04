<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
</head>
<body>
	<%
		int dltid=0;
	    dltid=Integer.parseInt(request.getParameter("dltid"));		
		
			
			
				
	%>
	<%
	
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/Registration","root","");
			Statement stmt=con.createStatement();
	
			int rs=stmt.executeUpdate("DELETE from jobinformation where job_id='"+dltid+"'");

			response.sendRedirect("Editdata.jsp");
		}
		catch(Exception e){
			out.println(e);
		}
	
	
	%>
<br><a href="Editdata.jsp">click to go back</a>
</body>
</html>