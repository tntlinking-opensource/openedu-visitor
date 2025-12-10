<!-- home -->
<template>
  <div>
    <van-nav-bar title="我的申请"/>
    <div class="van-doc-demo-block">
      <h2 class="van-doc-demo-block__title">功能列表</h2>
      <van-grid :column-num="2">
        <van-grid-item dot :to="{ name: 'apply'}">
          <van-image
            width="40"
            height="40"
            :src="applyImgUrl"
          />
          <span style="color:#999;">新增申请</span>
        </van-grid-item>
        <van-grid-item :to="{ name: 'applyList'}">
          <van-badge :content="count">
            <van-image
              width="40"
              height="40"
              :src="listImgUrl"
            />
          </van-badge>
          <span style="color:#999;">申请记录</span>
        </van-grid-item>
      </van-grid>
    </div>
    <div class="main-footer">
      <van-tabbar>
        <van-tabbar-item icon="home-o">首页</van-tabbar-item>
      </van-tabbar>
    </div>

  </div>
</template>

<script>
import Vue from 'vue';
import { weChatApi } from 'api/weChat/weChat';
import { employeeApi } from 'api/employee';
import { visitorApi } from 'api/visitor';
import { Cell, CellGroup, Notify } from 'vant';

Vue.use(Cell);
Vue.use(CellGroup);

export default {
  name: 'index',
  data() {
    return {
      applyImgUrl: require('assets/icon_w_apply.png'),
      listImgUrl: require('assets/icon_w_list.png'),
      loginImgUrl: require('assets/icon_w_login.png'),
      // vconsole: null,
      openid: '',
      accessType: '',
      count: ''
    };
  },
  created() {
    // this.vconsole = new VConsole();
    this.accessType = localStorage.getItem('accessType');
    this.openid = localStorage.getItem('openid');

    if (!this.openid || this.openid === 'null') {
      this.$router.push('/visitor/loading');
    }
    this.getApplyCount();
  },
  computed: {},
  mounted() {
  },
  methods: {
    async getApplyCount() {
      let count = await visitorApi.getApplyCount(this.openid);
      this.count = count.data;
    },
    async getOpenId() {
      let res = await weChatApi.getOpenId(this.code);
      this.openid = res.data;
      localStorage.setItem('openid', this.openid);
      if (!this.openid) {
        Notify({ type: 'danger', message: '授权失败，请稍后再试' });
      } else {
        Notify({ type: 'success', message: '授权成功' });
      }
      //获取申请记录数
      this.getApplyCount();
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

.van-grid-item__icon {
  color: #ee0a24 !important;
}
</style>
