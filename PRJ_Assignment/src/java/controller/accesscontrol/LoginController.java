/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.accesscontrol;

import dal.UserDBContext;
import entity.accesscontrol.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author sonng
 */
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user = req.getParameter("username");
        String pass = req.getParameter("password");

        UserDBContext db = new UserDBContext();
        User account = db.get(user, pass);

        if (account != null) {
            req.getSession().setAttribute("account", account);

            resp.getWriter().write("success");
        } else {
//            resp.setContentType("text/html");
//            resp.getWriter().println("<script type='text/javascript'>");
//            resp.getWriter().println("alert('Tài khoản không đúng!');");
//            resp.getWriter().println("window.location.href = 'http://localhost:9999/ta.com/login';");  // Redirect to base URL
//            resp.getWriter().println("</script>");
            resp.getWriter().write("fail");
        }

        

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false); // Không tạo mới session nếu không có
        if (session != null && session.getAttribute("account") != null) {
            // Nếu người dùng đã đăng nhập, chuyển hướng về trang home
            resp.sendRedirect("home");
        } else {
            // Nếu chưa đăng nhập, hiển thị trang đăng nhập
            req.getRequestDispatcher("/view/login/login.jsp").forward(req, resp);
        }
    }

}
