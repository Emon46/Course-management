<%-- 
    Document   : index
    Created on : Mar 18, 2019, 9:37:40 PM
    Author     : H.R. Emon
--%>

<%
    String loggedin=(String) session.getAttribute("LoginTypeAs");
    if(loggedin=="admin"){
        response.sendRedirect("adminindex.jsp");
        
    }
    else if(loggedin=="student"){
        response.sendRedirect("studentIndex.jsp"); 
    }
    else if(loggedin=="teacher"){
        response.sendRedirect("teacherIndex.jsp"); 
    }
        
    %>
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

            <h1>CSE SUST</h1>
		<div class="main-wrapper">
                    		
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
        
        <section class="main-container" >
		<div class="main-wrapper">
			<h2>please login with your username and password.</h2>
			

		</div>
	</section>
        <div style="margin-top:500px;">
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
