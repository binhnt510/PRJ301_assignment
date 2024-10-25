/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.time.YearMonth;

public class AttendanceReport {
    private String employeeName;  
    private String[] dailyStatus = new String[31];
    
    public AttendanceReport() {
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String[] getDailyStatus() {
        return dailyStatus;
    }

    public void setDailyStatus(String[] dailyStatus) {
        this.dailyStatus = dailyStatus;
    }
    
    public String getStatus(int day) {
        return dailyStatus[day-1];
    }
    
    public void setStatus(int day, String status) {
        this.dailyStatus[day-1] = status;
    }
    
    // Add new helper method to get days in month
    public static int getDaysInMonth(String yearMonth) {
        if (yearMonth == null || yearMonth.isEmpty()) {
            return 31; // Default value if no date selected
        }
        String[] parts = yearMonth.split("-");
        if (parts.length != 2) {
            return 31;
        }
        int year = Integer.parseInt(parts[0]);
        int month = Integer.parseInt(parts[1]);
        return YearMonth.of(year, month).lengthOfMonth();
    }
}