<!-- home -->
<template>
  <div class="body_w">
    <van-nav-bar
      left-text="返回"
      left-arrow
      @click-left="$router.back()"
      title="申请结果"
    />

    <div class="main_w" style="width: 100%;height: 85%;overflow-y: auto;">
      <div class="img_font_w" v-if="details.shzt == 0">
        <div class="img_div_w">
          <van-image
            width="200"
            height="200"
            :src="waitImgUrl"
          />
        </div>
        <span>待审核</span>
      </div>
      <div class="img_font_w" v-if="details.shzt == 1">
        <div class="img_div_w">
          <van-image
            width="200"
            height="200"
            :src="downloadUrl+details.qrCode"
          />
        </div>
        <span>申请已通过</span>
      </div>
      <div class="img_font_w" v-if="details.shzt == -1">
        <div class="img_div_w">
          <van-image
            width="200"
            height="200"
            :src="downloadUrl+details.qrCode"
          />
        </div>
        <span>审核未通过</span>
      </div>
      <div class="img_font_w_2">
        <span>访问部门：{{details.departmentName}}&#160;/&#160;{{details.employeeName}}</span><br>
        <span>访校时间：{{details.visitorsTime}}</span><br>
      </div>
      
      <van-form>
        <van-cell-group>
          <van-cell title="访客姓名">
            <template slot="default">
              <span>{{ details.name }}</span>
            </template>
          </van-cell>
          
          <van-cell title="所在地区">
            <template slot="default">
              <span>{{ details.area }}</span>
            </template>
          </van-cell>
          <van-cell title="手机号码">
            <template slot="default">
              <span>{{ details.phone }}</span>
            </template>
          </van-cell>
          <van-cell title="来访事由">
            <template slot="default">
              <span>{{ details.remark }}</span>
            </template>
          </van-cell>
          <!-- <van-cell title="行程码">
            <template slot="default">
              <van-image
                width="100"
                height="100"
                :src="itineraryCodeUrl"
                @click="sceneItineraryCodeUrlImg()"
              />
            </template>
          </van-cell>
          <van-cell title="健康码">
            <template slot="default">
              <van-image
                width="100"
                height="100"
                :src="healthCodeUrl"
                @click="sceneHealthCodeUrlImg()"
              />
            </template>
          </van-cell> -->
          <van-cell title="身份证">
            <template slot="default">
              <span>{{ details.idCardEncryption }}</span>
            </template>
          </van-cell>
          <van-cell title="公司">
            <template slot="default">
              <span>{{ details.companyName }}</span>
            </template>
          </van-cell>
          <!-- <van-cell title="情况说明">
            <template slot="default">
              <span>{{
                details.specialCase == 1
                  ? '本人未离开上海/抵达上海14天以上'
                  : '抵达上海不满14天'
              }}</span>
            </template>
          </van-cell>
          <van-cell title="是否发热">
            <template slot="default">
              <span>{{ details.isFr == 0 ? '否' : '是' }}</span>
            </template>
          </van-cell> -->
          <van-cell title="访问部门">
            <template slot="default">
              <span>{{ details.departmentName }}</span>
            </template>
          </van-cell>
          <van-cell title="访问教师">
            <template slot="default">
              <span>{{ details.employeeName }}</span>
            </template>
          </van-cell>
          <van-cell title="访校时间">
            <template slot="default">
              <span>{{ details.visitorsTime }}</span>
            </template>
          </van-cell>
          <van-cell title="审核意见">
            <template slot="default">
              <span>{{ details.shyj }}</span>
            </template>
          </van-cell>
        </van-cell-group>
      </van-form>
    </div>
  </div>
</template>

<script>
import { visitorApi } from 'api/visitor';
import Vue from 'vue';
import { Cell, CellGroup, Dialog, Icon ,NavBar} from 'vant';
import { ImagePreview } from "vant"; // 引入Vant图片预览组件
import config from '@/config';

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
      downloadUrl: '',
      successImgUrl:require("assets/success_new.png"),
      waitImgUrl:require("assets/wait.png"),
      failImgUrl:require("assets/fail_new.png"),
      isHidden: true,
      itineraryCodeUrl: '',
      healthCodeUrl: '',
      successHidden: true,
      failHidden: true,
      crossHidden: true,
      hiddenButton: false,
      backButton: true,
      details: {},
      id: '',
      openid: ''
    };
  },
  computed: {},
  created() {
    //this.parent.openid = this.$route.params.openid;
    this.openid = localStorage.getItem("openid");
    if(!this.openid||this.openid == "null"){
      //返回首页
      this.$router.push('/dashboard/visitor');
    }
    this.downloadUrl = baseUrl + '/visitorsRecord/downloadImg/';
  },
  mounted() {
    this.id = this.$route.params.id;
    this.getResults();
  },
  methods: {
    async getResults() {
      let result = await visitorApi.getResultsById(this.id);
      this.details = result.data;
      this.itineraryCodeUrl = baseUrl + '/visitorsRecord/downloadImg/' + result.data.itineraryCode;
      this.healthCodeUrl = baseUrl + '/visitorsRecord/downloadImg/' + result.data.healthCode;
      // if (this.details.shzt == 0) {
      //   this.details.shzt = '待审核';
      //   this.failHidden = false;
      // } else if (this.details.shzt == 1) {
      //   this.details.shzt = '审核通过';
      //   this.successHidden = false;
      // } else {
      //   this.details.shzt = '审核未通过';
      //   this.crossHidden = false;
      // }
      //console.log(this.details);
    },
    lookDetails() {
      this.isHidden = false;
      this.failHidden = true;
      this.successHidden = true;
      this.crossHidden = true;
      this.hiddenButton = true;
      this.backButton = false;
    },
    back() {
      this.isHidden = true;
      if (this.details.shzt == '待审核') {
        this.failHidden = false;
      } else if (this.details.shzt == '审核通过') {
        this.successHidden = false;
      } else {
        this.crossHidden = false;
      }
      this.hiddenButton = false;
      this.backButton = true;
    },
    //预览图片
    sceneItineraryCodeUrlImg() {
      const list = [this.itineraryCodeUrl];
      ImagePreview({
        images:list, //需要预览的图片 URL 数组
        showIndex:true, //是否显示页码
        loop:false, //是否开启循环播放
        startPosition:0 //图片预览起始位置索引
      })
    },
    sceneHealthCodeUrlImg() {
      const list = [this.healthCodeUrl];
      ImagePreview({
        images:list, //需要预览的图片 URL 数组
        showIndex:true, //是否显示页码
        loop:false, //是否开启循环播放
        startPosition:0 //图片预览起始位置索引
      })
    }
  }
};
</script>
<style scoped>
.body_w{
  position:absolute;
  width: 100%;
  height: 100%;
  background: white;
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
.img_font_w_2{
  text-align: center;
  font-size: 1.2em;
  line-height: 1.5em;
  margin-bottom: 10px;
}
</style>
