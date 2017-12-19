package cn.staryu.service.basicsetting;

import cn.staryu.dao.basicsetting.BasicsettingMapper;
import cn.staryu.pojo.Basicsetting;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @author zwy
 * 2017/12/19 下午 3:25
 */
@Service("basicsettingService")
public class BasicsettingServiceImpl implements BasicsettingService{
    private BasicsettingMapper basicsettingMapper;

    @Override
    public Basicsetting findBasicsettingByid(Integer id) throws Exception {
        return basicsettingMapper.findBasicsettingByid(id);
    }

    @Override
    public List<Basicsetting> findBasicsettingsByinfo(Basicsetting basicsetting) throws Exception {
        List<Basicsetting>list=new ArrayList<Basicsetting>();
        list=basicsettingMapper.findBasicsettingsByinfo(basicsetting);
        if(list.size()==0){
            list=null;
        }
        return list;
    }

    @Override
    public int addBasicsetting(Basicsetting basicsetting) throws Exception {
        return basicsettingMapper.addBasicsetting(basicsetting);
    }

    @Override
    public int updateBasicsetting(Basicsetting basicsetting) throws Exception {
        return basicsettingMapper.updateBasicsetting(basicsetting);
    }

    @Override
    public int delBasicsettingByid(Integer id) throws Exception {
        return basicsettingMapper.delBasicsettingByid(id);
    }
}
