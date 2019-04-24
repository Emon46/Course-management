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
public class viewcourseServlet extends HttpServlet {

   
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
         
        HttpSession session=request.getSession();
        if(session.getAttribute("LoginTypeAs")=="admin"){
            
        String courseName =request.getParameter("coursename");
        String courseCode =request.getParameter("courseCode");
        String assignedTeacher=request.getParameter("assignedteacher");
        String assignedTeacherMail=request.getParameter("assignedteachermail");
        
        PrintWriter out=response.getWriter();
        out.println(courseCode );
        request.setAttribute("courseCode", courseCode);
        request.getRequestDispatcher("adminviewcourseinfo.jsp").forward(request, response);
        }
        else if(session.getAttribute("LoginTypeAs")=="teacher"){
        String courseName =request.getParameter("coursename");
        String courseCode =request.getParameter("courseCode");
        String assignedTeacher=request.getParameter("assignedteacher");
        String assignedTeacherMail=request.getParameter("assignedteachermail");
        
        PrintWriter out=response.getWriter();
        out.println(courseCode );
        request.setAttribute("courseCode", courseCode);
        request.getRequestDispatcher("teacherviewcourseinfo.jsp").forward(request, response);
        }
    }

    

}
