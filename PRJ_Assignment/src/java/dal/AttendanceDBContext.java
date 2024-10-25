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
import java.sql.*;

public class AttendanceDBContext extends DBContext<AttendenceWorker> {

    public ArrayList<AttendanceDetail> getAttendanceDetails(Date date, int departmentId, String shift) {
        ArrayList<AttendanceDetail> details = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = "SELECT e.EmployeeID, e.EmployeeName,p.ProductName,se.OrderedQuantity,aw.ActuralQuantity,aw.Alpha,aw.Note,\n"
                    + "aw.CreateBy,se.SchEmpID\n"
                    + "		from SchedualCampaign sc  join SchedualEmployee se on\n"
                    + "		sc.ScID=se.ScID  left join AttendenceWorker aw\n"
                    + "		on se.SchEmpID=aw.SchEmpID  join Employee e \n"
                    + "		on e.EmployeeID=se.EmployeeID  join PlanCampain pc\n"
                    + "		on pc.PlanCampnID=sc.PlanCampnID  join [Product] p\n"
                    + "		on p.ProductID=pc.ProductID\n"
                    + "	where sc.Date=?  and e.DepartmentID=? and sc.Shift=?";

            stm = connection.prepareStatement(sql);
            stm.setDate(1, date);
            stm.setInt(2, departmentId);
            stm.setString(3, shift);

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
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
                if (stm != null) {
                    stm.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return details;
    }

    public void insertAttendance(AttendenceWorker entity) {

        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO AttendenceWorker (SchEmpID, ActuralQuantity, Alpha, Note, CreateBy) "
                    + "VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, entity.getSchEmpId());
            stm.setInt(2, entity.getActualQuantity());
            stm.setDouble(3, entity.getAlpha());
            stm.setString(4, entity.getNote());
            stm.setString(5, entity.getCreateBy());
            stm.executeUpdate();

            String sql_select_atten = "SELECT @@IDENTITY as AttendentID";
            PreparedStatement stm_select_atten = connection.prepareStatement(sql_select_atten);
            ResultSet rs = stm_select_atten.executeQuery();
            if (rs.next()) {
                entity.setAttendentId(rs.getInt("AttendentID"));
            }
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(AttendanceDBContext.class.getName())
                        .log(Level.SEVERE, "Failed to rollback", ex1);
            }
            Logger.getLogger(AttendanceDBContext.class.getName())
                    .log(Level.SEVERE, "Failed to insert attendance", ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(AttendanceDBContext.class.getName())
                        .log(Level.SEVERE, "Failed to reset auto commit", ex);
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
