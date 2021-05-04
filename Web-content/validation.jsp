<%@ page import ="java.sql.*"%>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/registration","root","");
    PreparedStatement ps=conn.prepareStatement(select * from reg(email,password) where VALUES=(?,?));
    ps.getString(1,email);
    ps.getString(2,password);
  
    int x = ps.executeUpdate();
    if(x>0){
        out.println("Registration done successfully");
    }else{
        out.println("Registration failed");
    }

}catch(Exception e){
    out.println(e);
}
%>
