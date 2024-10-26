/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.employee;

import controller.accesscontrol.BaseRBACController;
import dal.PlanDBContext;
import dal.PlanDetailsDBContext;
import entity.Plan;
import entity.PlanDetails;
import entity.accesscontrol.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class ListPlanController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PlanDBContext db =new PlanDBContext();
        ArrayList<Plan> planName = db.list();
        req.setAttribute("planName", planName);
        req.getRequestDispatcher("/view/employee/searchplan.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PlanDBContext planDB = new PlanDBContext();
        ArrayList<Plan> planName = planDB.list();
        req.setAttribute("planName", planName);
        
        // Xử lý tìm kiếm
        String selectedPlanName = req.getParameter("planName");
        PlanDetailsDBContext detailsDB = new PlanDetailsDBContext();
        ArrayList<PlanDetails> details = detailsDB.searchByPlanName(selectedPlanName);
        req.setAttribute("details", details);
        req.setAttribute("selectedPlanName", selectedPlanName); // để hiển thị lại plan đã chọn
        
        req.getRequestDispatcher("/view/employee/searchplan.jsp").forward(req, resp);
    }
}
