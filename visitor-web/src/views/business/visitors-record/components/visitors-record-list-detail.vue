<template>
  <Modal
    :footer-hide="true"
    :width="700"
    title="申请访校明细"
    v-model="isShowDetailModal"
  >
    <Form :label-width="120">
      <Row :gutter="24">
        <Col span="12">
          <FormItem label="访客姓名:">{{ details.name }}</FormItem>
        </Col>
        <Col span="12">
          <FormItem label="电话:">{{ details.phone }}</FormItem>
        </Col>
      </Row>
      <Row :gutter="24">
        <Col span="12">
          <FormItem label="身份证:">{{ details.idCardEncryption }}</FormItem>
        </Col>
        <Col span="12">
          <FormItem label="所在地区:">{{ details.area }}</FormItem>
        </Col>
      </Row>
      <Row :gutter="24">
        <Col span="24">
          <FormItem label="公司名称:">{{ details.companyName }}</FormItem>
        </Col>
      </Row>
      <!-- <Row :gutter="24">
        <Col span="12">
          <FormItem label="健康码:">
            <img :src="healthCodeUrl" @click="showHealthCodeUrlImgModalForDetail()" width="100px" height="100px" style="cursor:pointer;"  alt="">
          </FormItem>
        </Col>
        <Col span="12">
          <FormItem label="行程码:">
            <img :src="itineraryCodeUrl" @click="showItineraryCodeImgModalForDetail()" width="100px" height="100px" style="cursor:pointer;"  alt="">
          </FormItem>
        </Col>
      </Row>
      <Row :gutter="24">
        <Col span="12">
          <FormItem label="情况说明:">{{
            details.specialCase == 1
              ? "未离开上海/抵达上海14天以上"
              : "抵达上海不满14天"
          }}</FormItem>
        </Col>
        <Col span="12">
          <FormItem label="是否发热:">{{
            details.isFr == 1 ? "发热" : "不发热"
          }}</FormItem>
        </Col>
      </Row> -->
      <Row :gutter="24">
        <Col span="12">
          <FormItem label="访问教师:">{{ details.deptEmp }}</FormItem>
        </Col>
        <Col span="12">
          <FormItem label="访校时间:">{{ details.visitorsTime }}</FormItem>
        </Col>
      </Row>
      <Row :gutter="24">
        <Col span="24">
          <FormItem label="访校原因:">{{ details.remark }}</FormItem>
        </Col>
      </Row>
      <Row :gutter="24">
        <Col span="24">
          <FormItem label="审核意见:">{{ details.shyj }} </FormItem>
        </Col>
      </Row>
    </Form>
    <!--图片预览-->
    <Modal
      v-model="showImgModal"
      draggable
      width="500"
      title="预览">

      <img :src="imgCodeUrl" width="100%" height="100%"  alt="">
      <div slot="footer"></div>
    </Modal>
    <!--图片预览-->
  </Modal>


</template>
<script>

import config from '@/config';

const baseUrl = config.baseUrl.apiUrl;
export default {
  name: "VisitorsRecordListDetail",
  components: {},
  props: {},
  data() {
    return {
      //显示图片预览弹框
      showImgModal : false,
      isShowDetailModal: false,
      details: {},
      itineraryCodeUrl:'',
      healthCodeUrl:'',
      imgCodeUrl: '',
    };
  },
  watch: {},
  created() {},
  mounted() {},
  methods: {
    showModal(details) {
      this.isShowDetailModal = true;
      this.details = details;
      this.itineraryCodeUrl = baseUrl+"/visitorsRecord/downloadImg/"+details.itineraryCode;
      this.healthCodeUrl = baseUrl+"/visitorsRecord/downloadImg/"+details.healthCode;
    },
    showHealthCodeUrlImgModalForDetail(){
      this.imgCodeUrl = this.healthCodeUrl;
      this.showImgModal = true;
    },
    showItineraryCodeImgModalForDetail(){
      this.imgCodeUrl = this.itineraryCodeUrl;
      this.showImgModal = true;
    }
  },
};
</script>
