<%-- 
    Document   : index
    Created on : Mar 18, 2019, 9:37:40 PM
    Author     : H.R. Emon
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="cse.web.CourseDetailsData"%>
<%@page import="java.util.ArrayList"%>
<%
    String loggedin=(String) session.getAttribute("LoginTypeAs");
    if(loggedin=="admin"){
        response.sendRedirect("adminindex.jsp"); 
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
                    <ul>
                        <li><a href="studentIndex.jsp">Courses </a></li>
			<li><a href="studentTeachers.jsp">Teachers</a></li>
			<li><a href="studentStudents.jsp">Students</a></li>
                        
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
        
                <%
                    ArrayList<CourseDetailsData> allCourseList= new ArrayList<CourseDetailsData>();
                    ArrayList<CourseDetailsData> registeredCourseList= new ArrayList<CourseDetailsData>();
                    
                    ArrayList<CourseDetailsData> notRegisteredCourse= new ArrayList<CourseDetailsData>();
                     
		        Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagement","root","");
		        Statement stmt=con.createStatement();
                        
                        PreparedStatement coursedb=con.prepareStatement("select * from courselist");                            
                        ResultSet courseDbResult = null;
                        courseDbResult=coursedb.executeQuery();
                        while(courseDbResult.next()){
                            String tempCourseCode=courseDbResult.getString(1);
                            String tempCourseName=courseDbResult.getString(2);
                            String tempTeacher=courseDbResult.getString(3);
                            String tempAssignTeacherEmail=courseDbResult.getString(4);
                            
                            CourseDetailsData temp=new CourseDetailsData(tempCourseCode,tempCourseName,tempTeacher,tempAssignTeacherEmail);
                            allCourseList.add( temp );
                            //out.println(temp.getcourseCode());
                        }
                        
                        PreparedStatement registeredCoursedb=con.prepareStatement("SELECT * FROM management WHERE student_reg="+(String) session.getAttribute("RegNo"));                            
                        ResultSet registeredcourseDbResult = null;
                        registeredcourseDbResult=registeredCoursedb.executeQuery();
                        
                        while(registeredcourseDbResult.next()){
                            String tempCourseName=registeredcourseDbResult.getString(2);
                            String tempCourseCode=registeredcourseDbResult.getString(3);
                            String tempTeacher=registeredcourseDbResult.getString(6);
                            String tempAssignTeacherEmail=registeredcourseDbResult.getString(7);
                            
                            CourseDetailsData temp=new CourseDetailsData(tempCourseName,tempCourseCode,tempTeacher,tempAssignTeacherEmail);
                            registeredCourseList.add( temp );
                        }
                        
                        
                                for( CourseDetailsData allCoursetemp : allCourseList ){
                                    boolean finded=false;
                                    for ( CourseDetailsData regCourse : registeredCourseList ){ 
                                        
                                        if(allCoursetemp.getcourseCode().equals(regCourse.getcourseCode()) ){
                                            finded=true;
                                            }
                                     
                                    }
                                    if(finded==false){
                                        notRegisteredCourse.add(allCoursetemp);
                                    }
                                }
                            
                    
                %>
                
        <div style="padding-top:20px; width:80%; float:center ; margin:0px auto;" >
            <h1 align="center">Registered courses List</h1>
        
                        <table style="width:100%">
                            <tr>
                                <th>Course Name</th>
                                <th>Course code</th>
                                <th>Course Teacher</th>
                                <th>Course Teacher's Mail</th>
                            </tr>                     
                            <%
                                 for (CourseDetailsData temp : registeredCourseList) { 
                                %>
                            <tr><td align="center"><% out.println(temp.getcourseName()); %></td>
                                <td align="center"><% out.println(temp.getcourseCode()); %></td>
                                <td align="center"><% out.println(temp.getassignedTeacher()); %></td>
                                <td align="center"><% out.println(temp.getassignedTeacherMail()); %></td>
                                
                                
                            </tr>
                            <%
                                }
                            %>                          
                        </table>
        </div>
        <div style="padding-top:20px; width:80%; float:center ; margin:0px auto;" >
            <h1 align="center">UnRegistered courses List</h1>
        
                        <table style="width:100%">
                            <tr>
                                <th>Course Name</th>
                                <th>Course code</th>
                                <th>Course Teacher</th>
                                <th>Course Teacher's Mail</th>
                            </tr>                     
                            <%
                                 for (CourseDetailsData temp : notRegisteredCourse) { 
                                %>
                            <tr><td align="center"><% out.println(temp.getcourseName()); %></td>
                                <td align="center"><% out.println(temp.getcourseCode()); %></td>
                                <td align="center"><% out.println(temp.getassignedTeacher()); %></td>
                                <td align="center"><% out.println(temp.getassignedTeacherMail()); %></td>
                                 <td align="center">
                                    
                                    <form action="takecoursecheck" method="GET">
                                        <input type="hidden" id="courseName" name="courseCode" value=<% out.println(temp.getcourseCode()); %> >
                                        <input type="submit" value="take course">
                                    </form>
                                </td>
                                
                                
                            </tr>
                            <%
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
