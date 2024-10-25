/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;

import controller.accesscontrol.BaseRBACController;
import dal.AttendanceDBContext;
import dal.DepartmentDBContext;
import entity.AttendanceDetail;
import entity.AttendenceWorker;
import entity.Department;
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
        DepartmentDBContext dbDepts = new DepartmentDBContext();

        req.setAttribute("account", account);
        ArrayList<Department> depts = dbDepts.get("WS");
        req.setAttribute("depts", depts);

        req.getRequestDispatcher("../view/employee/attendance_select.jsp").forward(req, resp);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        String action = req.getParameter("action");
        String search = req.getParameter("search1");
        String check = req.getParameter("check");
        req.setAttribute("account", account);
        DepartmentDBContext dbDepts = new DepartmentDBContext();
        ArrayList<Department> depts = dbDepts.get("WS");
        req.setAttribute("depts", depts);
        AttendanceDBContext db = new AttendanceDBContext();
        if ("search".equals(action) && "Search for inserting the attendance of workers".equals(search)) {
            // Handle form 1 submission - search
            Date date = Date.valueOf(req.getParameter("date"));
            int departmentId = Integer.parseInt(req.getParameter("departmentId"));

            String depname = "";
            for (Department department : depts) {
                if (departmentId == department.getId()) {
                    depname = department.getName();
                    break;
                }
            }
            req.setAttribute("depname", depname);

            String shift = req.getParameter("shift");

            ArrayList<AttendanceDetail> details = db.getAttendanceDetails(date, departmentId, shift);
            int count=0;
            for (AttendanceDetail detail : details) {
                if (detail.getCreateBy()!= null) {
                    count++;
                }
                
            }
            if (count!=0) {
                req.getRequestDispatcher("../view/employee/attendance_report_exist.jsp").forward(req, resp);
            } else {
                req.setAttribute("details", details);
                req.setAttribute("searchDate", date);
                req.setAttribute("searchDepartment", departmentId);
                req.setAttribute("searchShift", shift);
                req.getRequestDispatcher("../view/employee/attendacene_insert.jsp").forward(req, resp);
            }

        } else if ("save".equals(action)) {
            // Handle form 2 submission - save attendance

            String[] actualQuantities = req.getParameterValues("actualQuantity");
            String[] alphas = req.getParameterValues("alpha");
            String[] notes = req.getParameterValues("note");
            String[] schEmpIds = req.getParameterValues("schEmpId");

            int rowCount = Integer.parseInt(req.getParameter("rowCount"));
            for (int i = 0; i < rowCount; i++) {
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
            req.getRequestDispatcher("../view/employee/attendance_select.jsp").forward(req, resp);
        } else if ("search".equals(action) && "Check the saved attendance of workers".equals(check)) {
            // Handle form 1 submission - search
            Date date = Date.valueOf(req.getParameter("date"));
            int departmentId = Integer.parseInt(req.getParameter("departmentId"));
            String shift = req.getParameter("shift");

            String depname = "";
            for (Department department : depts) {
                if (departmentId == department.getId()) {
                    depname = department.getName();
                    break;
                }
            }
            req.setAttribute("depname", depname);

            ArrayList<AttendanceDetail> details = db.getAttendanceDetails(date, departmentId, shift);

            req.setAttribute("details", details);
            req.setAttribute("searchDate", date);
            req.setAttribute("searchDepartment", departmentId);
            req.setAttribute("searchShift", shift);
            req.getRequestDispatcher("../view/employee/attendance_select.jsp").forward(req, resp);
        }

    }
}
