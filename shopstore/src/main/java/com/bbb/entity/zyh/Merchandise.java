package com.bbb.entity.zyh;

import java.util.Date;

public class Merchandise {
    private String c_id;
    private int m_id;
    private String m_name;
    private double m_price;
    private double m_bookprice;
    private double m_oldprice;
    private String m_detial;
    private Date m_date;

    public String getC_id() {
        return c_id;
    }

    public void setC_id(String c_id) {
        this.c_id = c_id;
    }

    public int getM_id() {
        return m_id;
    }

    public void setM_id(int m_id) {
        this.m_id = m_id;
    }

    public String getM_name() {
        return m_name;
    }

    public void setM_name(String m_name) {
        this.m_name = m_name;
    }

    public double getM_price() {
        return m_price;
    }

    public void setM_price(double m_price) {
        this.m_price = m_price;
    }

    public double getM_bookprice() {
        return m_bookprice;
    }

    public void setM_bookprice(double m_bookprice) {
        this.m_bookprice = m_bookprice;
    }

    public double getM_oldprice() {
        return m_oldprice;
    }

    public void setM_oldprice(double m_oldprice) {
        this.m_oldprice = m_oldprice;
    }

    public String getM_detial() {
        return m_detial;
    }

    public void setM_detial(String m_detial) {
        this.m_detial = m_detial;
    }

    public Date getM_date() {
        return m_date;
    }

    public void setM_date(Date m_date) {
        this.m_date = m_date;
    }

    public int getM_count() {
        return m_count;
    }

    public void setM_count(int m_count) {
        this.m_count = m_count;
    }

    private int m_count;

}
