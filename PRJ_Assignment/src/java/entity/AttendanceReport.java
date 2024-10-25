/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author admin
 */
public class AttendanceReport {
    private String employeeName;  // Thay đổi từ int employeeID sang String employeeName
    private String[] dailyStatus = new String[31];
    
    public AttendanceReport() {
    }
    
    // Sửa getter/setter cho employeeName
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
}