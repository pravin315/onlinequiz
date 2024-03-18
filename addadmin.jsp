<%@page import="java.sql.*" %> 
<% 

    if(request.getParameter("submit")!=null)
    {
    	String rollno = request.getParameter("adminid");
    	String cous = request.getParameter("adminpass");
        Connection con;
        PreparedStatement pst;
        ResultSet rs2;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/appex","root","");
        pst = con.prepareStatement("insert into adminuser(admin_id,admin_pw) values(?,?)");
        pst.setString(1, rollno);
        pst.setString(2, cous);
        pst.executeUpdate();
       
    }
   %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<script type="text/javascript">
function take_delete(id)
{
	var http = new XMLHttpRequest();
	 http.open("POST", "http://localhost:8080/appexwed/deleteadmin.jsp", true);
	 	http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	 	var params = "param=" + id;
	 	http.send(params);
}
</script>
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
 <br>
   <div class="row">
            <div class="col-sm-3">
                <form  method="POST" name="myform" autocomplete="off" > 
                    
                    <div alight="left">
                        <label class="form-label">ADMIN ID</label>
                        <input type="text" class="form-control" placeholder="" name="adminid" id="adminid" required >
                     </div>                     <br>
                     <div alight="left">
                        <label class="form-label">ADMIN PASSWORD</label>
                        <input type="password" class="form-control" placeholder="" name="adminpass" id="adminpass" required >
                     </div>
                     <br>
                         <br>
                         
                     <div alight="right">
                         <input type="submit" id="submit" value="submit"  name="submit" class="btn btn-info">
                        
                     </div>  
                         
                </form>
            </div>
            <div class="col-sm-9">
                 <div class="panel-body">
                     <table id="table" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                         <thead>
                             <tr>
                                    <th>S.NO</th>
                                    <th>ADMIN ID</th>
                                    <th>PASSWORD</th>
                                    <th>Delete</th>
                             </tr>  
                             
                             <%   

                             Connection conn;
                             
                             ResultSet rs2;
                             Class.forName("com.mysql.jdbc.Driver");
                             conn= DriverManager.getConnection("jdbc:mysql://localhost/appex","root","");
                                  String query1 = "select * from adminuser";
                                  Statement st1 = conn.createStatement();
                                  
                                    rs2 =  st1.executeQuery(query1);
                                    int i=0;
                                        while(rs2.next())
                                        {
                                            
                                           i+=1;
                                   %>
             
                             <tr>
                                 <td><%=i%></td>
                                 <td><%=rs2.getString("admin_id") %></td>
                                 <td><%=rs2.getString("admin_pw") %></td>
 <td><input type="button" onclick='take_delete("<%=rs2.getString("admin_id") %>"); window.location.reload(true)' value="DELETE" class="btn btn-danger" /></td>
                             </tr> 
                             
                             
                                <%
                                 
                                 }
                               %>
                             
                     </table>    
                 </div>

            </div>  
        </div>
</body>
</html>