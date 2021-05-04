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
        int id=0;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/Registration","root","");
            Statement stmt1=con.createStatement();
            ResultSet rs=stmt1.executeQuery("select * from login");
            while(rs.next())
            {
                id=rs.getInt(1);
            }
			Statement stmt=con.createStatement();
    
			int rs=stmt.executeUpdate("DELETE from recrgister where refid='"+id+"'");

			response.sendRedirect("index.jsp");
		}
		catch(Exception e){
			out.println(e);
		}
	
	
	%>
<br><a href="Editdata.jsp">click to go back</a>
</body>
</html>