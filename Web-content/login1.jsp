<%@ page language="java" contentType="text/html/javascript; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>


<html>
<body>
<%
try{  
	String num1="";
	num1=request.getParameter("id1");
	String pass1=""; 
	pass1=request.getParameter("password1");
	 
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection(
			
	"jdbc:mysql://localhost:3306/Registration","root",""); 
	Statement stmt=con.createStatement();
	
	ResultSet rs=stmt.executeQuery("select * from RecRegister1 where mobile1='"+num1+"' and cnf_password1='"+pass1+"'");
	int i=0;
	while(rs.next())  
	{
		String queary="insert into login  (ID,f_name,l_name,email,mobile)"+"select rid1,first_name1,last_name1,email1,mobile1 from RecRegister1 where mobile1='"+num1+"' and cnf_password1='"+pass1+"'";
			PreparedStatement prestmt=con.prepareStatement(queary);			
			prestmt.execute();
		 i=1;	 
	}
	if(i==0){
		out.println("Wrong details entered...."); 
	}
	else{ 

		 response.sendRedirect("homepage3.jsp");
	} 
	//int inf=8;
	con.close();  
}catch(Exception e){ out.println(e);} 

%>

</body>
</html>

