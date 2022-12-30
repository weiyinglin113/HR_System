package org.gdou.controller;

import org.gdou.domain.Condition;
import org.gdou.domain.UserInfo;
import org.gdou.service.IUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/userInfo")
public class UserInfoController
{
    @Autowired
    private IUserInfoService userInfoService;

    // 登记页面
    @RequestMapping("/register")
    public String register(UserInfo userInfo, RedirectAttributes attributes)
    {
        System.out.println("register");

        String archiveId = String.format("%tY", new Date()) + "0" + userInfo.getFirst_mechaId() + "0" + userInfo.getSecond_mechaId() + "0" + userInfo.getThird_mechaId() + handleNumber();

        userInfo.setArchiveId(archiveId);
        userInfo.setCreate_archive_time(new Timestamp(System.currentTimeMillis()));

        System.out.println(userInfo);
        userInfoService.addUserInfo(userInfo);

        attributes.addFlashAttribute("message", "addSuccess");

        return "redirect:sendRedirect";
    }

    // 所有未通过复核的员工信息
    @RequestMapping("/check")
    public ModelAndView check()
    {
        System.out.println("check");

        ModelAndView modelAndView = new ModelAndView();
        List<Object> checkingUserList = userInfoService.queryCheckingUserInfo();

        List<UserInfo> checkUserList = (List<UserInfo>) checkingUserList.get(0);
        List<String> firstList = (List<String>) checkingUserList.get(1);
        List<String> secondList = (List<String>) checkingUserList.get(2);
        List<String> thirdList = (List<String>) checkingUserList.get(3);
        List<String> jobList = (List<String>) checkingUserList.get(4);

        modelAndView.addObject("checkUserList", checkUserList);
        modelAndView.addObject("firstList", firstList);
        modelAndView.addObject("secondList", secondList);
        modelAndView.addObject("thirdList", thirdList);
        modelAndView.addObject("jobList", jobList);
        modelAndView.setViewName("../archive/check");

        return modelAndView;

    }

    // 通过复核
    @RequestMapping("/passCheck")
    public String passCheck(UserInfo userInfo, RedirectAttributes attributes)
    {
        System.out.println("passCheck");

        userInfo.setCheck_archive_time(new Timestamp(System.currentTimeMillis()));
        System.out.println(userInfo);

        userInfoService.updateUser(userInfo);

        attributes.addFlashAttribute("message", "checkSuccess");

        return "redirect:sendRedirect";

    }

    // 查询员工信息
    @RequestMapping("/queryUser")
    public ModelAndView queryUser(Condition condition, String message)
    {
        System.out.println("queryUser");
        // System.out.println(conditionIsNull(condition));

        ModelAndView modelAndView = new ModelAndView();

        // 条件为空，查询所有已通过复核的员工信息
        if (conditionIsNull(condition))
        {
            List<Object> infoList = userInfoService.queryAllUserInfo();
            List<UserInfo> userInfoList = (List<UserInfo>) infoList.get(0);
            List<String> firstList = (List<String>) infoList.get(1);
            List<String> secondList = (List<String>) infoList.get(2);
            List<String> thirdList = (List<String>) infoList.get(3);
            List<String> jobList = (List<String>) infoList.get(4);

            modelAndView.addObject("userInfoList", userInfoList);
            modelAndView.addObject("firstList", firstList);
            modelAndView.addObject("secondList", secondList);
            modelAndView.addObject("thirdList", thirdList);
            modelAndView.addObject("jobList", jobList);

            if (message.equals("query"))
            {
                // 查询员工信息页面发过来的请求
                // 回到显示所有用户信息的页面
                modelAndView.setViewName("archive/showUserInfo");
            }
            else
            {
                modelAndView.setViewName("archive/updateUserInfo");
            }

        }
        else
        {
            List<Object> userDetails = userInfoService.queryUserByCondition(condition);
            List<UserInfo> userInfoList = (List<UserInfo>) userDetails.get(0);
            List<String> infoList = (List<String>) userDetails.get(1);

            modelAndView.addObject("userInfoList", userInfoList);
            modelAndView.addObject("infoList", infoList);

            if (message.equals("query"))
            {
                modelAndView.setViewName("archive/showUserInfo");
            }
            else
            {
                modelAndView.setViewName("archive/updateUserInfo");
            }

        }

        return modelAndView;
    }

