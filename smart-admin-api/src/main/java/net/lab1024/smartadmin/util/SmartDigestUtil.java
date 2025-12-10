package net.lab1024.smartadmin.util;

import net.lab1024.smartadmin.constant.CommonConst;
import org.apache.commons.codec.digest.DigestUtils;

public class SmartDigestUtil extends DigestUtils {

    /**
     * md5加盐加密
     *
     * @param salt
     * @param password
     * @return
     */
    public static String encryptPassword(String salt, String password) {
        return SmartDigestUtil.md5Hex(String.format(salt, password));
    }

    public static void main(String[] args) {
        System.out.println(SmartDigestUtil.encryptPassword(CommonConst.Password.SALT_FORMAT, "123456"));
    }
}
