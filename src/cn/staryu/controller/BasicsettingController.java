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

    //添加后判断
    @RequestMapping("/addBasicsetting")
    public String addBasicsetting(Basicsetting basicsetting) {
        int rest = 0;
        try {
            rest = basicsettingService.addBasicsetting(basicsetting);

        } catch (Exception e) {
            e.printStackTrace();
        }
        if (rest > 0) {
            return "backend/basice/ShowBasice";
        }


        return "backend/basice/BasiceManage";
    }

    //修改
    @RequestMapping("/changeBasicsetting")
    public String changeBasicsetting(Basicsetting basicsetting) {
        int rest = 0;
        try {
            rest = basicsettingService.updateBasicsetting(basicsetting);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (rest > 0) {
            return "backend/basice/ShowBasice";
        }
        return "backend/basice/BasiceManage";
    }

    //删除
    @RequestMapping("/delBasicsetting")
    @ResponseBody
    public Object delBasicsetting(String id) {
        int result = 0;
        try {
            result = basicsettingService.delBasicsettingByid(Integer.valueOf(id));
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (result > 0) {
            return "{\"status\":\"删除成功！\"}";
        } else {
            return "{\"status\":\"删除失败！\"}";
        }
    }

    //查看
    @RequestMapping("/findBasicsetting")
    public String findBasicsetting(Model model) {
        Basicsetting basicsetting = new Basicsetting();
        List<Basicsetting> list = new ArrayList<Basicsetting>();
        try {
            list = basicsettingService.findBasicsettingsByinfo(basicsetting);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("basicsettingList", list);
        return "backend/basice/BasiceManage";
    }

    //根据id查看
    @RequestMapping("/findBasicsettingbyid")
    public String findBasicsettingbyid(String id) {
        Basicsetting rest = null;
        try {
            rest = basicsettingService.findBasicsettingByid(Integer.valueOf(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    //显示添加页面
    @RequestMapping("/addshowBasic")
    public String addshowBasic() {


        return "backend/basice/addBasice";
    }

    //显示修改页面
    @RequestMapping("/updateBasic")
    public String updateBasic(Model model,String id){
        Basicsetting basicsetting = null;
        try {
            basicsetting = basicsettingService.findBasicsettingByid(Integer.valueOf(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("BasicList",basicsetting);
        return "backend/basice/updateBasice";
    }

    //网络名称唯一性
    @RequestMapping("/nameSole")
    @ResponseBody
    public Object nameSole(String name){
        Basicsetting basicsetting = new Basicsetting();
        List<Basicsetting> list = new ArrayList<Basicsetting>();
        try {
            list = basicsettingService.findBasicsettingsByinfo(basicsetting);
        } catch (Exception e) {
            e.printStackTrace();
        }
        for (Basicsetting basicsetting1 : list) {
            if (basicsetting1.getName().equals(name)){
                return "{\"status\":\"error\"}";
            }
        }
        return "{\"status\":\"success\"}";
    }

    //网络地址唯一性
    @RequestMapping("/adressSole")
    @ResponseBody
    public Object adressSole(String adress){
        Basicsetting basicsetting = new Basicsetting();
        List<Basicsetting> list = new ArrayList<Basicsetting>();
        try {
            list = basicsettingService.findBasicsettingsByinfo(basicsetting);
        } catch (Exception e) {
            e.printStackTrace();
        }
        for (Basicsetting basicsetting1 : list) {
            if (basicsetting1.getAdress().equals(adress)){
                return "{\"status\":\"error\"}";
            }
        }
        return "{\"status\":\"success\"}";
    }
}