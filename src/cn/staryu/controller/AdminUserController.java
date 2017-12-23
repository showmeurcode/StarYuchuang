package cn.staryu.controller;

import cn.staryu.pojo.AdminUser;
import cn.staryu.service.admin_user.AdminUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @author kongxiangzhong
 * 2017/12/19 15:52
 */
@Controller
@RequestMapping("/adminuser")
public class AdminUserController {

    @Resource
    AdminUserService adminUserService;

    @RequestMapping(value="/Blogin")//登录
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


            return "backend/index";
        }else{
            request.setAttribute("error","用户名或密码不正确！");

            return "/login";
        }


    }
    @RequestMapping("/loginout")
    public String loginout(HttpServletRequest request){//登出
        //    注销用户，使session失效。
        request.getSession().removeAttribute("adminUserSession");

        return "backend/login";
    }

    @RequestMapping("/adduser")//添加用户
    public String addUser(@ModelAttribute("adminUser") AdminUser adminUser){

        return "adminUser/useradd";

    }
    @RequestMapping("/addusersave")//保存用户
    public String addUsersave(AdminUser adminUser){
        int result=0;
        try {
            result=adminUserService.addUser(adminUser);

            if(result>0){

                return "adminUser/addsave";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "adminUser/useradd";


    }

    @RequestMapping("/delete")//删除管理
    public String delete(String id){
        int result=0;

        try {
            result = adminUserService.deleteUser(Integer.parseInt(id));
            if (result>0){

                return  "删除成功";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return  "删除页面";


    }

    @RequestMapping("/upeateUserbyid")//获取用户信息
    public String getUserById(@RequestParam String id, Model model){

        try {
            AdminUser adminUser=adminUserService.findUserById(Integer.parseInt(id));

            model.addAttribute(adminUser);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "修改页";

    }
    @RequestMapping("/upeateUser")//修改保存
    public String updateadminsave(@ModelAttribute("adminUser") AdminUser adminUser){

        int result=0;

        try {
            result=adminUserService.updateUser(adminUser);

            if(result>0){
                return "用户列表页";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "修改页";

    }

    @RequestMapping("/select")//根据用户名查询用户信息
    public String select(@RequestParam String adminName,Model model){

        AdminUser adminUser=null;

        try {
            adminUser= adminUserService.findUserByname(adminName);
            model.addAttribute("adminUser",adminUser);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "查询页面";

    }

    @RequestMapping("/selectfindUser")//查询所有用户
    public String selectfindUser(Model model,AdminUser adminUser){

        List<AdminUser> adminUserList=new ArrayList<>();

        try {
            adminUserList= adminUserService.findAllBackendUser(adminUser);
            model.addAttribute("adminUserList",adminUserList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "显示用户集合页面";

    }


}
