/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.employee;

import controller.accesscontrol.BaseRBACController;
import entity.accesscontrol.Permission;
import entity.accesscontrol.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 *
 * @author admin
 */
public class HomeController extends BaseRBACController{

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        String username = account.getUsername();
        List<Permission> permissions = new ArrayList<>();

        // Kiểm tra vai trò và gán quyền tương ứng
        switch (username) {
            case "admin":
                permissions = Arrays.asList(
                    new Permission("List Plan", "/work/listplan"),
                    new Permission("Create Plan&PlanCampain", "/work/createplan"),
                    new Permission("Create Schedule Campain", "/work/schedulecampain"),
                    new Permission("Check Process", "/work/checkprocess"),
                    new Permission("Create Detail Product For Worker", "/work/detailforworker"),
                    new Permission("Attendance", "/employee/attendance"),
                    new Permission("Calculating Salary Worker", "/employee/salaryworker")
                );
                break;
            case "qd1": case "qd2": 
                permissions = Arrays.asList(
                    new Permission("Create Schedule Campain", "/work/schedulecampain"),
                    new Permission("Create Detail Product For Worker", "/work/detailforworker"),
                    new Permission("Check Process", "/work/checkprocess"),
                    new Permission("List Schedule Campain", "/work/listplan")
                );
                break;
            case "ketoan":
                permissions = Arrays.asList(
                    new Permission("Calculating Salary Worker", "/employee/salaryworker")
                );
                break;
            case "qlk1w1" : case "qlk2w1": case "qlk3w1": case "qlk1w2": case "qlk2w2": case "qlk3w2":
                permissions = Arrays.asList(
                    new Permission("Check Process", "/work/checkprocess"),
                    new Permission("Attendance", "/employee/attendance")
                );
                break;
            case "mrplan":
                permissions = Arrays.asList(
                    new Permission("List Plan", "/work/listplan"),
                    new Permission("Create Plan&PlanCampain", "/work/createplan"),
                    new Permission("Check Process", "/work/checkprocess")
                );
                break;
            default:
                break;
        }

        // Đưa danh sách quyền vào model
        req.setAttribute("permissions", permissions);
        req.getRequestDispatcher("/view/home/homebasic.jsp").forward(req, resp);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
