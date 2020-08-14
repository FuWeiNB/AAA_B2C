package com.bbb.service;

import com.bbb.dao.BaseDao;

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
    public List<Map<String,Object>> find(Object... obj)
    {
        return getDao().find(obj);
    }
    public List<Map<String,Object>> page(Object... obj)
    {
        return getDao().page(obj);
    }
    public Map<String,Object> findOne(T entity)
    {
        return getDao().findOne(entity);
    }

}
