/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.PlanCampain;
import entity.Product;

import entity.SchedualCampaignDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class SchedualCmapainDetailDBContext extends DBContext<SchedualCampaignDetail>{
    @Override
    public ArrayList<SchedualCampaignDetail> list() {
        ArrayList<SchedualCampaignDetail> scheduals = new ArrayList<>();
        try {
            String sql = "SELECT sc.ScID, sc.Date, sc.[Shift], sc.Quantity, \n"
                    + "                    p.PlanName, d.DepartmentName, pr.ProductName, sc.PlanCampnID \n"
                    + "                    FROM SchedualCampaign sc \n"
                    + "                    INNER JOIN PlanCampain pc ON sc.PlanCampnID = pc.PlanCampnID \n"
                    + "                    INNER JOIN [Plan] p ON pc.PlanID = p.PlanID \n"
                    + "                    INNER JOIN Department d ON p.DepartmentID = d.DepartmentID \n"
                    + "                    INNER JOIN [Product] pr ON pc.ProductID = pr.ProductID \n"
                    + "                    ORDER BY p.PlanName desc,sc.Date desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                SchedualCampaignDetail sc = new SchedualCampaignDetail();
                sc.setScID(rs.getInt("ScID"));
                sc.setDate(rs.getDate("Date"));
                sc.setShift(rs.getString("Shift"));
                sc.setQuantity(rs.getInt("Quantity"));
                sc.setPlanName(rs.getNString("PlanName"));
                sc.setDepartmentName(rs.getNString("DepartmentName"));
                sc.setProductName(rs.getNString("ProductName"));
                sc.setPlanCampnID(rs.getInt("PlanCampnID"));

                scheduals.add(sc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SchedualCmapainDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return scheduals;
    }

    public ArrayList<SchedualCampaignDetail> getByDepartment(int deptId) {
        ArrayList<SchedualCampaignDetail> scheduals = new ArrayList<>();
        try {
           String sql = "SELECT p.PlanID,sc.ScID, sc.Date, sc.[Shift], sc.Quantity, \n"
                    + "                    p.PlanName, d.DepartmentName, pr.ProductName, sc.PlanCampnID \n"
                    + "                    FROM SchedualCampaign sc \n"
                    + "                    INNER JOIN PlanCampain pc ON sc.PlanCampnID = pc.PlanCampnID \n"
                    + "                    INNER JOIN [Plan] p ON pc.PlanID = p.PlanID \n"
                    + "                    INNER JOIN Department d ON p.DepartmentID = d.DepartmentID \n"
                    + "                    INNER JOIN [Product] pr ON pc.ProductID = pr.ProductID \n"
                    + "                    WHERE d.DepartmentID = ?"
                    + "                    ORDER BY p.PlanID desc,sc.Date desc";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, deptId);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                SchedualCampaignDetail sc = new SchedualCampaignDetail();
                sc.setScID(rs.getInt("ScID"));
                sc.setDate(rs.getDate("Date"));
                sc.setShift(rs.getString("Shift"));
                sc.setQuantity(rs.getInt("Quantity"));
                sc.setPlanName(rs.getNString("PlanName"));
                sc.setDepartmentName(rs.getNString("DepartmentName"));
                sc.setProductName(rs.getNString("ProductName"));
                sc.setPlanCampnID(rs.getInt("PlanCampnID"));

                scheduals.add(sc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SchedualCmapainDetailDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return scheduals;
    }

    @Override
    public void insert(SchedualCampaignDetail entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(SchedualCampaignDetail entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(SchedualCampaignDetail entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public SchedualCampaignDetail get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
