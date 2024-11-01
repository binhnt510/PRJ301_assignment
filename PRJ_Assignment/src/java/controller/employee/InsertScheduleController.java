/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.employee;

import controller.accesscontrol.BaseRBACController;
import dal.PlanDetailsDBContext;
import dal.SchedualCampaignDBContext;
import entity.PlanCampain;
import entity.PlanDetails;
import entity.SchedualCampaign;
import entity.accesscontrol.User;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.text.SimpleDateFormat;

/**
 *
 * @author admin
 */
public class InsertScheduleController extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest request, HttpServletResponse response, User account)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        int planCampnID = Integer.parseInt(request.getParameter("planCampnID"));

        String planName = request.getParameter("planName");  // Tiếng Việt sẽ tự động giải mã khi nhận
        String start = request.getParameter("startDate");
        String end = request.getParameter("endDate");
        String departmentName = request.getParameter("departmentName");
        String productName = request.getParameter("productName");
        String quantity = request.getParameter("quantity");
        String estimate = request.getParameter("estimate");
        SchedualCampaignDBContext db = new SchedualCampaignDBContext();
        if (db.existsByPlanCampainId(planCampnID)) {
            request.setAttribute("message", "Plan has created for SchedualCampaign");
        }

        // Get plan details for dates
        PlanDetailsDBContext planDB = new PlanDetailsDBContext();
        PlanDetails plan = planDB.get(planCampnID);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

        // Chuyển đổi chuỗi ngày sang kiểu LocalDate
        LocalDate startDate = plan.getStartDate().toLocalDate();
        LocalDate endDate = plan.getEndDate().toLocalDate();

        // Tạo một ArrayList để lưu các ngày
        ArrayList<String> dateList = new ArrayList<>();

        // Duyệt qua các ngày và thêm vào ArrayList
        LocalDate currentDate = startDate;
        while (!currentDate.isAfter(endDate)) {
            dateList.add(currentDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
            currentDate = currentDate.plusDays(1);
        }

        // Chuyển ArrayList sang mảng String
        String[] dateArray = dateList.toArray(new String[0]);
        session.setAttribute("insertPageVisited", true);
        request.setAttribute("planName", planName);
        request.setAttribute("start", start);
        request.setAttribute("end", end);
        request.setAttribute("departmentName", departmentName);
        request.setAttribute("productName", productName);
        request.setAttribute("quantity", quantity);
        request.setAttribute("estimate", estimate);
        request.setAttribute("planCampnID", planCampnID);
        request.setAttribute("dates", dateArray);
        request.getRequestDispatcher("../view/work/schedualcampaign.jsp").forward(request, response);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest request, HttpServletResponse response, User account)
            throws ServletException, IOException {
        int planCampnID = Integer.parseInt(request.getParameter("planCampnID"));
        String[] dates = request.getParameterValues("date");
        String[] k1Values = request.getParameterValues("k1");
        String[] k2Values = request.getParameterValues("k2");
        String[] k3Values = request.getParameterValues("k3");

        ArrayList<SchedualCampaign> schedules = new ArrayList<>();
        
        for (int i = 0; i < dates.length; i++) {
            if (k1Values[i] != null && !k1Values[i].isEmpty()&& !k1Values[i].equals("0")) {
                SchedualCampaign sc = new SchedualCampaign();
                PlanCampain p = new PlanCampain();
                p.setId(planCampnID);
                sc.setPlanCampain(p);
                sc.setDate(Date.valueOf(dates[i]));
                sc.setShift("K1");
                sc.setQuantity(Integer.parseInt(k1Values[i]));
                schedules.add(sc);
            }

            if (k2Values[i] != null && !k2Values[i].isEmpty()&& !k2Values[i].equals("0")) {
                SchedualCampaign sc = new SchedualCampaign();
                PlanCampain p = new PlanCampain();
                p.setId(planCampnID);
                sc.setPlanCampain(p);
                sc.setDate(Date.valueOf(dates[i]));
                sc.setShift("K2");
                sc.setQuantity(Integer.parseInt(k2Values[i]));
                schedules.add(sc);
            }

            if (k3Values[i] != null && !k3Values[i].isEmpty()&& !k3Values[i].equals("0")) {
                SchedualCampaign sc = new SchedualCampaign();
                PlanCampain p = new PlanCampain();
                p.setId(planCampnID);
                sc.setPlanCampain(p);
                sc.setDate(Date.valueOf(dates[i]));
                sc.setShift("K3");
                sc.setQuantity(Integer.parseInt(k3Values[i]));
                schedules.add(sc);
            }
        }

        SchedualCampaignDBContext db = new SchedualCampaignDBContext();

        HttpSession session = request.getSession();
        Boolean insertPageVisited = (Boolean) session.getAttribute("insertPageVisited");
        if (insertPageVisited != null && insertPageVisited) {
            // Tiến hành insert dữ liệu vào database
            // (giả sử insert thành công)
            db.insertBatch(schedules);
            // Chuyển hướng về trang chủ sau khi insert
            session.setAttribute("insertPageVisited", false); // Ngăn submit lại
            response.sendRedirect("listplan"); // Trang chủ
        } else {
//        // Nếu người dùng cố submit lại, chuyển hướng hoặc thông báo lỗi
            response.sendRedirect("listplan"); // Thông báo không thể submit lại
        }
        
    }
}
