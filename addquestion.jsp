<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %> 
<% 
    if(request.getParameter("submit")!=null)
    {
        String busno = request.getParameter("ques");
        String from = request.getParameter("a");
        String to = request.getParameter("b");
        String ddate = request.getParameter("c");
        String dtime = request.getParameter("d");
        String cost = request.getParameter("ans");
        String course= request.getParameter("courses");
        String testno= request.getParameter("testno");
       
        Connection con;
        PreparedStatement pst;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/appex","root","");
        pst = con.prepareStatement("insert into "+course+"(question,option_1,option_2,option_3,option_4,answer,testno) values(?,?,?,?,?,?,?)");
        pst.setString(1, busno);
        pst.setString(2, from);
        pst.setString(3, to);  
        pst.setString(4, ddate);
        pst.setString(5, dtime);
        pst.setString(6, cost);
        pst.setString(7, testno);
        pst.executeUpdate();
    }

%> 
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
function take_delete(id)
{
	var http = new XMLHttpRequest();
	 http.open("POST", "http://localhost:8080/appexwed/delete.jsp", true);
	 	http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	 	var params = "param=" + id;
	 	http.send(params);
}
function set_delete(setno)
{
	var http = new XMLHttpRequest();
	 http.open("POST", "http://localhost:8080/appexwed/deleteset.jsp", true);
	 	http.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	 	var params = "param=" +setno;
	 	http.send(params);
}
    
    
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
  <div class="col-sm-8">
  <form  method="POST" autocomplete="off" >
				<label class="form-label">COURSES</label>
				<select id="course" name="course">
				 <option value="0" selected>select</option>
		 <option value="TESTING" >TESTING</option>
		 <option value="JAVA">JAVA/J2EE</option>
		 <option value="PYTHON">PYTHON</option>
		 <option value="DOTNET">DOTNET</option>
		 <option value="UIUX">UI/UX</option>
		 <option value="FULLSTACK">FULLSTACK</option>
		 <option value="FRONTENDDEVELOPER">FRONT END DEVELOPER</option>
		 <option value="DIGITALMARKETING">DIGITAL MARKETING</option>
		 <option value="AI">AI</option>
		 <option value="DATASCIENCE">DATA SCIENCE</option>
		 </select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="submit" id="submit1" value="submit" name="submit1"  class="btn btn-info"> 
 </form> 
</div>
<div class="col-sm-3">
    <button class="btn btn-primary" data-toggle="modal" data-target="#add" >QUESTION</button>
</div>
 </div>
 <div class="modal" id="add" >
 <div class="modal-dialog">
 <div class="modal-content">
 
  <div class="modal-body">
 <form  method="POST" autocomplete="off" > 
 <label class="form-label">COURSES</label>
		<select id="courses" name="courses">
		<option value="0" selected>select</option>
		 <option value="TESTING" >TESTING</option>
		 <option value="JAVA">JAVA/J2EE</option>
		 <option value="PYTHON">PYTHON</option>
		 <option value="DOTNET">DOTNET</option>
		 <option value="UIUX">UI/UX</option>
		 <option value="FULLSTACK">FULLSTACK</option>
		 <option value="FRONTENDDEVELOPER">FRONTENDDEVELOPER</option>
		 <option value="DIGITALMARKETING">DIGITAL MARKETING</option>
		 <option value="AI">AI</option>
		 <option value="DATASCIENCE">DATASCIENCE</option>
		 </select>
                         <div alight="right">
	                        <label class="form-label">TEST NO</label>
	                        <input type="number" class="form-control" placeholder="" name="testno" id="testno"  required >
	                     </div><br>
	                     <div alight="left">
	                        <label class="form-label">QUESTION</label>
	                        <input type="text" class="form-control" placeholder="" name="ques" id="ques"  required >
	                     </div>  <br>
	                      <div alight="left">
	                        <label class="form-label">OPTION A</label>
	                        <input type="text" class="form-control" placeholder="" name="a" id="a"  required >
	                     </div><br>
	                     <div alight="left">
	                        <label class="form-label">OPTION B</label>
	                        <input type="text" class="form-control" placeholder="" name="b" id="b" required >
	                     </div><br>
	                      <div alight="left">
	                        <label class="form-label">OPTION C</label>
	                        <input type="text" class="form-control" placeholder="" name="c" id="c" required >
	                     </div><br>
	                        <div alight="left">
	                        <label class="form-label">OPTION D</label>
	                        <input type="text" class="form-control" placeholder="" name="d" id="d" required >
	                     </div><br>
	                     <div alight="left">
	                        <label class="form-label">ANSWER</label>
	                        <input type="text" class="form-control" placeholder="" name="ans" id="ans" required >
	                     </div><br>  
	                     <div alight="right">
	                         <input type="submit" id="submit" value="submit" name="submit"  class="btn btn-info">
	                     </div>
 </form>
 </div>
 </div>
 </div>
 </div>
 
 
 
 <div class="row">
  
  

 
 <div class="col-sm-4">
 <div class="panel-body">
