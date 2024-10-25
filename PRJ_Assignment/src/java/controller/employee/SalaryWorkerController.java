/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;


import dal.SalaryWorkerDBContext;
import entity.AttendanceReport;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class SalaryWorkerController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SalaryWorkerDBContext db = new SalaryWorkerDBContext();
        String date =req.getParameter("monthyear");
        ArrayList<AttendanceReport> reports = db.list1(date);
        req.setAttribute("reports", reports);
        req.getRequestDispatcher("/view/employee/listsalary.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        
        
        req.getRequestDispatcher("/view/employee/salaryinsert.jsp").forward(req, resp);
    }

}
