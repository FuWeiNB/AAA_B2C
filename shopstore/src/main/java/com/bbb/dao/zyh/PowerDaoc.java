package com.bbb.dao.zyh;

import com.aaa.util.DBhelper;
import com.bbb.entity.zyh.power;
import com.bbb.util.BaseDao;
import com.bbb.util.PageHelper;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Component
public class PowerDaoc implements BaseDao<power> {
    @Override
    public void add(power entity) {
        DBhelper.executeUpdate("insert into power(p_id,p_name,mgr) values(?,?,?)",entity.getP_id(),entity.getP_name(),entity.getMgr());
    }

    @Override
    public void upd(power entity) {
        DBhelper.executeUpdate("update power set p_name=?,mgr=? where p_id=?", entity.getP_name(),entity.getMgr(),entity.getP_id());
    }

    @Override
    public void del(power entity) {
        DBhelper.executeUpdate("delete from power where p_id=?",entity.getP_id());
    }

    @Override
    public List<Map<String, Object>> findAll(Object... obj) {
        List<Map<String,Object>> list = DBhelper.executeQuery("Select *from r_p rp INNER JOIN role r on r.r_id = rp.r_id INNER JOIN power p on p.p_id = rp.p_id where rp.r_id = ?",5);
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

    @Override
    public List<Map<String, Object>> findPage(PageHelper p, Object... obj) {
        return null;
    }

    @Override
    public Map<String, Object> findone(power entity) {
        return DBhelper.executeQuery("select * from power where p_id=?", entity.getP_id()).get(0);
    }

    @Override
    public int count(power entity) {
        String sql = "select count(*) from power where 1=1 and p_id!=0";
        if(entity.getP_name() != null && entity.getP_name() != "") sql += " and p_name like '%"+entity.getP_name()+"%'";
        if(entity.getMgr() != null && entity.getMgr() !="") sql += " and mgr="+entity.getMgr();
        return Integer.valueOf(DBhelper.executeQuery(sql).get(0).get("count(*)").toString());
    }

    @Override
    public List<Map<String, Object>> findByParams(PageHelper p, power entity) {
        String sql = "select * from power where 1=1 and p_id != 0";
        if(entity.getP_name() != null && entity.getP_name() != "") sql += " and p_name like '%"+entity.getP_name()+"%'";
        if(entity.getMgr() != null && entity.getMgr() !="") sql += " and mgr="+entity.getMgr();
        sql += " limit ?,?";
        return DBhelper.executeQuery(sql,p.getBegin(),p.getPageSize());
    }
    public List<Map<String,Object>> findByMgr(){
        return DBhelper.executeQuery("select distinct mgr from power where p_id != 0");
    }
    public List<Map<String,Object>> findPower(){
        return DBhelper.executeQuery("select p_id,p_name from power where p_id != 0");
    }
    public int count(){
        return Integer.valueOf(DBhelper.executeQuery("select count(*) from power").get(0).get("count(*)").toString());
    }

}
