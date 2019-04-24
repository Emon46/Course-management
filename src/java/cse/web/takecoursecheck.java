/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cse.web;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author H.R. Emon
 */
public class takecoursecheck extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         String courseCode =request.getParameter("courseCode");
         PrintWriter out=response.getWriter();
         
         
            //HttpSession session=request.getSession();
            try {
                
                request.setAttribute("courseCode", courseCode);
                request.getRequestDispatcher("studentTakecourse.jsp").forward(request, response);
            } catch (Exception ex) {
                out.println(ex);
            }
        
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
    }

   
}
