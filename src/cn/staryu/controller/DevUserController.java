package cn.staryu.controller;

import cn.staryu.pojo.DevUser;
import cn.staryu.service.dev_user.DevUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


/**
 * @author kongxiangzhong
 * 2017/12/19 14:27
 */
@Controller
@RequestMapping("/devuser")
public class DevUserController {

    @Resource
    DevUserService devUserService;

    @RequestMapping(value="/login")//登录
    public String login(@ModelAttribute("devUser") DevUser devUser , HttpSession session, HttpServletRequest request){
        DevUser devUser1=null;
        try {
            devUser1=devUserService.finduserLogin(devUser.getDevName(),devUser.getDevPassword());
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(devUser1 != null){
            //放入session
            session.setAttribute("devUserSession", devUser1);


            return "developer/frame";
        }else{
            request.setAttribute("error","用户名或密码不正确！");

            return "developer/login";
        }


    }
    @RequestMapping("/loginout")
    public String loginout(HttpServletRequest request){//登出
        //    注销用户，使session失效。
        request.getSession().removeAttribute("devUserSession");

        return "developer/login";
    }










}
