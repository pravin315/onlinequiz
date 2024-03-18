<%@page import="java.sql.*" %> 

<%
String set=(String)request.getParameter("param");

Connection connection=null; 
try { 
	Connection con;
    PreparedStatement pst,pst1,pst2;
    ResultSet rs;
    
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/appex","root","");
    
    pst = con.prepareStatement("delete from studentrollno where rollno=?");
    pst.setString(1,set);
    pst.executeUpdate();
    
    pst1 = con.prepareStatement("delete from result where rollno=?");
    pst1.setString(1,set);
    pst1.executeUpdate();
    
    pst2 = con.prepareStatement("delete from user where userid=?");
    pst2.setString(1,set);
    pst2.executeUpdate();
} catch (ClassNotFoundException e) {
 e.printStackTrace();
} catch (SQLException e) {
 e.printStackTrace();
}
%>