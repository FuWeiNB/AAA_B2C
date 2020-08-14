package com.bbb.dao;

import com.aaa.util.DBhelper;
import com.bbb.entity.Power;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Component
public class PowerDao implements BaseDao<Power>
{
    @Override
    public void add(Power entity)
    {

    }
    @Override
    public void upd(Power entity)
    {

    }
    @Override
    public void del(Power entity){
    }


    @Override
    public Map<String, Object> findOne(Power entity)
    {
        return null;
    }


    @Override
    public List<Map<String, Object>> find(Object... obj)
    {
         List<Map<String,Object>> list = DBhelper.executeQuery("Select *from r_p rp INNER JOIN role r on r.r_id = rp.r_id INNER JOIN power p on p.p_id = rp.p_id where rp.r_id = ?",obj);
         List<Map<String,Object>> list2 = new ArrayList<Map<String,Object>>();
         for (Map<String,Object> map : list)
        {
            if("0".equals(map.get("p_id").toString()))
            {
                return DBhelper.executeQuery("select *from power");
            }
            List<Map<String,Object>> list3 =DBhelper.executeQuery("Select * from power where p_id = ? or mgr = ?",map.get("p_id"),map.get("p_id"));
            for(Map<String,Object> map2 :list3 )
            {
                 list2.add(map2);
            }
        }
     return list2;
    }

    public List<Map<String, Object>> page(Object... obj)
    {
        return null;
    }



}
