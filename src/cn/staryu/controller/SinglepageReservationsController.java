package cn.staryu.controller;

import cn.staryu.pojo.SinglepageReservations;
import cn.staryu.service.singlepage_reservations.SinglepageReservationsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author zwy
 * 2017/12/20 上午 10:20
 */
@Controller
@RequestMapping("/singlepageReservations")
public class SinglepageReservationsController {
    @Resource
    SinglepageReservationsService singlepageReservationsService;

    //添加后判断
    @RequestMapping("/addSinglepageReservations")
    public String addSinglepageReservations(SinglepageReservations singlepageReservations){
        int rest=0;
        try {
            rest=singlepageReservationsService.addSinglepageReservations(singlepageReservations);

        } catch (Exception e) {
            e.printStackTrace();
        }
        if(rest>0){
            return "backend/sing/ShowSing";
        }


        return "backend/sing/SingManage";
    }

    //修改
    @RequestMapping("/changeSinglepageReservations")
    public String changeSinglepageReservations(SinglepageReservations singlepageReservations){
        int rest=0;
        try {
            rest=singlepageReservationsService.updateSinglepageReservations(singlepageReservations);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (rest>0){
            return "backend/sing/ShowSing";
        }
        return "backend/sing/SingManage";
    }

    //删除
    @RequestMapping("/delSinglepageReservationsg")
    @ResponseBody
    public Object delSinglepageReservationsg(String id){
        int result=0;
        try {
            result=singlepageReservationsService.delSinglepageReservationsByid(Integer.valueOf(id));
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
    @RequestMapping("/findSinglepageReservations")
    public String findSinglepageReservations(Model model){
        SinglepageReservations singlepageReservations=new SinglepageReservations();
        List<SinglepageReservations> list=new ArrayList<SinglepageReservations>();
        try {
            list=singlepageReservationsService.findSinglepageReservationsInfo(singlepageReservations);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("singlepageReservationsList",list);
        return "backend/sing/SingManage";
    }

    //根据id查看
    @RequestMapping("/findSinglepageReservationsByid")
    public String findSinglepageReservationsByid(String id){
        SinglepageReservations rest=null;
        try {
            rest=singlepageReservationsService.findSinglepageReservationsByid(Integer.valueOf(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    //增加显示
    @RequestMapping("/addshowSing")
    public String addshowSing(){
        return "backend/sing/addSing";
    }

    //显示修改页面
    @RequestMapping("/updateSing")
    public String updateSing(Model model,String id){
        SinglepageReservations singlepageReservations = null;
        try {
            singlepageReservations = singlepageReservationsService.findSinglepageReservationsByid(Integer.valueOf(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("SingList",singlepageReservations);
        return "backend/sing/updateSing";
    }

}
