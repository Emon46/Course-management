<%-- 
    Document   : students
    Created on : Mar 18, 2019, 4:43:05 PM
    Author     : H.R. Emon
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.PrintWriter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
table, th, td {
  border: 1px solid black;
  
}
</style>
<html>
    <head>
	<link rel="stylesheet" type="text/css" href="style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>students</title>
    </head>
    <body>
        <header>
        <nav>

            <h1>CSE SUST</h1>
		<div class="main-wrapper">
                    <ul>
                        <li><a href="teachercourses.jsp">courses </a></li>
			<li><a href="teacherTeacher.jsp">Teachers</a></li>
			<li><a href="teacherstudents.jsp">Students</a></li>
                        
                    </ul>		
                </div>
         
            <div class="nav-login">
                <% 
                    String username= (String) session.getAttribute("Name");
                    if(username==null){
                    %>
                <form action="loginValidateCheck" method="POST">
                    <input type="text" name="email" placeholder="enter email">
                    <input type="password" name="password" placeholder="password">
                    <button type="submit" name="submit">login</button>
		</form>
            </div>
                <%
                     } 
                        else{
                        %>
            <div class="nav-logout">
                         <a style="font-size:14px;padding-right:10px; padding-left:0px;text-align:left;">
                             <% out.println(session.getAttribute("Name")); %>
                         </a>
                        <form action="doLogout" method="POST">
                            <button type="submit" name="logout">logout</button>
                        </form>
            </div>
                        <%
                        }
                %>
        </nav>
        </header>
        <div style="padding-top:20px; width:80%; float:center ; margin:0px auto;" >
            <h1 align="center">students List</h1>
            <%
                try{

			 //loading drivers for mysql
		         Class.forName("com.mysql.jdbc.Driver");
		 	 //creating connection with the database 
		         Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagement","root","");
		        Statement stmt=con.createStatement();
                        ResultSet rs=stmt.executeQuery("select * from student"); %>
                        <table style="width:100%">
                            <tr>
                                <th>Name</th>
                                <th>Email</th> 
                                <th>Reg. No.</th>
                            </tr>                     
                            <%
                                while(rs.next()){
                                %>
                            <tr><td align="center"><% out.println(rs.getString(1)); %></td>
                                <td align="center"><% out.println(rs.getString(2)); %></td> 
                                <td align="center"><% out.println(rs.getString(3)); %></td></tr>
                            <%
                                }
                                }catch(Exception e)
                                    {
                                        e.printStackTrace();
                                        }
                            %>                          
                        </table>
        </div>
        <div style="margin-top:150px;">
		</div>
        
    <footer class ="footer">
	<ul>
            <li>
		<div >
		<div class="footdiv">
                    <h2>CSE Society,SUST</h2>
                    <p>Official mail : *********@gmail.com</p>
                    <p>Official phone number : +088*******<br></p>
                    &copy;  Copyright.
                </div>

		</div>
            </li>
            <li>
		<div class="footdiv">
                    <h2>About</h2>
                    <p>This is an introductory website for cse society.</p>
                </div>
            </li>
            <li>
		<div class="footdiv">
                    <h2>Designed by:</h2>
                    <big>Emon & Shoumik<br></big> 
                </div>
            </li>
        </ul>
    </footer>
    </body>
</html>
