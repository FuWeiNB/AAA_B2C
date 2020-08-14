package com.bbb.dao.zyh;

import com.aaa.util.DBhelper;
import com.bbb.entity.zyh.Dept;
import com.bbb.util.BaseDao;
import com.bbb.util.PageHelper;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
@Component
public class DeptDaoc implements BaseDao<Dept> {
    @Override
    public void add(Dept entity) {
        DBhelper.executeUpdate("insert into dept(d_name,d_loc) values(?,?)", entity.getD_name(),entity.getD_loc());
    }

    @Override
    public void upd(Dept entity) {
        DBhelper.executeUpdate("update dept set d_name=?,d_loc=? where d_id=?", entity.getD_name(),entity.getD_loc(), entity.getD_id());
    }

    @Override
    public void del(Dept entity) {
        DBhelper.executeUpdate("delete from dept where d_id=?", entity.getD_id());
    }

    @Override
    public List<Map<String, Object>> findAll(Object... obj) {
        return DBhelper.executeQuery("select * from dept");
    }

    @Override
    public List<Map<String, Object>> findPage(PageHelper p, Object... obj) {
        return DBhelper.executeQuery("select * from dept limit ?,?", p.getBegin(), p.getPageSize());
    }

    @Override
    public Map<String, Object> findone(Dept entity) {
        return DBhelper.executeQuery("select * from dept where d_id=?", entity.getD_id()).get(0);
    }

    @Override
    public int count(Dept entity) {
        String sql = "select count(*) from dept where 1=1";
        if(entity.getD_name() != null && entity.getD_name() != "") sql += " and d_name like '%"+entity.getD_name()+"%'";
        return Integer.valueOf(DBhelper.executeQuery(sql).get(0).get("count(*)").toString());
    }

    @Override
    public List<Map<String, Object>> findByParams(PageHelper p, Dept entity) {
        String sql = "select * from dept where 1=1";
        if(entity.getD_name() != null && entity.getD_name() != "") sql += " and d_name like '%"+entity.getD_name()+"%'";
        sql += " limit ?,?";
        return DBhelper.executeQuery(sql, p.getBegin(), p.getPageSize());
    }
}
