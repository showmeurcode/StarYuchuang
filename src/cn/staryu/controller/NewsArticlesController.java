package cn.staryu.controller;

import cn.staryu.service.news_articles.NewsArticlesService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/newsAtricles")
public class NewsArticlesController {

    @Resource
    NewsArticlesService newsArticlesService;

}
