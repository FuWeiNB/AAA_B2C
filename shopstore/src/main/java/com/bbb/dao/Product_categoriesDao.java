package com.bbb.dao;

import com.aaa.util.DBhelper;
import com.bbb.entity.Product_categories;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class Product_categoriesDao implements BaseDao<Product_categories>
{
    @Override
    public void add(Product_categories entity) {
        DBhelper.executeUpdate("Insert into product_categories(c_Name,c_Flag) values(?,?)",entity.getC_Name(),entity.getC_Flag());
    }
    @Override
    public void upd(Product_categories entity) {
        DBhelper.executeUpdate("Update  product_categories  set c_Name = ? where c_Id = ?",entity.getC_Name(),entity.getC_Id());
    }
    @Override
    public void del(Product_categories entity) {
        DBhelper.executeUpdate("Delete from product_categories where c_Id = ?",entity.getC_Id());
        DBhelper.executeUpdate("Delete from product_categories where c_Flag = ?",entity.getC_Id());

    }
    @Override
    public List<Map<String, Object>> find(Object... obj) {
        return DBhelper.executeQuery("Select *from product_categories ");
    }
    @Override
    public List<Map<String, Object>> page(Object... obj) {
        return null;
    }
    @Override
    public Map<String, Object> findOne(Product_categories entity) {
        return null;
    }
}
