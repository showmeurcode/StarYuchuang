package cn.staryu.service.linkmanager;

import cn.staryu.pojo.Linkmanager;

import java.util.List;

/**
 * @author zwy
 * 2017/12/19 下午 3:37
 */
public interface LinkmanagerService {
    //增加
    int addLinkmanager(Linkmanager linkmanager)throws Exception;

    //修改
    int updateLinkmanager(Linkmanager linkmanager)throws Exception;

    //删除
    int delLinkmanagerByid(Integer id)throws Exception;

    //根据id查询
    Linkmanager findLinkmanagerByid(Integer id)throws Exception;

    //根据名称模糊查询
    List<Linkmanager> findLinkmanagerInfo(Linkmanager linkmanager)throws Exception;
}
