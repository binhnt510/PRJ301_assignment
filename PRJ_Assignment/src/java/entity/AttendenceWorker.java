/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author admin
 */
public class AttendenceWorker {
    private int attendentId;
    private int schEmpId;
    private int actualQuantity;
    private double alpha;
    private String note;
    private String createBy;
    
    // Getters and setters
    public int getAttendentId() { return attendentId; }
    public void setAttendentId(int attendentId) { this.attendentId = attendentId; }
    public int getSchEmpId() { return schEmpId; }
    public void setSchEmpId(int schEmpId) { this.schEmpId = schEmpId; }
    public int getActualQuantity() { return actualQuantity; }
    public void setActualQuantity(int actualQuantity) { this.actualQuantity = actualQuantity; }
    public double getAlpha() { return alpha; }
    public void setAlpha(double alpha) { this.alpha = alpha; }
    public String getNote() { return note; }
    public void setNote(String note) { this.note = note; }
    public String getCreateBy() { return createBy; }
    public void setCreateBy(String createBy) { this.createBy = createBy; }
}
