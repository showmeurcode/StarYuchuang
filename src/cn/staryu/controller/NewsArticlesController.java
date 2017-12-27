package cn.staryu.controller;

import cn.staryu.pojo.DevUser;
import cn.staryu.pojo.NewsArticles;
import cn.staryu.pojo.NewsClassify;
import cn.staryu.service.news_articles.NewsArticlesService;
import cn.staryu.service.news_classify.NewsClassifyService;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/newsAtricles")
public class NewsArticlesController {

    @Resource
    NewsArticlesService newsArticlesService;

    @Resource
    NewsClassifyService newsClassifyService;

    /**
     * 添加新闻的保存操作
     * @param newsArticles
//     * @param session
     * @return
     */
    @RequestMapping("/addAtricles")
    @ResponseBody
    public Object addAtricles(NewsArticles newsArticles){

//        DevUser devUser = (DevUser) session.getAttribute("devUserSession");
//        newsArticles.setAuthor(devUser.getDevName());
        newsArticles.setAuthor("test00");
        newsArticles.setPuttime(new Date());
        newsArticles.setCount(0);
        int result = 0;
        try {
            result = newsArticlesService.addArticles(newsArticles);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(result > 0){
            return "{\"status\":\"success\"}";
        }
        return "{\"status\":\"未知错误！\"}";

    }

    /**
     * 根据id删除新闻
     * @param id
     * @return
     */
    @RequestMapping("/delAtricles")
    @ResponseBody
    public Object delAtricles(Integer id){

        int result = 0;
        try {
            result = newsArticlesService.delArticles(id);
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
     * 更改新闻保存操作
     * @param newsArticles
//     * @param session
     * @return
     */
    @RequestMapping("/updateAtricles")
    @ResponseBody
    public Object updateAtricles(NewsArticles newsArticles){

//        DevUser devUser = (DevUser) session.getAttribute("devUserSession");
//        newsArticles.setAuthor(devUser.getDevName());
        newsArticles.setAuthor("test00");
        newsArticles.setPuttime(new Date());
        newsArticles.setCount(0);
        int result = 0;
        try {
            result = newsArticlesService.updateArticles(newsArticles);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if(result > 0){
            return "{\"status\":\"success\"}";
        }
        return "{\"status\":\"未知错误！\"}";

    }

    /**
     * 显示所有新闻列表
     * @return
     */
    @RequestMapping("/showAtricleslist")
    public String showAtricleslist(){
        return "backend/newsArticles/newslist";
    }

    /**
     * 根据新闻ID查看具体单个新闻页面
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/showAtriclesByID")
    public String findAtriclesByID(Model model,String id){
        NewsArticles newsArticles = null;
        try {
            newsArticles = newsArticlesService.findArticlesById(Integer.valueOf(id));
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("newsArticles",newsArticles);
        return "单个新闻查看页面";
    }

    /**
     * 根据分类显示该分类下的新闻列表页面
     * @param model
     * @param classifyId
     * @return
     */
    @RequestMapping("/showAtriclesByClassify")
    public String findAtriclesByClassify(Model model,String classifyId){
        NewsArticles newsArticles = new NewsArticles();
        newsArticles.setClassifyId(Integer.valueOf(classifyId));
        List<NewsArticles> list = new ArrayList<NewsArticles>();
        try {
            list = newsArticlesService.findArticlesByInfo(newsArticles);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("atriclesList",list);
        return "某分类新闻列表";
    }

    /**
     * 添加文章的页面
     * @param model
     * @return
     */
    @RequestMapping("/add")
    public String addPage(Model model){
        List<NewsClassify> list = new ArrayList<NewsClassify>();
        NewsClassify newsClassify = new NewsClassify();
        try {
            list = newsClassifyService.findClassifyByInfo(newsClassify);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("newsClassifyList",list);
        return "backend/newsArticles/addNewsArticles";
    }

    /**
     * 修改文章的页面
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/update")
    public String updatePage(Model model,String id){
        List<NewsClassify> list = new ArrayList<NewsClassify>();
        NewsClassify newsClassify = new NewsClassify();
        NewsArticles newsArticles = null;

        try {
            newsArticles = newsArticlesService.findArticlesById(Integer.valueOf(id));
            list = newsClassifyService.findClassifyByInfo(newsClassify);
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("newsArticles",newsArticles);
        model.addAttribute("newsClassifyList",list);
        return "backend/newsArticles/updateNewsArticles";
    }


    @RequestMapping("/showAllArticles")
    @ResponseBody
    public Object showAllArticles(){
        StringBuffer html = new StringBuffer("");

        List<NewsArticles> list = new ArrayList<>();
        NewsArticles newsArticles = new NewsArticles();

        try {
            list = newsArticlesService.findArticlesByInfo(newsArticles);
        } catch (Exception e) {
            e.printStackTrace();
        }
        for (NewsArticles articles:list) {
            html.append(" <tr>" +
                    "                                            <td>"+articles.getId()+"</td>" +
                    "                                            <td>"+articles.getTitle()+"</td>" +
                    "                                            <td><a class='btn btn-primary btn-sm' href='#' onclick='edittype("+articles.getId()+")'>&#x7F16;&#x8F91;</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class='btn btn-danger btn-sm' href='#' onclick='del("+articles.getId()+")'>&#x5220;&#x9664;</a></td>" +
                    "                                        </tr>");
        }

        return html.toString();
    }


}
