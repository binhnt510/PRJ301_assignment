/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.employee;

import dal.DepartmentDBContext;
import dal.SchedualCmapainDetailDBContext;
import entity.Department;
import entity.SchedualCampaignDetail;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;


public class SchedualCampaignController extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
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
}