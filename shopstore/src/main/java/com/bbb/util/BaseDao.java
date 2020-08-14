package com.bbb.util;

import java.util.List;
import java.util.Map;

public interface BaseDao<T>
{
        public void add(T entity);
        public void upd(T entity);
        public void del(T entity);
        public List<Map<String,Object>> findAll(Object... obj);
        public List<Map<String,Object>> findPage(PageHelper p, Object... obj);
        public Map<String,Object> findone(T entity);
        public int count(T entity);
        public List<Map<String,Object>> findByParams(PageHelper p, T entity);
}
