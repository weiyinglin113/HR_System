package org.gdou.dao;


import org.gdou.domain.Conditions;
import org.gdou.domain.SalInfo;

import java.util.List;

public interface SalInfoDao {
    public Boolean addSalInfo(SalInfo salInfo);


    public List<SalInfo> queryCheckingSalInfo();

    public SalInfo querySalInfoById(String salaryId);

    public Boolean updateSalInfo(SalInfo salInfo);

    public List<SalInfo> queryAllSalInfo();

    public List<SalInfo> querySalByConditions(Conditions conditions);

    public Boolean updatesalDetails(SalInfo salInfo);
}
