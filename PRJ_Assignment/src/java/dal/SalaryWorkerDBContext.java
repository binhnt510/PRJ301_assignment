/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.SalaryDetail;
import java.util.ArrayList;
import entity.AttendanceReport;
import entity.Employee;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.*;

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
    public boolean existsBySalaryWorkerDate(String date) {
        PreparedStatement stm = null;
        try {
            String sql = "SELECT COUNT(*) as count FROM Salary WHERE Salary.MonthYear =  ?";
            stm = connection.prepareStatement(sql);
            stm.setString(1, date);
            ResultSet rs = stm.executeQuery();
            if(rs.next()) {
                return rs.getInt("count") > 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SalaryWorkerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if(stm != null) stm.close();
                if(connection != null) connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(SalaryWorkerDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }
    @Override
    public void update(SalaryDetail entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(SalaryDetail entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    
    public ArrayList<SalaryDetail> listdetail(String date) {
        ArrayList<SalaryDetail> salarys = new ArrayList<>();
        PreparedStatement command = null;
        ResultSet rs = null; // Khai báo ResultSet ở đây

        try {
            String sql = " SELECT e.EmployeeID,e.EmployeeName,s.MonthYear,s.Salary,s.Fine,s.Note  FROM Salary s join Employee e on s.EmployeeID=e.EmployeeID where MonthYear=?";
            command = connection.prepareStatement(sql);
            command.setString(1, date);
            rs = command.executeQuery(); // Lưu trữ ResultSet
            
            while (rs.next()) {
                SalaryDetail s = new SalaryDetail();
                
                Employee e= new Employee();
                e.setId(rs.getInt("EmployeeID"));
                e.setName(rs.getNString("EmployeeName"));
                s.setEmp(e);
                s.setMonthyear(rs.getString("MonthYear"));
                s.setFine(rs.getDouble("Fine"));
                s.setSalary(rs.getDouble("Salary"));
                s.setNote(rs.getNString("Note"));
                salarys.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(SalaryWorkerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                command.close();
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(SalaryWorkerDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return salarys;
    }

    @Override
    public SalaryDetail get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<SalaryDetail> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
