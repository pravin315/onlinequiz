<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*,java.util.*"%>
    <%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "appex";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection conn = null;
Statement st,st1 = null;
ResultSet rs,rs1 = null;
%>
  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"><link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
     <link rel="stylesheet" type='text/css' href="css\login.css">
     
</head>
<style>
@charset "ISO-8859-1";
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family:'poppins',sans-serif;
 }
 body{
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background-image: url(image/3794750.jpg);
    background-size: cover;
 
 }
 .box{
    position: relative;
     width: 380px;
   height: 400px;;
     border-radius: 10px;
     overflow:hidden;
    

 }
 
 .box form{
    position: absolute;
    inset: 4px;
    line-height: 10px;
    background-color:#fff;
    padding: 50px 40px;
    border-radius: 8px;
    z-index: 2;
    display: flex;
    flex-direction: column;
    
 }
 .box form h2{
    color:#FDA50F;
    font-weight: 500;
    text-align: center;
    letter-spacing: 0.1em;
 }
 .box form .inputbox{
    position: relative;
    width: 300px; 
    margin-top: 35px;
 }
 .box form .inputbox input{
    position: relative;
    width: 100%;
    padding: 20px 10px 10px;
    background: transparent;
    outline:none;
    border:none;
    box-shadow: none;
    color: #fff;
    font-size: 1em;
    letter-spacing: 0.05em;
    transition: 0.5s;
    z-index: 10;
 
 }
 .box form .inputbox span{
    position: absolute;
    left: 0;
    padding: 20px 10px 10px;
    pointer-events: none;
    color: #8f8f8f;
    font-size:1em;
    letter-spacing: 0.05em;
    tranition:0.5em;
 }
 .box form .inputbox input:valid ~ span,
.box form .inputbox input:focus ~ span
{
   color:black;
   font-size: 0.75em;
   transform:translatey(-34px);
} 
.box form .inputbox i{
    position: absolute;
    left: 0;
    bottom: 0;
    width: 100%;
    height: 2px;
    background: #FDA50F;
    border-radius: 4px;
    overflow: hidden;
    transition: 0.05s;
    pointer-events: none;
 }
 .box form .inputbox input:valid ~ i,
.box form .inputbox input:focus ~ i
{
height: 44px;
}
.box form .links{
    display: flex;
    justify-content: space-between;
 }
 .box form .links a{
    margin: 10px 0;
    margin-top: 1rem;
    font-size:0.75em;
    color: #f11111;
    text-decoration: none;
 }s
 .box form .links a:hover{
 color: rgb(0, 94, 255);
 }
 .box form  input[type="submit"]{
   
    border: none;
    outline: none;
    padding: 15px 25px;
    background: #FDA50F;
    cursor:pointer;
    font-size: 0.9em;
    border-radius: 4px;
 }
 .box form  input[type="submit"]:active{
 opacity: 0.0;
 }
 
 
</style>
<body>
<div class="box">
   <form autocomplete="off" method="get">
          <h2>LOGIN</h2>
          <div class="inputbox">
           <input type="text" name="userid" required="required ">
           <span>Username</span>
           <i></i>
          </div> 
          <div class="inputbox">
            <input type="password"  name="password" required="required">
            <span>password</span>
            <i></i>
           </div> 
           <div class="links">
            <a href="#jsdjs">Forgot password</a>
            <a href="register.jsp" >signup</a>
           </div>
           <input type="submit" name="submit" value="login" >
        </form>
        
</div>
<%

if(request.getParameter("submit")!=null)
{
String userid1=request.getParameter("userid"); 
//session.putValue("userid",userid); 
String password1=request.getParameter("password"); 
conn=DriverManager.getConnection(connectionUrl+database, userid, password);
 st= conn.createStatement();
 st1= conn.createStatement();
 
 String sql ="select * from adminuser where admin_id='"+userid1+"' and admin_pw='"+password1+"'";
 String sql1 ="select * from user where userid='"+userid1+"' and user_pw='"+password1+"'";
 rs=st.executeQuery(sql);
 
 rs1=st1.executeQuery(sql1);
 

try{
	
	
	
	 if(rs1.next()) 
		{   
		 session.setAttribute("rollno",rs1.getString("userid"));
			session.setAttribute("uname",rs1.getString("name"));
			session.setAttribute("course",rs1.getString("courses"));
     	response.sendRedirect("userlogin.jsp"); 
		}else
        		 if(rs.next()) 
			{ 
	        	response.sendRedirect("adminshow.jsp"); 
			}
        		

       		
				  
		
}
catch (Exception e) {
e.printStackTrace();
}
}
%>
</body>
</html>