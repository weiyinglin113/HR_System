package org.gdou.dao;

import org.gdou.domain.User;

import java.util.List;

public interface IUserDao
{
    public Boolean addUser(User user);

    public Boolean deleteUser(Integer userId);

    public Boolean updateUser(User user);

    public User findUserById(Integer id);

    public List<User> findAllUser();

}
