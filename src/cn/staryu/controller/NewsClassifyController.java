package cn.staryu.controller;

import cn.staryu.pojo.NewsClassify;
import cn.staryu.service.news_classify.NewsClassifyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author ligaoshan
 * 2017/12/20 13:13
 */
@Controller
@RequestMapping("/newsClassify")
public class NewsClassifyController {

    @Resource
    private  NewsClassifyService newsClassifyService;

    /**
     * 添加新闻分类保存
     * @param newsClassify
     * @return
     */
    @RequestMapping("/addClassify")
    @ResponseBody
    public Object addClassify(NewsClassify newsClassify){
        int result = 0;
        try {
            result = newsClassifyService.addClassify(newsClassify);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (result>0) {
            return "{\"status\":\"success\"}";
        } else {
            return "{\"status\":\"error\"}";
        }
    }

    /**
     * 根据id删除新闻分类
     * @param id
     * @return
     */
    @RequestMapping("/delClassify")
    @ResponseBody
    public Object delClassify(String id){
        int result = 0;
        try {
            result = newsClassifyService.delClassify(Integer.valueOf(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(result>0){
            return "{\"status\":\"success\"}";
        }else {
            return "{\"status\":\"error\"}";
        }
    }

    /**
     * 修改新闻分类保存
     * @param newsClassify
     * @return
     */
    @RequestMapping("/updateClassify")
    @ResponseBody
    public Object updateClassify(NewsClassify newsClassify){
        int result = 0;
        try {
            result = newsClassifyService.updateClassify(newsClassify);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (result>0) {
            return "{\"status\":\"success\"}";
        } else {
            return "{\"status\":\"error\"}";
        }
    }

    /**
     * 显示所有新闻分类列表
     * @param model
     * @return
     */
    @RequestMapping("/showClassify")
    public String showAllClassify(Model model){
        NewsClassify newsClassify = new NewsClassify();
        List<NewsClassify> list = new ArrayList<NewsClassify>();
        try {
            list = newsClassifyService.findClassifyByInfo(newsClassify);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("newsClassifyList",list);
        return "新闻分类列表";
    }

    /**
     * 新闻分类修改页面
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/update")
    public String updatePage(Model model,String id){
        NewsClassify newsClassify = null;
        try {
            newsClassify = newsClassifyService.findClassifyById(Integer.valueOf(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("newsClassify",newsClassify);
        return "修改页面";
    }

}
