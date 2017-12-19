package cn.staryu.dao.news_articles;

import cn.staryu.pojo.NewsArticles;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface NewsArticlesMapper {

    /**
     * 添加文章的方法
     */
    int addArticles(NewsArticles newsArticles) throws Exception;

    /**
     * 根据id删除文章
     */
    int delArticles(@Param("id") Integer id) throws Exception;

    /**
     * 修改文章的方法
     */
    int updateArticles(NewsArticles newsArticles) throws Exception;

    /**
     * 根据id查询单个文章
     */
    NewsArticles findArticlesById(@Param("id") Integer id) throws Exception;

    /**
     * 根据分类id查询文章的方法
     * 根据文章名称模糊查询的方法
     * 根据作者模糊查询的方法
     * 查询全部文章
     */
    List<NewsArticles> findArticlesByInfo(NewsArticles newsArticles) throws Exception;


}
