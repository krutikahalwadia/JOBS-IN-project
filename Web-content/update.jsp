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
		int id=Integer.parseInt(request.getParameter("cid"));
		String job_desc1=request.getParameter("job_desc1");
		String job_type1=request.getParameter("job_type1");
		String job_title1=request.getParameter("job_title1");
		String Comp_name1=request.getParameter("Comp_name1");		
		String job_location1=request.getParameter("job_location1");
		int job_salary1=Integer.parseInt(request.getParameter("job_salary1"));
		int job_work_day1=Integer.parseInt(request.getParameter("job_work_day1"));
		int job_contact1=Integer.parseInt(request.getParameter("job_contact1"));
	%>
	<%
	
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/Registration","root","");
			Statement stmt=con.createStatement();
	
		    String queary="UPDATE jobinformation SET `Comp_name`= ?,`j_title`=?,`j_type`=?,`j_desc`=?,`j_location`=?,`j_salary`=?,`j_contact`=?,`j_workingday`=? where job_id='"+id+"'";
			PreparedStatement prestmt=con.prepareStatement(queary);
			prestmt.setString(1,Comp_name1);
			prestmt.setString(2,job_title1);
			prestmt.setString(3,job_type1);
			prestmt.setString(4,job_desc1);
			prestmt.setString(5,job_location1);
			prestmt.setInt(6,job_salary1);
			prestmt.setInt(7,job_contact1);
			prestmt.setInt(8,job_work_day1);
			prestmt.execute();
			response.sendRedirect("Editdata.jsp");
		}
		catch(Exception e){
			out.println(e);
		}
	
	
	%>
<br><a href="Editdata.jsp">click to go back</a>
</body>
</html>