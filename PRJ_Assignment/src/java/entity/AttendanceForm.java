/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;

/**
 *
 * @author admin
 */
public class AttendanceForm {
    private Date date;
    private int departmentId;
    private String shift;
    
    // Getters and setters
    public Date getDate() { return date; }
    public void setDate(Date date) { this.date = date; }
    public int getDepartmentId() { return departmentId; }
    public void setDepartmentId(int departmentId) { this.departmentId = departmentId; }
    public String getShift() { return shift; }
    public void setShift(String shift) { this.shift = shift; }
}
