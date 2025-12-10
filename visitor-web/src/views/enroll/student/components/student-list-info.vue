<template>
  <div>
    <Row><Col span="24"><div class="file_title_w"><span>学生信息</span></div></Col></Row>
    <Row :gutter="16" align="top" style="line-height: 30px;">
      <Col span="6"  class="cl_right">姓名:</Col>
      <Col span="6" class="cl_font">{{form.name}}</Col>
      <Col span="6" class="cl_right">性别:</Col>
      <Col span="6" class="cl_font">{{form.genderStr}}</Col>
    </Row>
    <Row :gutter="16" align="top" style="line-height: 30px;">
      <Col span="6" class="cl_right">出生年月日:</Col>
      <Col span="6" class="cl_font">{{form.birthday}}</Col>
      <Col span="6" class="cl_right">民族:</Col>
      <Col span="6" class="cl_font">{{form.nation}}</Col>
    </Row>
    <Row :gutter="16" align="top" style="line-height: 30px;">
      <Col span="6" class="cl_right">新生身份证号:</Col>
      <Col span="18" class="cl_font">{{form.idCard}}</Col>
    </Row>
    <Row :gutter="16" align="top" style="line-height: 30px;">
      <Col span="6" class="cl_right">户籍所在地详细地址:</Col>
      <Col span="18" class="cl_font">{{form.koseki}}</Col>
    </Row>
    <Row :gutter="16" align="top" style="line-height: 30px;">
      <Col span="6" class="cl_right">实际居住地详细地址:</Col>
      <Col span="18" class="cl_font">{{form.address}}</Col>
    </Row>


  <Row><Col span="24"><div class="file_title_w"><span>家长信息</span></div></Col></Row>
  <Row :gutter="16" align="top" style="line-height: 30px;">
    <Col span="12" style="text-align: center;"><Tag size="large">父亲</Tag></Col>
    <Col span="12" style="text-align: center;"><Tag size="large">母亲</Tag></Col>
  </Row>
  <Row :gutter="16" align="top" style="line-height: 30px;">
    <Col span="6" class="cl_right">姓名:</Col>
    <Col span="6" class="cl_font">{{form.nameFather}}</Col>
    <Col span="6" class="cl_right">姓名:</Col>
    <Col span="6" class="cl_font">{{form.nameMather}}</Col>
  </Row>
  <Row :gutter="16" align="top" style="line-height: 30px;">
    <Col span="6" class="cl_right">工作单位:</Col>
    <Col span="6" class="cl_font">{{form.workUnitFather}} </Col>
    <Col span="6" class="cl_right">工作单位:</Col>
    <Col span="6" class="cl_font">{{form.workUnitMather}} </Col>
  </Row>
  <Row :gutter="16" align="top" style="line-height: 30px;">
    <Col span="6" class="cl_right">工作单位详细地址:</Col>
    <Col span="6" class="cl_font">{{form.workAddressFather}}</Col>
    <Col span="6" class="cl_right">工作单位详细地址:</Col>
    <Col span="6" class="cl_font">{{form.workAddressMather}}</Col>
  </Row>
  <!-- <Row :gutter="16" align="top" style="line-height: 30px;">
    <Col span="6" class="cl_right">单位电话: </Col>
    <Col span="6" class="cl_font">{{form.workTelephoneFather}} </Col>
    <Col span="6" class="cl_right">单位电话:</Col>
    <Col span="6" class="cl_font">{{form.workTelephoneMather}}</Col>
  </Row>
  <Row :gutter="16" align="top" style="line-height: 30px;">
    <Col span="6" class="cl_right">住宅电话:</Col>
    <Col span="6" class="cl_font">{{form.homePhoneFather}}</Col>
    <Col span="6" class="cl_right">住宅电话:</Col>
    <Col span="6" class="cl_font">{{form.homePhoneMather}}</Col>
  </Row> -->
  <Row :gutter="16" align="top" style="line-height: 30px;">
    <Col span="6" class="cl_right">移动电话:</Col>
    <Col span="6" class="cl_font">{{form.phoneFather}}</Col>
    <Col span="6" class="cl_right">移动电话:</Col>
    <Col span="6" class="cl_font">{{form.phoneMather}}</Col>
  </Row>

  <Row><Col span="24"><div class="file_title_w"><span>社区信息</span></div></Col></Row>
  <Row :gutter="16" align="top" style="line-height: 30px;">
    <Col span="6" class="cl_right">社区名称:</Col>
    <Col span="6" class="cl_font">{{form.communityName}}</Col>
    <Col span="6" class="cl_right">小区名称:</Col>
    <Col span="6" class="cl_font">{{form.plotName}}</Col>
  </Row>
  <Row :gutter="16" align="top" style="line-height: 30px;">
    <Col span="6" class="cl_right">房产证户主姓名:</Col>
    <Col span="6" class="cl_font">{{form.householdHead}}</Col>
    <Col span="6" class="cl_right">户主与新生的关系:</Col>
    <Col span="6" class="cl_font">{{form.relation}}</Col>
  </Row>
  <Row :gutter="16" align="top" style="line-height: 30px;">
    <Col span="6" class="cl_right">房产证号:</Col>
    <Col span="18" class="cl_font">{{form.premisesPermitCode}}</Col>
  </Row>

  <Row><Col span="24"><div class="file_title_w"><span>其他</span></div></Col></Row>
  <Row :gutter="16" align="top" style="line-height: 30px;">
    <Col span="6" class="cl_right">幼儿园名称:</Col>
    <Col span="6" class="cl_font">{{form.kindergarten}}</Col>
    
  </Row>
  <Row :gutter="16" align="top" style="line-height: 30px;">
    <Col span="6" class="cl_right">新生特点:</Col>
    <Col span="18" class="cl_font">{{form.feature}}</Col>
  </Row>
  <Row :gutter="16" align="top" style="line-height: 30px;">
    <Col span="6" class="cl_right">备注:</Col>
    <Col span="18" class="cl_font">{{form.remark}}</Col>
  </Row>

    <Row class="code-row-bg" justify="end" type="flex">
      <Button @click="cancel" type="primary">关闭</Button>
    </Row>
  </div>
