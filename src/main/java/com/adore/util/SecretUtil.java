package com.adore.util;

import java.security.MessageDigest;

/**
 * Created by adore on 17/5/13.
 */
public class SecretUtil {
    // 密钥
    public static final String KEY = ":cookie@adorecrow.com";

    // MD5 加密算法
    public final static String calcMD5(String ss) {

        String s = ss==null ? "" : (ss+KEY);

        char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };
        try {
            byte[] strTemp = s.getBytes();
            MessageDigest mdTemp = MessageDigest.getInstance("MD5");
            mdTemp.update(strTemp);
            byte[] md = mdTemp.digest();
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            return null;
        }
    }
}
