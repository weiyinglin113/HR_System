package org.gdou.service;

import org.gdou.domain.Conditions;
import org.gdou.domain.SalInfo;

import java.util.List;


public interface SalInfoService {


    public Boolean addSalInfo(SalInfo salInfo);


    public List<SalInfo> queryCheckingSalInfo();


    public List<SalInfo> querySalDetailsById(String salaryId);


    public Boolean updateSal(SalInfo salInfo);


    public List<Object> queryCheckedSalInfo();

    public List<Object> querySalDetailsByConditons(Conditions conditions);


    public  Boolean updateSalInfo(SalInfo salInfo);
}
