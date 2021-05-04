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
		String comp_name="",jobtitle="",jobtype="",jobdesc="", joblocation="";
		float jobsalary=0;
		long jobcontact=0;
		int workingday=0;
		int refID=0;
		comp_name=request.getParameter("Comp_name");
		jobtitle=request.getParameter("job_title");
		jobtype=request.getParameter("job_type");
		jobdesc=request.getParameter("job_desc");
		joblocation=request.getParameter("job_location");
		jobsalary=Integer.parseInt(request.getParameter("job_salary"));
		jobcontact=Long.parseLong(request.getParameter("job_contact"));
		workingday=Integer.parseInt(request.getParameter("job_work_day"));
		
			
			
				
	%>
	<%
	
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/Registration","root","");
			Statement stmt=con.createStatement();
	
			ResultSet rs=stmt.executeQuery("select * from login ");
			while(rs.next())
			{
				refID = rs.getInt(1);
				String queary="insert into JobInformation  (refid,job_id,Comp_name,j_title,j_type,j_desc,j_location,j_salary,j_contact,j_workingday)"+"values(?,?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement prestmt=con.prepareStatement(queary);
			int i=10;
			prestmt.setInt(1,refID);
			prestmt.setInt(2, 0);
			prestmt.setString(3,comp_name);
			prestmt.setString(4,jobtitle);
			prestmt.setString(5,jobtype);
			prestmt.setString(6,jobdesc);
			prestmt.setString(7,joblocation);
			prestmt.setFloat(8,jobsalary);
			prestmt.setLong(9,jobcontact);
			prestmt.setInt(10,workingday);
			
			prestmt.execute();
			}
			
			
			out.println("  Data Entered Sucessfully...."); 
			response.sendRedirect("Editdata.jsp");
			out.println("");
		}
		catch(Exception e){
			out.println(e);
		}
	
	
	%>
<br><a href="Editdata.jsp">click to go back</a>
</body>
</html>