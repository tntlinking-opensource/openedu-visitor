<!-- home -->
<template>
  <div class="body_w">

    <div class="main_w">
      <div v-if="!isOnTime">
        <div class="img_font_w">
          <div class="img_div_w" style="margin-bottom: 20px">
            <van-image
              width="250"
              height="120"
              :src="errorImgUrl"
            />
          </div>
          <span>{{ errorMsg1 }}</span><br>
          <span>{{ errorMsg2 }}</span>
        </div>
      </div>
      <div v-if="isOnTime">
        <div class="img_font_w" v-if="details.shzt == 0">
          <div class="img_div_w">
            <van-image
              width="200"
              height="200"
              :src="waitImgUrl"
            />
          </div>
          <span>您的申请已提交，请耐心等待</span>
        </div>
        <div class="img_font_w" v-if="details.shzt == 1">
          <div class="img_div_w">
            <van-image
              width="200"
              height="200"
              :src="downloadUrl+details.qrCode"
            />
          </div>
          <span style="font-size: 28px; color: green;">访客申请已通过</span>
        </div>
        <div class="img_font_w" v-if="details.shzt == -1">
          <div class="img_div_w">
            <van-image
              width="200"
              height="200"
              :src="downloadUrl+details.qrCode"
            />
          </div>
          <span>对不起，审核未通过</span>
        </div>
        <div class="img_font_w_2" style="font-size: 28px; line-height: 50px;">
          <!--          <span v-if="!isShow" style="color:green;">温度{{ data.temp }}</span><br>-->
          <span>访校姓名：{{ details.name }}</span><br>
          <span>访问部门：{{ details.departmentName }}&#160;/&#160;{{ details.employeeName }}</span><br>
          <span>访校时间：{{ details.visitorsTime }}</span><br>
        </div>
<!--        <van-form @submit="onSubmit" v-if="details.shzt == 1 && isShow">
          <van-field v-model="data.temp" clearable type="number" label="温度" placeholder="温度" maxlength="4">
            <template #button> °C</template>
          </van-field>
          <div style="padding: 0 20px;">
            <van-button round block color="linear-gradient(to right, #7fddad, #07c160)" native-type="submit">提交
            </van-button>
          </div>
        </van-form>-->
      </div>
    </div>
  </div>
</template>

<script>
import { visitorApi } from 'api/visitor';
import Vue from 'vue';
import { Notify } from 'vant';
import { Cell, CellGroup, Dialog, Icon, NavBar } from 'vant';
import config from '@/config';
import { weChatApi } from 'api/weChat/weChat';
import { employeeApi } from 'api/employee';
import cookie from '@/lib/cookie';

function getUrlKey(name) {//获取url 参数
  return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.href) || [, ''])[1].replace(/\+/g, '%20')) || null;
}

function getCodeApi(state) {//获取code
  let urlNow = encodeURIComponent(window.location.href);
  let scope = 'snsapi_base';    //snsapi_userinfo   //静默授权 用户无感知
  let appid = 'wx3dd35327d83d23c3';
  let url = `https://open.weixin.qq.com/connect/oauth2/authorize?appid=${appid}&redirect_uri=${urlNow}&response_type=code&scope=${scope}&state=${state}#wechat_redirect`;
  window.location.replace(url);
}

export const baseUrl = config.baseUrl.apiUrl;

Vue.use(Cell);
Vue.use(CellGroup);
Vue.use(Dialog);
Vue.use(Icon);
Vue.use(NavBar);
export default {
  name: 'applyResult',
  data() {
    return {
      isShow: true,
      isOnTime: false,
      downloadUrl: '',
      errorMsg1: '',
      errorMsg2: '',
      errorImgUrl: require('assets/error.png'),
      successImgUrl: require('assets/success_new.png'),
      waitImgUrl: require('assets/wait.png'),
      failImgUrl: require('assets/fail_new.png'),
      itineraryCodeUrl: '',
      healthCodeUrl: ' ',
      details: {},
      openid: '',
      data: {
        id: null,
        temp: ''
      }
    };
  },
  computed: {},
  created() {
    this.openid = localStorage.getItem('openid');
    let token = cookie.getToken();
    if (!token) {
      localStorage.setItem('login_back_url', location.href);
      this.$router.push('/login');
    } else {
      // 判断当前微信用户是否为教师
      this.vilidateUser();
      this.downloadUrl = baseUrl + '/visitorsRecord/downloadImg/';
    }
  },
  mounted() {
  },
  methods: {
    async getOpenId() {
      let res = await weChatApi.getOpenId(this.code);
      this.openid = res.data;
      localStorage.setItem('openid', this.openid);
      if (!this.openid) {
        Notify({ type: 'danger', message: '授权失败，请先关注微房校公众号' });
      } else {
        Notify({ type: 'success', message: '授权成功' });
      }
    },

    // 通过openid获取用户信息 判断当前微信用户是否为教师
    // 若判断为教师 则直接后台模拟登陆
    async vilidateUser() {
      let res = await employeeApi.getByOpenid(this.openid);
      // 验证通过 跳转到教师页面
      // console.log('res', res);
      if (res != null && res.success && res.code === 1 && res.data) {
        this.data.id = this.$route.params.id;
        this.getResults();
      } else {
        this.errorMsg1 = '用户错误';
        this.errorMsg2 = '您没有相关权限';
      }
    },
    async getResults() {
      let result = await visitorApi.getResultsById(this.data.id);
      this.details = result.data;
      this.data.temp = result.data.temp;
      this.isOnTime = result.data.onTime;
      if (!this.isOnTime) {
        this.errorMsg1 = '时间有误';
        this.errorMsg2 = '您的申请访校时间为' + this.details.visitorsTime;
      }
      this.itineraryCodeUrl = baseUrl + '/visitorsRecord/downloadImg/' + result.data.itineraryCode;
      this.healthCodeUrl = baseUrl + '/visitorsRecord/downloadImg/' + result.data.healthCode;
    },
    // 表单提交
    onSubmit() {
      this.save();
    },
    async save() {
      let res = await visitorApi.visitorsComfirm(this.data);
      if (res != null && res.success && res.code === 1) {
        Notify({ type: 'success', message: res.msg });
        this.isShow = false;
      } else {
        Notify({ type: 'danger', message: res.msg });
        this.isShow = true;
      }
    }
  }
};
</script>
<style scoped>
.body_w {
  position: absolute;
  width: 100%;
  height: 100%;
  background: white;
}

.main_w {
  width: 100%;
  height: 70%;
  overflow-y: auto;
  margin-top: 30%;
}

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

.img_div_w {
  width: 100%;
  height: aoto;
  text-align: center;
}

.img_font_w {
  text-align: center;
  font-size: 1.2em;
  font-weight: bold;
  line-height: 1.5em;
  margin-bottom: 10px;
}

.img_font_w_2 {
  text-align: center;
  font-size: 1.2em;
  line-height: 1.5em;
  margin-bottom: 10px;
}
</style>
