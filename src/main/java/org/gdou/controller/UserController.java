package org.gdou.controller;

import org.gdou.domain.User;
import org.gdou.service.IUserService;
import org.gdou.util.creatcode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController
{
    @Autowired
    private IUserService userService;

    // 用户登录
    @RequestMapping("/login")
    public String login(User user, HttpSession session)
    {

        List<User> list = userService.findAllUser();

        for (User user1 : list)
        {
            if (user.getUsername().equals(user1.getUsername()) && user.getPassword().equals(user1.getPassword())){

//                creatcode code=new creatcode();
//              String randomcode= creatcode.getCurrentDateStr();
//                session.setAttribute("randomcode",randomcode);
                // 将对象添加进去，以便在登录成功页面显示用户信息
                session.setAttribute("user", user1);
                return "user/index";
            }

        }

        return "../index";

    }

    // 用户注册
    @RequestMapping("/regist")
    public String regist(User user, RedirectAttributes attributes)
    {

        user.setRole("人事专员");

        if (userService.addUser(user))
        {
            attributes.addFlashAttribute("message", "sigUpSuccess");

            return "redirect:../userInfo/sendRedirect";
        }

        return null;
    }

    // 修改密码
    @RequestMapping("/updatePassword")
    public String updatePassword(User user, String newPassword)
    {
        System.out.println("updatePassword");
        System.out.println(user.toString());
        System.out.println("新密码：" + newPassword);

        List<User> list = userService.findAllUser();

        for (User user1 : list)
        {
            if (user.getUsername().equals(user1.getUsername()) && user.getPassword().equals(user1.getPassword()))
            {
                User user2 = user;
                user2.setPassword(newPassword);

                userService.updateUser(user2);

                return "updateSuccess";
            }

        }

        return "updateFail";
    }

    // 用户注销
    @RequestMapping("/logout")
    public String logout(HttpSession session)
    {
        session.removeAttribute("user");

        return "../index";
    }

}
