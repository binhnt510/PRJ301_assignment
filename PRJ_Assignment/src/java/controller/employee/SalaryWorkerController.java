/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;
import dal.SalaryWorkerDBContext;
import entity.AttendanceReport;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class SalaryWorkerController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SalaryWorkerDBContext db = new SalaryWorkerDBContext();
        String date = req.getParameter("monthyear");
        ArrayList<AttendanceReport> reports = db.list1(date);
        
        // Add the selected date and number of days to request attributes
        req.setAttribute("selectedDate", date);
        req.setAttribute("daysInMonth", AttendanceReport.getDaysInMonth(date));
        req.setAttribute("reports", reports);
        
        req.getRequestDispatcher("/view/employee/salaryinsert.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/employee/salaryinsert.jsp").forward(req, resp);
    }
}
