package org.gdou.dao;

import org.gdou.domain.Condition;
import org.gdou.domain.UserInfo;

import java.util.List;

public interface IUserInfoDao
{
    public Boolean addUserInfo(UserInfo userInfo);

    public Boolean deleteUserInfo(String archiveId);

    public Boolean recoverUserInfo(String archiveId);

    public Boolean updateUserInfo(UserInfo userInfo);

    public UserInfo queryUserInfoById(String archiveId);

    public List<UserInfo> queryAllUserInfo();

    public List<UserInfo> queryCheckingUserInfo();

    public List<UserInfo> queryUserByCondition(Condition condition);

    public List<UserInfo> queryDeleteUserInfo();

    public List<UserInfo> queryDeleteUserByCondition(Condition condition);

    public String queryFirstMecha(Integer first_mechaId);

    public String querySecondMecha(Integer second_mechaId);

    public String queryThirdMecha(Integer third_mechaId);

    public String queryJobClass(Integer job_classId);

    public String queryJob(Integer jobId);

    public String queryProTitle(Integer ptId);

    public String queryNation(Integer nationId);

    public String queryEducation(Integer educationId);

    public String queryMajor(Integer majorId);

    public String querySalary(Integer salaryId);

    public int queryUserInfoCount();

    public String querystatusByAchivedId(Integer archivedId);
}