    @RequestMapping("/queryDeleteUser")
    public ModelAndView queryDeleteUser(Condition condition)
    {
        System.out.println("queryDeleteUser");
        // System.out.println(conditionIsNull(condition));

        ModelAndView modelAndView = new ModelAndView();

        // 条件为空，查询所有已通过复核的员工信息
        if (conditionIsNull(condition))
        {
            List<Object> infoList = userInfoService.queryDeleteUserInfo();
            List<UserInfo> userInfoList = (List<UserInfo>) infoList.get(0);
            List<UserInfo> deleteUserInfoList = (List<UserInfo>) infoList.get(1);
            List<String> firstList = (List<String>) infoList.get(2);
            List<String> secondList = (List<String>) infoList.get(3);
            List<String> thirdList = (List<String>) infoList.get(4);
            List<String> jobList = (List<String>) infoList.get(5);

            modelAndView.addObject("userInfoList", userInfoList);
            modelAndView.addObject("deleteUserInfoList", deleteUserInfoList);
            modelAndView.addObject("firstList", firstList);
            modelAndView.addObject("secondList", secondList);
            modelAndView.addObject("thirdList", thirdList);
            modelAndView.addObject("jobList", jobList);

            modelAndView.setViewName("archive/deleteUserInfo");

        }
        else
        {
            List<Object> userDetails = userInfoService.queryDeleteUserByCondition(condition);
            List<UserInfo> userInfoList = (List<UserInfo>) userDetails.get(0);
            List<UserInfo> deleteUserInfoList = (List<UserInfo>) userDetails.get(1);
            List<String> infoList = (List<String>) userDetails.get(2);

            modelAndView.addObject("userInfoList", userInfoList);
            modelAndView.addObject("deleteUserInfoList", deleteUserInfoList);
            modelAndView.addObject("infoList", infoList);

            modelAndView.setViewName("archive/deleteUserInfo");

        }

        return modelAndView;

    }

    @RequestMapping("/showDetails")
    public ModelAndView showDetails(String archiveId, String message)
    {

        ModelAndView modelAndView = new ModelAndView();
        List<Object> userDetails = userInfoService.queryUserDetailsById(archiveId);

        UserInfo userInfo = (UserInfo) userDetails.get(0);
        List<String> InfoList = (List<String>) userDetails.get(1);

        modelAndView.addObject("userInfo", userInfo);
        modelAndView.addObject("InfoList", InfoList);

        if (message.equals("query"))
        {
            modelAndView.setViewName("archive/showUserDetails");
        }
        else if (message.equals("check"))
        {
            modelAndView.setViewName("../archive/checkOne");
        }
        else if (message.equals("update"))
        {
            modelAndView.setViewName("archive/updateUserDetails");
        }
        else if (message.equals("delete"))
        {
            modelAndView.addObject("message", "delete");
            modelAndView.setViewName("archive/showUserDetails");
        }
        else
        {
            modelAndView.addObject("message", "recover");
            modelAndView.setViewName("archive/showUserDetails");
        }

        return modelAndView;
    }

    @RequestMapping("/updateUserInfo")
    public String updateUserInfo(UserInfo userInfo, RedirectAttributes attributes)
    {
        System.out.println("updateUserInfo");

        userInfoService.updateUser(userInfo);

        attributes.addFlashAttribute("message", "updateSuccess");

        return "redirect:sendRedirect";

    }

    @RequestMapping("/deleteUserInfo")
    public String deleteUserInfo(String archiveId, RedirectAttributes attributes)
    {
        System.out.println("deleteUserInfo");

        userInfoService.deleteUserInfo(archiveId);

        attributes.addFlashAttribute("message", "deleteSuccess");

        return "redirect:sendRedirect";

    }

    @RequestMapping("/recoverUserInfo")
    public String recoverUserInfo(String archiveId, RedirectAttributes attributes)
    {
        System.out.println("recoverUserInfo");

        userInfoService.recoverUserInfo(archiveId);

        attributes.addFlashAttribute("message", "recoverSuccess");

        return "redirect:sendRedirect";
    }

    // 处理重定向
    @RequestMapping("/sendRedirect")
    private ModelAndView sendRedirect(@ModelAttribute("message") String message)
    {
        System.out.println("sendRedirect");

        ModelAndView modelAndView = new ModelAndView();

        if (message.equals("addSuccess"))
        {
            modelAndView.clear();
            modelAndView.addObject("addSuccess", message);
            modelAndView.setViewName("archive/success");
        }
        else if (message.equals("checkSuccess"))
        {
            modelAndView.clear();
            modelAndView.addObject("checkSuccess", message);
            modelAndView.setViewName("archive/success");
        }
        else if (message.equals("updateSuccess"))
        {
            modelAndView.clear();
            modelAndView.addObject("updateSuccess", message);
            modelAndView.setViewName("archive/success");
        }
        else if (message.equals("deleteSuccess"))
        {
            modelAndView.clear();
            modelAndView.addObject("deleteSuccess", message);
            modelAndView.setViewName("archive/success");
        }
        else if (message.equals("recoverSuccess"))
        {
            modelAndView.clear();
            modelAndView.addObject("recoverSuccess", message);
            modelAndView.setViewName("archive/success");
        }
        else if (message.equals("sigUpSuccess"))
        {
            modelAndView.clear();
            modelAndView.addObject("sigUpSuccess", message);
            modelAndView.setViewName("archive/success");
        }

        return modelAndView;
    }

    //
    private Boolean conditionIsNull(Condition condition)
    {
        if (condition.getFirst_mechaId() == 0 && condition.getSecond_mechaId() == 0 && condition.getThird_mechaId() == 0 && condition.getJob_classId() == 0 && condition.getJobId() == 0 && condition.getStart_time().equals("") && condition.getEnd_time().equals(""))
        {
            return true;
        }

        return false;
    }

    // 处理编号，小于10添0
    private String handleNumber()
    {
        int num = userInfoService.queryUserInfoCount();

        return num < 10 ? "0" + (num + 1) : "" + num;
    }

}
