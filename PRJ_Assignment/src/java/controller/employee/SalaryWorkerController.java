/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;

import controller.accesscontrol.BaseRBACController;
import dal.AttendanceReportForSalaryDBContext;
import entity.AttendanceReportWorker;
import entity.Employee;
import entity.SalaryDetail;
import entity.accesscontrol.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

public class SalaryWorkerController extends BaseRBACController {

    private double calculateSalary(AttendanceReportWorker report, int daysInMonth) {
        int totalDays = 0;
        for (int i = 1; i <= daysInMonth; i++) {
            String status = report.getStatus(i);
            if (status != null && !status.trim().isEmpty() && !status.equals("null")) {
                totalDays++;
            }
        }
        return report.getSalary() * 8 * totalDays;
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        String date = req.getParameter("monthyear");
        String action = req.getParameter("action");

        AttendanceReportForSalaryDBContext db = new AttendanceReportForSalaryDBContext();
        ArrayList<AttendanceReportWorker> reports = db.list1(date);
        int daysInMonth = AttendanceReportWorker.getDaysInMonth(date);
        
        if ("calculate".equals(action)) {
            // Calculate salaries
            for (AttendanceReportWorker report : reports) {
                double calculatedSalary = calculateSalary(report, daysInMonth);
                report.setCalculatedSalary(calculatedSalary);
            }
        }
        req.setAttribute("selectedDate", date);
        req.setAttribute("daysInMonth", daysInMonth);
        req.setAttribute("reports", reports);
        req.setAttribute("action", action);
        req.getRequestDispatcher("/view/employee/salarylist.jsp").forward(req, resp);
    }

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp,
            User account) throws ServletException, IOException {
        HttpSession session = req.getSession();
        session.setAttribute("insertPageVisited", true);
        req.getRequestDispatcher("/view/employee/salarylist.jsp").forward(req, resp);
    }
}
