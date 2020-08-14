package com.bbb.dao;

import com.aaa.util.DBhelper;
import com.bbb.entity.Login;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class LoginDao implements BaseDao<Login>
{
    @Override
    public void add(Login entity)
    {

    }
    @Override
    public void upd(Login entity){
    }
    @Override
    public void del(Login entity)
    {

    }



    @Override
    public Map<String, Object> findOne(Login entity)
    {
        return null;
    }



    @Override
    public List<Map<String, Object>> find(Object... obj)
    {
        return DBhelper.executeQuery("Select * from emp e inner join role r on e.r_id=r.r_id where e.e_id = ? and e.e_pass = ?",obj);
    }

    public List<Map<String, Object>> page(Object... obj) {
        return null;
    }

}
