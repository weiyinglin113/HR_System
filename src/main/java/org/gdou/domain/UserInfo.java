package org.gdou.domain;

import java.sql.Timestamp;

public class UserInfo
{
    private String archiveId;
    private Integer first_mechaId;
    private Integer second_mechaId;
    private Integer third_mechaId;
    private Integer job_classId;
    private Integer jobId;
    private Integer ptId;
    private String name;
    private String gender;
    private String email;
    private String mobilephone;
    private String address;
    private Integer nationId;
    private String IDCard;
    private Integer age;
    private Integer educationId;
    private Integer majorId;
    private Integer salaryId;
    private String bank;
    private String bank_card;
    private String registrar;
    private Timestamp create_archive_time;
    private Timestamp check_archive_time;
    private String resume;
    private String family_relation;
    private String remarks;
    private String state;

    public String getArchiveId()
    {
        return archiveId;
    }

    public void setArchiveId(String archiveId)
    {
        this.archiveId = archiveId;
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

    public Integer getPtId()
    {
        return ptId;
    }

    public void setPtId(Integer ptId)
    {
        this.ptId = ptId;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getGender()
    {
        return gender;
    }

    public void setGender(String gender)
    {
        this.gender = gender;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getMobilephone()
    {
        return mobilephone;
    }

    public void setMobilephone(String mobilephone)
    {
        this.mobilephone = mobilephone;
    }

    public String getAddress()
    {
        return address;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }

    public Integer getNationId()
    {
        return nationId;
    }

    public void setNationId(Integer nationId)
    {
        this.nationId = nationId;
    }

    public String getIDCard()
    {
        return IDCard;
    }

    public void setIDCard(String IDCard)
    {
        this.IDCard = IDCard;
    }

    public Integer getAge()
    {
        return age;
    }

    public void setAge(Integer age)
    {
        this.age = age;
    }

    public Integer getEducationId()
    {
        return educationId;
    }

    public void setEducationId(Integer educationId)
    {
        this.educationId = educationId;
    }

    public Integer getMajorId()
    {
        return majorId;
    }

    public void setMajorId(Integer majorId)
    {
        this.majorId = majorId;
    }

    public Integer getSalaryId()
    {
        return salaryId;
    }

    public void setSalaryId(Integer salaryId)
    {
        this.salaryId = salaryId;
    }

    public String getBank()
    {
        return bank;
    }

    public void setBank(String bank)
    {
        this.bank = bank;
    }

    public String getBank_card()
    {
        return bank_card;
    }

    public void setBank_card(String bank_card)
    {
        this.bank_card = bank_card;
    }

    public String getRegistrar()
    {
        return registrar;
    }

    public void setRegistrar(String registrar)
    {
        this.registrar = registrar;
    }

    public Timestamp getCreate_archive_time()
    {
        return create_archive_time;
    }

    public void setCreate_archive_time(Timestamp create_archive_time)
    {
        this.create_archive_time = create_archive_time;
    }

    public Timestamp getCheck_archive_time()
    {
        return check_archive_time;
    }

    public void setCheck_archive_time(Timestamp check_archive_time)
    {
        this.check_archive_time = check_archive_time;
    }

    public String getResume()
    {
        return resume;
    }

    public void setResume(String resume)
    {
        this.resume = resume;
    }

    public String getFamily_relation()
    {
        return family_relation;
    }

    public void setFamily_relation(String family_relation)
    {
        this.family_relation = family_relation;
    }

    public String getRemarks()
    {
        return remarks;
    }

    public void setRemarks(String remarks)
    {
        this.remarks = remarks;
    }

    public String getState()
    {
        return state;
    }

    public void setState(String state)
    {
        this.state = state;
    }

    @Override
    public String toString()
    {
        return "UserInfo{" +
                "archiveId='" + archiveId + '\'' +
                ", first_mechaId=" + first_mechaId +
                ", second_mechaId=" + second_mechaId +
                ", third_mechaId=" + third_mechaId +
                ", job_classId=" + job_classId +
                ", jobId=" + jobId +
                ", ptId=" + ptId +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", email='" + email + '\'' +
                ", mobilephone='" + mobilephone + '\'' +
                ", address='" + address + '\'' +
                ", nationId=" + nationId +
                ", IDCard='" + IDCard + '\'' +
                ", age=" + age +
                ", educationId=" + educationId +
                ", majorId=" + majorId +
                ", salaryId=" + salaryId +
                ", bank='" + bank + '\'' +
                ", bank_card='" + bank_card + '\'' +
                ", registrar='" + registrar + '\'' +
                ", create_archive_time=" + create_archive_time +
                ", check_archive_time=" + check_archive_time +
                ", resume='" + resume + '\'' +
                ", family_relation='" + family_relation + '\'' +
                ", remarks='" + remarks + '\'' +
                ", state='" + state + '\'' +
                '}';
    }
}
