package com.bbb.service;

import com.bbb.dao.AdminDao;
import com.bbb.entity.admin_login;
import com.bbb.util.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AdminService
{

    @Autowired
    AdminDao dao;
    public int add(admin_login entity) {
        return dao.add(entity);
    }
    public int upd(admin_login entity) {
        return dao.upd(entity);
    }
    public int del(admin_login entity) {
        return dao.del(entity);
    }
    public List<Map<String, Object>> findAll(Object... obj) {
        return dao.findAll(obj);
    }
    public List<Map<String, Object>> findPage(PageHelper p, admin_login entity)
    {
        return dao.findPage(p,entity);
    }

    public Map<String, Object> findOne(admin_login entity) {
        return dao.findOne(entity);
    }

    public Map<String, Object> findtheOne(String user) {
        return findtheone(user);
    }
    public int count(admin_login entity)
    {
        return dao.count(entity);
    }
    public Map<String,Object> login(Object... obj)
    {
        return dao.login(obj);
    }
    public Map<String,Object> adminlogin(Object... obj)
    {
        return dao.adminlogin(obj);
    }
    public Map<String, Object> findtheone(String user)
    {
        return dao.findtheOne(user);
    }
}
