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
		String f_name="",l_name="",mail="",epassword="",cpassword="",mobileno="";
		f_name=request.getParameter("first_name");
		l_name=request.getParameter("last_name");
		mobileno=request.getParameter("mobileno");
		mail=request.getParameter("email");
		epassword=request.getParameter("epass");
		cpassword=request.getParameter("cpass");
		int j=0;
		if (epassword.equals(cpassword)){
			j=1;
		}
			
			
				
	%>
	<%
	//String pagea = "signup.html";
	//if(j>0){
	//	out.println("  Password not matched...."+epassword);
	//	out.println("  Password not matched...."+cpassword);
//	}else{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/Registration","root","");
			String queary="insert into RecRegister  (rid,first_name,last_name,email,mobile,cnf_password)"+"values(?,?,?,?,?,?)";
			
			PreparedStatement prestmt=con.prepareStatement(queary);
			int i=10;
			prestmt.setInt(1, 0);
			prestmt.setString(2,f_name);
			prestmt.setString(3,l_name);
			prestmt.setString(4, mail);
			prestmt.setString(5, mobileno);
			prestmt.setString(6, epassword);
			
			prestmt.execute();
			
			out.println("  Registration Sucessfully...."); 
			response.sendRedirect("login.html");
			out.println("");
		}
		catch(Exception e){
			out.println(e);
		}
	//}
	
	%>
<br><a href="login1.html">click here to Login..</a>
</body>
</html>