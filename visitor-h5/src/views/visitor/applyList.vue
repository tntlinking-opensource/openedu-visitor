<!-- home -->
<template>
  <div class="body_w">
    <van-nav-bar
      left-text="返回"
      left-arrow
      @click-left="$router.back()"
      title="申请记录"
    />
    
    <div v-if="details.length == 0" class="main_w" style="width: 100%;height: 85%;overflow-y: auto; background: white;">
       <div class="img_font_w" >
        <div class="img_div_w">
          <van-image
            width="200"
            height="200"
            :src="recordImgUrl"
          />
        </div>
        <span>还没有任何申请记录</span>
      </div>
    </div>
    
    <van-form v-if="details.length != 0" style="width: 100%;height: 85%;overflow-y: auto;">
      <van-card  v-for="item in details"
        :desc="item.remark"
        :title="item.visitorsTime"
      >
        <template #thumb>
          <van-icon name="success" />
          <van-image v-if="item.shzt == 0"
            width="100%"
            height="100%"
            :src="waitImgUrl"
          />
          <van-image v-if="item.shzt == 1 || item.shzt == -1"
            width="100%"
            height="100%"
            :src="downloadUrl+item.qrCode"
          />
        </template>
        <template #tag>
          <van-tag type="primary" size="medium" v-if="item.shzt == 0">待审核</van-tag>
          <van-tag type="success" size="medium" v-if="item.shzt == 1">已通过</van-tag>
          <van-tag type="danger" size="medium" v-if="item.shzt == -1">未通过</van-tag>
        </template>
        <template #desc>
          <div class="van-card__desc van-ellipsis"> {{item.name}}&#160;(&#160;{{item.phone}}&#160;)</div>
        </template>
        <template #tags>
          <van-tag round  size="medium" type="primary">{{item.area}}</van-tag>
        </template>
        <template #bottom>
          <div class="van-card__bottom">{{item.departmentName}}&#160;/&#160;{{item.employeeName}}</div>
        </template>
        <template #footer>
          <van-button round  color="linear-gradient(to right, #ff6034, #ee0a24)" size="small" :to="{ name: 'applyResult', params: { id: item.id } }" style="width:8em;">查看</van-button>
        </template>
      </van-card>
    </van-form>
    
  </div>
</template>

<script>
import { visitorApi } from 'api/visitor';
import Vue from 'vue';
import { Cell, CellGroup } from 'vant';
import config from '@/config';

export const baseUrl = config.baseUrl.apiUrl;

Vue.use(Cell);
Vue.use(CellGroup);
export default {
  name: 'applyList',
  data() {
    return {
      downloadUrl: '',
      successImgUrl:require("assets/success_new.png"),
      waitImgUrl:require("assets/wait.png"),
      failImgUrl:require("assets/fail_new.png"),
      recordImgUrl:require("assets/record.png"),
      details: [],
      openid: ''
    };
  },
  computed: {},
  created() {
    //this.parent.openid = this.$route.params.openid;
    this.openid = localStorage.getItem("openid");
    if(!this.openid||this.openid == "null"){
      //返回首页
      this.$router.push('/visitor/index');
    }
    this.downloadUrl = baseUrl + '/visitorsRecord/downloadImg/';
  },
  mounted() {
    this.getResults();
  },
  methods: {
    async getResults() {
      let result = await visitorApi.getResultsByOpenId(this.openid); 
      this.details = result.data;
    }
  }
};
</script>
<style scoped>
.bottom-button {
  width: 200px;
  height: 40px;
}
.body_w{
  position:absolute;
  width: 100%;
  height: 100%;
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
.van-card {
    position: relative;
    box-sizing: border-box;
    padding: 0.21333rem 0.42667rem;
    color: #323233;
    font-size: 0.32rem;
    background-color: white;
}
.img_div_w{
  width: 100%;
  height: aoto;
  text-align: center;
}
.img_font_w{
  text-align: center;
  font-size: 1.2em;
  font-weight: bold;
  line-height: 1.5em;
  margin-bottom: 10px;
}
</style>
