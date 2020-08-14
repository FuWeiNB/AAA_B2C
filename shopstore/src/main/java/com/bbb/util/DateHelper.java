package com.bbb.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateHelper
{
    public static String D2S(Date date)
    {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String da=sdf.format(date);
        return da;
    }
    public static String D2R(Date date)
    {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String da=sdf.format(date);
        return da;
    }
}
