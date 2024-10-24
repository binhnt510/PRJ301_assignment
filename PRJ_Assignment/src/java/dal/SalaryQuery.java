/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.EmployeeSalary;
import java.lang.System.Logger;
import java.lang.System.Logger.Level;
import java.util.ArrayList;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



/**
 *
 * @author admin
 */
public class SalaryQuery extends DBContext<EmployeeSalary> {

    @Override
    public void insert(EmployeeSalary entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(EmployeeSalary entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(EmployeeSalary entity) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<EmployeeSalary> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public EmployeeSalary get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public ArrayList<EmployeeSalary> getSalaries() {

        ArrayList<EmployeeSalary> salaries = new ArrayList<>();
    PreparedStatement command = null;
    try {
        String sql = "SELECT EmployeeName, \n" +
"    [1] AS [1], [2] AS [2], [3] AS [3], [4] AS [4], [5] AS [5], \n" +
"    [6] AS [6], [7] AS [7], [8] AS [8], [9] AS [9], [10] AS [10],\n" +
"    [11] AS [11], [12] AS [12], [13] AS [13], [14] AS [14], [15] AS [15],\n" +
"    [16] AS [16], [17] AS [17], [18] AS [18], [19] AS [19], [20] AS [20],\n" +
"    [21] AS [21], [22] AS [22], [23] AS [23], [24] AS [24], [25] AS [25],\n" +
"    [26] AS [26], [27] AS [27], [28] AS [28], [29] AS [29], [30] AS [30],\n" +
"    [31] AS [31]\n" +
"FROM \n" +
"(\n" +
"    SELECT EmployeeName, Alpha, ROW_NUMBER() OVER(PARTITION BY EmployeeName ORDER BY AttendentID) AS rn\n" +
"    FROM  SchedualCampaign sc  join SchedualEmployee se on\n" +
"		sc.ScID=se.ScID  join AttendenceWorker aw\n" +
"		on se.SchEmpID=aw.SchEmpID  join Employee e \n" +
"		on e.EmployeeID=se.EmployeeID  join PlanCampain pc\n" +
"		on pc.PlanCampnID=sc.PlanCampnID  \n" +
"	where sc.Date like '2024-10%'  \n" +
"\n" +
") AS src\n" +
"PIVOT\n" +
"(\n" +
"    MAX(Alpha) \n" +
"    FOR rn IN (\n" +
"        [1], [2], [3], [4], [5], [6], [7], [8], [9], [10], \n" +
"        [11], [12], [13], [14], [15], [16], [17], [18], [19], [20], \n" +
"        [21], [22], [23], [24], [25], [26], [27], [28], [29], [30], [31]\n" +
"    ) \n" +
") AS pvt;"; // Thay thế với câu lệnh SQL của bạn
        command = connection.prepareStatement(sql);
        ResultSet rs = command.executeQuery();
        while (rs.next()) {
            EmployeeSalary e = new EmployeeSalary();
            e.setEmployeeName(rs.getNString("EmployeeName"));
            String[] salary = new String[31];
            for (int i = 1; i <= 31; i++) {
                salary[i - 1] = rs.getNString(String.valueOf(i));
            }
            e.setSalary(salary);
            salaries.add(e);
        }
    } catch (SQLException ex) {
        java.util.logging.Logger.getLogger(SalaryQuery.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
    } finally {
        
            
            try {
                command.close();
                connection.close();
            } catch (SQLException ex) {
                java.util.logging.Logger.getLogger(SalaryQuery.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
            }
        
    }
        return salaries;
    }
}
