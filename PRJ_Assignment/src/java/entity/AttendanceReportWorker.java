/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

public class AttendanceReportWorker {
    private String employeeName;
    private int employeeId;
    private double salary;
    private double calculatedSalary;
    private String[] status;
    
    public AttendanceReportWorker() {
        status = new String[32]; // 0-31 for easy indexing
    }
    
    public String getEmployeeName() {
        return employeeName;
    }
    
    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }
    
    public int getEmployeeId() {
        return employeeId;
    }
    
    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }
    
    public double getSalary() {
        return salary;
    }
    
    public void setSalary(double salary) {
        this.salary = salary;
    }
    
    public double getCalculatedSalary() {
        return calculatedSalary;
    }
    
    public void setCalculatedSalary(double calculatedSalary) {
        this.calculatedSalary = calculatedSalary;
    }
    
    public String getStatus(int day) {
        return status[day];
    }
    
    public void setStatus(int day, String value) {
        status[day] = value;
    }
    
    public static int getDaysInMonth(String monthYear) {
        // Assuming monthYear format is "yyyy-MM"
        String[] parts = monthYear.split("-");
        int year = Integer.parseInt(parts[0]);
        int month = Integer.parseInt(parts[1]);
        
        switch (month) {
            case 4:
            case 6:
            case 9:
            case 11:
                return 30;
            case 2:
                return (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) ? 29 : 28;
            default:
                return 31;
        }
    }
}