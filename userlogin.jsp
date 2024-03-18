<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

     <%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"  href="css\userlogin.css">


</head>

<style>
 *{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: sans-serif;
 }
  .navbar {
    margin-bottom: 0;
    background-color: #FDA50F;
    z-index: 9999;
    border: 0;
    font-size: 12px !important;
    line-height: 1.42857143 !important;
    letter-spacing: 4px;
    border-radius: 0;
    font-family: Montserrat, sans-serif;
  }
  .navbar li a, .navbar .navbar-brand {
    color: #fff !important;
  }
  .navbar-nav li a:hover, .navbar-nav li.active a {
    color: #FDA50F !important;
    background-color: #fff !important;
  }
  
.col-sm-3{
    top:30px;
    height:370px;
    }
body{
background-image: url(image/gradient.jpg);
background-size: cover;
 
}

 .card{
    position: relative;
    width: 250px;
    height: 180px;
    background: #fff;
    transition: 0.5s;
    border-radius: 8px;
}
.card:hover{
    height: 350px;
}
.card .lines{
    position: absolute;
    inset:0;
    background: #000;
    overflow: hidden;
}
.card .lines::before{
content: '';
position: absolute;
top:50%;
left: 50%;
width: 600px;
height: 120px;
border-radius: 8px;
background: linear-gradient(transparent,#45f3ff,#45f3ff,
    #45f3ff,transparent);
animation: animate 4s linear infinite;
animation-play-state: paused;
}
.card:hover .lines::before{
    animation-play-state: running;
}
@keyframes animate{
    0%{
        transform: translate(-50%,-50%) rotate(0deg);
    }
    100%{
        transform: translate(-50%,-50%) rotate(360deg);
    }
}
 .card .lines::after{
    content: '';
    position: absolute;
    inset: 5px;
    background: #fff;
}
.card .imgb{
    position: absolute;
    top:-10%;
    left: 50%;
    width: 100px;
    height: 100px;
    transform: translateX(-50%);
    background: #000;
    transition: 0.5s;
    z-index: 10;
       display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden;
}

.card:hover .imgb{
    top:25px;
    width: 150px;
    height: 150px;
}

.card .imgb::before{
    content: '';
    position: absolute;
    top:50%;
    left: 50%;
    width: 400px;
    height: 90px;
    transform: translate(-50%,-50%);
   background: linear-gradient(transparent,#45f3ff,#45f3ff,
    #45f3ff,transparent);
   
    animation: animate2 4s linear infinite;
   
}
 .card:hover .imgb::before{
    
     background: linear-gradient(transparent,#FDA50F,#FDA50F,
    #FDA50F,transparent);
    
     }
    @keyframes animate2{
        0%{
            transform: translate(-50%,-50%) rotate(360deg);
        }
        100%{
            transform: translate(-50%,-50%) rotate(0deg);
        }
    }
    .card .imgb::after{
        content: '';
        position: absolute;
        inset: 3px;
        background:#292929
    }
.card .imgb img{
        position: absolute;
        top: 10px;
        left: 10px;
        z-index: 1;
        width: calc(100% - 20px);
        height:  calc(100% - 20px);
    }

.card .content{
        position: absolute;
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: flex-end;
        overflow: hidden;
}
.card .content .details{
    padding: 30px 20px;
    text-align: center;
    width: 100%;
    transition: 0.5s;
    transform: translateY(65px);
}
.card:hover .content .details{
    transform: translateY(0px); 
}
.card:hover .content .details h2{
    color: #FDA50F;
    font-weight: 800;
    font-size:32px;
}
.card .content .details h2{
    color: #1c44d2;
    font-size:22px;
    font-weight: 700;
    font-style:italic;
    text-transform: uppercase;
}
input[type="submit"]{
   
    border: none;
    outline: none;
    padding: 9px 25px;
    background: #FDA50F;
    cursor:pointer;
    font-size: 0.9em;
    border-radius: 4px;
 }
</style>
<body>
<nav class="navbar navbar-default navbar-ml-auto">
   <div class="navbar-header ">
      <a class="navbar-brand"></a>
   </div>
   <div class="collapse navbar-collapse " >
     <ul class="nav navbar-nav navbar-left">
       <li><a href="#"><%=(String)session.getAttribute("uname") %></a></li>
     </ul>
     <ul class="nav navbar-nav navbar-center">
       <li><a href="#"><%=(String)session.getAttribute("course") %></a></li>
     </ul>
     <ul class="nav navbar-nav navbar-right">
       <li><a href="logout.jsp"><%out.println("LOGOUT"); %></a></li>
     </ul>
   </div>
 </nav>

<%
String course=(String)session.getAttribute("course");

Connection con;
ResultSet rs;
Class.forName("com.mysql.jdbc.Driver");
con= DriverManager.getConnection("jdbc:mysql://localhost/appex","root","");
     String query1 = "select DISTINCT testno from "+course+" order by testno ";
     Statement st1 = con.createStatement();
     rs=st1.executeQuery(query1);
   
     %>
<main>
<%while(rs.next()){
	String setno=rs.getString("testno");
	%>
	<div class="col-sm-3">
<div class="card">
<div class="lines"></div>
<div class="imgb"><img src="image\testing.png" ></div> 
 <div class="content">
<div class="details">
 <form method="POST">
<h2>SET<%=setno%><input type="hidden" value="<%=setno%>" name="setno"></h2>
 <input type="submit" id="submit" value="submit" name="submit"  class="btn btn-info">
</form>
    </div>
  </div>
</div> 
</div>
<%} %>
</main>
<%
if(request.getParameter("submit")!=null){
	String setno=request.getParameter("setno");
	Connection conn;
	ResultSet rs1;
	Class.forName("com.mysql.jdbc.Driver");
	con= DriverManager.getConnection("jdbc:mysql://localhost/appex","root","");
	     String query = "select  * from result where name='"+(String)session.getAttribute("uname")+"' and setno ='"+setno+"'";
	     Statement st = con.createStatement();
	     rs=st.executeQuery(query);
	   
	   
	
			if(rs.next()){
			response.sendRedirect("userlogin.jsp");
			
			  
			}else{
				
				session.setAttribute("setno", setno);
				response.sendRedirect("mcqpage.jsp");
			}
	     

}
%>
</body>
</html>