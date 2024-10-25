/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.AttendanceReport;
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
public class SalaryWorkerDBContext extends DBContext<AttendanceReport> {

    @Override
    public void insert(AttendanceReport entity) {
        throw new UnsupportedOperationException("Not supported yet."); 
    }

    @Override
    public void update(AttendanceReport entity) {
        throw new UnsupportedOperationException("Not supported yet."); 
    }

    @Override
    public void delete(AttendanceReport entity) {
        throw new UnsupportedOperationException("Not supported yet."); 
    }

    public ArrayList<AttendanceReport> list1(String date) {
        ArrayList<AttendanceReport> reports = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = "SELECT EmployeeName, "
                    + "[1] AS [1], [2] AS [2], [3] AS [3], [4] AS [4], [5] AS [5], "
                    + "[6] AS [6], [7] AS [7], [8] AS [8], [9] AS [9], [10] AS [10], "
                    + "[11] AS [11], [12] AS [12], [13] AS [13], [14] AS [14], [15] AS [15], "
                    + "[16] AS [16], [17] AS [17], [18] AS [18], [19] AS [19], [20] AS [20], "
                    + "[21] AS [21], [22] AS [22], [23] AS [23], [24] AS [24], [25] AS [25], "
                    + "[26] AS [26], [27] AS [27], [28] AS [28], [29] AS [29], [30] AS [30], "
                    + "[31] AS [31] "
                    + "FROM ("
                    + "    SELECT e.EmployeeName, aw.Alpha, ROW_NUMBER() OVER(PARTITION BY EmployeeName ORDER BY AttendentID) AS rn "
                    + "    FROM SchedualCampaign sc join SchedualEmployee se on "
                    + "    sc.ScID=se.ScID join AttendenceWorker aw "
                    + "    on se.SchEmpID=aw.SchEmpID join Employee e "
                    + "    on e.EmployeeID=se.EmployeeID join PlanCampain pc "
                    + "    on pc.PlanCampnID=sc.PlanCampnID "
                    + "    where sc.Date like ?"
                    + ") AS src "
                    + "PIVOT ("
                    + "    MAX(Alpha) "
                    + "    FOR rn IN ([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],"
                    + "              [11],[12],[13],[14],[15],[16],[17],[18],[19],[20],"
                    + "              [21],[22],[23],[24],[25],[26],[27],[28],[29],[30],[31])"
                    + ") AS pvt";

            stm = connection.prepareStatement(sql);
            stm.setString(1, date+"%");
            ResultSet rs = stm.executeQuery();
            
            while(rs.next()) {
                AttendanceReport report = new AttendanceReport();
                report.setEmployeeName(rs.getString("EmployeeName")); // Thay đổi từ getInt sang getString
                
                for(int i = 1; i <= 31; i++) {
                    report.setStatus(i, rs.getString(String.valueOf(i)));
                }
                
                reports.add(report);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) stm.close();
                if (connection != null) connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return reports;
    }

    @Override
    public AttendanceReport get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); 
    }

    @Override
    public ArrayList<AttendanceReport> list() {
        throw new UnsupportedOperationException("Not supported yet."); 
    }
}
