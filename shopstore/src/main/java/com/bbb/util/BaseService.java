package com.bbb.util;

import java.util.List;
import java.util.Map;

public abstract class BaseService<T>
{
    public abstract BaseDao<T> getDao();

    public void add(T entity)
    {
        getDao().add(entity);
    }
    public void upd(T entity)
    {
        getDao().upd(entity);
    }
    public void del(T entity)
    {
        getDao().del(entity);
    }
    public List<Map<String,Object>> findAll(Object... obj)
    {
        return getDao().findAll(obj);
    }
    public List<Map<String,Object>> findPage(PageHelper p,Object... obj)
    {
        return getDao().findPage(p);
    }
    public Map<String,Object> findone(T entity)
    {
        return getDao().findone(entity);
    }
    public int count(T entity){
        return getDao().count(entity);
    }
    public List<Map<String,Object>> findByParams(PageHelper p, T entity){
        return getDao().findByParams(p, entity);
    }

}
