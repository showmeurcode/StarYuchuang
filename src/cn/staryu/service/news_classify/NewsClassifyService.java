package cn.staryu.service.news_classify;

import cn.staryu.pojo.NewsClassify;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author ligaoshan
 * 2017/12/19 14:41
 */
public interface NewsClassifyService {

    /**
     * 添加新闻分类
     * @param newsClassify
     * @return
     */
    int addClassify(NewsClassify newsClassify) throws Exception;

    /**
     * 根据id删除新闻分类
     * @param id
     * @return
     */
    int delClassify(Integer id) throws Exception;

    /**
     * 修改新闻分类
     * @param newsClassify
     * @return
     */
    int updateClassify(NewsClassify newsClassify) throws Exception;

    /**
     * 根据Id查找分类
     * @param id
     * @return 具体查找的单个分类信息
     */
    NewsClassify findClassifyById(Integer id) throws Exception;

    /**
     * 根据条件查找分类集合
     * @param newsClassify
     * @return 根据条件查找的分类集合
     */
    List<NewsClassify> findClassifyByInfo(NewsClassify newsClassify) throws Exception;


}
