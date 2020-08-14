package com.bbb.entity;

public class Merchandise
{
    private int m_number;
    private String m_name;
    private double m_price;
    private int m_count;
    private double m_bookprice;
    private double m_oldprice;
    private String m_detail;
    private int m_flag;
    private String i_name;
    private int m_id;
    private int c_id[];
    private int t_id;
    private String t_name[];
    private String t_type[];
    private int lengths[];

    public int[] getLengths() {
        return lengths;
    }

    public void setLengths(int[] lengths) {
        this.lengths = lengths;
    }

    public int getT_id() {
        return t_id;
    }

    public void setT_id(int t_id) {
        this.t_id = t_id;
    }

    public String[] getT_name() {
        return t_name;
    }

    public void setT_name(String[] t_name) {
        this.t_name = t_name;
    }

    public String[] getT_type() {
        return t_type;
    }

    public void setT_type(String[] t_type) {
        this.t_type = t_type;
    }

    public int[] getC_id() {
        return c_id;
    }

    public void setC_id(int[] c_id) {
        this.c_id = c_id;
    }

    public int getM_id() {
        return m_id;
    }

    public void setM_id(int m_id) {
        this.m_id = m_id;
    }

    public String getI_name() {
        return i_name;
    }

    public void setI_name(String i_name) {
        this.i_name = i_name;
    }



    public int getM_number() {
        return m_number;
    }

    public void setM_number(int m_number) {
        this.m_number = m_number;
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

    public int getM_count() {
        return m_count;
    }

    public void setM_count(int m_count) {
        this.m_count = m_count;
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

    public String getM_detail() {
        return m_detail;
    }

    public void setM_detail(String m_detail) {
        this.m_detail = m_detail;
    }

    public int getM_flag() {
        return m_flag;
    }

    public void setM_flag(int m_flag) {
        this.m_flag = m_flag;
    }
}
