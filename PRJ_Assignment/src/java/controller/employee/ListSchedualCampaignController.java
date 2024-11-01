/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.employee;

import controller.accesscontrol.BaseRBACController;
import dal.DepartmentDBContext;
import dal.SchedualCmapainDetailDBContext;
import entity.Department;
import entity.SchedualCampaignDetail;
import entity.accesscontrol.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;


public class ListSchedualCampaignController extends BaseRBACController {
    
    @Override
    protected void doAuthorizedGet(HttpServletRequest request, HttpServletResponse response, User account)
            throws ServletException, IOException {
        DepartmentDBContext deptDB = new DepartmentDBContext();
        ArrayList<Department> depts = deptDB.get("WS");
        request.setAttribute("depts", depts);
        
        String deptId = request.getParameter("deptId");
        if(deptId != null && !deptId.isEmpty()) {
            SchedualCmapainDetailDBContext scDB = new SchedualCmapainDetailDBContext();
            ArrayList<SchedualCampaignDetail> scheduals = scDB.getByDepartment(Integer.parseInt(deptId));
            request.setAttribute("scheduals", scheduals);
            request.setAttribute("deptId", deptId);
        }
        
        request.getRequestDispatcher("../view/work/listschedual.jsp").forward(request, response);
    }
    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}