package cn.staryu.dao.linkmanager;

import cn.staryu.pojo.Linkmanager;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author zwy
 * 2017/12/19 下午 2:51
 */
public interface LinkmanagerMapper {
    //增加
    int addLinkmanager(Linkmanager linkmanager)throws Exception;

    //修改
    int updateLinkmanager(Linkmanager linkmanager)throws Exception;

    //删除
    int delLinkmanagerByid(@Param("id")Integer id)throws Exception;

    //根据id查询
    Linkmanager findLinkmanagerByid(@Param("id")Integer id)throws Exception;

    //根据名称模糊查询
    List<Linkmanager> findLinkmanagerInfo(Linkmanager linkmanager)throws Exception;
}