<table id="table1" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
  <thead>
							<tr>
							<th>S.NO</th>                                    
							<th>QUESTION SET</th>
							<th>Delete</th>
							</tr>  
  </thead>                    
 <%   session.setAttribute("delete","testing");
                        String query1 = "select DISTINCT testno from testing order by testno ";
                        if(request.getParameter("submit1")!=null)
                        {

    						String course= request.getParameter("course");   
    						session.setAttribute("delete",course);
                        	 query1 = "select DISTINCT testno from "+course+" order by testno ";
                        }
						 Connection conn;                           
						 ResultSet rs;                           
						 Class.forName("com.mysql.jdbc.Driver");                            
						 conn= DriverManager.getConnection("jdbc:mysql://localhost/appex","root","");
						
						Statement st = conn.createStatement();        
						rs =  st.executeQuery(query1);
				int i=0;
				while(rs.next())
				{                                       
				i+=1;
				String setno=rs.getString("testno");
				%>            
 <tr>
<td><%=i%></td>
 <td>SET<%=setno%></td>
<td><input type="button" onclick='set_delete("<%=setno%>"); window.location.reload(true)' value="DELETE" class="btn btn-danger" /></td>
 </tr> 
               <%}%>
                             
</table>                     
</div>
 </div>
 
 
 
 <div class="col-sm-8">
 <div class="panel-body">
                     <table id="table" class="table table-responsive table-bordered" cellpadding ="0" width="100%">
                         <thead>
                             <tr>
                                    <th>S.NO</th>
                                    <th>QUESTION</th>
                                    <th>ANSWER</th>
                                    <th>QUESTION SET</th>
                                    <th>Delete</th>
                             </tr>  
                             <% 

	                             
                             session.setAttribute("delete","testing");
	                             String query = "select * from testing order by testno ";
	                             if(request.getParameter("submit1")!=null)
	                             {
	                            	  String course1= request.getParameter("course");
	 	                             session.setAttribute("delete",course1);
	 	                            query = "select * from "+course1+" order by testno ";
	                             }
	                             Connection con;
	                             
	                             ResultSet rs2;
	                             Class.forName("com.mysql.jdbc.Driver");
	                             con= DriverManager.getConnection("jdbc:mysql://localhost/appex","root","");
                                  
                                  Statement st1 = con.createStatement();
                                  
                                    rs2 =  st1.executeQuery(query);
                                    int a=0;
                                        while(rs2.next())
                                        {

                                        	a+=1;
                               %>
                             <tr>
                                <td><%=a%></td>
                               <td><%=rs2.getString("question") %></td>
                                <td><%=rs2.getString("answer") %></td>  
                                <td><%=rs2.getString("testno") %></td>
<td><input type="button" onclick='take_delete("<%=rs2.getString("id")%>"); window.location.reload(true)' value="DELETE" class="btn btn-danger" /></td>
                             </tr> 
                                     <%}%>
                                      
                     </table>    
                 </div>
 </div>

</div>
</body>
</html>
