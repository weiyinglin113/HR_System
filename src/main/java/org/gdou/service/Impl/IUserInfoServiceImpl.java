package org.gdou.service.Impl;

import org.gdou.dao.IUserInfoDao;
import org.gdou.domain.Condition;
import org.gdou.domain.UserInfo;
import org.gdou.service.IUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("userInfoService")
public class IUserInfoServiceImpl implements IUserInfoService {
    @Autowired
    private IUserInfoDao userInfoDao;

    // 添加员工信息
    @Override
    public Boolean addUserInfo(UserInfo userInfo) {
        return userInfoDao.addUserInfo(userInfo);
    }

    // 删除员工信息
    @Override
    public Boolean deleteUserInfo(String archiveId) {
        return userInfoDao.deleteUserInfo(archiveId);
    }

    @Override
    public Boolean recoverUserInfo(String archiveId) {
        return userInfoDao.recoverUserInfo(archiveId);
    }

    @Override
    // 更新员工信息
    public Boolean updateUser(UserInfo userInfo) {
        return userInfoDao.updateUserInfo(userInfo);
    }

    // 查询一个没通过复核的员工信息
    @Override
    public List<Object> queryUserInfoById(String archiveId) {
        List<Object> checkOne = new ArrayList<>();
        UserInfo userInfo = userInfoDao.queryUserInfoById(archiveId);
        List<String> infoList = new ArrayList<>();

        infoList.add(userInfoDao.queryFirstMecha(userInfo.getFirst_mechaId()));
        infoList.add(userInfoDao.querySecondMecha(userInfo.getSecond_mechaId()));
        infoList.add(userInfoDao.queryThirdMecha(userInfo.getThird_mechaId()));
        infoList.add(userInfoDao.queryJobClass(userInfo.getJob_classId()));
        infoList.add(userInfoDao.queryJob(userInfo.getJobId()));
        // infoList.add(userInfoDao.queryProTitle(userInfo.getPtId()));
        // infoList.add(userInfoDao.queryMajor(userInfo.getMajorId()));
        // infoList.add(userInfoDao.queryNation(userInfo.getNationId()));
        // infoList.add(userInfoDao.querySalary(userInfo.getSalaryId()));
        // infoList.add(userInfoDao.queryEducation(userInfo.getEducationId()));

        checkOne.add(userInfo);
        checkOne.add(infoList);

        return checkOne;

    }

    // 查询所有已复核的员工信息
    @Override
    public List<Object> queryAllUserInfo() {
        List<Object> infoList = new ArrayList<>();
        List<UserInfo> userInfoList = userInfoDao.queryAllUserInfo();
        List<String> firstList = new ArrayList<>();
        List<String> secondList = new ArrayList<>();
        List<String> thirdList = new ArrayList<>();
        List<String> jobList = new ArrayList<>();

        for (UserInfo userInfo : userInfoList) {
            firstList.add(userInfoDao.queryFirstMecha(userInfo.getFirst_mechaId()));
            secondList.add(userInfoDao.querySecondMecha(userInfo.getSecond_mechaId()));
            thirdList.add(userInfoDao.queryThirdMecha(userInfo.getThird_mechaId()));
            jobList.add(userInfoDao.queryJob(userInfo.getJobId()));
        }

        infoList.add(userInfoList);
        infoList.add(firstList);
        infoList.add(secondList);
        infoList.add(thirdList);
        infoList.add(jobList);

        return infoList;
    }

    // 查询所有没通过复核的员工信息
    @Override
    public List<Object> queryCheckingUserInfo() {
        List<Object> checkingUserList = new ArrayList<>();
        List<UserInfo> userInfoList = userInfoDao.queryCheckingUserInfo();
        List<String> firstList = new ArrayList<>();
        List<String> secondList = new ArrayList<>();
        List<String> thirdList = new ArrayList<>();
        List<String> jobList = new ArrayList<>();

        for (UserInfo userInfo : userInfoList) {
            firstList.add(userInfoDao.queryFirstMecha(userInfo.getFirst_mechaId()));
            secondList.add(userInfoDao.querySecondMecha(userInfo.getSecond_mechaId()));
            thirdList.add(userInfoDao.queryThirdMecha(userInfo.getThird_mechaId()));
            jobList.add(userInfoDao.queryJob(userInfo.getJobId()));
        }

        checkingUserList.add(userInfoList);
        checkingUserList.add(firstList);
        checkingUserList.add(secondList);
        checkingUserList.add(thirdList);
        checkingUserList.add(jobList);

        return checkingUserList;
    }

