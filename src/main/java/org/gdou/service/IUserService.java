package org.gdou.service;

import org.gdou.domain.User;

import java.util.List;

public interface IUserService
{
    public Boolean addUser(User user);

    public Boolean deleteUser(Integer userId);

    public Boolean updateUser(User user);

    public User findUserById(Integer userId);

    public List<User> findAllUser();
}
