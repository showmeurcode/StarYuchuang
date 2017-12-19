package cn.staryu.service.singlepage_reservations;

import cn.staryu.dao.singlepage_reservations.SinglepageReservationsMapper;
import cn.staryu.pojo.SinglepageReservations;

import java.util.ArrayList;
import java.util.List;

/**
 * @author zwy
 * 2017/12/19 下午 3:43
 */
public class SinglepageReservationsServiceImpl implements SinglepageReservationsService {
    private SinglepageReservationsMapper singlepageReservationsMapper;

    @Override
    public int addSinglepageReservations(SinglepageReservations singlepageReservations) throws Exception {
        return singlepageReservationsMapper.addSinglepageReservations(singlepageReservations);
    }

    @Override
    public int delSinglepageReservationsByid(Integer id) throws Exception {
        return singlepageReservationsMapper.delSinglepageReservationsByid(id);
    }

    @Override
    public int updateSinglepageReservations(SinglepageReservations singlepageReservations) throws Exception {
        return singlepageReservationsMapper.updateSinglepageReservations(singlepageReservations);
    }

    @Override
    public SinglepageReservations findSinglepageReservationsByid(Integer id) throws Exception {
        return singlepageReservationsMapper.findSinglepageReservationsByid(id);
    }

    @Override
    public List<SinglepageReservations> findSinglepageReservationsInfo(SinglepageReservations singlepageReservations) throws Exception {
        List<SinglepageReservations>list=new ArrayList<SinglepageReservations>();
        list=singlepageReservationsMapper.findSinglepageReservationsInfo(singlepageReservations);
        if(list.size()==0){
            list=null;
        }
        return list;
    }
}
