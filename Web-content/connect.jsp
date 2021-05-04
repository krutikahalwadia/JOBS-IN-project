<%@ page import ="java.sql.*"%>
<%
String f_name = request.getParameter("f_name");
String l_name = request.getParameter("l_name");
String email = request.getParameter("email");
String gender = request.getParameter("gender");
String phno = request.getParameter("phno");
String password = request.getParameter("password");
String cpassword = request.getParameter("cpassword");
String insert_into = "INSERT INTO reg(f_name,l_name,email,gender,phno,password,cpassword)" + " VALUES (?,?,?,?,?,?,?)";
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/registration","root","");
    PreparedStatement ps=conn.prepareStatement(insert_into);
    ps.setString(1,f_name);
    ps.setString(2,l_name);
    ps.setString(3,email);
    ps.setString(4,gender);
    ps.setString(5,phno);
    ps.setString(6,password);
    ps.setString(7,cpassword);
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
