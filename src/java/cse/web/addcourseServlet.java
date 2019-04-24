/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cse.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author H.R. Emon
 */
public class addcourseServlet extends HttpServlet {

    

  

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String courseName =request.getParameter("coursename");
        String courseCode =request.getParameter("coursecode");
        String assignedTeacher=request.getParameter("assignedteacher");
        String assignedTeacherMail=request.getParameter("assignedteacheremail");
        String tableName=courseCode;
        PrintWriter out=response.getWriter();
            
            try{

			 //loading drivers for mysql
		         Class.forName("com.mysql.jdbc.Driver");
		 	 //creating connection with the database 
		         Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagement","root","");
		        Statement stmt=con.createStatement();
                        String query = "insert into courselist (course_name, course_code,assign_teacher_name,assign_teacher_mail)"
                                   + " values (?,?,?,?)";

      // create the mysql insert preparedstatement
                        PreparedStatement preparedStmtCourselist = con.prepareStatement(query);
                        preparedStmtCourselist.setString (1, courseName);
                        preparedStmtCourselist.setString(2,courseCode );
                        preparedStmtCourselist.setString(3,assignedTeacher );
                        
                        preparedStmtCourselist.setString(4,assignedTeacherMail );
            // execute the preparedstatement
                        preparedStmtCourselist.execute();      
                        // out.println("szxchjh"+courseName+" "+courseCode+" "+assignedTeacher+" "+assignedTeacherMail);
                        
                        String queryforCourse = "CREATE TABLE "+tableName+ "(student_name VARCHAR(50) NOT NULL ,student_reg VARCHAR(30) NOT NULL PRIMARY KEY)";

      // create the mysql insert preparedstatement
                        Statement statement = con.createStatement();
            // execute the preparedstatement
                        statement.executeUpdate(queryforCourse);
                        response.sendRedirect("adminindex.jsp");
                        
                        
            }
            catch(Exception e){
                 out.println("szxchjh "+courseName+" "+courseCode+" "+assignedTeacher+" "+assignedTeacherMail);
            }
    }

    
}
