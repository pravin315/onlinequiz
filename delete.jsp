<%@page import="java.sql.*" %> 

<%
String id=(String)request.getParameter("param");
String delete=(String)session.getAttribute("delete");
Connection connection=null; 
try { 
	Connection con;
    PreparedStatement pst;
    ResultSet rs;
    
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/appex","root","");
    pst = con.prepareStatement("delete from "+delete+" where id=?");
    pst.setString(1,id);
   
    pst.executeUpdate();
} catch (ClassNotFoundException e) {
 e.printStackTrace();
} catch (SQLException e) {
 e.printStackTrace();
}
%>