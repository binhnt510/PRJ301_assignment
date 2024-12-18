/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.AttendanceReportWorker;
import java.util.ArrayList;
import entity.AttendanceReportWorker;
import entity.SalaryDetail;
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
public class AttendanceReportForSalaryDBContext extends DBContext<AttendanceReportWorker> {

    @Override
    public void insert(AttendanceReportWorker entity) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void update(AttendanceReportWorker entity) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public void delete(AttendanceReportWorker entity) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    public ArrayList<AttendanceReportWorker> list1(String date) {
        ArrayList<AttendanceReportWorker> reports = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = "WITH DailyAttendance AS (\n"
                    + "    SELECT \n"
                    + "        e.EmployeeName,\n"
                    + "        e.EmployeeID, \n"
                    + "        e.Salary, \n"
                    + "        sc.Date,\n"
                    + "        FIRST_VALUE(aw.Alpha) OVER (PARTITION BY e.EmployeeID, sc.Date ORDER BY aw.AttendentID) AS Alpha,\n"
                    + "        DAY(sc.Date) AS DayOfMonth\n"
                    + "    FROM SchedualCampaign sc  \n"
                    + "    JOIN SchedualEmployee se ON sc.ScID = se.ScID  \n"
                    + "    JOIN AttendenceWorker aw ON se.SchEmpID = aw.SchEmpID  \n"
                    + "    JOIN Employee e ON e.EmployeeID = se.EmployeeID  \n"
                    + "    JOIN PlanCampain pc ON pc.PlanCampnID = sc.PlanCampnID  \n"
                    + "    WHERE e.RoleID= '5' and sc.Date LIKE ?\n"
                    + ")\n"
                    + "SELECT \n"
                    + "    EmployeeName,\n"
                    + "    EmployeeID,\n"
                    + "    Salary,\n"
                    + "    [1] AS [1], [2] AS [2], [3] AS [3], [4] AS [4], [5] AS [5],\n"
                    + "    [6] AS [6], [7] AS [7], [8] AS [8], [9] AS [9], [10] AS [10],\n"
                    + "    [11] AS [11], [12] AS [12], [13] AS [13], [14] AS [14], [15] AS [15],\n"
                    + "    [16] AS [16], [17] AS [17], [18] AS [18], [19] AS [19], [20] AS [20],\n"
                    + "    [21] AS [21], [22] AS [22], [23] AS [23], [24] AS [24], [25] AS [25],\n"
                    + "    [26] AS [26], [27] AS [27], [28] AS [28], [29] AS [29], [30] AS [30],\n"
                    + "    [31] AS [31]\n"
                    + "FROM \n"
                    + "(\n"
                    + "    SELECT DISTINCT\n"
                    + "        EmployeeName,\n"
                    + "        EmployeeID,\n"
                    + "        Salary,\n"
                    + "        DayOfMonth,\n"
                    + "        Alpha\n"
                    + "    FROM DailyAttendance\n"
                    + ") AS SourceTable\n"
                    + "PIVOT\n"
                    + "(\n"
                    + "    MAX(Alpha)\n"
                    + "    FOR DayOfMonth IN (\n"
                    + "        [1], [2], [3], [4], [5], [6], [7], [8], [9], [10],\n"
                    + "        [11], [12], [13], [14], [15], [16], [17], [18], [19], [20],\n"
                    + "        [21], [22], [23], [24], [25], [26], [27], [28], [29], [30], [31]\n"
                    + "    )\n"
                    + ") AS PivotTable\n"
                    + "ORDER BY EmployeeID;";

            stm = connection.prepareStatement(sql);
            stm.setString(1, date + "%");
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                AttendanceReportWorker report = new AttendanceReportWorker();
                report.setEmployeeName(rs.getNString("EmployeeName")); // Thay đổi từ getInt sang getString
                report.setSalary(rs.getDouble("Salary"));
                report.setEmployeeId(rs.getInt("EmployeeID"));
                for (int i = 1; i <= 31; i++) {
                    report.setStatus(i, rs.getString(String.valueOf(i)));
                }

                reports.add(report);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AttendanceReportForSalaryDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (stm != null) {
                    stm.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(AttendanceReportForSalaryDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return reports;
    }

    @Override
    public AttendanceReportWorker get(int id) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public ArrayList<AttendanceReportWorker> list() {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
