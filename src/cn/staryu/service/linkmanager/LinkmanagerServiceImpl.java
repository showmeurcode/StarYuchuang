package cn.staryu.service.linkmanager;

import cn.staryu.dao.linkmanager.LinkmanagerMapper;
import cn.staryu.pojo.Linkmanager;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author zwy
 * 2017/12/19 下午 3:38
 */
@Service("linkmanagerService")
public class LinkmanagerServiceImpl implements LinkmanagerService {
    @Resource
    private LinkmanagerMapper linkmanagerMapper;

    @Override
    public int addLinkmanager(Linkmanager linkmanager) throws Exception {
        return linkmanagerMapper.addLinkmanager(linkmanager);
    }

    @Override
    public int updateLinkmanager(Linkmanager linkmanager) throws Exception {
        return linkmanagerMapper.updateLinkmanager(linkmanager);
    }

    @Override
    public int delLinkmanagerByid(Integer id) throws Exception {
        return linkmanagerMapper.delLinkmanagerByid(id);
    }

    @Override
    public Linkmanager findLinkmanagerByid(Integer id) throws Exception {
        return linkmanagerMapper.findLinkmanagerByid(id);
    }

    @Override
    public List<Linkmanager> findLinkmanagerInfo(Linkmanager linkmanager) throws Exception {
        List<Linkmanager>list=new ArrayList<Linkmanager>();
        list=linkmanagerMapper.findLinkmanagerInfo(linkmanager);
        if (list.size()==0){
            list=null;
        }
        return list;
    }
}
