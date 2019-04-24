<%-- 
    Document   : takecourse
    Created on : Mar 19, 2019, 12:50:11 AM
    Author     : H.R. Emon
--%>

<%@page import="java.sql.PreparedStatement"%>
<%-- 
    Document   : courses
    Created on : Mar 18, 2019, 4:42:35 PM
    Author     : H.R. Emon
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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
        <title>courses</title>
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
        <div style="padding-top:20px; width:80%; float:center ; margin:0px auto;" >
            
        <%
            
            try{

			 //loading drivers for mysql
		         Class.forName("com.mysql.jdbc.Driver");
		 	 //creating connection with the database 
		         Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagement","root","");
		        
                        String courseCode=(String) (String)request.getAttribute("courseCode");
                        
                        
                        //out.println(tableName);
                        String query = "insert into "+ courseCode + "(student_name, student_reg)"
                                   + " values (?,?)";

                         // create the mysql insert preparedstatement
                         Statement stmt=con.createStatement();
                        PreparedStatement preparedStmt = con.prepareStatement(query);
                        preparedStmt.setString (1, (String) session.getAttribute("Name"));
                        preparedStmt.setString(2, (String) session.getAttribute("RegNo"));
                        // execute the preparedstatement
                        preparedStmt.execute();
                        
                        Statement coursedb=con.createStatement();
                        
                        //coursedb.setString(1,courseCode);  
                        ResultSet courseDbResult=null;
                        courseDbResult=coursedb.executeQuery("select * from courselist");
                        
                        //out.println(" szdsdsdf " + courseDbResult.next());
                        String courseName=null;
                        String courseTeacher=null;
                        String courseTeacherMail= null;
                        while(courseDbResult.next()){
                            if(courseCode.equals(courseDbResult.getString(2))){
                                
                            courseName=courseDbResult.getString(1);
                            //out.println(" szdf sd "); 
                            courseCode=courseDbResult.getString(2);
                            courseTeacher=courseDbResult.getString(3);
                            courseTeacherMail=courseDbResult.getString(4);
                            }
                        }
             
                        
                        
                        //out.println(" "+courseName+" "+courseCode+" "+courseTeacher+" "+courseTeacherMail);
                        String queryForManagement = "INSERT INTO management(course_name, course_code, student_name,"
                                + "student_reg,assign_teacher,assign_teacher_mail) VALUES (?,?,?,?,?,?);";

                         // create the mysql insert preparedstatement
                        PreparedStatement preparedStmtForManagement = con.prepareStatement(queryForManagement);
                        preparedStmtForManagement.setString (1, courseName);
                        preparedStmtForManagement.setString(2, courseCode);
                        preparedStmtForManagement.setString (3, (String) session.getAttribute("Name"));
                        preparedStmtForManagement.setString(4, (String) session.getAttribute("RegNo"));
                        preparedStmtForManagement.setString (5, courseTeacher);
                        preparedStmtForManagement.setString(6, courseTeacherMail);

                        // execute the preparedstatement
                        preparedStmtForManagement.execute();
      
                        ResultSet rs=stmt.executeQuery("select * from "+courseCode);%>
                        <h1 align="center"><% out.println("Course Name :" + courseName); %></h1>
                        
                        <table style="width:100%">
                            <tr>
                                <th>Student Name</th>
                                <th>Student Reg</th>
                            </tr>                     
                            <%
                                while(rs.next()){
                                %>
                            <tr>
                                <td align="center"><% out.println(rs.getString(1)); %></td>
                                <td align="center"><% out.println(rs.getString(2)); %></td>
                                
                          
                            </tr>
                            <%
                                }
                                }catch(Exception e)
                                    {
                                        out.println(e);
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
