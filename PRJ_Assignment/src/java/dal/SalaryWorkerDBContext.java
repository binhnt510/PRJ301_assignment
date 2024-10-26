/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.SalaryDetail;
import java.util.ArrayList;
import entity.AttendanceReport;
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
public class SalaryWorkerDBContext extends DBContext<SalaryDetail> {

    @Override
    public void insert(SalaryDetail entity) {
        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO [dbo].[Salary] ([EmployeeID], [MonthYear], [Salary], [Fine], [Note])"
                    + "VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, entity.getEmp().getId());
            stm.setString(2, entity.getMonthyear());
            stm.setDouble(3, entity.getSalary());
            stm.setDouble(4, entity.getFine());
            stm.setString(5, entity.getNote());
            stm.executeUpdate();

            String sql_select_salary = "SELECT @@IDENTITY as SalaryID";
            PreparedStatement stm_select_atten = connection.prepareStatement(sql_select_salary);
            ResultSet rs = stm_select_atten.executeQuery();
            if (rs.next()) {
                entity.setSalaryID(rs.getInt("SalaryID"));
            }
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(SalaryWorkerDBContext.class.getName())
                        .log(Level.SEVERE, "Failed to rollback", ex1);
            }
            Logger.getLogger(SalaryWorkerDBContext.class.getName())
                    .log(Level.SEVERE, "Failed to insert salary", ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(SalaryWorkerDBContext.class.getName())
                        .log(Level.SEVERE, "Failed to reset auto commit", ex);
            }
        }
    }

    @Override
    public void update(SalaryDetail entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(SalaryDetail entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<SalaryDetail> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public SalaryDetail get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
