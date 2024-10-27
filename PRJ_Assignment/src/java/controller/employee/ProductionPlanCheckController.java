/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.employee;

import controller.accesscontrol.BaseRBACController;
import dal.PlanCampainDBContext;
import dal.PlanDBContext;
import dal.PlanDetailsDBContext;
import entity.Plan;
import entity.PlanCampain;
import entity.PlanDetails;
import entity.accesscontrol.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class ProductionPlanCheckController extends BaseRBACController{

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        PlanDBContext db =new PlanDBContext();
        ArrayList<Plan> planName = db.list();
        req.setAttribute("planName", planName);
        req.getRequestDispatcher("../view/work/checkprocess.jsp").forward(req, resp);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        PlanDBContext planDB = new PlanDBContext();
        ArrayList<Plan> planName = planDB.list();
        req.setAttribute("planName", planName);
        
        // Xử lý tìm kiếm
        String selectedPlanName = req.getParameter("planName");
        PlanDetailsDBContext detailsDB = new PlanDetailsDBContext();
        ArrayList<PlanDetails> details = detailsDB.searchByPlanName(selectedPlanName);
        req.setAttribute("details", details);
        req.setAttribute("selectedPlanName", selectedPlanName); // để hiển thị lại plan đã chọn
        
        req.getRequestDispatcher("../view/work/checkprocess.jsp").forward(req, resp);
    }
    
}