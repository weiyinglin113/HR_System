package org.gdou.domain;

import java.sql.Timestamp;

public class Conditions {
    private String salaryId;
    private String xxx;
    private String start_time;
    private String end_time;

    public Conditions() {
    }

    public Conditions(String salaryId, String xxx, String start_time, String end_time) {
        this.salaryId = salaryId;
        this.xxx = xxx;
        this.start_time = start_time;
        this.end_time = end_time;
    }

    public String getSalaryId() {
        return salaryId;
    }

    public void setSalaryId(String salaryId) {
        this.salaryId = salaryId;
    }

    public String getXxx() {
        return xxx;
    }

    public void setXxx(String xxx) {
        this.xxx = xxx;
    }

    public String getStart_time() {
        return start_time;
    }

    public void setStart_time(String start_time) {
        this.start_time = start_time;
    }

    public String getEnd_time() {
        return end_time;
    }

    public void setEnd_time(String end_time) {
        this.end_time = end_time;
    }

    @Override
    public String toString() {
        return "Conditions{" +
                "salaryId='" + salaryId + '\'' +
                ", xxx='" + xxx + '\'' +
                ", start_time='" + start_time + '\'' +
                ", end_time='" + end_time + '\'' +
                '}';
    }
}
