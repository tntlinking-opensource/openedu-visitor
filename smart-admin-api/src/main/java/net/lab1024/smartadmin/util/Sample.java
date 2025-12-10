package net.lab1024.smartadmin.util;

import com.alibaba.fastjson.JSONObject;
import com.aliyun.tea.*;
import com.aliyun.dysmsapi20170525.*;
import com.aliyun.dysmsapi20170525.models.*;
import com.aliyun.teaopenapi.*;
import com.aliyun.teaopenapi.models.*;
import com.aliyun.teaconsole.*;
import com.aliyun.darabonba.env.*;
import com.aliyun.teautil.*;
import com.aliyun.darabonbatime.*;
import com.aliyun.darabonbastring.*;
/**
 * 阿里云短信
 * @author wangQiang
 * @date 2021/8/2 10:46
 */
public class Sample {

    public final static String SIGN_NAME = "XXX学校";
    public final static String TEMPLATE_CODE = "XXX";
    public final static String ASSESS_KEY_ID = "XXX";
    public final static String ASSESS_KEY_SECRET = "XXX";

    /**
     * 使用AK&SK初始化账号Client
     * @param accessKeyId
     * @param accessKeySecret
     * @return Client
     * @throws Exception
     */
    public static com.aliyun.dysmsapi20170525.Client createClient(String accessKeyId, String accessKeySecret) throws Exception {
        Config config = new Config()
                // 您的AccessKey ID
                .setAccessKeyId(accessKeyId)
                // 您的AccessKey Secret
                .setAccessKeySecret(accessKeySecret);
        // 访问的域名
        config.endpoint = "dysmsapi.aliyuncs.com";
        return new com.aliyun.dysmsapi20170525.Client(config);
    }

    /**
     * @param date 日期
     * @param code 部门（教师）
     * @param result 审核结果 已通过/未通过
     * @param phone 手机号
     * 发送短信
     */
    public static void sendShSms(String date,String code,String result,String phone) throws Exception{
        com.aliyun.dysmsapi20170525.Client client = Sample.createClient(ASSESS_KEY_ID, ASSESS_KEY_SECRET);

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("dete",date);
        jsonObject.put("code",code);
        jsonObject.put("result",result);

        //您申请的${dete}前往${code}的访校申请${result}，请及时查看
        SendSmsRequest sendSmsRequest = new SendSmsRequest()
                .setPhoneNumbers(phone)
                .setSignName(SIGN_NAME)
                .setTemplateCode(TEMPLATE_CODE)
                .setTemplateParam(jsonObject.toJSONString());
        // 复制代码运行请自行打印 API 的返回值
        SendSmsResponse sendSmsResponse = client.sendSms(sendSmsRequest);

        // 发送失败 打印错误信息
        String sendSmsResponseCode = sendSmsResponse.body.code;
        if (!com.aliyun.teautil.Common.equalString(sendSmsResponseCode, "OK")) {
            com.aliyun.teaconsole.Client.log("错误信息: " + sendSmsResponse.body.message + "");
        }
    }

    public static void main(String[] args_) throws Exception {
        java.util.List<String> args = java.util.Arrays.asList(args_);
        com.aliyun.dysmsapi20170525.Client client = Sample.createClient("XXX", "XXX");

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("dete","2021-08-02");
        jsonObject.put("code","教务处（教师）");
        jsonObject.put("result","已通过");

        //您申请的${dete}前往${code}的访校申请${result}，请及时查看
        SendSmsRequest sendSmsRequest = new SendSmsRequest()
                .setPhoneNumbers("138000000")
                .setSignName("XXX")
                .setTemplateCode("XXX")
                .setTemplateParam(jsonObject.toJSONString());
        // 复制代码运行请自行打印 API 的返回值
        client.sendSms(sendSmsRequest);
    }
}
