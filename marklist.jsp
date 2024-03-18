<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %> 

<!DOCTYPE html>
<html>
<head>
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">

 </script>
</head>
<body>

<nav class="navbar navbar-default navbar-ml-auto">
   <div class="navbar-header ">
     <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#Menu">
       <span class="icon-bar"></span>
       <span class="icon-bar"></span>
       <span class="icon-bar"></span>
       <span class="icon-bar"></span>
     </button>
      <a class="navbar-brand"></a>
   </div>
   <div class="collapse navbar-collapse " id="Menu">
     <ul class="nav navbar-nav navbar-left">
       <li><a href="adminshow.jsp">ADDSTUDEND</a></li>
       <li><a href="addquestion.jsp">ADDQUESTION</a></li>
       <li><a href="marklist.jsp">STUDENT MARK</a></li>
       <li><a href="addadmin.jsp">ADD ADMIN</a></li>

     </ul>
   </div>
 </nav>



<div class="box ">
  
  <form  method="POST" > 
<%   

Connection con1;
ResultSet rs1;
Class.forName("com.mysql.jdbc.Driver");
con1 = DriverManager.getConnection("jdbc:mysql://localhost/appex","root","");
String query = "select DISTINCT rollno from result";
Statement st = con1.createStatement();
rs1 =  st.executeQuery(query);

%>
<label class="form-label">ROLL NO</label>
<select id="rollno" name="rollno">
<option value="0" selected>Select</option>
<%while(rs1.next()){
                                 	String rollno = rs1.getString("rollno");
                                   %>
                                 <option value="<%=rollno %>"><%=rollno %></option>
                                 <%}
                                 %>
                                 </select>
          <input type="submit" id="submit" value="submit" name="submit"  class="btn btn-info"> 
 </form> 
</div>
<div class="col-sm-10">
                 <div class="panel-body">
                     <table id="table" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                         <thead>
                             <tr>
                                    <th>S.NO</th>
                                    <th>ROLL NO</th>
                                    <th>NAME</th>
                                    <th>SUBJECT</th>
                                    <th>SET NO</th>
                                    <th>MARK</th>
                                   
                             </tr>  
                             
                             <%   
                             String query1 = "select * from result";
                             if(request.getParameter("submit")!=null)
                             {
                            	 String rollno = request.getParameter("rollno");
                            	 
                            	 query1 = "select * from result where rollno='"+rollno+"'";
                             }
                             Connection conn;
                             
                             ResultSet rs2;
                             Class.forName("com.mysql.jdbc.Driver");
                             conn= DriverManager.getConnection("jdbc:mysql://localhost/appex","root","");
                                  
                                  Statement st1 = conn.createStatement();
                                  
                                    rs2 =  st1.executeQuery(query1);
                                    int i=0;
                                        while(rs2.next())
                                        {
                                            
                                           i+=1;
                                   %>
             
                             <tr>
                                 <td><%=i%></td>
                                 <td><%=rs2.getString("rollno") %></td>
                                 <td><%=rs2.getString("name") %></td>
                                 <td><%=rs2.getString("subject") %></td>
                                 <td><%=rs2.getString("setno") %></td>
                                 <td><%=rs2.getString("scoer") %></td>
                             </tr> 
                             
                             
                                <%
                                 
                                 }
                               %>
                             
                     </table>    
                 </div>

            </div>  

</body>
</html>
