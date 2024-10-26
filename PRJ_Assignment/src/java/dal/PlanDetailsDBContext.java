/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.PlanDetails;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PlanDetailsDBContext extends DBContext<PlanDetails> {
    
    public ArrayList<PlanDetails> searchByPlanName(String planName) {
        ArrayList<PlanDetails> details = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = """
                SELECT p.PlanID, p.PlanName, p.StartDate, p.EndDate, 
                       d.DepartmentName, pr.ProductName, 
                       pc.Quantity, pc.Estimate,
                       (SELECT ISNULL(SUM(aw.ActuralQuantity), 0)
                        FROM AttendenceWorker aw
                        JOIN SchedualEmployee se ON aw.SchEmpID = se.SchEmpID
                        JOIN SchedualCampaign sc ON se.ScID = sc.ScID
                        JOIN PlanCampain pc2 ON sc.PlanCampnID = pc2.PlanCampnID
                        WHERE pc2.PlanID = p.PlanID
                        AND sc.Date BETWEEN p.StartDate AND p.EndDate) as AccomplishedQuantity,
                       CASE 
                           WHEN GETDATE() < p.StartDate THEN 'not started' 
                           WHEN GETDATE() BETWEEN p.StartDate AND p.EndDate THEN 'on going'
                           WHEN GETDATE() > p.EndDate AND
                                (SELECT ISNULL(SUM(aw.ActuralQuantity), 0)
                                 FROM AttendenceWorker aw
                                 JOIN SchedualEmployee se ON aw.SchEmpID = se.SchEmpID
                                 JOIN SchedualCampaign sc ON se.ScID = sc.ScID
                                 JOIN PlanCampain pc2 ON sc.PlanCampnID = pc2.PlanCampnID
                                 WHERE pc2.PlanID = p.PlanID) < pc.Quantity THEN 'late'
                           WHEN (SELECT ISNULL(SUM(aw.ActuralQuantity), 0)
                                 FROM AttendenceWorker aw
                                 JOIN SchedualEmployee se ON aw.SchEmpID = se.SchEmpID
                                 JOIN SchedualCampaign sc ON se.ScID = sc.ScID
                                 JOIN PlanCampain pc2 ON sc.PlanCampnID = pc2.PlanCampnID
                                 WHERE pc2.PlanID = p.PlanID) >= pc.Quantity THEN 'complete'
                       END as Status
                FROM [Plan] p
                JOIN Department d ON p.DepartmentID = d.DepartmentID
                JOIN PlanCampain pc ON p.PlanID = pc.PlanID
                JOIN Product pr ON pc.ProductID = pr.ProductID
                WHERE p.PlanName LIKE ?
                """;
            
            stm = connection.prepareStatement(sql);
            stm.setString(1, "%" + planName + "%");
            ResultSet rs = stm.executeQuery();
            
            while(rs.next()) {
                PlanDetails detail = new PlanDetails();
                detail.setPlanId(rs.getInt("PlanID"));
                detail.setPlanName(rs.getString("PlanName"));
                detail.setStartDate(rs.getDate("StartDate"));
                detail.setEndDate(rs.getDate("EndDate"));
                detail.setDepartmentName(rs.getString("DepartmentName"));
                detail.setProductName(rs.getString("ProductName"));
                detail.setQuantity(rs.getInt("Quantity"));
                detail.setEstimate(rs.getInt("Estimate"));
                detail.setAccomplishedQuantity(rs.getInt("AccomplishedQuantity"));
                detail.setStatus(rs.getString("Status"));
                details.add(detail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PlanDetailsDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if(stm != null) stm.close();
                if(connection != null) connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(PlanDetailsDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return details;
    }

    @Override
    public void insert(PlanDetails entity) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void update(PlanDetails entity) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void delete(PlanDetails entity) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public PlanDetails get(int id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public ArrayList<PlanDetails> list() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
