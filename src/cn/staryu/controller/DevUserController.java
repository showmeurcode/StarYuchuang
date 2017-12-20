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

    @RequestMapping("/adduser")//添加用户
    public String addUser(@ModelAttribute("devUser") DevUser devUser){

        return "deleloper/useradd";

    }
    @RequestMapping("addusersave")//保存用户
    public String addUsersave(DevUser devUser){
        int result=0;
        try {
            result=devUserService.addUser(devUser);

            if(result>0){

                return "deleloper/addsave";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "deleloper/useradd";


    }

    @RequestMapping("delete")//删除用户
    public String delete(String id,Model model){
        int result=0;

        try {
            result = devUserService.deleteUser(Integer.parseInt(id));
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
            DevUser devUser=devUserService.findUserById(Integer.parseInt(id));

            model.addAttribute(devUser);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "修改页";

    }
    @RequestMapping("/upeateUser")//修改保存
    public String updateusersave(@ModelAttribute("devUser") DevUser devUser){

        int result=0;

        try {
            result=devUserService.updateUser(devUser);

            if(result>0){

                return "用户列表页";

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "修改页";

    }

@RequestMapping("select")//根据用户名查询用户信息
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


@RequestMapping("selectfindUser")//查询所有用户
    public String selectfindUser(Model model,DevUser devUser){

    List<DevUser> devUserList=new ArrayList<>();

    try {
        devUserList= devUserService.findAllDevUser(devUser);
        model.addAttribute("devUserList",devUserList);
    } catch (Exception e) {
        e.printStackTrace();
    }
    return "显示用户集合页面";


}



}
