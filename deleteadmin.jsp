<%@page import="java.sql.*" %> 

<%
String id=(String)request.getParameter("param");

Connection connection=null; 
try { 
	Connection con;
    PreparedStatement pst;
    ResultSet rs;
    
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/appex","root","");
    
    pst = con.prepareStatement("delete from adminuser where admin_id=?");
    pst.setString(1,id);
    pst.executeUpdate();
    
   
} catch (ClassNotFoundException e) {
 e.printStackTrace();
} catch (SQLException e) {
 e.printStackTrace();
}
%>