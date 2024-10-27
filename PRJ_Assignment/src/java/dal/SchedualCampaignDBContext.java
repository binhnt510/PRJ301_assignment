/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dal;
/**
 *
 * @author admin
 */


import entity.SchedualCampaign;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SchedualCampaignDBContext extends DBContext<SchedualCampaign> {
    
    public boolean existsByPlanCampainId(int planCampnID) {
        PreparedStatement stm = null;
        try {
            String sql = "SELECT COUNT(*) as count FROM SchedualCampaign WHERE PlanCampnID = ?";
            stm = connection.prepareStatement(sql);
            stm.setInt(1, planCampnID);
            ResultSet rs = stm.executeQuery();
            if(rs.next()) {
                return rs.getInt("count") > 0;
            }
        } catch (SQLException ex) {
            Logger.getLogger(SchedualCampaignDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if(stm != null) stm.close();
                if(connection != null) connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(SchedualCampaignDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return false;
    }
    
    public void insertBatch(ArrayList<SchedualCampaign> schedules) {
        PreparedStatement stm = null;
        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO SchedualCampaign (PlanCampnID, Date, Shift, Quantity) VALUES (?, ?, ?, ?)";
            stm = connection.prepareStatement(sql);
            
            for(SchedualCampaign sc : schedules) {
                stm.setInt(1, sc.getPlanCampnID());
                stm.setDate(2, sc.getDate());
                stm.setString(3, sc.getShift());
                stm.setInt(4, sc.getQuantity());
                stm.addBatch();
            }
            
            stm.executeBatch();
            connection.commit();
            
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(SchedualCampaignDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(SchedualCampaignDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if(stm != null) stm.close();
                if(connection != null) {
                    connection.setAutoCommit(true);
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(SchedualCampaignDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    @Override
    public ArrayList<SchedualCampaign> list() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    @Override
    public void insert(SchedualCampaign entity) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    @Override
    public void update(SchedualCampaign entity) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    @Override
    public void delete(SchedualCampaign entity) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    @Override
    public SchedualCampaign get(int id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
