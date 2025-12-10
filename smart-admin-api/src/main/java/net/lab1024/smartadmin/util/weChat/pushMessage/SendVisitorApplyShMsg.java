package net.lab1024.smartadmin.util.weChat.pushMessage;

import net.lab1024.smartadmin.util.weChat.WeChatConfig;
import net.lab1024.smartadmin.util.weChat.WeChatUtils;
import net.lab1024.smartadmin.util.weChat.WeinXinUtil;
import net.sf.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

/**
 * 发送访校申请审核信息
 */
public class SendVisitorApplyShMsg {

    /**
     * 发送模板消息
     * {{first.DATA}}
     * 提交时间：{{keyword1.DATA}}
     * 访问人：{{keyword2.DATA}}
     * 来访单位：{{keyword3.DATA}}
     * 访问时间：{{keyword4.DATA}}
     * 访问事由：{{keyword5.DATA}}
     * {{remark.DATA}}
     * appId 公众账号的唯一标识
     * appSecret 公众账号的密钥
     * openId 用户标识
     */
    public static void send_template_message(String openId,String firstStr,String keyword1Str,String keyword2Str,String keyword3Str,String keyword4Str,String keyword5Str ) {
        if(!WeChatConfig.enabled){
            return;
        }
        String appId = WeChatConfig.appid;
        String appSecret = WeChatConfig.secret;
        String templateId = WeChatConfig.visitorApplyShTemplateId;
        String access_token = WeinXinUtil.getAccessToken(appId, appSecret);

        String url = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token="+access_token;
        WxTemplate temp = new WxTemplate();
        temp.setUrl("https://wx.shfdcxx.com/visitor/#/visitor/loading");
        temp.setTouser(openId);
        temp.setTopcolor("#000000");
        temp.setTemplate_id(templateId);
        Map<String,TemplateData> m = new HashMap<String,TemplateData>();

        TemplateData first = new TemplateData();
        first.setColor("#000000");
        first.setValue(firstStr);
        m.put("first", first);

        TemplateData keyword1 = new TemplateData();
        keyword1.setColor("#000000");
        keyword1.setValue(keyword1Str);
        m.put("keyword1", keyword1);

        TemplateData keyword2 = new TemplateData();
        keyword2.setColor("#000000");
        keyword2.setValue(keyword2Str);
        m.put("keyword2", keyword2);

        TemplateData keyword3 = new TemplateData();
        keyword3.setColor("#000000");
        keyword3.setValue(keyword3Str);
        m.put("keyword3", keyword3);

        TemplateData keyword4 = new TemplateData();
        keyword4.setColor("#000000");
        keyword4.setValue(keyword4Str);
        m.put("keyword4", keyword4);

        TemplateData keyword5 = new TemplateData();
        keyword5.setColor("#000000");
        keyword5.setValue(keyword5Str);
        m.put("keyword5", keyword5);

        TemplateData remark = new TemplateData();
        remark.setColor("#000000");
        remark.setValue("请及时查看");
        m.put("remark", remark);

        temp.setData(m);
        String jsonString = JSONObject.fromObject(temp).toString();
        JSONObject jsonObject = JSONObject.fromObject(WeChatUtils.httpRequest(url, "POST", jsonString));
        System.out.println(jsonObject);
        int result = 0;
        if (null != jsonObject) {
            if (0 != jsonObject.getInt("errcode")) {
                result = jsonObject.getInt("errcode");
                System.out.println("错误 errcode:"+jsonObject.getInt("errcode"));
                System.out.println("错误 errmsg:"+jsonObject.getInt("errmsg"));
            }
        }
        System.out.println("模板消息发送结果："+result);
    }
}
