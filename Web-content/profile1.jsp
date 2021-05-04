<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
	<% Class.forName("com.mysql.jdbc.Driver");%>
	<% ResultSet rs = null; %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>JOBS-IN/User/Profile</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="css/profile.css">
  <link rel="stylesheet" href="fontawesome-free-5.6.3-web/css/all.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="css/homepage1.css"></script>
  <link rel="stylesheet" href="css/dropdown.css">
<style>
         .footer {
   position: fixed;
   left: 0;
   bottom: 0;
   width: 100%;
}
</style>

</head>
<body style="background-color:rgb(153, 153, 255,0.4);">

<!---------------------------------- Navigation bar --------------->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand"  href="#" style="size:18px;color:Yellow ;animation: animate 
                1.5s linear infinite;"><b>JOBS-IN</b></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="homepage3.jsp">Home</a></li>
      <li><a href="Aboutus1.html">About Us</a></li>
      <li><a href="contactus1.html">Contact Us</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
              <li class="nav-item dropdown">
                <a class="nav-link dropbtn dropdown-toggle btn btn-outline-success" data-toggle="dropdown" role="button" href="#"><i class="fa fa-chevron-circle-down"></i>Services</a>
                <div class="dropdown-menu dropdown-menu-end" style="color:balck; font-size:18px;">
                  <a class="dropdown-item" href="form.html"><i class="fa fa-clipboard" ></i> Form for Post</a><br>
                  <a class="dropdown-item" href="Editdata.jsp"><i class="fa fa-pencil-square-o"></i>Edit my Post</a>
                </div>
      <li class="active"><a href="profile1.jsp"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
      <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Log out</a></li>
    </ul>
  </div>
</nav>


  <!-- ------------------------Connect to the database---------------------- -->

<%
try{
 Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/registration","root","");              
            Statement s=con.createStatement();
             rs=s.executeQuery("select * from login");
}

catch(Exception e){
    System.out.println(e);
}
%>  

 <%while(rs.next()){  %>
            <div class="profile-card">
              <div class="image-container">
                <img src="image\p.png" alt="photo" width="100%">
                  <div class="title">
                    <h3><i class="fa fa-user info" ></i><%=rs.getString(2)%> &ensp; <%=rs.getString(3)%></h3>
                  </div>
                  <div class="main-container">
                  <p><i class="fa fa-envelope info"></i>Email:-&nbsp<%=rs.getString(4)%></p>
                  <p><i class="fa fa-phone info"></i>Mobile No:-&nbsp<%=rs.getString(5)%></p>
                  <hr>
                  <table>
                  <tr>
                  <td>
                  <form>
                  <input type="submit" value="Edit my profile">
                  </form></td>
                  <td>
                  <form method="POST">
                  <input type="submit" value="Remove my profile"> 
                  </form></td>
                  </table>
                  </div>
              </div>
             </div>  
            <%
          } %>
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