</template>
<script>
  import { studentApi } from '@/api/student';
  export default {
    name: 'StudentListInfo',
    components: {
    },
    props: {
      //更新的表单数据对象
      infoData: {
        type: Object
      }
    },
    data() {
      return {
        //表单数据
        form: {
         //姓名
         name:null,
         //性别
         genderStr:null,
         //生日
         birthday:null,
         //民族
         nation:null,
         //户籍所在地详细地址
         koseki:null,
         //实际居住地详细地址（包含门栋号）
         address:null,
         //社区名称
         communityName:null,
         //小区ID
         plotid:null,
         //小区名称
         plotName:null,
         //房产证户主姓名
         householdHead:null,
         //与新生的关系
         relation:null,
         //房产证号
         premisesPermitCode:null,
         //幼儿园
         kindergarten:null,
         //身份证号
         idCard:null,
         //新生特点
         feature:null,
         //备注
         remark:null,
         //姓名 -----父亲
         nameFather:null,
         //工作单位-----父亲
         workUnitFather:null,
         //工作单位详细地址-----父亲
         workAddressFather:null,
         //单位电话-----父亲
         workTelephoneFather:null,
         //住宅电话-----父亲
         homePhoneFather:null,
         //手机-----父亲
         phoneFather:null,
         //姓名 -----母亲
         nameMather:null,
         //工作单位 -----母亲
         workUnitMather:null,
         //工作单位详细地址 -----母亲
         workAddressMather:null,
         //单位电话 -----母亲
         workTelephoneMather:null,
         //住宅电话 -----母亲
         homePhoneMather:null,
         //手机 -----母亲
         phoneMather:null,
        }
      };
    },
  watch: {
      infoData: function(newValue, oldValue) {
          for (let k in this.form) {
              this.$set(this.form, k, newValue[k]);
          }
          this.$set(this.form, 'id', newValue['id']);
      },
  },
    created() {},
    mounted() {},
    methods: {
      cancel() {
        this.$emit('on-form-close');
      }
    }
  };
</script>
<style scoped>
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
    font-size: 10px;
  }
  .cl_right{
    min-height:1px;
        text-align: right;
        line-height: 30px;
  }
  .cl_font{
    min-height:1px;
    color: #999;
  }
</style>