    @Override
    public List<Object> queryUserDetailsById(String archiveId) {
        List<Object> userDetails = new ArrayList<>();
        UserInfo userInfo = userInfoDao.queryUserInfoById(archiveId);
        List<String> infoList = new ArrayList<>();

        infoList.add(userInfoDao.queryFirstMecha(userInfo.getFirst_mechaId()));
        infoList.add(userInfoDao.querySecondMecha(userInfo.getSecond_mechaId()));
        infoList.add(userInfoDao.queryThirdMecha(userInfo.getThird_mechaId()));
        infoList.add(userInfoDao.queryJobClass(userInfo.getJob_classId()));
        infoList.add(userInfoDao.queryJob(userInfo.getJobId()));
        infoList.add(userInfoDao.queryProTitle(userInfo.getPtId()));
        infoList.add(userInfoDao.queryMajor(userInfo.getMajorId()));
        infoList.add(userInfoDao.queryNation(userInfo.getNationId()));
        infoList.add(userInfoDao.querySalary(userInfo.getSalaryId()));
        infoList.add(userInfoDao.queryEducation(userInfo.getEducationId()));

        userDetails.add(userInfo);
        userDetails.add(infoList);

        return userDetails;
    }

    @Override
    public List<Object> queryUserByCondition(Condition condition) {
        List<Object> userDetails = new ArrayList<>();
        List<UserInfo> userInfoList = userInfoDao.queryUserByCondition(condition);
        List<String> infoList = new ArrayList<>();

        infoList.add(userInfoDao.queryFirstMecha(condition.getFirst_mechaId()));
        infoList.add(userInfoDao.querySecondMecha(condition.getSecond_mechaId()));
        infoList.add(userInfoDao.queryThirdMecha(condition.getThird_mechaId()));
        infoList.add(userInfoDao.queryJob(condition.getJobId()));

        userDetails.add(userInfoList);
        userDetails.add(infoList);

        return userDetails;
    }

    // 查询所有通过复核的未被删除和已删除的员工信息
    @Override
    public List<Object> queryDeleteUserInfo() {
        List<Object> infoList = new ArrayList<>();
        List<UserInfo> userInfoList = userInfoDao.queryAllUserInfo();
        List<UserInfo> deleteUserInfoList = userInfoDao.queryDeleteUserInfo();
        List<String> firstList = new ArrayList<>();
        List<String> secondList = new ArrayList<>();
        List<String> thirdList = new ArrayList<>();
        List<String> jobList = new ArrayList<>();

        for (UserInfo userInfo : userInfoList) {
            firstList.add(userInfoDao.queryFirstMecha(userInfo.getFirst_mechaId()));
            secondList.add(userInfoDao.querySecondMecha(userInfo.getSecond_mechaId()));
            thirdList.add(userInfoDao.queryThirdMecha(userInfo.getThird_mechaId()));
            jobList.add(userInfoDao.queryJob(userInfo.getJobId()));
        }

        for (UserInfo deleteUserInfo : deleteUserInfoList) {
            firstList.add(userInfoDao.queryFirstMecha(deleteUserInfo.getFirst_mechaId()));
            secondList.add(userInfoDao.querySecondMecha(deleteUserInfo.getSecond_mechaId()));
            thirdList.add(userInfoDao.queryThirdMecha(deleteUserInfo.getThird_mechaId()));
            jobList.add(userInfoDao.queryJob(deleteUserInfo.getJobId()));
        }

        infoList.add(userInfoList);
        infoList.add(deleteUserInfoList);
        infoList.add(firstList);
        infoList.add(secondList);
        infoList.add(thirdList);
        infoList.add(jobList);

        return infoList;
    }

    // 按照条件查询所有通过复核的未被删除和已删除的员工信息

    @Override
    public List<Object> queryDeleteUserByCondition(Condition condition) {
        List<Object> userDetails = new ArrayList<>();
        List<UserInfo> userInfoList = userInfoDao.queryUserByCondition(condition);
        List<UserInfo> deleteUserInfoList = userInfoDao.queryDeleteUserByCondition(condition);
        List<String> infoList = new ArrayList<>();

        infoList.add(userInfoDao.queryFirstMecha(condition.getFirst_mechaId()));
        infoList.add(userInfoDao.querySecondMecha(condition.getSecond_mechaId()));
        infoList.add(userInfoDao.queryThirdMecha(condition.getThird_mechaId()));
        infoList.add(userInfoDao.queryJob(condition.getJobId()));

        userDetails.add(userInfoList);
        userDetails.add(deleteUserInfoList);
        userDetails.add(infoList);

        return userDetails;
    }

    @Override
    public int queryUserInfoCount() {
        return userInfoDao.queryUserInfoCount();
    }

}

//    @Override
//    public  String querystatusByAchivedId(Integer archivedId)
//    {
//
//        return userInfoDao.querystatusByAchivedId(Integer archivedId);
//    }
//
//}