<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
	<% Class.forName("com.mysql.jdbc.Driver");%>
	<% ResultSet rs = null; %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JOBS-IN/Home page/Recruiter portal
    </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/dropdown.css">
    <link rel="stylesheet" href="css/index.css">
     <style>
     body{background-color:rgb(255, 204, 204);}
     </style>

</head>
<body>

<!---------------------------------- Navigation bar --------------->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand"  href="#" style="size:18px;color:Yellow ;animation: animate 
                1.5s linear infinite;"><b>JOBS-IN</b></a>
    </div>
    <ul class="nav navbar-nav">
      <li ><a href="homepage3.jsp">Home</a></li>
      <li><a href="Aboutus2.html">About Us</a></li>
      <li><a href="contactus2.html">Contact Us</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
              <li class="nav-item dropdown">
                <a class="nav-link dropbtn dropdown-toggle btn btn-outline-success" data-toggle="dropdown" role="button" href="#"><i class="fa fa-chevron-circle-down"></i>Services</a>
                <div class="dropdown-menu dropdown-menu-end" style="color:balck; font-size:18px;">
                  <a class="dropdown-item" href="form.html"><i class="fa fa-clipboard" ></i> Form for Post</a><br>
                  <a class="dropdown-item active" href="Editdata.jsp"><i class="fa fa-pencil-square-o"></i>Edit my Post</a>
                </div>
      <li><a href="profile1.jsp"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
      <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Log out</a></li>
    </ul>
  </div>
</nav>


<!-- ------------------------Connect to the database---------------------- -->
  
  <%

  int refID=0;
try{
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con=DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/Registration","root",""); 
	Statement stmt1=con.createStatement();
	Statement stmt=con.createStatement();
	
			ResultSet rs1=stmt.executeQuery("select * from login ");
			while(rs1.next())
			{
				refID=rs1.getInt(1);
        rs=stmt1.executeQuery("select * from JobInformation where refid='"+refID+"'");
			}
	 
   
	
	  
}catch(Exception e){
	out.println(e);
}
%>
<!-----edit and delete-------->
<form method="POST" action="formedit.jsp" style="margin-left:40%;margin-top:3%;font-size:16px;">
     <input type="number" placeholder="ID you want to update" name="editid">
     <td><input type="submit" value="Edit"></td>
          	
</form>
<form method="POST" action="delete.jsp" style="margin-left:40%;margin-top:1%;margin-bottom:2%;font-size:16px;">
  <input type="number" placeholder="ID you want to delete" name="dltid">
     <td><input type="submit" value="Delete" ></td>
</form>



<!-- ------------------------Display all record----------------------- -->
<h3><P style="margin-left:40%;color:brown;margin-bottom:1%;">Here's you posted Job's</p></h3>
<table style="background:lightgray;margin-left: auto;
  margin-right: auto;" >
        <tr>
           <td>Job ID</td><td>Company Name</td><td>Job Title</td><td>Job Type</td><td>Job Description</td><td>Job Location</td><td>Job Salary</td><td>Mobile No</td><td>Working day</td>
        </tr>
        <% while(rs.next()){ %>
        <tr>
           <td><input type="text" value=' <%= rs.getInt(2) %>' size="5%" disabled/></td>
           <td><input type="text" value=' <%= rs.getString(3) %>' disabled/></td>
           <td><input type="text" value=' <%= rs.getString(4) %>' size="10%"disabled/></td>
           <td><input type="text" value=' <%= rs.getString(5) %>' disabled/></td>
           <td><input type="text" value=' <%= rs.getString(6) %>' disabled/></td>
           <td><input type="text" value=' <%= rs.getString(7) %>' disabled/></td>
           <td><input type="text" value=' <%= rs.getFloat(8) %>' disabled/></td>
           <td><input type="text" value=' <%= rs.getLong(9) %>' size="5%" disabled/></td>
           <td><input type="text" value=' <%= rs.getInt(10) %>' size="5%" disabled/></td>           
        </tr>     
        <% } %>
</table>

    <script src="C:\Users\kruti\OneDrive\Desktop\bootstrap-5.0.0-beta2-dist\js\jquery.js"></script>
    
    <script src="C:\Users\kruti\OneDrive\Desktop\bootstrap-5.0.0-beta2-dist\js\bootstrap.min.js"></script>


<!-- ----------- --footer------------>
<table class="container footer"  style="width:100%;color:white;">
  	<tr class="panel panel-default" style="background-color:black;">
    <td class="panel-body">Copyright � 2021 Jobs-IN . All Rights Reserved .</td>
  	</tr>
</table>
<!-- ---------end footer-------------->

<script>
function function1(){
	prompt("hello");
}
</script>
 
</body>
</html>