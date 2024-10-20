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
            case "mra":
                permissions = Arrays.asList(
                    new Permission("Quyền 1", "/employee/create"),
                    new Permission("Quyền 2", "/employee/update"),
                    new Permission("Quyền 3", "/employee/delete"),
                    new Permission("Quyền 4", "/employee/list"),
                    new Permission("Quyền 5", "/employee/search")
                );
                break;
            case "mrb": case "mrd":
                permissions = Arrays.asList(
                    new Permission("Quyền 1", "/employee/create"),
                    new Permission("Quyền 2", "/employee/list")
                );
                break;
            case "mrc":
                permissions = Arrays.asList(
                    new Permission("Quyền 1", "/employee/create")
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
