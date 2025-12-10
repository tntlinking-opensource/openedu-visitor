<!-- home -->
<template>
  <div>
    <van-nav-bar title="新生报名"/>

    <van-empty description="报名成功" >
      <van-button v-if="isFillIn" class="bottom-button"
       color="linear-gradient(to right, #ff6034, #ee0a24)"
       to="/dashboard/enroll">返回</van-button>
    </van-empty>
    <!-- <van-button size="large" color="linear-gradient(to right, #ff6034, #ee0a24)">填写报名信息</van-button> -->
  </div>
</template>

<script>
import { loginApi } from 'api/login';
import cookie from '@/lib/cookie';
import { userApi } from 'api/user';

export default {
  name: 'Mine',
  data() {
    return {
      isFillIn: true,//是否允许填写
    };
  },

  computed: {},

  mounted() {
  },

  methods: {
    // 清空缓存
    clearCache() {
      this.$toast('清空了!!');
    },
    // 更新权限
    async forceUpdatePrivilege() {
      this.$smart.loading();
      try {
        const res = await userApi.getSession();
        const loginInfo = res.data;
        this.$store.commit('user/updateSession', loginInfo);
        this.$toast('已成功更新权限!');
      } catch (e) {
        this.$smartSentry.captureException(e);
      } finally {
        this.$smart.loadingClear();
      }
    },
    // 退出
    async logout() {
      this.$smart.loading();
      try {
        await loginApi.logout(cookie.getToken());
      } catch (e) {
        this.$smartSentry.captureException(e);
      } finally {
        cookie.clearToken();
        this.$smart.loadingClear();
        this.$router.replace('/login');
      }
    }
  }
};
</script>
<style scoped>
  .bottom-button {
    width: 200px;
    height: 40px;
  }
</style>
