/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cse.web;

/**
 *
 * @author H.R. Emon
 */
public class CourseDetailsData {
    private String courseName;
    private String courseCode;
    private String assignedTeacher;
    private String assignedTeacherMail;
    public CourseDetailsData(String courseName,String courseCode,String assignedTeacher,String assignedTeacherMail){
        this.courseName=courseName;
        this.courseCode=courseCode;
        this.assignedTeacher=assignedTeacher;
        this.assignedTeacherMail=assignedTeacherMail;
        
    }
    public String getcourseName(){
        return courseName;
    }
    public String getcourseCode(){
        return courseCode;
    }
    public String getassignedTeacher(){
        return assignedTeacher;
    }
    public String getassignedTeacherMail(){
        return assignedTeacherMail;
    }
    
    
}
