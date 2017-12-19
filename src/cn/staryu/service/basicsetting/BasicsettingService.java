package cn.staryu.service.basicsetting;

import cn.staryu.pojo.Basicsetting;

import java.util.List;

/**
 * @author zwy
 * 2017/12/19 下午 3:23
 */
public interface BasicsettingService {
    //根据id查找
    Basicsetting findBasicsettingByid(Integer id)throws Exception;

    //根据名字、地址模糊查找
    List<Basicsetting> findBasicsettingsByinfo(Basicsetting basicsetting)throws Exception;

    //增加
    int addBasicsetting(Basicsetting basicsetting)throws Exception;

    //修改
    int updateBasicsetting(Basicsetting basicsetting)throws Exception;

    //根据id删除
    int delBasicsettingByid(Integer id)throws Exception;
}
