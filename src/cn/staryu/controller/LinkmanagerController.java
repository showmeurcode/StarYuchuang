package cn.staryu.controller;

import cn.staryu.pojo.Linkmanager;
import cn.staryu.service.linkmanager.LinkmanagerService;
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
@RequestMapping("/linkmanager")
public class LinkmanagerController {
    @Resource
    LinkmanagerService linkmanagerService;

    //增加后判断
    @RequestMapping("/addLinkmanager")
    public String addLinkmanager(Linkmanager linkmanager) {
        int rest = 0;
        try {
            rest = linkmanagerService.addLinkmanager(linkmanager);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (rest > 0) {
            return "backend/link/ShowLink";
        }


        return "backend/link/LinkManage";
    }

    //修改
    @RequestMapping("/changeLinkmanager")
    public String changeLinkmanager(Linkmanager linkmanager) {
        int rest = 0;
        try {
            rest = linkmanagerService.updateLinkmanager(linkmanager);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (rest > 0) {
            return "backend/link/ShowLink";
        }
        return "backend/link/LinkManage";

    }

    //删除
    @RequestMapping("/delLinkmanager")
    @ResponseBody
    public Object delLinkmanager(String id) {
        int result = 0;
        try {
            result = linkmanagerService.delLinkmanagerByid(Integer.valueOf(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (result > 0) {
            return "{\"status\":\"删除成功！\"}";
        }
        return "{\"status\":\"删除失败！\"}";

    }

    //查看
    @RequestMapping("/findLinkmanager")
    public String findLinkmanager(Model model) {
        Linkmanager linkmanager = new Linkmanager();
        List<Linkmanager> list = new ArrayList<Linkmanager>();
        try {
            list = linkmanagerService.findLinkmanagerInfo(linkmanager);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("linkmanagerList", list);
        return "backend/link/LinkManage";
    }

    //根据id查看
    @RequestMapping("/findLinkmanagerByid")
    public String findLinkmanagerByid(String id) {
        Linkmanager rest = null;
        try {
            rest = linkmanagerService.findLinkmanagerByid(Integer.valueOf(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    //添加显示
    @RequestMapping("/addshowLink")
    public String addshowLink() {


        return "backend/link/addLink";
    }

    //显示修改页面
    @RequestMapping("/updateLink")
    public String updateLink(Model model, String id) {
        Linkmanager linkmanager = null;
        try {
            linkmanager = linkmanagerService.findLinkmanagerByid(Integer.valueOf(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("LinkList", linkmanager);
        return "backend/link/updateLink";
    }

    //网站名称唯一性
    @RequestMapping("/nameSole")
    @ResponseBody
    public Object nameSole(String name) {
        Linkmanager linkmanager = new Linkmanager();
        List<Linkmanager> list = new ArrayList<Linkmanager>();
        try {
            list = linkmanagerService.findLinkmanagerInfo(linkmanager);
        } catch (Exception e) {
            e.printStackTrace();
        }
        for (Linkmanager linkmanager1 : list) {
            if (linkmanager1.getName().equals(name)) {
                return "{\"status\":\"error\"}";
            }
        }
        return "{\"status\":\"success\"}";
    }

    //网络地址唯一性
    @RequestMapping("/linkSole")
    @ResponseBody
    public Object linkSole(String link) {
        Linkmanager linkmanager = new Linkmanager();
        List<Linkmanager> list = new ArrayList<Linkmanager>();
        try {
            list = linkmanagerService.findLinkmanagerInfo(linkmanager);
        } catch (Exception e) {
            e.printStackTrace();
        }
        for (Linkmanager linkmanager1 : list) {
            if (linkmanager1.getLink().equals(link)) {
                return "{\"status\":\"error\"}";
            }
        }
        return "{\"status\":\"success\"}";
    }
}