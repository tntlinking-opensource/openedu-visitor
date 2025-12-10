<style lang="less">
    .vertical-center-modal{
        display: flex;
        align-items: center;
        justify-content: center;

        .ivu-modal{
            top: 0;
        }
    }
</style>
<template>
  <div>
    <Modal :footer-hide="true" :width="700" title="审核" v-model="isShowDetailModal">
      <Form :label-width="100">
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
            <FormItem label="审核意见:">
              <Input v-model="update.shyj" maxlength="30" show-word-limit type="textarea" placeholder="审核意见" style="width: 500px" />
            </FormItem>
          </Col>
        </Row>
      </Form>
      <Row class="code-row-bg" justify="end" type="flex">
        <Button @click="modalShow1" style="margin-right:10px;width:150px;" type="primary">通过</Button>
        <Button @click="modalShow0" style="margin-right:10px;width:150px;"  type="error">不通过</Button>
      </Row>
    </Modal>

    <Modal
        v-model="modalShow"
        @on-ok="ok"
        @on-cancel="cancel"
        class-name="vertical-center-modal">
        <p>{{this.message}}</p>
    </Modal>

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

  </div>
</template>
<script>
import { visitorsRecordApi } from '@/api/visitors-record';
import config from '@/config';

const baseUrl = config.baseUrl.apiUrl;
  export default {
    name: 'AuditManagementListForm',
    components: {},
    props: {},
    data() {
      return {
        modalShow: false,
        isShowDetailModal: false,
         //显示图片预览弹框
        showImgModal : false,
        healthCodeUrl:'',
        itineraryCodeUrl:'',
        imgCodeUrl: '',
        details: {},
        status: 0,
        message: '',
        update:{
          id: null,
          shzt: null,
          shyj: ''
        }
      };
    },
    watch: {},
    created() {},
    mounted() {},
    methods: {
      showModal(details){
        this.isShowDetailModal = true;
        this.details = details;
        this.update.shyj = this.details.shyj;
        this.itineraryCodeUrl = baseUrl+"/visitorsRecord/downloadImg/"+details.itineraryCode;
        this.healthCodeUrl = baseUrl+"/visitorsRecord/downloadImg/"+details.healthCode;
      },
      pass() {
        this.update.shzt = 1;
        this.update.id = this.details.id;
        visitorsRecordApi.updateVisitorsRecord(this.update);
        this.$Message.success('审核成功');
        this.$emit('close');
        this.isShowDetailModal = false;

      },
      nopass() {
        this.update.shzt = -1;
        this.update.id = this.details.id;
        visitorsRecordApi.updateVisitorsRecord(this.update);
        this.$Message.success('审核成功');
        this.$emit('close');
        this.isShowDetailModal = false;
      },
      modalShow0 (){
        this.message = '您的审核结果为"不通过",点击确认按钮保存审核结果';
        this.modalShow = true;
        this.status = 0;
      },
      modalShow1 (){
        this.message = '您的审核结果为"通过",点击确认按钮保存审核结果';
        this.modalShow = true;
        this.status = 1;
      },
      ok () {
        if(this.status == 1){
          this.pass();
        }else{
          if(!this.update.shyj){
            this.$Notice.error({
              title: '不通过请填写审核意见。',
              desc: ' '
            });
          }else{
            this.nopass();
          }
        }

      },
      cancel () {
      },
      showImgModalForDetail(){
        this.showImgModal = true;
      },
      showHealthCodeUrlImgModalForDetail(){
        this.imgCodeUrl = this.healthCodeUrl;
        this.showImgModal = true;
      },
      showItineraryCodeImgModalForDetail(){
        this.imgCodeUrl = this.itineraryCodeUrl;
        this.showImgModal = true;
      }
    }
  };
</script>
