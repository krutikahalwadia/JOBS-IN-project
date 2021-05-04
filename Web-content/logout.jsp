<%@ page language="java" contentType="text/html/javascript; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>


<html>
<body>
<%
try{  

 Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/registration","root","");              
            Statement s=con.createStatement();
             int rs=s.executeUpdate("TRUNCATE TABLE login");
    
        response.sendRedirect("index.jsp");
    
    con.close();
 
}catch(Exception e){ out.println(e);} 

%>

</body>
</html>

