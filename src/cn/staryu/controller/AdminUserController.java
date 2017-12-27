package cn.staryu.controller;

import cn.staryu.pojo.AdminUser;
import cn.staryu.service.admin_user.AdminUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
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
    public String Blogin(@ModelAttribute("adminUser") AdminUser adminUser , HttpSession session, HttpServletRequest request){
        AdminUser adminUser1=null;
        try {
            adminUser1=adminUserService.findUserLogin(adminUser.getAdminName(),adminUser.getAdminPassword());
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(adminUser1 != null){
            //放入session
            session.setAttribute("adminUserSession", adminUser1);


            return "backend/index";
        }else{
            request.setAttribute("error","用户名或密码不正确！");

            return "adminlogin";
        }


    }
    @RequestMapping("/Bloginout")
    public String loginout(HttpServletRequest request){//登出
        //    注销用户，使session失效。
        request.getSession().removeAttribute("adminUserSession");

        return "adminlogin";
    }




    @RequestMapping("/adduser")//添加用户
    public Object addUser(@ModelAttribute("adminUser") AdminUser adminUser){

        return "backend/AddUser";

    }
    @RequestMapping("/usersave")//保存用户
    public Object addUsersave( AdminUser adminUser){
        int result=0;

        try {
            adminUser.setRegisterDate(new Date());
            result=adminUserService.addUser(adminUser);

            if(result>0){

                return "backend/addUsersave";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "backend/AddUser";


    }

    @RequestMapping("/deleteuser")//删除
    @ResponseBody
    public Object delete(@RequestParam String id){
        int result=0;

        try {

            result = adminUserService.deleteUser(Integer.parseInt(id));

        } catch (Exception e) {
            e.printStackTrace();
        }
        if(result>0){
            return "{\"status\":\"success\"}";
        }else {
            return "{\"status\":\"error\"}";
        }



    }

    @RequestMapping("/upeateUserbyid")//获取用户信息
    public String  getUserById(@RequestParam String id, Model model){

        try {
            AdminUser adminUser=adminUserService.findUserById(Integer.parseInt(id));

            model.addAttribute(adminUser);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "backend/updateUser";

    }
    @RequestMapping("/userupdatesave")//修改数据保存
    public String userupdatesave(AdminUser adminUser, HttpSession session){

        int result=0;

        try {
            adminUser.setModifyBy(((AdminUser)session.getAttribute("adminUserSession")).getId());
            adminUser.setRegisterDate(new Date());

            result=adminUserService.updateUser(adminUser);

            if(result>0){

                return "backend/update";

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "backend/updateUser";

    }

    @RequestMapping("/select")//根据用户名查询用户信息
    public String select(@RequestParam String adminName,Model model){

        AdminUser adminUser=null;
        boolean data=true;

        try {
            adminUser= adminUserService.findUserByname(adminName);

            model.addAttribute(adminUser);
            if(adminName.equals("")&&adminName==null){

                data=false;

                return ""+data;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return ""+data;

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
        return "backend/CustomerManage";

    }


}
