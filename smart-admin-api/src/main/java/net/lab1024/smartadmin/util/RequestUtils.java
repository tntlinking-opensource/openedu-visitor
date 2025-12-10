package net.lab1024.smartadmin.util;

import org.apache.commons.codec.net.BCodec;

import javax.servlet.http.HttpServletRequest;
import java.net.URLEncoder;

/**
 * @author wangQiang
 * @date 2021/6/6 18:06
 */
public class RequestUtils {

    public static String encodeAttachName(HttpServletRequest request, String attach_name) {
        String agent = request.getHeader("USER-AGENT");

        try {
            String newName;
            if (null != agent && -1 != agent.indexOf("Windows")) {
                newName = URLEncoder.encode(attach_name, "UTF-8");
            } else {
                newName = (new BCodec("UTF-8")).encode(attach_name);
            }

            if ("FF".equals(getBrowser(request))) {
                newName = new String(attach_name.getBytes("UTF-8"), "iso-8859-1");
            }

            return newName;
        } catch (Exception var5) {
            return attach_name;
        }
    }

    public static String getBrowser(HttpServletRequest request) {
        String UserAgent = request.getHeader("USER-AGENT").toLowerCase();
        if (UserAgent != null) {
            if (UserAgent.indexOf("msie") >= 0) {
                return "IE";
            }

            if (UserAgent.indexOf("firefox") >= 0) {
                return "FF";
            }

            if (UserAgent.indexOf("safari") >= 0) {
                return "SF";
            }
        }

        return null;
    }
}
