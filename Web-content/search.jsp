<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
	<% Class.forName("com.mysql.jdbc.Driver");%>
	<% ResultSet rs = null; %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>JOBS-IN/Home Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="css/homepage1.css"></script>
  <!---for post------->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="css/searchbar.css">
    <link rel="stylesheet" href="css/index.css">

</head>
<body style="background-color:rgb(153, 153, 255,0.4);">

<!---------------------------------- Navigation bar --------------->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand"  href="#" style="size:18px;color:Yellow ;animation: animate 
                1.5s linear infinite;"><b>JOBS-IN</b></a>
    </div>
    <ul class="nav navbar-nav" style="margin-left:3%;">
      <li class="active"><a href="homepage1.jsp">Home</a></li>
      <li><a href="Aboutus.html">About Us</a></li>
      <li><a href="contactus.html">Contact Us</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="page.html"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="page1.html"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav>




<!-- -------Image slider start -->

<div class="container" style="width: 100%;">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators" style="margin-bottom: -1%">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">

      <div class="item active">
        <img src="image\7.jpg" alt="Los Angeles" style="width:100%;height:300px">
      </div>

      <div class="item">
        <img src="image\6.jpg" alt="Chicago" style="width:100%;height:300px">
      </div>
      <div class="item">
        <img src="image\5.jpg" alt="Chicago" style="width:100%;height:300px">
      </div>
      <div class="item">
        <img src="image\4.jpg" alt="Chicago" style="width:100%;height:300px">
      </div>
    
     
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div><br>
 <!-------Search bar----------->
<div class="col-sm-10" style="margin-left:8%;margin-bottom:3%;">
            <section id="search">
            <form method="POST" action="search.jsp">
             <label for="search-input"><i class="fa fa-search" aria-hidden="true"></i><span class="sr-only">Search job by job title</span></label>
              <input id="search-input" class="form-control input-lg" placeholder="Search job by job title" autocomplete="off" spellcheck="false" autocorrect="off" tabindex="1" name="search" onclick=record()>
              <input class="button" type="submit" value="search" >
              <a id="search-clear" href="#" class="fa fa-times-circle hide" aria-hidden="true"><span class="sr-only">Clear search</span></a>
            </form>  
            </section>
  </div> 

  <!-- ------------------------Connect to the database---------------------- -->
  	<%
try{ 
    
	String search=""; 
	search=request.getParameter("search");

	 
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection(
			
	"jdbc:mysql://localhost:3306/Registration","root",""); 
	Statement stmt=con.createStatement();
	String query="select * from jobinformation where j_title Like '"+ "%" + search + "%" +"'";
  ResultSet	rst=stmt.executeQuery(query);
 int j=0;
	while(rst.next())  
	{
		 j=1;	 
	}
	if(j==0){ %>  
		<div style="color:brown;margin-left:40%;margin-top:9%;">
  <h3>! ! ! Data not found ! ! !</h3>
</div>
	<%}
	else{ %>
		 <div style="color:brown;margin-left:40%;margin-top:9%;">
  <h3>! ! ! Your searched JOBS ! ! !</h3>
</div>
    <% Statement s=con.createStatement();
	
	rs=s.executeQuery(query);
   int i=1; while(rs.next()){%>
  	<% if(i%2!=0) {%>
        <div class="profile-card floatleft">
              <div class="image-container">
                <img src="image/hire1.jpg" alt="photo" width="100%">
                  <div class="title">
                    <p><i class="fa fa-building info"></i>Company name:-&nbsp<%=rs.getString(3)%></p>
                  </div>
                  <div class="main-container">
                  <p><i class="fa fa-briefcase info"></i>Job title:-&nbsp<%=rs.getString(4)%></p>
                  <p><i class="fa fa-map-marker info" ></i>Location:-&nbsp<%=rs.getString(7)%></p>
                  <hr>
                  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="color:blue;">Show details</button>
                  </div>
              </div>
             </div>  
     
         <!----------------------model --------------------------------> 
          <div class="modal fade" id="myModal" role="dialog">
				    <div class="modal-dialog modal-sm">
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">Show more detail and apply please</h4>
				        </div>
				        <div class="modal-body">
                <p>To view detail click
				          <button type="button" class="btn btn-default" ><a href="page1.html">Login</a></button></p>
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
				      </div>
				    </div>
				  </div>
				</div>
      
   <%}else{ %>
        <div class="profile-card floatright">
              <div class="image-container">
                <img src="image/hire1.jpg" alt="photo" width="100%">
                  <div class="title">
                    <p><i class="fa fa-building info" ></i>Company name:-&nbsp<%=rs.getString(3)%></p>
                  </div>
                  <div class="main-container">
                  <p><i class="fa fa-briefcase info"></i>Job title:-&nbsp<%=rs.getString(4)%></p>
                  <p><i class="fa fa-map-marker info" ></i>Location:-&nbsp<%=rs.getString(7)%></p>
                  <hr>
                  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="color:blue;">Show details</button>
                  </div>
              </div>
             </div>  
     
         <!----------------------model --------------------------------> 
          <div class="modal fade" id="myModal" role="dialog">
				    <div class="modal-dialog modal-sm">
				      <div class="modal-content">
				        <div class="modal-header">
				          <button type="button" class="close" data-dismiss="modal">&times;</button>
				          <h4 class="modal-title">Show more detail and apply please</h4>
				        </div>
				        <div class="modal-body">
                <p>To view detail click
				          <button type="button" class="btn btn-default" ><a href="page1.html">Login</a></button></p>
				        </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        </div>
				      </div>
				    </div>
				  </div>
				</div>

   <% }i++;}%> 
	<%} 

}catch(Exception e){ out.println(e);} 

%>



 <!---voice recongnitation----->
 <script >
      function record()
      {
        var recongnition = new webkitSpeechRecognition();
        recongnition.lang="en-GB";
        recongnition.onresult = function(event){
          console.log(event);
          document.getElementById('search-input').value = event.results[0][0].transcript;
        }
        recongnition.start();
      }
    </script>
      <!---voice recongnitation----->
    <script src="//cdnjs.cloudflare.com/ajax/libs/annyang/2.6.0/annyang.min.js"></script>
 <script >
      
      if (annyang) {
        // Let's define our first command. First the text we expect, and then the function it should call
        var commands = {
          'write in search *tag':function(variable){
            let search = document.getElementById("search-input");
            search.value = variable;
          },
        };

        // Add our commands to annyang
        annyang.addCommands(commands);

        // Start listening. You can call this here, or attach this call to an event, button, etc.
        annyang.start();
      }
     </script>
  
 
  <!--------- job list panel---------->
<br>
<br>
<br>
<br>
  
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
