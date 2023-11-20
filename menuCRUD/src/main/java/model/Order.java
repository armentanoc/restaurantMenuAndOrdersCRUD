package model;

public class Order {
    private int id;
    private String customerName;
    private int entradaId;
    private int pratoPrincipalId;
    private int sobremesaId;
    private String status;

    public Order(int id, String customerName, int entradaId, int pratoPrincipalId, int sobremesaId, String status) {
        this.id = id;
        this.customerName = customerName;
        this.entradaId = entradaId;
        this.pratoPrincipalId = pratoPrincipalId;
        this.sobremesaId = sobremesaId;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public int getEntradaId() {
        return entradaId;
    }

    public void setEntradaId(int entradaId) {
        this.entradaId = entradaId;
    }

    public int getPratoPrincipalId() {
        return pratoPrincipalId;
    }

    public void setPratoPrincipalId(int pratoPrincipalId) {
        this.pratoPrincipalId = pratoPrincipalId;
    }

    public int getSobremesaId() {
        return sobremesaId;
    }

    public void setSobremesaId(int sobremesaId) {
        this.sobremesaId = sobremesaId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
