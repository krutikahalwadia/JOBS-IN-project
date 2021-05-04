<%@ page language="java" contentType="text/html/javascript; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>


<html>
<body>
<%
try{  
	String num="";
	num=request.getParameter("id");
	String pass=""; 
	pass=request.getParameter("password");
	 
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection(
			
	"jdbc:mysql://localhost:3306/Registration","root",""); 
	Statement stmt=con.createStatement();
	
	ResultSet rs=stmt.executeQuery("select * from RecRegister where mobile='"+num+"' and cnf_password='"+pass+"'");
	int i=0;
	while(rs.next())  
	{
		String queary="insert into login  (ID,f_name,l_name,email,mobile)"+"select rid,first_name,last_name,email,mobile from RecRegister where mobile='"+num+"' and cnf_password='"+pass+"'";
			PreparedStatement prestmt=con.prepareStatement(queary);			
			prestmt.execute();
		 i=1;	 
	}
	if(i==0){
		out.println("Wrong details entered...."); 
	}
	else{ 

		 response.sendRedirect("homepage2.jsp");
	} 
	//int inf=8;
	con.close();  
}catch(Exception e){ out.println(e);} 

%>

</body>
</html>

