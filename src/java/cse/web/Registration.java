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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author H.R. Emon
 */
public class Registration extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email =request.getParameter("email");
        String pass =request.getParameter("password");
        String name =request.getParameter("username");
        String regno =request.getParameter("regno");
        
        String profession =request.getParameter("proffesion");
        pass=GFG.getSHA(pass);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            //creating connection with the database 
            Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/coursemanagement","root","");
            
        if(profession.equals("teacher")){
            String queryForManagement = "INSERT INTO teacher(name, email, password)"
                                + " VALUES (?,?,?);";

                         // create the mysql insert preparedstatement
                        PreparedStatement preparedStmtForManagement = con.prepareStatement(queryForManagement);
                        preparedStmtForManagement.setString (1, name);
                        preparedStmtForManagement.setString(2, email);
                        preparedStmtForManagement.setString (3, pass);

                        // execute the preparedstatement
                        preparedStmtForManagement.execute();
            
        }else if( profession.equals("Student")){
            String queryForManagement = "INSERT INTO student(name, email, reg, password)"
                                + " VALUES (?,?,?,?);";

                         // create the mysql insert preparedstatement
                        PreparedStatement preparedStmtForManagement = con.prepareStatement(queryForManagement);
                        preparedStmtForManagement.setString (1, name);
                        preparedStmtForManagement.setString(2, email);
                        preparedStmtForManagement.setString (3, regno);
                        preparedStmtForManagement.setString (4, pass);

                        // execute the preparedstatement
                        preparedStmtForManagement.execute();
        }
        
                response.sendRedirect("afterRegistration.jsp");
        
        } catch (Exception ex) {
            
        }
    }

   
}
