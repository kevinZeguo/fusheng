package com.beijing.geek.cms.fusheng.utils;

/**
 * Created by mazeguo on 2017/7/8.
 */
public class FsCodeUtils {
    //获取编号
    public synchronized static String getCustomerCode() {
        return "FSKH" + System.currentTimeMillis();
    }

    public synchronized static String getDeviceCode() {
        return "FSEQ" + System.currentTimeMillis();
    }

    public static String getRepertoryInCode() {
        return "FSRQ" + System.currentTimeMillis();
    }

    public static String getCode(String prex) {
        return prex + System.currentTimeMillis();
    }
}
