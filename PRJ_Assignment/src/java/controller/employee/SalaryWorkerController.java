/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;
import controller.accesscontrol.BaseRBACController;
import dal.AttendanceReportDBContext;
import dal.SalaryWorkerDBContext;
import entity.AttendanceReport;
import entity.Employee;
import entity.SalaryDetail;
import entity.accesscontrol.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class SalaryWorkerController extends BaseRBACController {
    
    private double calculateSalary(AttendanceReport report, int daysInMonth) {
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
        
        AttendanceReportDBContext db = new AttendanceReportDBContext();
        ArrayList<AttendanceReport> reports = db.list1(date);
        int daysInMonth = AttendanceReport.getDaysInMonth(date);
        SalaryWorkerDBContext salaryDB = new SalaryWorkerDBContext();
        if ("calculate".equals(action)) {
            // Calculate salaries
            for (AttendanceReport report : reports) {
                double calculatedSalary = calculateSalary(report, daysInMonth);
                report.setCalculatedSalary(calculatedSalary);
            }
        } else if ("save".equals(action)) {
            // Save salaries to database
            
            
            for (AttendanceReport report : reports) {
                double calculatedSalary = calculateSalary(report, daysInMonth);
                
                SalaryDetail salary = new SalaryDetail();
                Employee emp = new Employee();
                emp.setId(report.getEmployeeId());
                
                salary.setEmp(emp);
                salary.setMonthyear(date);
                salary.setSalary(calculatedSalary);
                salary.setFine(0.0);
                salary.setNote(null);
                
                salaryDB.insert(salary);
            }
            
            resp.sendRedirect(req.getRequestURI() + "?monthyear=" + date);
            return;
        }
        if (salaryDB.existsBySalaryWorkerDate(date)) {
            req.setAttribute("message", "Salaryworker has added for "+date);
        }
        req.setAttribute("selectedDate", date);
        req.setAttribute("daysInMonth", daysInMonth);
        req.setAttribute("reports", reports);
        
        req.getRequestDispatcher("/view/employee/salaryinsert.jsp").forward(req, resp);
    }

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        req.getRequestDispatcher("/view/employee/salaryinsert.jsp").forward(req, resp);
    }
}



