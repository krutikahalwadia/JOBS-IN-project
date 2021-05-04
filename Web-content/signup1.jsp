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
		String f_name1="",l_name1="",mail1="",epassword1="",cpassword1="";
		int mobileno1=0;
		f_name1=request.getParameter("first_name1");
		l_name1=request.getParameter("last_name1");
		mobileno1=Integer.parseInt(request.getParameter("mobileno1"));
		mail1=request.getParameter("email1");
		epassword1=request.getParameter("epass1");
		cpassword1=request.getParameter("cpass1");
		int j=0;
		if (epassword1.equals(cpassword1)){
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
			String queary="insert into RecRegister1  (rid1,first_name1,last_name1,email1,mobile1,cnf_password1)"+"values(?,?,?,?,?,?)";
			
			PreparedStatement prestmt=con.prepareStatement(queary);
			int i=10;
			prestmt.setInt(1, 0);
			prestmt.setString(2,f_name1);
			prestmt.setString(3,l_name1);
			prestmt.setString(4, mail1);
			prestmt.setInt(5, mobileno1);
			prestmt.setString(6, epassword1);
			
			prestmt.execute();
			
			out.println("  Registration Sucessfully...."); 
			response.sendRedirect("login1.html");
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