<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %> 
    <!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Kaushan+Script|Source+Sans+Pro" rel="stylesheet">
<style type="text/css">
*{
  box-sizing:border-box;
 /* outline:1px solid ;*/
}
body{
background: #ffffff;
background: linear-gradient(to bottom, #ffffff 0%,#e1e8ed 100%);
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#e1e8ed',GradientType=0 );
    height: 100%;
        margin: 0;
        background-repeat: no-repeat;
        background-attachment: fixed;
  
}

.wrapper-1{
  width:100%;
  height:100vh;
  display: flex;
flex-direction: column;
}
.wrapper-2{
  padding :30px;
  text-align:center;
}
h1{
    font-family: 'Kaushan Script', cursive;
  font-size:4em;
  letter-spacing:3px;
  color:#FDA50F;
  margin:0;
  margin-bottom:20px;
}
.wrapper-2 p{
  margin:0;
  font-size:1.3em;
  color:#aaa;
  font-family: 'Source Sans Pro', sans-serif;
  letter-spacing:1px;
}
.go-home{
  color:#fff;
  background:#FDA50F;
  border:none;
  padding:10px 50px;
  margin:30px 0;
  border-radius:30px;
  text-transform:capitalize;
  box-shadow: 0 10px 16px 1px rgba(174, 199, 251, 1);
}

@media (min-width:360px){
  h1{
    font-size:4.5em;
  }
  .go-home{
    margin-bottom:20px;
  }
}

@media (min-width:600px){
  .content{
  max-width:1000px;
  margin:0 auto;
}
  .wrapper-1{
  height: initial;
  max-width:620px;
  margin:0 auto;
  margin-top:50px;
  box-shadow: 4px 8px 40px 8px rgba(88, 146, 255, 0.2);
}
  
}
</style>
</head>
<body>
<div class=content>
  <div class="wrapper-1">
    <div class="wrapper-2">
      <h1>Thank you !</h1>
     
      <p>CONGRATULATIONS ON YOUR ACHIEVEMENT!!</P>
      <P>THIS IS YOUR REWARD <%
    Integer count = (Integer)session.getAttribute("count");
    out.println(count);  
    %>FOR ALL THE HARD WORD YOU PUT IN IT . </p>
    <P>ENJOY EVERY BIT OF IT</P>
      <button class="go-home" onclick="location.href='userlogin.jsp'">
      go home
      </button>
    </div>
   
</div>
</div>
<%

String name=(String)session.getAttribute("uname");
String rollno=(String)session.getAttribute("rollno");
String cous = (String)session.getAttribute("course");;
String set=(String)session.getAttribute("setno");
Connection con;
PreparedStatement pst;
ResultSet rs2;
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost/appex","root","");
pst = con.prepareStatement("insert into result(name,rollno,subject,setno,scoer) values(?,?,?,?,?)");
pst.setString(1, name);
pst.setString(2, rollno);
pst.setString(3, cous);
pst.setString(4, set);
pst.setInt(5, count);
pst.executeUpdate();

%>  
</body>
</html>
    