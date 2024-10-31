/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;

import dal.SchedualCampaignDBContext;
import dal.SchedualCmapainDetailDBContext;
import dal.SchedualEmployeeDBContext;
import entity.Employee;

import entity.SchedualCampaignDetail;
import entity.SchedualEmployee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

public class SchedualEmployeeController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int scId = Integer.parseInt(request.getParameter("scId"));
        int deptId = Integer.parseInt(request.getParameter("deptId"));
        String shift = request.getParameter("shift");

        SchedualCmapainDetailDBContext scDB = new SchedualCmapainDetailDBContext();
        ArrayList<SchedualCampaignDetail> scheduals = scDB.getByDepartment(deptId);
        SchedualCampaignDetail selectedSchedule = null;
        for (SchedualCampaignDetail sc : scheduals) {
            if (sc.getScID() == scId) {
                selectedSchedule = sc;
                break;
            }
        }

        SchedualEmployeeDBContext seDB = new SchedualEmployeeDBContext();
        ArrayList<Employee> employees = seDB.getAvailableEmployees(deptId, shift);
        if (seDB.existsBySchedualEmployeeId(scId)) {
            request.setAttribute("message", "SchedualEmployee has created");
        }
        request.setAttribute("schedule", selectedSchedule);
        request.setAttribute("employees", employees);
        session.setAttribute("insertPageVisited", true);
        request.getRequestDispatcher("../view/work/createschedulemployee.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int scId = Integer.parseInt(request.getParameter("scId"));
        String[] employeeIds = request.getParameterValues("employeeIds");
        String[] quantities = request.getParameterValues("quantities");
        SchedualEmployeeDBContext seDB = new SchedualEmployeeDBContext();
        HttpSession session = request.getSession();
        Boolean insertPageVisited = (Boolean) session.getAttribute("insertPageVisited");
        if (insertPageVisited != null && insertPageVisited) {
            for (int i = 0; i < employeeIds.length; i++) {
                if (quantities[i] != null && !quantities[i].isEmpty()) {
                    SchedualEmployee se = new SchedualEmployee();
                    SchedualCampaignDetail sc = new SchedualCampaignDetail();
                    sc.setScID(scId);
                    se.setSchedualCampaignDetail(sc);

                    Employee emp = new Employee();
                    emp.setId(Integer.parseInt(employeeIds[i]));
                    se.setEmployee(emp);

                    se.setOrderedQuantity(Integer.parseInt(quantities[i]));
                    seDB.insert(se);
                }
            }
            session.setAttribute("insertPageVisited", false);
            response.sendRedirect("listschedulecampaign");
        } else {
            response.sendRedirect("listschedulecampaign");
        }
    }
}
