package employee;

public class Employee {

    private long id;
    private String name;
    private String surname;
    private String charge;

    public Employee(long id, String name, String surname, String charge) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.charge = charge;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getCharge() {
        return charge;
    }

    public void setCharge(String charge) {
        this.charge = charge;
    }

}
