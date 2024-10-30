package entity;

public class SchedualEmployee {
    private int schEmpId;
    private SchedualCampaignDetail SchedualCampaignDetail;
    private Employee employee;
    private int orderedQuantity;

    public int getSchEmpId() {
        return schEmpId;
    }

    public void setSchEmpId(int schEmpId) {
        this.schEmpId = schEmpId;
    }

    public SchedualCampaignDetail getSchedualCampaignDetail() {
        return SchedualCampaignDetail;
    }

    public void setSchedualCampaignDetail(SchedualCampaignDetail SchedualCampaignDetail) {
        this.SchedualCampaignDetail = SchedualCampaignDetail;
    }

    

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public int getOrderedQuantity() {
        return orderedQuantity;
    }

    public void setOrderedQuantity(int orderedQuantity) {
        this.orderedQuantity = orderedQuantity;
    }
}