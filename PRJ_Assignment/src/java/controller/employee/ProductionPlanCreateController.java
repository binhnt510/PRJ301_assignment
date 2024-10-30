/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.employee;

import controller.accesscontrol.BaseRBACController;
import dal.DepartmentDBContext;
import dal.PlanDBContext;
import dal.ProductDBContext;
import entity.Department;
import entity.Plan;
import entity.PlanCampain;
import entity.Product;
import entity.accesscontrol.User;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;

/**
 *
 * @author sonnt-local hand-some
 */
public class ProductionPlanCreateController extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        ProductDBContext dbProduct = new ProductDBContext();
        DepartmentDBContext dbDepts = new DepartmentDBContext();
        
        req.setAttribute("products", dbProduct.list());
        req.getSession().setAttribute("products", dbProduct.list());
        req.setAttribute("depts", dbDepts.get("WS"));
        
        req.getRequestDispatcher("../view/work/createplan.jsp").forward(req, resp);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User account) throws ServletException, IOException {
        Plan plan = new Plan();
        plan.setName(req.getParameter("name"));
        plan.setStart(Date.valueOf(req.getParameter("from")));
        plan.setEnd(Date.valueOf(req.getParameter("to")));
        Department d = new Department();
        d.setId(Integer.parseInt(req.getParameter("did")));
        plan.setDept(d);
        
        String[] pids = req.getParameterValues("pid");
        for (String pid : pids) {
            PlanCampain c = new PlanCampain();
            
            Product p = new Product();
            p.setId(Integer.parseInt(pid));
            c.setProduct(p);
            c.setPlan(plan);
            
            String raw_quantity = req.getParameter("quantity"+pid);
            String raw_cost = req.getParameter("cost"+pid);
            
            c.setQuantity(raw_quantity!=null&&raw_quantity.length()>0?Integer.parseInt(raw_quantity):0);
            c.setEstimate(raw_cost != null && !raw_cost.equals("0") && raw_cost.length() > 0 ? Integer.parseInt(raw_cost) : 0);
            
            if(c.getQuantity()>0 && c.getEstimate()>0)
                plan.getCampains().add(c);
        }
        resp.setContentType("text/html;charset=UTF-8");
        if(plan.getCampains().size()>0)
        {
            //insert
            PlanDBContext db = new PlanDBContext();
            db.insert(plan);
            resp.getWriter().println("<!DOCTYPE html>");
            resp.getWriter().println("<html>");
            resp.getWriter().println("<head>");
            resp.getWriter().println("<title>Servlet NewServlet</title>");  
            resp.getWriter().println("</head>");
            resp.getWriter().println("<body>");
            resp.getWriter().println("<h2 style=\"color: red\">Your plan has been added!</h2>");
            resp.getWriter().println("<a href=\"createplan\"><button type=\"button\" style=\"font-size: 20px\">Back</button></a>");
            resp.getWriter().println("</body>");
            resp.getWriter().println("</html>");
        }
        else
        {
           
            resp.getWriter().println("<!DOCTYPE html>");
            resp.getWriter().println("<html>");
            resp.getWriter().println("<head>");
            resp.getWriter().println("<title>Servlet NewServlet</title>");  
            resp.getWriter().println("</head>");
            resp.getWriter().println("<body>");
            resp.getWriter().println("<h2 style=\"color: red\">Your plan does not have any products / campains</h2>");
            resp.getWriter().println("<a href=\"createplan\"><button type=\"button\" style=\"font-size: 20px\">Back</button></a>");
            resp.getWriter().println("</body>");
            resp.getWriter().println("</html>");
        }
        
    }    
   
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

}