/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.sql.Date;

public class PlanDetails {
    private int planId;
    private String planName;
    private Date startDate;
    private Date endDate;
    private String departmentName;
    private String productName;
    private int quantity;
    private int estimate;
    private Integer accomplishedQuantity;
    private String status;

    // Getters and Setters
    public int getPlanId() {
        return planId;
    }

    public void setPlanId(int planId) {
        this.planId = planId;
    }

    public String getPlanName() {
        return planName;
    }

    public void setPlanName(String planName) {
        this.planName = planName;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getEstimate() {
        return estimate;
    }

    public void setEstimate(int estimate) {
        this.estimate = estimate;
    }

    public Integer getAccomplishedQuantity() {
        return accomplishedQuantity;
    }

    public void setAccomplishedQuantity(Integer accomplishedQuantity) {
        this.accomplishedQuantity = accomplishedQuantity;
    }

    

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
