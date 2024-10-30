/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Employee;
import entity.SchedualEmployee;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SchedualEmployeeDBContext extends DBContext<SchedualEmployee> {
    
    @Override
    public void insert(SchedualEmployee entity) {
        try {
            String sql = "INSERT INTO [SchedualEmployee] (ScID, EmployeeID, OrderedQuantity) " +
                        "VALUES (?, ?, ?)";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, entity.getSchedualCampaignDetail().getScID());
            stm.setInt(2, entity.getEmployee().getId());
            stm.setInt(3, entity.getOrderedQuantity());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(SchedualEmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Employee> getAvailableEmployees(int deptId, String shift) {
        ArrayList<Employee> employees = new ArrayList<>();
        try {
            String sql = "SELECT EmployeeID, EmployeeName FROM Employee " +
                        "WHERE DepartmentID = ? AND shift = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, deptId);
            stm.setString(2, shift);
            ResultSet rs = stm.executeQuery();
            
            while(rs.next()) {
                Employee e = new Employee();
                e.setId(rs.getInt("EmployeeID"));
                e.setName(rs.getString("EmployeeName"));
                employees.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(SchedualEmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return employees;
    }

    public boolean existsBySchedualEmployeeId(int scID) {
        PreparedStatement stm = null;
        try {
            String sql = "SELECT COUNT(*) as count FROM [SchedualEmployee] WHERE [ScID] = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, scID);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("count") > 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SchedualEmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(SchedualEmployeeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }

    @Override
    public void update(SchedualEmployee entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(SchedualEmployee entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<SchedualEmployee> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public SchedualEmployee get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}

