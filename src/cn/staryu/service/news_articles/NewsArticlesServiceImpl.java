package cn.staryu.service.news_articles;


import cn.staryu.dao.news_articles.NewsArticlesMapper;
import cn.staryu.pojo.NewsArticles;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Service("newsArticlesService")
public class NewsArticlesServiceImpl implements NewsArticlesService {

    @Resource
    private NewsArticlesMapper newsArticlesMapper;

    @Override
    public int addArticles(NewsArticles newsArticles) throws Exception {
        return newsArticlesMapper.addArticles(newsArticles);
    }

    @Override
    public int delArticles(Integer id) throws Exception {
        return newsArticlesMapper.delArticles(id);
    }

    @Override
    public int updateArticles(NewsArticles newsArticles) throws Exception {
        return newsArticlesMapper.updateArticles(newsArticles);
    }

    @Override
    public NewsArticles findArticlesById(Integer id) throws Exception {
        return newsArticlesMapper.findArticlesById(id);
    }

    @Override
    public List<NewsArticles> findArticlesByInfo(NewsArticles newsArticles) throws Exception {
        List<NewsArticles> list = new ArrayList<NewsArticles>();
        list = newsArticlesMapper.findArticlesByInfo(newsArticles);
        if (list.size() == 0) {
            list = null;
        }
        return list;
    }
}
