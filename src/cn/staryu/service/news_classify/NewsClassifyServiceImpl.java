package cn.staryu.service.news_classify;

import cn.staryu.dao.news_classify.NewsClassifyMapper;
import cn.staryu.pojo.NewsClassify;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author ligaoshan
 * 2017/12/19 14:42
 */
@Service("newsClassifyService")
public class NewsClassifyServiceImpl implements NewsClassifyService {

    @Resource
    private NewsClassifyMapper newsClassifyMapper;

    @Override
    public int addClassify(NewsClassify newsClassify) throws Exception {
        return newsClassifyMapper.addClassify(newsClassify);
    }

    @Override
    public int delClassify(Integer id) throws Exception {
        return newsClassifyMapper.delClassify(id);
    }

    @Override
    public int updateClassify(NewsClassify newsClassify) throws Exception {
        return newsClassifyMapper.updateClassify(newsClassify);
    }

    @Override
    public NewsClassify findClassifyById(Integer id) throws Exception {
        return newsClassifyMapper.findClassifyById(id);
    }

    @Override
    public List<NewsClassify> findClassifyByInfo(NewsClassify newsClassify) throws Exception {
        List<NewsClassify> list = new ArrayList<NewsClassify>();
        list = newsClassifyMapper.findClassifyByInfo(newsClassify);
        if (list.size() == 0) {
            list = null;
        }
        return list;
    }
}
