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
     * @param session
     * @param request
     * @param attach
     * @return
     */
    @RequestMapping("/addAtricles")
    @ResponseBody
    public Object addAtricles(NewsArticles newsArticles, HttpSession session, HttpServletRequest request,
                              @RequestParam(value = "picture",required = false) MultipartFile attach){

        if (!attach.isEmpty()) {
            String path = request.getSession().getServletContext().getRealPath("statics"+ File.separator+"uploadfiles");

            String oldFileName = attach.getOriginalFilename();//原文件名
            String prefix = FilenameUtils.getExtension(oldFileName);//原文件名后缀
            int filesize = 50000;
            if (attach.getSize() > filesize) { //上传大小不得超过50KB
                return "{\"status\":\"上传大小不得超过50KB\"}";
            } else if (prefix.equalsIgnoreCase("jpg")
                    || prefix.equalsIgnoreCase("png")
                    || prefix.equalsIgnoreCase("jpeg")) {
                String fileName = System.currentTimeMillis()+ RandomUtils.nextInt(1000000)+"_Personal.jpg";
                File targetFile = new File(path,fileName);
                if (!targetFile.exists()) {
                    targetFile.mkdirs();
                }
                //保存
                try {
                    attach.transferTo(targetFile);
                } catch (IOException e) {
                    e.printStackTrace();
                    request.setAttribute("uploadFileError","* 上传失败！");
                    return "{\"status\":\"上传失败！\"}";
                }
                String picture = path+File.separator+fileName;
                newsArticles.setPicture(picture);
            } else {
                request.setAttribute("uploadFileError","* 上传图片格式不正确");
                return "{\"status\":\"上传图片格式不正确！\"}";
            }
        }

        DevUser devUser = (DevUser) session.getAttribute("devUserSession");
        newsArticles.setAuthor(devUser.getDevName());
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
     * @param session
     * @param request
     * @param attach
     * @return
     */
    @RequestMapping("/updateAtricles")
    @ResponseBody
    public Object updateAtricles(NewsArticles newsArticles, HttpSession session, HttpServletRequest request,
                                 @RequestParam(value = "picture",required = false) MultipartFile attach){

        if (!attach.isEmpty()) {
            String path = request.getSession().getServletContext().getRealPath("statics"+ File.separator+"uploadfiles");

            String oldFileName = attach.getOriginalFilename();//原文件名
            String prefix = FilenameUtils.getExtension(oldFileName);//原文件名后缀
            int filesize = 50000;
            if (attach.getSize() > filesize) { //上传大小不得超过50KB
                return "{\"status\":\"上传大小不得超过50KB\"}";
            } else if (prefix.equalsIgnoreCase("jpg")
                    || prefix.equalsIgnoreCase("png")
                    || prefix.equalsIgnoreCase("jpeg")) {
                String fileName = System.currentTimeMillis()+ RandomUtils.nextInt(1000000)+"_Personal.jpg";
                File targetFile = new File(path,fileName);
                if (!targetFile.exists()) {
                    targetFile.mkdirs();
                }
                //保存
                try {
                    attach.transferTo(targetFile);
                } catch (IOException e) {
                    e.printStackTrace();
                    request.setAttribute("uploadFileError","* 上传失败！");
                    return "{\"status\":\"上传失败！\"}";
                }
                String picture = path+File.separator+fileName;
                newsArticles.setPicture(picture);
            } else {
                request.setAttribute("uploadFileError","* 上传图片格式不正确");
                return "{\"status\":\"上传图片格式不正确！\"}";
            }
        }

        DevUser devUser = (DevUser) session.getAttribute("devUserSession");
        newsArticles.setAuthor(devUser.getDevName());
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
     * @param model
     * @return
     */
    @RequestMapping("/showAllAtricles")
    public String findAllAtricles(Model model){
        NewsArticles newsArticles = new NewsArticles();
        List<NewsArticles> list = new ArrayList<NewsArticles>();
        try {
            list = newsArticlesService.findArticlesByInfo(newsArticles);
        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("atriclesList",list);
        return "新闻列表页面";
    }

    /**
     * 根据新闻ID查看具体单个新闻页面
     * @param model
     * @param id
     * @return
     */
    @RequestMapping("/showAtriclesByID")
    public String findAtriclesByID(Model model,String id){
        NewsArticles newsArticles = new NewsArticles();
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
        newsArticles.setClassifyid(Integer.valueOf(classifyId));
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
        return "添加页面";
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
        NewsArticles newsArticles = new NewsArticles();

        try {
            newsArticles = newsArticlesService.findArticlesById(Integer.valueOf(id));
            list = newsClassifyService.findClassifyByInfo(newsClassify);
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("newsArticles",newsArticles);
        model.addAttribute("newsClassifyList",list);
        return "修改页面";
    }

}
