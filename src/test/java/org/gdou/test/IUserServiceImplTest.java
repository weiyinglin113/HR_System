package org.gdou.test;

import org.gdou.domain.User;
import org.gdou.service.IUserService;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import static org.junit.Assert.*;

public class IUserServiceImplTest
{
    ApplicationContext ac = new ClassPathXmlApplicationContext("springmvc.xml");
    IUserService userService = ac.getBean("userService", IUserService.class);

    @Test
    public void addUser()
    {
        userService.addUser(new User(null, "admin", "admin", "1229655503@qq.com", null));
    }

    @Test
    public void deleteUser()
    {
    }

    @Test
    public void updateUser()
    {
    }

    @Test
    public void findUserById()
    {
    }

    @Test
    public void findAllUser()
    {
    }
}