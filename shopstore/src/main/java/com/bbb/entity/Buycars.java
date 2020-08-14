package com.bbb.entity;

public class Buycars
{
    private int[] b_id;
    private int[] m_id;
    private int[] t_id;
    private int b_user;
    private int[] buy_number;
    private String o_phone;
    private String o_site;
    private float o_price;
    private String o_name;
    private String o_memo;
    private String pa_number;
    private String a_id;

    public String getA_id()
    {
        return a_id;
    }

    public void setA_id(String a_id)
    {
        this.a_id = a_id;
    }

    public String getO_name() {
        return o_name;
    }

    public void setO_name(String o_name) {
        this.o_name = o_name;
    }

    public String getO_memo() {
        return o_memo;
    }

    public void setO_memo(String o_memo) {
        this.o_memo = o_memo;
    }

    public String getPa_number() {
        return pa_number;
    }

    public void setPa_number(String pa_number) {
        this.pa_number = pa_number;
    }

    public int[] getBuy_number() {
        return buy_number;
    }

    public void setBuy_number(int[] buy_number) {
        this.buy_number = buy_number;
    }

    public String getO_phone() {
        return o_phone;
    }

    public void setO_phone(String o_phone) {
        this.o_phone = o_phone;
    }

    public String getO_site() {
        return o_site;
    }

    public void setO_site(String o_site) {
        this.o_site = o_site;
    }

    public float getO_price() {
        return o_price;
    }

    public void setO_price(float o_price) {
        this.o_price = o_price;
    }

    public int[] getB_id() {
        return b_id;
    }

    public void setB_id(int b_id[]) {
        this.b_id = b_id;
    }

    public int[] getM_id() {
        return m_id ;
    }

    public void setM_id(int[] m_id) {
        this.m_id = m_id;
    }

    public int[] getT_id() {
        return t_id;
    }

    public void setT_id(int[] t_id) {
        this.t_id = t_id;
    }

    public int getB_user() {
        return b_user;
    }

    public void setB_user(int b_user) {
        this.b_user = b_user;
    }


}
