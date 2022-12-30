package org.gdou.domain;

import java.sql.Date;

public class Condition
{
    private Integer first_mechaId;
    private Integer second_mechaId;
    private Integer third_mechaId;
    private Integer job_classId;
    private Integer jobId;
    private String start_time;
    private String end_time;

    public Condition()
    {
    }

    public Condition(Integer first_mechaId, Integer second_mechaId, Integer third_mechaId, Integer job_classId, Integer jobId, String start_time, String end_time)
    {
        this.first_mechaId = first_mechaId;
        this.second_mechaId = second_mechaId;
        this.third_mechaId = third_mechaId;
        this.job_classId = job_classId;
        this.jobId = jobId;
        this.start_time = start_time;
        this.end_time = end_time;
    }

    public Integer getFirst_mechaId()
    {
        return first_mechaId;
    }

    public void setFirst_mechaId(Integer first_mechaId)
    {
        this.first_mechaId = first_mechaId;
    }

    public Integer getSecond_mechaId()
    {
        return second_mechaId;
    }

    public void setSecond_mechaId(Integer second_mechaId)
    {
        this.second_mechaId = second_mechaId;
    }

    public Integer getThird_mechaId()
    {
        return third_mechaId;
    }

    public void setThird_mechaId(Integer third_mechaId)
    {
        this.third_mechaId = third_mechaId;
    }

    public Integer getJob_classId()
    {
        return job_classId;
    }

    public void setJob_classId(Integer job_classId)
    {
        this.job_classId = job_classId;
    }

    public Integer getJobId()
    {
        return jobId;
    }

    public void setJobId(Integer jobId)
    {
        this.jobId = jobId;
    }

    public String getStart_time()
    {
        return start_time;
    }

    public void setStart_time(String start_time)
    {
        this.start_time = start_time;
    }

    public String getEnd_time()
    {
        return end_time;
    }

    public void setEnd_time(String end_time)
    {
        this.end_time = end_time;
    }

    @Override
    public String toString()
    {
        return "Condition{" +
                "first_mechaId=" + first_mechaId +
                ", second_mechaId=" + second_mechaId +
                ", third_mechaId=" + third_mechaId +
                ", job_classId=" + job_classId +
                ", jobId=" + jobId +
                ", start_time=" + start_time +
                ", end_time=" + end_time +
                '}';
    }
}
