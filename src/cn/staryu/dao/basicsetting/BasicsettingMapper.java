package cn.staryu.dao.basicsetting;

import cn.staryu.pojo.Basicsetting;
import com.sun.org.glassfish.gmbal.ParameterNames;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zwy
 * 2017/12/19 下午 1:36
 */
public interface BasicsettingMapper {
    //根据id查找
    Basicsetting findBasicsettingByid(@Param("id") Integer id)throws Exception;

    //根据名字、地址模糊查找
    List<Basicsetting>findBasicsettingsByinfo(Basicsetting basicsetting)throws Exception;

    //增加
    int addBasicsetting(Basicsetting basicsetting)throws Exception;

    //修改
    int updateBasicsetting(Basicsetting basicsetting)throws Exception;

    //根据id删除
    int delBasicsettingByid(@Param("id") Integer id)throws Exception;
}
