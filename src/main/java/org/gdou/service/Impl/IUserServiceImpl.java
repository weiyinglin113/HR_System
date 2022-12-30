package org.gdou.service.Impl;

import org.gdou.dao.IUserDao;
import org.gdou.domain.User;
import org.gdou.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("userService")
public class IUserServiceImpl implements IUserService
{
    // 注入dao
    @Autowired
    private IUserDao userDao;

    // 添加用户
    @Override
    public Boolean addUser(User user)
    {
        userDao.addUser(user);

        return true;
    }

    // 删除用户
    @Override
    public Boolean deleteUser(Integer userId)
    {
        userDao.deleteUser(userId);

        return true;
    }

    // 更新用户
    @Override
    public Boolean updateUser(User user)
    {
        userDao.updateUser(user);

        return true;
    }

    // 查询一个用户
    @Override
    public User findUserById(Integer userId)
    {
        // System.out.println("userService：findUserById");
        return userDao.findUserById(userId);
        // System.out.println(user + "\n");
    }

    // 查询所有用户
    @Override
    public List<User> findAllUser()
    {
        return userDao.findAllUser();
        // System.out.println("所有用户信息：");
        // System.out.println(allUser + "\n");
    }


}
