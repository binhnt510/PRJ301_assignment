/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author admin
 */
public class EmployeeSalary {
    private String employeeName;
    private String[] salary;

    public EmployeeSalary(String employeeName, String[] salary) {
        this.employeeName = employeeName;
        this.salary = salary;
    }

    public EmployeeSalary() {
    }
    

    // Getters and Setters
    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String[] getSalary() {
        return salary;
    }

    public void setSalary(String[] salary) {
        this.salary = salary;
    }
}
