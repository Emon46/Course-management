<%-- 
    Document   : index
    Created on : Mar 18, 2019, 9:37:40 PM
    Author     : H.R. Emon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>CSE,SUST</title>
	<link rel="stylesheet" type="text/css" href="style.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <header>
        <nav>

            <a href="adminindex.jsp"><h1>CSE SUST</h1></a>
		<div class="main-wrapper">
                    <ul>
                        <li><a href="adminAddNewCourse.jsp">Add course </a></li>
			<li><a href="adminteachers.jsp">Teachers</a></li>
			<li><a href="adminstudents.jsp">Students</a></li>
                        
                    </ul>		
                </div>
            <div class="nav-login">
                <% 
                    String username= (String) session.getAttribute("Name");
                    if(username==null){
                    %>
                <form action="adminloginValidateCheck" method="POST">
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
        
        <section class="main-container" >
		<div class="main-wrapper">
			<h2>Add course</h2>
			<form class="signup-form" action="addcourseServlet" method="POST">
				
				<input style=" float: center; height: 40px;  width: 80%; padding: 0px 5%; border: none; background-color: #ccc; line-height: 40px; margin-bottom: 4px;" type="text" name="coursename" placeholder="course name">
				
				<input  style=" float: center; height: 40px;  width: 80%; padding: 0px 5%; border: none; background-color: #ccc; line-height: 40px; margin-bottom: 4px;" type="text" name="coursecode" placeholder="course code">
				
				<input style=" float: center; height: 40px;  width: 80%; padding: 0px 5%; border: none; background-color: #ccc; line-height: 40px; margin-bottom: 4px;" type="text" name="assignedteacher" placeholder="assigned teacher">
				
				<input style=" float: center; height: 40px;  width: 80%; padding: 0px 5%; border: none; background-color: #ccc; line-height: 40px; margin-bottom: 4px;" type="text" name="assignedteacheremail" placeholder="assigned teacher email">

<!--				<b class="profession">Profession : </b></br>
				<input style="float: left; width : 20% ;height : 20px ;padding:5px 0px 0px 0px; margin: 10px 0px 0px 0px;" type ="radio" name ="proffesion" value="teacher"> <p style="text-align: left">Teacher</p>
				<input style="float: left; width : 20% ;height : 20px ;padding:5px 0px 0px 100px; margin: 10px 0px 0px 127px;" type ="radio" name ="proffesion" value="Student"> <p style="text-align: left;margin: 25px 0px 15px 0px;">Student</p>-->
			    </br>
			    
				<button type="submit" name="submit" >submit</button>
			</form>

		</div>
	</section>
        
        <div style="margin-top:350px;">
		</div>
        
        <footer class ="footer">
            <ul>
		<li>
			<div >
				<div class="footdiv"><h2>CSE Society,SUST</h2>
						<p>Official mail : *********@gmail.com</p>
						<p>Official phone number : +088*******<br></p>
			 			&copy;  Copyright.
			 		</div>

			</div>
		</li>
		<li>
			<div class="footdiv"><h2>About</h2>
			<p>This is an introductory website for cse society.</p></div>
		</li>
		<li>
			<div class="footdiv"><h2>Designed by:</h2>
			       <big>Emon & Shoumik<br></big> 
		    </div>
		</li>
            </ul>
        </footer>
        
        
    </body>
</html>
