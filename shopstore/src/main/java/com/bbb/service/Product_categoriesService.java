package com.bbb.service;

import com.bbb.dao.BaseDao;
import com.bbb.dao.Product_categoriesDao;

import com.bbb.entity.Product_categories;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Product_categoriesService extends BaseService<Product_categories>
{

    @Autowired
    Product_categoriesDao dao;

    public BaseDao<Product_categories> getDao() {
        return dao;
    }
}
