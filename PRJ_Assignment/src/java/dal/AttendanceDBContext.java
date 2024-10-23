/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.AttendanceDetail;
import entity.AttendenceWorker;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class AttendanceDBContext extends DBContext<AttendenceWorker> {
    
    public ArrayList<AttendanceDetail> getAttendanceDetails(Date date, int departmentId, String shift) {
        ArrayList<AttendanceDetail> details = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = "SELECT e.EmployeeID, e.EmployeeName, p.ProductName, " +
                        "se.SchEmpID, se.OrderedQuantity, aw.ActuralQuantity, aw.Alpha, " +
                        "aw.Note, aw.CreateBy " +
                        "FROM SchedualCampaign sc " +
                        "JOIN SchedualEmployee se ON sc.ScID = se.ScID " +
                        "JOIN AttendenceWorker aw ON se.SchEmpID = aw.SchEmpID " +
                        "JOIN Employee e ON e.EmployeeID = se.EmployeeID " +
                        "JOIN PlanCampain pc ON pc.PlanCampnID = sc.PlanCampnID " +
                        "JOIN [Product] p ON p.ProductID = pc.ProductID " +
                        "WHERE sc.Date = ? AND e.DepartmentID = ? AND e.shift = ?";
            
            stm = connection.prepareStatement(sql);
            stm.setDate(1, date);
            stm.setInt(2, departmentId);
            stm.setString(3, shift);
            
            ResultSet rs = stm.executeQuery();
            while(rs.next()) {
                AttendanceDetail detail = new AttendanceDetail();
                detail.setEmployeeId(rs.getInt("EmployeeID"));
                detail.setEmployeeName(rs.getString("EmployeeName"));
                detail.setProductName(rs.getString("ProductName"));
                detail.setSchEmpId(rs.getInt("SchEmpID"));
                detail.setOrderedQuantity(rs.getInt("OrderedQuantity"));
                detail.setActualQuantity(rs.getInt("ActuralQuantity"));
                detail.setAlpha(rs.getDouble("Alpha"));
                detail.setNote(rs.getString("Note"));
                detail.setCreateBy(rs.getString("CreateBy"));
                details.add(detail);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if(stm != null) stm.close();
                if(connection != null) connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return details;
    }
    
    public void insertAttendance(AttendenceWorker entity) {
    String sql = "INSERT INTO AttendenceWorker (SchEmpID, ActuralQuantity, Alpha, Note, CreateBy) " +
                 "VALUES (?, ?, ?, ?, ?)";
    PreparedStatement stm = null;
    try {
        stm = connection.prepareStatement(sql);
        stm.setInt(1, entity.getSchEmpId());
        stm.setInt(2, entity.getActualQuantity());
        stm.setDouble(3, entity.getAlpha());
        stm.setString(4, entity.getNote());
        stm.setString(5, entity.getCreateBy());

        stm.executeUpdate();
    } catch (SQLException ex) {
        Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, 
            "Error inserting attendance for SchEmpID: " + entity.getSchEmpId(), ex);
    } finally {
        try {
            if (stm != null) stm.close();
            // Only close connection if you are sure this is the end of the session
            // if (connection != null) connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
    
    
    
    
    

    @Override
    public void insert(AttendenceWorker entity) {
        throw new UnsupportedOperationException("Use insertAttendance instead.");
    }

    @Override
    public void update(AttendenceWorker entity) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void delete(AttendenceWorker entity) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public ArrayList<AttendenceWorker> list() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public AttendenceWorker get(int id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}