/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.employee;

import controller.accesscontrol.BaseRBACController;
import dal.SalaryWorkerDBContext;
import entity.SalaryDetail;
import entity.accesscontrol.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class SalaryListController extends BaseRBACController {
    
    @Override
    protected void doAuthorizedGet(HttpServletRequest request, HttpServletResponse response, User account)
            throws ServletException, IOException {
        request.getRequestDispatcher("../view/employee/salarylist.jsp").forward(request, response);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account)
            throws ServletException, IOException {
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