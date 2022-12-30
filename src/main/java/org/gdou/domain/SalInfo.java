package org.gdou.domain;


import java.math.BigDecimal;
import java.sql.Timestamp;

public class SalInfo {
    private String salaryId;
    private String salaryname;
    private BigDecimal salaryamount;
    private String enacters;
    private String registrar;
    private Timestamp register_time;
    private BigDecimal basicsalary;
    private BigDecimal Transportation_sal;
    private BigDecimal Year_end_sal;
    private BigDecimal phone_sal;
    private BigDecimal oldAge_sal;
    private BigDecimal unemployment_sal;
    private BigDecimal health_sal;
    private BigDecimal housing_sal;
    private Timestamp check_salary_time;
    private String advice;
    private String state;



    public String getAdvice() {
        return advice;
    }

    public void setAdvice(String advice) {
        this.advice = advice;
    }

    public Timestamp getCheck_salary_time() {
        return check_salary_time;
    }

    public void setCheck_salary_time(Timestamp check_salary_time) {
        this.check_salary_time = check_salary_time;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getSalaryId() {
        return salaryId;
    }

    public void setSalaryId(String salaryId) {
        this.salaryId = salaryId;
    }

    public String getSalaryname() {
        return salaryname;
    }

    public void setSalaryname(String salaryname) {
        this.salaryname = salaryname;
    }

    public BigDecimal getSalaryamount() {
        return salaryamount;
    }

    public void setSalaryamount(BigDecimal salaryamount) {
        this.salaryamount = salaryamount;
    }

    public String getEnacters() {
        return enacters;
    }

    public void setEnacters(String enacters) {
        this.enacters = enacters;
    }

    public String getRegistrar() {
        return registrar;
    }

    public void setRegistrar(String registrar) {
        this.registrar = registrar;
    }

    public Timestamp getRegister_time() {
        return register_time;
    }

    public void setRegister_time(Timestamp register_time) {
        this.register_time = register_time;
    }

    public BigDecimal getBasicsalary() {
        return basicsalary;
    }

    public void setBasicsalary(BigDecimal basicsalary) {
        this.basicsalary = basicsalary;
    }

    public BigDecimal getTransportation_sal() {
        return Transportation_sal;
    }

    public void setTransportation_sal(BigDecimal transportation_sal) {
        Transportation_sal = transportation_sal;
    }

    public BigDecimal getYear_end_sal() {
        return Year_end_sal;
    }

    public void setYear_end_sal(BigDecimal year_end_sal) {
        Year_end_sal = year_end_sal;
    }

    public BigDecimal getPhone_sal() {
        return phone_sal;
    }

    public void setPhone_sal(BigDecimal phone_sal) {
        this.phone_sal = phone_sal;
    }

    public BigDecimal getOldAge_sal() {
        return oldAge_sal;
    }

    public void setOldAge_sal(BigDecimal oldAge_sal) {
        this.oldAge_sal = oldAge_sal;
    }

    public BigDecimal getUnemployment_sal() {
        return unemployment_sal;
    }

    public void setUnemployment_sal(BigDecimal unemployment_sal) {
        this.unemployment_sal = unemployment_sal;
    }

    public BigDecimal getHealth_sal() {
        return health_sal;
    }

    public void setHealth_sal(BigDecimal health_sal) {
        this.health_sal = health_sal;
    }

    public BigDecimal getHousing_sal() {
        return housing_sal;
    }

    public void setHousing_sal(BigDecimal housing_sal) {
        this.housing_sal = housing_sal;
    }

    @Override
    public String toString() {
        return "SalInfo{" +
                "salaryId='" + salaryId + '\'' +
                ", salaryname='" + salaryname + '\'' +
                ", salaryamount=" + salaryamount +
                ", enacters='" + enacters + '\'' +
                ", registrar='" + registrar + '\'' +
                ", register_time=" + register_time +
                ", basicsalary=" + basicsalary +
                ", Transportation_sal=" + Transportation_sal +
                ", Year_end_sal=" + Year_end_sal +
                ", phone_sal=" + phone_sal +
                ", oldAge_sal=" + oldAge_sal +
                ", unemployment_sal=" + unemployment_sal +
                ", health_sal=" + health_sal +
                ", housing_sal=" + housing_sal +
                ", check_salary_time=" + check_salary_time +
                ", advice='" + advice + '\'' +
                ", state='" + state + '\'' +
                '}';
    }
}


//    构造函数
