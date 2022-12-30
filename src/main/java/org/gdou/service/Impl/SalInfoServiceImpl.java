package org.gdou.service.Impl;

import org.gdou.dao.SalInfoDao;
import org.gdou.domain.Conditions;
import org.gdou.domain.SalInfo;

import org.gdou.domain.UserInfo;
import org.gdou.service.SalInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("salInfoService")
public class SalInfoServiceImpl implements SalInfoService {

    @Autowired
    private SalInfoDao salInfoDao;


    //添加薪酬信息
    @Override
    public Boolean addSalInfo(SalInfo salInfo) {
        return salInfoDao.addSalInfo(salInfo);
    }


    // 查询所有未通过复核的薪酬信息
    @Override
    public List<SalInfo> queryCheckingSalInfo() {
        List<SalInfo> salInfoList = salInfoDao.queryCheckingSalInfo();
        return salInfoList;
    }

    @Override
    public List<SalInfo> querySalDetailsById(String salaryId) {
        List<SalInfo> salDetails = new ArrayList<>();
        SalInfo salInfo = salInfoDao.querySalInfoById(salaryId);
        salDetails.add(salInfo);
        return salDetails;
    }

    @Override
    public Boolean updateSal(SalInfo salInfo) {
        return salInfoDao.updateSalInfo(salInfo);
    }

    //    查询已通过复核的薪酬信息
    @Override
    public List<Object> queryCheckedSalInfo() {
        List<Object> infoList = new ArrayList<>();
        List<SalInfo> salInfoList = salInfoDao.queryAllSalInfo();
        infoList.add(salInfoList);
        return infoList;
    }


    //    通过条件查询薪酬信息
    @Override
    public List<Object> querySalDetailsByConditons(Conditions conditions) {
        List<Object> salDetails = new ArrayList<>();
        List<SalInfo> salInfoList = salInfoDao.querySalByConditions(conditions);
        salDetails.add(salInfoList);

        return salDetails;
    }

    @Override
    public Boolean updateSalInfo(SalInfo salInfo) {
        return salInfoDao.updatesalDetails(salInfo);
    }


}
