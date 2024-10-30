/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.employee;

import dal.SalaryWorkerDBContext;
import entity.SalaryDetail;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class SalaryListController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("../view/employee/salarylist.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String monthYear = req.getParameter("monthYear");
        
        if(monthYear != null && !monthYear.trim().isEmpty()) {
            SalaryWorkerDBContext salaryDB = new SalaryWorkerDBContext();
            ArrayList<SalaryDetail> salaryList = salaryDB.listdetail(monthYear);
            req.setAttribute("salaryList", salaryList);
            req.setAttribute("selectedMonth", monthYear);
        }
        
        req.getRequestDispatcher("../view/employee/salarylist.jsp").forward(req, resp);
    }
}