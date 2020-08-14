package com.bbb.dao.zyh;

import com.aaa.util.DBhelper;
import com.bbb.entity.zyh.Role;
import com.bbb.util.BaseDao;
import com.bbb.util.PageHelper;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class RoleDao implements BaseDao<Role> {
    @Override
    public void add(Role entity) {

            }

    @Override
    public void upd(Role entity) {

            }

    public void insertRa(Role role, String c)
            {
            DBhelper.executeUpdate("insert into r_p(r_id,p_id) values(?,?)", role.getR_id(), c);
            }

    @Override
    public void del(Role entity) {
            DBhelper.executeUpdate("delete from r_p where r_id=?", entity.getR_id());
            }

    @Override
    public List<Map<String, Object>> findAll(Object... obj) {
            return DBhelper.executeQuery("select * from role");
            }

    @Override
    public List<Map<String, Object>> findPage(PageHelper page, Object... obj) {
            List<Map<String,Object>> list = DBhelper.executeQuery("select * from role limit ?,?", page.getBegin(),page.getPageSize());
            return list.size() > 0 ? list : null;
            }

    @Override
    public Map<String, Object> findone(Role entity) {
            return DBhelper.executeQuery("select * from role where r_id=?",entity.getR_id()).get(0);
            }

    @Override
    public int count(Role entity) {
            String sql = "select count(*) c from role where 1=1 and r_id !=1 and r_id !=2";
            if(entity.getR_name() != null) sql += " and r_name like '%"+entity.getR_name()+"%'";
            return Integer.valueOf(DBhelper.executeQuery(sql).get(0).get("c").toString());
            }

    @Override
    public List<Map<String, Object>> findByParams(PageHelper p, Role entity) {
            String sql = "select * from role where 1=1 and r_id !=1 and r_id !=2";
            if(entity.getR_name() != null) sql += " and r_name like '%"+entity.getR_name()+"%'";
            sql += " limit ?,?";
            List<Map<String,Object>> list = DBhelper.executeQuery(sql, p.getBegin(), p.getPageSize());
            return list.size() > 0 ? list : null;
            }

    public List<Map<String,Object>> oneR(Role entity)
            {
            List<Map<String,Object>> list = DBhelper.executeQuery("select * from role r inner join r_p b on r.r_id=b.r_id where r.r_id=?", entity.getR_id());
            return list.size() > 0 ? list : null;
            }
}
