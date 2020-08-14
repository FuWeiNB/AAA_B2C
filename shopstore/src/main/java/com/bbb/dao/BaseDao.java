package com.bbb.dao;

import java.util.List;
import java.util.Map;

public interface BaseDao<T>
{

        public void add(T entity);
        public void upd(T entity);
        public void del(T entity);
        public List<Map<String,Object>> find(Object... obj);
        public List<Map<String,Object>> page(Object... obj);
        public Map<String,Object> findOne(T entity);


}
