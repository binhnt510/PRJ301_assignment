/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;

import controller.accesscontrol.BaseRBACController;
import dal.AttendanceDBContext;
import entity.AttendanceDetail;
import entity.AttendenceWorker;
import entity.accesscontrol.User;
import java.io.IOException;
import java.sql.Date;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.ArrayList;

public class AttendanceController extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        req.getRequestDispatcher("../view/employee/attendance.jsp").forward(req, resp);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("search".equals(action)) {
            // Handle form 1 submission - search
            Date date = Date.valueOf(req.getParameter("date"));
            int departmentId = Integer.parseInt(req.getParameter("departmentId"));
            String shift = req.getParameter("shift");

            AttendanceDBContext db = new AttendanceDBContext();
            ArrayList<AttendanceDetail> details = db.getAttendanceDetails(date, departmentId, shift);

            req.setAttribute("details", details);
            req.setAttribute("searchDate", date);
            req.setAttribute("searchDepartment", departmentId);
            req.setAttribute("searchShift", shift);

        } else if ("save".equals(action)) {
            // Handle form 2 submission - save attendance

            String[] actualQuantities = req.getParameterValues("actualQuantity");
            String[] alphas = req.getParameterValues("alpha");
            String[] notes = req.getParameterValues("note");
            String[] schEmpIds = req.getParameterValues("schEmpId");

            AttendanceDBContext db = new AttendanceDBContext();
            int rowCount = Integer.parseInt(req.getParameter("rowCount"));
            for (int i = 0; i < rowCount; i++) {
                resp.setContentType("text/html");
            resp.getWriter().println("<script type='text/javascript'>");
            resp.getWriter().println("console.log(\"Row \" + i + \":\");");
            
            resp.getWriter().println("console.log(\"Actual Quantity: \" + actualQuantities[i]);");
            resp.getWriter().println("console.log(\"Alpha: \" + alphas[i]);");
            resp.getWriter().println("console.log(\"Note: \" + notes[i]);");
            resp.getWriter().println("</script>");
                if (actualQuantities[i] != null && !actualQuantities[i].isEmpty()) {
                    AttendenceWorker attendance = new AttendenceWorker();
                    attendance.setSchEmpId(Integer.parseInt(schEmpIds[i]));
                    attendance.setActualQuantity(Integer.parseInt(actualQuantities[i]));
                    attendance.setAlpha(Double.parseDouble(alphas[i]));
                    attendance.setNote(notes[i]);
                    attendance.setCreateBy(account.getUsername());

                    db.insertAttendance(attendance);
                }
            }
        }

        req.getRequestDispatcher("../view/employee/attendance.jsp").forward(req, resp);
    }
}
