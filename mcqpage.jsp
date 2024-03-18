<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>

</script>
</head>
<body><div class="col-sm-10">
                 <div class="panel-body">
                     <form name="form1">
                     <%   
                             String course = (String)session.getAttribute("course");
                             String set=(String)session.getAttribute("setno");
                              
                             Connection con;
                             ResultSet rs;
                             Class.forName("com.mysql.jdbc.Driver");
                             con= DriverManager.getConnection("jdbc:mysql://localhost/appex","root","");
                                  String query1 = "select * from testing where testno="+set+"";
                                  Statement st1 = con.createStatement();
                                  
                                    rs =  st1.executeQuery(query1);
                                   int i=0;
                                   int totalRows = 0;
                                     rs.last();
                                   totalRows = rs.getRow();
                                      rs.beforeFirst();
                                   String ans[];
                                   ans=new String[totalRows];
                                        while(rs.next())
                                        {
                                         
                                   %>

<%= i+1 + ")"  +rs.getString("question") %><br>
<input type="radio" name="question<%=i%>" value= "<%= rs.getString("option_1") %>" />
<%= rs.getString("option_1") %> <br>
<input type="radio" name="question<%=i%>" value="<%= rs.getString("option_2") %>" />
<%= rs.getString("option_2") %><br>
<input type="radio" name="question<%=i%>" value="<%= rs.getString("option_3") %>" />
<%= rs.getString("option_3") %><br>
<input type="radio" name="question<%=i%>" value="<%= rs.getString("option_4") %>" /> 
<%= rs.getString("option_4") %><br><br><br>
<% ans[i]=rs.getString("answer");
 i++;}  
 %>
 <input type="submit" value="Submit" name="submit">
 </form>
 <%
            if(request.getParameter("submit") != null) {
            	int count=0;
            	int check=0;
            	
            	while(check<totalRows){
            		
            		 if(request.getParameter("question"+check).equals(ans[check])) {
                     	count++;	
                     }
            		
            		 check++;
            	}

            	session.setAttribute("count",count);
            	response.sendRedirect("resultpage.jsp"); 
            }
%>
</div>
 </div>  
</body>
</html>