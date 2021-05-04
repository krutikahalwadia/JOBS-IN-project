<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import = "java.sql.*" %>
 <% ResultSet rs = null; %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>JOBS-IN/Home page/Recruiter portal
    </title>
    <link rel="stylesheet" href="css\reg.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/dropdown.css">
    <link rel="stylesheet" href="css/index.css">
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
                  <a class="dropdown-item active" href="form.html"><i class="fa fa-clipboard" ></i> Form for Post</a><br>
                  <a class="dropdown-item" href="Editdata.jsp"><i class="fa fa-pencil-square-o"></i>Edit my Post</a>
                </div>
      <li><a href="profile1.jsp"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
      <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Log out</a></li>
    </ul>
  </div>
</nav>
<!--------connection---->
<%
	
		int edit=0;
	    edit=Integer.parseInt(request.getParameter("editid"));				
	%>
	<%
	
		try{
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			Connection con=DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/Registration","root","");
			Statement stmt=con.createStatement();
	
			rs=stmt.executeQuery("select * from jobinformation where job_id='"+edit+"'");
      if(rs.next())
      { %>
      <div class="container" style="margin-bottom: 5%;">
          <div class="row">
              <div class="col-sm-12 col-md-12 col-lg-12">
                  <p class="wel">Update your data..</p>
              </div>
          </div>
          <div class="row">
              <div class="col-sm-6" style="width:100%">
                  <form method="POST" action="update.jsp">
                      <div class="img">
                          <img src="image\p.png" alt="photo" height="15%" width="20%">
                      </div>
                      
                      <div class='name'>  
                      <input class="us" type="text" name = "cid" value="<%=rs.getInt(2)%>" size="30" readonly ><br><br>
                      <input class="us" type="text" name = "Comp_name1" value="<%=rs.getString(3)%>" size="30" ><br><br>
                      <input class="us" type="text" name = "job_title1" value="<%=rs.getString(4)%>" size="30" ><br><br>
                      <input class="us" type="text" name = "job_type1" value="<%=rs.getString(5)%>"  size="30" ><br><br>
                      <input class="us" type="text" name = "job_desc1" value="<%=rs.getString(6)%>" size="30" ><br><br>
                      <input class="us" type="text" name = "job_location1" value="<%=rs.getString(7)%>"  size="30" ><br><br>  
                      <input class="us" type="text" name = "job_salary1" value="<%=rs.getInt(8)%>"  size="30" ><br><br>
                      <input class="us" type="text" name = "job_work_day1" value="<%=rs.getInt(9)%>"  size="30" ><br>
                      <input class="us" type="text" name = "job_contact1" value="<%=rs.getString(10)%>"  size="30" >    		
                      <input class="us"type="submit" value="UPDATE" class="submit" name="submit" style="margin-bottom:5%">
                  </div> 
                  
                  </div>
                
              </form>
              </div>
          </div>
      </div>
      <% }
		}
		catch(Exception e){
			out.println(e);
		}
	
	
	%>

<!-------------------------------------Form--------------------------------------------->

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