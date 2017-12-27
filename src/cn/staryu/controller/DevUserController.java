package cn.staryu.controller;

import cn.staryu.pojo.DevUser;
import cn.staryu.service.dev_user.DevUserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


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

            return "pre/index";
        }else{
            request.setAttribute("error","用户名或密码不正确！");

            return "prelogin";
        }


    }
    @RequestMapping("/loginout")
    public String loginout(HttpServletRequest request){//登出
        //    注销用户，使session失效。
        request.getSession().removeAttribute("devUserSession");

        return "prelogin";
    }

    @RequestMapping("/adduser")//添加用户
    public String addUser(@ModelAttribute("devUser") DevUser devUser){

        return "pre/AddUser";

    }
    @RequestMapping("/usersave")//保存用户
    public String addUsersave(DevUser devUser){
        int result=0;
        try {
            result=devUserService.addUser(devUser);

            if(result>0){

                return "pre/addUsersave";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "pre/useradd";


    }

    @RequestMapping("/deleteuser")//删除用户
    public String delete(String id,Model model){
        int result=0;

        try {
            result = devUserService.deleteUser(Integer.parseInt(id));

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
    public String getUserById(@RequestParam String id, Model model){

        try {
            DevUser devUser=devUserService.findUserById(Integer.parseInt(id));

            model.addAttribute(devUser);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "pre/updateUser";

    }
    @RequestMapping("/userupdatesave")//修改保存
    public String updateusersave( DevUser devUser){

        int result=0;

        try {
            devUser.setRegisterDate(new Date());
            result=devUserService.updateUser(devUser);

            if(result>0){

                return "pre/update";

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "pre/updateUser";

    }

@RequestMapping("/select")//根据用户名查询用户信息
    public String select(@RequestParam String devName,Model model){

        DevUser devUser=new DevUser();

    try {

        devUser= devUserService.findUserByname(devName);
        model.addAttribute("devUser",devUser);

    } catch (Exception e) {
        e.printStackTrace();
    }
    return "查询页面";

}


@RequestMapping("/selectfindUser")//查询所有用户
    public String selectfindUser(Model model,DevUser devUser){

    List<DevUser> devUserList=new ArrayList<>();

    try {
        devUserList= devUserService.findAllDevUser(devUser);
        model.addAttribute("devUserList",devUserList);
    } catch (Exception e) {
        e.printStackTrace();
    }
    return "pre/UserManage";


}



}
