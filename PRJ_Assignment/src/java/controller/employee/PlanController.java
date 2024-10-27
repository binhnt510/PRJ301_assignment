package controller.employee;

import controller.accesscontrol.BaseRBACController;
import dal.PlanDetailsDBContext;
import dal.SchedualCampaignDBContext;
import entity.PlanDetails;
import entity.SchedualCampaign;
import entity.accesscontrol.User;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class PlanController extends BaseRBACController {
    
    @Override
    protected void doAuthorizedGet(HttpServletRequest request, HttpServletResponse response, User account)
    throws ServletException, IOException {
        PlanDetailsDBContext db = new PlanDetailsDBContext();
        ArrayList<PlanDetails> plans = db.list();
        request.setAttribute("plans", plans);
        request.getRequestDispatcher("../view/work/listplan.jsp").forward(request, response);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        super.doPost(req, resp); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/OverriddenMethodBody
    }
    
}