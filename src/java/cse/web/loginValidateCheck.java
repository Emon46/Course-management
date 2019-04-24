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
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author H.R. Emon
 */
public class loginValidateCheck extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          
        String email =request.getParameter("email");
        String pass =request.getParameter("password");
        boolean studentStatus=false;
        boolean teacherStatus=false;
        boolean adminStatus=false;
        ResultSet teacherDbResult=null;
        ResultSet studentDbResult=null;
        ResultSet adminDbResult=null;
        PrintWriter out=response.getWriter();
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
        //creating connection with the database 
        Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagement","root","");
        PreparedStatement studentdb=con.prepareStatement("select * from student where email=? and password=?");  
        studentdb.setString(1,email);  
        studentdb.setString(2,GFG.getSHA(pass));  
        studentDbResult=studentdb.executeQuery();  
        studentStatus=studentDbResult.next();
        
        PreparedStatement teacherdb=con.prepareStatement("select * from teacher where email=? and password=?");  
        teacherdb.setString(1,email);  
        teacherdb.setString(2,GFG.getSHA(pass));  
         teacherDbResult=teacherdb.executeQuery(); 
        teacherStatus=teacherDbResult.next(); 
        
        PreparedStatement admindb=con.prepareStatement("select * from admin where email=? and password=?");  
        admindb.setString(1,email);  
        admindb.setString(2,GFG.getSHA(pass));  
        adminDbResult=admindb.executeQuery(); 
        adminStatus=adminDbResult.next(); 
        
        
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(loginValidateCheck.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(loginValidateCheck.class.getName()).log(Level.SEVERE, null, ex);
        } 
        if(studentStatus==true){ 
            HttpSession session=request.getSession();
            try {
                session.setAttribute("Login", "true");
                session.setAttribute("LoginTypeAs", "student");
                session.setAttribute("Name", studentDbResult.getString(1));
                session.setAttribute("Email", studentDbResult.getString(2));
                session.setAttribute("RegNo", studentDbResult.getString(3));
                //request.getSession().invalidate();//for logout
                response.sendRedirect("studentIndex.jsp");
            } catch (SQLException ex) {
                Logger.getLogger(loginValidateCheck.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else if(teacherStatus==true){
            HttpSession session=request.getSession();
            try {
                session.setAttribute("Login", "true");
                session.setAttribute("LoginTypeAs", "teacher");
                session.setAttribute("Name", teacherDbResult.getString(1));
                session.setAttribute("Email", teacherDbResult.getString(2));
                
                response.sendRedirect("index.jsp");
            } catch (SQLException ex) {
                Logger.getLogger(loginValidateCheck.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else if(adminStatus==true){
            HttpSession session=request.getSession();
            try {
                session.setAttribute("Login", "true");
                session.setAttribute("LoginTypeAs", "admin");
                session.setAttribute("Name", adminDbResult.getString(1));
                session.setAttribute("Email", adminDbResult.getString(2));
                
                response.sendRedirect("adminindex.jsp");
            } catch (SQLException ex) {
                Logger.getLogger(loginValidateCheck.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else{
            out.println( "none");
        }
    }

}
