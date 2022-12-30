package org.gdou.service;


import org.gdou.domain.Condition;
import org.gdou.domain.UserInfo;

import java.util.List;

public interface IUserInfoService
{
    public Boolean addUserInfo(UserInfo userInfo);

    public Boolean deleteUserInfo(String archiveId);

    public Boolean recoverUserInfo(String archiveId);

    public Boolean updateUser(UserInfo userInfo);

    public List<Object> queryUserInfoById(String archiveId);

    public List<Object> queryAllUserInfo();

    public List<Object> queryCheckingUserInfo();

    public List<Object> queryUserDetailsById(String archiveId);

    public List<Object> queryUserByCondition(Condition condition);

    public List<Object> queryDeleteUserInfo();

    public List<Object> queryDeleteUserByCondition(Condition condition);

    public int queryUserInfoCount();

//    public String querystatusByAchivedId(Integer archivedId);

}
