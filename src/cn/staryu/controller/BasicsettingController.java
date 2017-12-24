package cn.staryu.controller;

import cn.staryu.pojo.Basicsetting;
import cn.staryu.service.basicsetting.BasicsettingService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author zwy
 * 2017/12/20 上午 10:19
 */
@Controller
@RequestMapping("/basicsetting")
public class BasicsettingController {
    @Resource
    BasicsettingService basicsettingService;

    //添加
    @RequestMapping("/addBasicsetting")
    @ResponseBody
    public Object addBasicsetting(Basicsetting basicsetting){
        int rest=0;
        try {
            rest=basicsettingService.addBasicsetting(basicsetting);

        } catch (Exception e) {
            e.printStackTrace();
        }
        if(rest>0){
            return "{\"status\":\"添加成功！\"}";
        }


        return "{\"status\":\"添加失败！\"}";
    }

    //修改
    @RequestMapping("/changeBasicsetting")
    @ResponseBody
    public Object changeBasicsetting(Basicsetting basicsetting){
        int rest=0;
        try {
            rest=basicsettingService.updateBasicsetting(basicsetting);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (rest>0){
            return "{\"status\":\"修改成功！\"}";
        }
        return "{\"status\":\"修改失败！\"}";
    }
    
    //删除
    @RequestMapping("/delBasicsetting")
    @ResponseBody
    public Object delBasicsetting(String id){
        int result=0;
        try {
            result=basicsettingService.delBasicsettingByid(Integer.valueOf(id));
        } catch (Exception e) {
            e.printStackTrace();
        }

        if(result>0){
            return "{\"status\":\"删除成功！\"}";
        }else {
            return "{\"status\":\"删除失败！\"}";
        }
    }

    //查看
    @RequestMapping("/findBasicsetting")
    public String findBasicsetting(Model model){
        Basicsetting basicsetting=new Basicsetting();
        List<Basicsetting> list=new ArrayList<Basicsetting>();
        try {
            list=basicsettingService.findBasicsettingsByinfo(basicsetting);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("basicsettingList",list);
        return "backend/BasiceManage";
    }

    //根据id查看
    @RequestMapping("/findBasicsettingbyid")
    public String findBasicsettingbyid(String id){
        Basicsetting rest=null;
        try {
            rest=basicsettingService.findBasicsettingByid(Integer.valueOf(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }
}
