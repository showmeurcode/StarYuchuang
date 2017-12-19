package cn.staryu.service.singlepage_reservations;

import cn.staryu.pojo.SinglepageReservations;

import java.util.List;

/**
 * @author zwy
 * 2017/12/19 下午 3:42
 */
public interface SinglepageReservationsService {
    //增加
    int addSinglepageReservations(SinglepageReservations singlepageReservations)throws Exception;

    //删除
    int delSinglepageReservationsByid(Integer id)throws Exception;

    //修改
    int updateSinglepageReservations(SinglepageReservations singlepageReservations)throws Exception;

    //根据id查询
    SinglepageReservations findSinglepageReservationsByid(Integer id)throws Exception;

    //根据报名对象、姓名模糊查询
    List<SinglepageReservations> findSinglepageReservationsInfo(SinglepageReservations singlepageReservations)throws Exception;
}
