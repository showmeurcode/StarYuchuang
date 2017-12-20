package cn.staryu.controller;

import cn.staryu.pojo.AdminUser;
import cn.staryu.service.admin_user.AdminUserService;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author kongxiangzhong
 * 2017/12/19 15:52
 */
public class AdminUserController {

    @Resource
    AdminUserService adminUserService;

    @RequestMapping(value="/login")//登录
    public String login(@ModelAttribute("adminUser") AdminUser adminUser , HttpSession session, HttpServletRequest request){
        AdminUser adminUser1=null;
        try {
            adminUser1=adminUserService.finduserLogin(adminUser.getAdminName(),adminUser.getAdminPassword());
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(adminUser1 != null){
            //放入session
            session.setAttribute("adminUserSession", adminUser1);


            return "developer/frame";
        }else{
            request.setAttribute("error","用户名或密码不正确！");

            return "backend/login";
        }


    }
    @RequestMapping("/loginout")
    public String loginout(HttpServletRequest request){//登出
        //    注销用户，使session失效。
        request.getSession().removeAttribute("adminUserSession");

        return "backend/login";
    }

}
