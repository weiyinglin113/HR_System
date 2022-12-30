package org.gdou.controller;

import org.gdou.domain.Conditions;
import org.gdou.domain.SalInfo;
import org.gdou.domain.UserInfo;
import org.gdou.service.SalInfoService;
import org.gdou.util.creatcode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.util.List;

@Controller
@RequestMapping("/salInfo")
public class salInfoController {


    @Autowired
    private SalInfoService salInfoService;


    @RequestMapping("/code")
    public String creatcode(creatcode creatcode, HttpSession session) {
        creatcode code = new creatcode();
        String randomcode = creatcode.getsalarycode();
        session.setAttribute("randomcode", randomcode);
        return "../salarysystem/salaryregister";
    }


    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @RequestMapping("/register")
    public String register(SalInfo salInfo, RedirectAttributes attributes) {
        salInfo.setRegister_time(new Timestamp(System.currentTimeMillis()));
        salInfoService.addSalInfo(salInfo);
        attributes.addFlashAttribute("message", "addSuccess");
        return "redirect:sendRedirect";
    }


    // 所有未通过复核的薪酬信息
    @RequestMapping("/check")
    public ModelAndView check() {
        ModelAndView modelAndView = new ModelAndView();
        List<SalInfo> salInfoList = salInfoService.queryCheckingSalInfo();
        modelAndView.addObject("salInfoList", salInfoList);
        modelAndView.setViewName("../salarysystem/salarycheck");
        return modelAndView;

    }

    // 通过复核
    @RequestMapping("/passCheck")
    public String passCheck(SalInfo salInfo, RedirectAttributes attributes) {

        salInfo.setCheck_salary_time(new Timestamp(System.currentTimeMillis()));

        salInfoService.updateSal(salInfo);

        attributes.addFlashAttribute("message", "checkSuccess");

        return "redirect:sendRedirect";

    }

    // 查询员工信息
    @RequestMapping("/querySal")
    public ModelAndView querySal(Conditions conditions, String message) {
        ModelAndView modelAndView = new ModelAndView();
//       条件为空，查询所有已通过复核的薪酬信息
        if (conditionsIsNull(conditions)) {
            List<Object> infoList = salInfoService.queryCheckedSalInfo();
            List<SalInfo> checkedSalInfoList = (List<SalInfo>) infoList.get(0);

            modelAndView.addObject("checkedSalInfoList", checkedSalInfoList);
            modelAndView.setViewName("../salarysystem/salarycheckedInfo");
        } else {
            List<Object> salDetails = salInfoService.querySalDetailsByConditons(conditions);
            List<SalInfo> salInfoListByConditions = (List<SalInfo>) salDetails.get(0);
            modelAndView.addObject("salinfoListByConditions", salInfoListByConditions);
            modelAndView.setViewName("../salarysystem/salarycheckedInfo");
        }


        return modelAndView;
    }


    @RequestMapping("/update")
    public ModelAndView update() {
        ModelAndView modelAndView = new ModelAndView();
        List<Object> infoList = salInfoService.queryCheckedSalInfo();
        List<SalInfo> checkedSalInfoList = (List<SalInfo>) infoList.get(0);
        modelAndView.addObject("checkedSalInfoList", checkedSalInfoList);
        modelAndView.setViewName("../salarysystem/updateSalInfo");
        return modelAndView;
    }

    //更新薪酬信息
    @RequestMapping("/updateInfo")
    public String updateSalInfo(SalInfo salInfo, RedirectAttributes attributes)
    {

        salInfoService.updateSalInfo(salInfo);

        attributes.addFlashAttribute("message", "updateSuccess");

        return "redirect:sendRedirect";

    }

    //conditonsIsNull判断
    private Boolean conditionsIsNull(Conditions conditions) {
        if (conditions.getSalaryId().equals("") && conditions.getXxx().equals("") && conditions.getStart_time().equals("") && conditions.getEnd_time().equals("")) {
            return true;
        }
        return false;
    }


    //    显示详细信息
    @RequestMapping("/showDetails")
    public ModelAndView showDetails(String salaryId, String message) {

        ModelAndView modelAndView = new ModelAndView();
        List<SalInfo> salDetails = salInfoService.querySalDetailsById(salaryId);
        SalInfo salInfo = (SalInfo) salDetails.get(0);
        modelAndView.addObject("salInfo", salInfo);


        if (message.equals("query")) {
            modelAndView.setViewName("archive/showUserDetails");
        } else if (message.equals("check")) {
            modelAndView.setViewName("../salarysystem/salarycheckOne");
        } else if (message.equals("update")) {
            modelAndView.setViewName("../salarysystem/updateSalDetails");
        } else if (message.equals("checked")) {
            modelAndView.addObject("message", "delete");
            modelAndView.setViewName("../salarysystem/showSalDetails");
        } else {
            modelAndView.addObject("message", "recover");
            modelAndView.setViewName("archive/showUserDetails");
        }

        return modelAndView;
    }

    // 处理重定向
    @RequestMapping("/sendRedirect")
    private ModelAndView sendRedirect(@ModelAttribute("message") String message) {
        System.out.println("sendRedirect");

        ModelAndView modelAndView = new ModelAndView();

        if (message.equals("addSuccess")) {
            modelAndView.clear();
            modelAndView.addObject("addSuccess", message);
            modelAndView.setViewName("../salarysystem/success");
        } else if (message.equals("checkSuccess")) {
            modelAndView.clear();
            modelAndView.addObject("checkSuccess", message);
            modelAndView.setViewName("../salarysystem/success");
        }else if(message.equals("updateSuccess")){
            modelAndView.clear();
            modelAndView.addObject("updateSuccess",message);
            modelAndView.setViewName("../salarysystem/success");
        }
        return modelAndView;
    }


}

