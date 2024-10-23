/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Department;
import entity.Plan;
import entity.PlanCampain;
import entity.Product;
import java.sql.Date;
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
public class PlanCampainDBContext extends DBContext<PlanCampain> {

    @Override
    public void insert(PlanCampain entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(PlanCampain entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(PlanCampain entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<PlanCampain> list() {
        ArrayList<PlanCampain> pc = new ArrayList<>();
        PreparedStatement command = null;
        try {
            String sql = "select p.PlanName,p.StartDate,p.EndDate,d.DepartmentName,\n"
                    + "	pr.ProductName,pc.Quantity,pc.Estimate\n"
                    + "	from [Plan] p join PlanCampain pc\n"
                    + "	on p.PlanID=pc.PlanID join Department d \n"
                    + "	on d.DepartmentID=p.DepartmentID join [Product] pr\n"
                    + "	on pr.ProductID=pc.ProductID\n"
                    + "order by pc.PlanCampnID desc";

            command = connection.prepareStatement(sql);
            ResultSet rs = command.executeQuery();
            while (rs.next()) {
                // Lấy các giá trị từ ResultSet
                PlanCampain plancampains = new PlanCampain();
                plancampains.setQuantity(rs.getInt("pc.Quantity"));
                plancampains.setCost(rs.getInt("pc.Estimate"));
                Plan plans =new Plan();
                Department dp =new Department();
                Product pr =new Product();
                plans.setDept(dp);
                plancampains.setProduct(pr);
                plancampains.setPlan(plans);
                
                pc.add(plancampains);

                
            }

        } catch (SQLException ex) {
            Logger.getLogger(PlanCampainDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (command != null) {
                    command.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(PlanCampainDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return pc;

    }

    @Override
    public PlanCampain get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
