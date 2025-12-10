package net.lab1024.smartadmin.util.weChat;

import net.sf.json.JSONObject;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class WeinXinUtil {

    // 获取token
    public static String getAccessToken(String appId, String appSecret) {
        String access_token = "";
        String grant_type = "client_credential";// 获取access_token填写client_credential
        // 这个url链接地址和参数皆不能变
        String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=" + grant_type + "&appid=" + appId + "&secret="
                + appSecret; // 访问链接

        try {
            URL urlGet = new URL(url);
            HttpURLConnection http = (HttpURLConnection) urlGet.openConnection();
            http.setRequestMethod("GET"); // 必须是get方式请求
            http.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            http.setDoOutput(true);
            http.setDoInput(true);
            /*
             * System.setProperty("sun.net.client.defaultConnectTimeout",
             * "30000");// 连接超时30秒
             * System.setProperty("sun.net.client.defaultReadTimeout", "30000");
             * // 读取超时30秒
             */
            http.connect();
            InputStream is = http.getInputStream();
            int size = is.available();
            byte[] jsonBytes = new byte[size];
            is.read(jsonBytes);
            String message = new String(jsonBytes, "UTF-8");
            JSONObject demoJson = JSONObject.fromObject(message);
            access_token = demoJson.getString("access_token");
            is.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return access_token;
    }

}
