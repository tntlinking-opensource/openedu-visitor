<!-- home -->
<template>
  <div>
    <van-nav-bar title="首页" />
    <div class="van-doc-demo-block">
      <h2 class="van-doc-demo-block__title">功能列表</h2>
      <van-grid :column-num="2">
        
        <van-grid-item :to="{ name: 'visitorApplyList'}">
          <van-image
            width="40"
            height="40"
            :src="listImgUrl"
          />
          <span style="color:#999;">访校申请记录</span>
        </van-grid-item>
        <van-grid-item :to="{ name: 'visitorApplyPending'}">
          <van-image
            width="40"
            height="40"
            :src="dclImgUrl"
          />
          <span style="color:#999;">待处理</span>
        </van-grid-item>
      </van-grid>
    </div>
  </div>
</template>

<script>
import Vue from 'vue';
import { weChatApi } from 'api/weChat/weChat';
import { visitorApi } from 'api/visitor';
import { Cell, CellGroup,Notify } from 'vant';

Vue.use(Cell);
Vue.use(CellGroup);

function getUrlKey(name){//获取url 参数
  return decodeURIComponent((new RegExp('[?|&]'+name+'='+'([^&;]+?)(&|#|;|$)').exec(location.href)||[,""])[1].replace(/\+/g,'%20'))||null;
}
  
function getCodeApi(state){//获取code   
  let urlNow=encodeURIComponent(window.location.href);
  let scope='snsapi_base';    //snsapi_userinfo   //静默授权 用户无感知
  let appid='wx3dd35327d83d23c3';
  let url=`https://open.weixin.qq.com/connect/oauth2/authorize?appid=${appid}&redirect_uri=${urlNow}&response_type=code&scope=${scope}&state=${state}#wechat_redirect`;
  window.location.replace(url);
}

export default {
  name: 'index',
  
  data() {
    return {
      dclImgUrl:require("assets/icon_w_dcl.png"),
      listImgUrl:require("assets/icon_w_list.png"),
      //vconsole: null,
      openid:'',
      count: ''
    };
  },
  created(){
    //localStorage.setItem('openid', '1111112312');
    //this.getOpenIdAndSave();
    
    this.openid = localStorage.getItem("openid");
    //若缓存中的openid为空 重新获取openid
    if(!this.openid||this.openid == "null"){
        this.$router.push('/visitor/loading');
    }
    //更新当前用户openid信息
    this.updeteOpenid();

    // if(!this.openid||this.openid == "null"){//若缓存中的openid为空 重新获取openid
    //   let code=getUrlKey("code");//获取url参数code
    //   if(code){ //拿到code， code传递给后台接口换取opend
    //     this.code = code;
    //     this.getOpenIdAndSave();
    //   }else{
    //     getCodeApi("1a23111111232");
    //   }
    // }else{
    //   //更新当前用户openid信息
    //   this.updeteOpenid();
    // }
    

	},
  computed: {},
  mounted() {
  },
  methods: {
    async getOpenIdAndSave() {
      let res = await weChatApi.getOpenId(this.code);
      this.openid = res.data;
      localStorage.setItem('openid', this.openid);
      if(!this.openid){
        Notify({ type: 'danger', message: "授权失败，请稍后再试" });
      }else{
        Notify({ type: 'success', message: "授权成功" });
        this.updeteOpenid();
      }
    },
    //更新当前用户openid信息
    async updeteOpenid() {
      let res = await weChatApi.updeteOpenid(this.openid);
    }
  }
};
</script>
<style scoped>
.bottom-button {
  width: 200px;
  height: 40px;
}
.file_title_w span {
  background: #3388ff;
  color: white;
  display: block;
  width: 6em;
  height: 2em;
  line-height: 2em;
  text-align: center;
  border-radius: 1em 1em 0 0;
  margin-left: 5%;
}
.seller .timeClass {
  color: #333;
}
.van-doc-demo-block__title {
    margin: 0;
    padding: 16px 16px 8px;
    color: rgba(69, 90, 100, 0.6);
    font-weight: normal;
    font-size: 14px;
    line-height: 16px;
}
.van-grid-item__icon{
  color: #ee0a24!important;
}
</style>
