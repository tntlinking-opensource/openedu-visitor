<template>
  <div>
    <Form ref="form" :rules="formValidate" :label-width="90" :model="form">
          <FormItem label="姓名" prop="name">
            <Input v-model="form.name" />
          </FormItem>
          <FormItem label="性别" prop="gender">
            <Input type="number" v-model.number="form.gender" />
          </FormItem>
          <FormItem label="生日" prop="birthday">
            <Input v-model="form.birthday" />
          </FormItem>
          <FormItem label="民族" prop="nation">
            <Input v-model="form.nation" />
          </FormItem>
          <FormItem label="户籍所在地详细地址" prop="koseki">
            <Input v-model="form.koseki" />
          </FormItem>
          <FormItem label="实际居住地详细地址（包含门栋号）" prop="address">
            <Input v-model="form.address" />
          </FormItem>
          <FormItem label="小区" prop="plotid">
            <Input type="number" v-model.number="form.plotid" />
          </FormItem>
          <FormItem label="房产证户主姓名及新生的关系" prop="relation">
            <Input v-model="form.relation" />
          </FormItem>
          <FormItem label="房产证号" prop="premisesPermitCode">
            <Input v-model="form.premisesPermitCode" />
          </FormItem>
          <FormItem label="幼儿园" prop="kindergarten">
            <Input v-model="form.kindergarten" />
          </FormItem>
          <FormItem label="身份证号" prop="idCard">
            <Input v-model="form.idCard" />
          </FormItem>
          <FormItem label="新生特点" prop="feature">
            <Input v-model="form.feature" />
          </FormItem>
          <FormItem label="备注" prop="remark">
            <Input v-model="form.remark" />
          </FormItem>
          <FormItem label="姓名 -----父亲" prop="pName">
            <Input v-model="form.pName" />
          </FormItem>
          <FormItem label="工作单位-----父亲" prop="pWorkUnit">
            <Input v-model="form.pWorkUnit" />
          </FormItem>
          <FormItem label="工作单位详细地址-----父亲" prop="pWorkAddress">
            <Input v-model="form.pWorkAddress" />
          </FormItem>
          <FormItem label="单位电话-----父亲" prop="pWorkTelephone">
            <Input v-model="form.pWorkTelephone" />
          </FormItem>
          <FormItem label="住宅电话-----父亲" prop="pHomePhone">
            <Input v-model="form.pHomePhone" />
          </FormItem>
          <FormItem label="手机-----父亲" prop="pPhone">
            <Input v-model="form.pPhone" />
          </FormItem>
          <FormItem label="姓名 -----母亲" prop="mName">
            <Input v-model="form.mName" />
          </FormItem>
          <FormItem label="工作单位 -----母亲" prop="mWorkUnit">
            <Input v-model="form.mWorkUnit" />
          </FormItem>
          <FormItem label="工作单位详细地址 -----母亲" prop="mWorkAddress">
            <Input v-model="form.mWorkAddress" />
          </FormItem>
          <FormItem label="单位电话 -----母亲" prop="mWorkTelephone">
            <Input v-model="form.mWorkTelephone" />
          </FormItem>
          <FormItem label="住宅电话 -----母亲" prop="mHomePhone">
            <Input v-model="form.mHomePhone" />
          </FormItem>
          <FormItem label="手机 -----母亲" prop="mPhone">
            <Input v-model="form.mPhone" />
          </FormItem>
    </Form>
    <Row class="code-row-bg" justify="end" type="flex">
      <Button @click="cancel" style="margin-right:10px">取消</Button>
      <Button @click="save" type="primary">保存</Button>
    </Row>
  </div>
</template>
<script>
  import { studentApi } from '@/api/student';
  export default {
    name: 'StudentListForm',
    components: {
    },
    props: {
      //是否为更新表单
      isUpdate: {
        type: Boolean,
        default: true
      },
      //更新的表单数据对象
      updateData: {
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
         gender:null,
         //生日
         birthday:null,
         //民族
         nation:null,
         //户籍所在地详细地址
         koseki:null,
         //实际居住地详细地址（包含门栋号）
         address:null,
         //小区
         plotid:null,
         //房产证户主姓名及新生的关系
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
         pName:null,
         //工作单位-----父亲
         pWorkUnit:null,
         //工作单位详细地址-----父亲
         pWorkAddress:null,
         //单位电话-----父亲
         pWorkTelephone:null,
         //住宅电话-----父亲
         pHomePhone:null,
         //手机-----父亲
         pPhone:null,
         //姓名 -----母亲
         mName:null,
         //工作单位 -----母亲
         mWorkUnit:null,
         //工作单位详细地址 -----母亲
         mWorkAddress:null,
         //单位电话 -----母亲
         mWorkTelephone:null,
         //住宅电话 -----母亲
         mHomePhone:null,
         //手机 -----母亲
         mPhone:null,
        },
        //表单验证
        formValidate: {
        //姓名
        name:[{ required: true, message: '请输入姓名', trigger: 'blur' }],
        //性别
        gender:[{ type:'number',required: true, message: '请输入性别', trigger: 'blur' }],
        //生日
        birthday:[{ required: true, message: '请输入生日', trigger: 'blur' }],
        //民族
        nation:[{ required: true, message: '请输入民族', trigger: 'blur' }],
        //户籍所在地详细地址
        koseki:[{ required: true, message: '请输入户籍所在地详细地址', trigger: 'blur' }],
        //实际居住地详细地址（包含门栋号）
        address:[{ required: true, message: '请输入实际居住地详细地址（包含门栋号）', trigger: 'blur' }],
        //小区
        plotid:[{ type:'number',required: true, message: '请输入小区', trigger: 'blur' }],
        //房产证户主姓名及新生的关系
        relation:[{ required: true, message: '请输入房产证户主姓名及新生的关系', trigger: 'blur' }],
        //房产证号
        premisesPermitCode:[{ required: true, message: '请输入房产证号', trigger: 'blur' }],
        //幼儿园
        kindergarten:[{ required: true, message: '请输入幼儿园', trigger: 'blur' }],
        //身份证号
        idCard:[{ required: true, message: '请输入身份证号', trigger: 'blur' }],
        //新生特点
        feature:[{ required: true, message: '请输入新生特点', trigger: 'blur' }],
        //备注
        remark:[{ required: true, message: '请输入备注', trigger: 'blur' }],
        //姓名 -----父亲
        pName:[{ required: true, message: '请输入姓名 -----父亲', trigger: 'blur' }],
        //工作单位-----父亲
        pWorkUnit:[{ required: true, message: '请输入工作单位-----父亲', trigger: 'blur' }],
        //工作单位详细地址-----父亲
        pWorkAddress:[{ required: true, message: '请输入工作单位详细地址-----父亲', trigger: 'blur' }],
        //单位电话-----父亲
        pWorkTelephone:[{ required: true, message: '请输入单位电话-----父亲', trigger: 'blur' }],
        //住宅电话-----父亲
        pHomePhone:[{ required: true, message: '请输入住宅电话-----父亲', trigger: 'blur' }],
        //手机-----父亲
        pPhone:[{ required: true, message: '请输入手机-----父亲', trigger: 'blur' }],
        //姓名 -----母亲
        mName:[{ required: true, message: '请输入姓名 -----母亲', trigger: 'blur' }],
        //工作单位 -----母亲
        mWorkUnit:[{ required: true, message: '请输入工作单位 -----母亲', trigger: 'blur' }],
        //工作单位详细地址 -----母亲
        mWorkAddress:[{ required: true, message: '请输入工作单位详细地址 -----母亲', trigger: 'blur' }],
        //单位电话 -----母亲
        mWorkTelephone:[{ required: true, message: '请输入单位电话 -----母亲', trigger: 'blur' }],
        //住宅电话 -----母亲
        mHomePhone:[{ required: true, message: '请输入住宅电话 -----母亲', trigger: 'blur' }],
        //手机 -----母亲
        mPhone:[{ required: true, message: '请输入手机 -----母亲', trigger: 'blur' }],
        }
      };
    },
  watch: {
      updateData: function(newValue, oldValue) {
          this.$refs['form'].resetFields();
          if (this.isUpdate) {
              for (let k in this.form) {
                  this.$set(this.form, k, newValue[k]);
              }
              this.$set(this.form, 'id', newValue['id']);
          }
      },
      isUpdate: function(newValue, oldValue) {
          if (!newValue) {
              this.resetForm();
              this.$refs['form'].resetFields();
          }
      }
  },
    created() {},
    mounted() {},
    methods: {
      cancel() {
        this.$emit('on-form-close');
      },
      save() {
       this.$refs['form'].validate(valid => {
         if (valid) {
           if (this.isUpdate) {
            this.update();
           } else {
             this.add();
           }
         } else {
          this.$Message.error('参数验证错误，请仔细填写表单数据!');
         }
       });
      },
    resetForm() {
        this.form = {
          //id
          id:null,
          //姓名
          name:null,
          //性别
          gender:null,
          //生日
          birthday:null,
          //民族
          nation:null,
          //户籍所在地详细地址
          koseki:null,
          //实际居住地详细地址（包含门栋号）
          address:null,
          //小区
          plotid:null,
          //房产证户主姓名及新生的关系
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
          pName:null,
          //工作单位-----父亲
          pWorkUnit:null,
          //工作单位详细地址-----父亲
          pWorkAddress:null,
          //单位电话-----父亲
          pWorkTelephone:null,
          //住宅电话-----父亲
          pHomePhone:null,
          //手机-----父亲
          pPhone:null,
          //姓名 -----母亲
          mName:null,
          //工作单位 -----母亲
          mWorkUnit:null,
          //工作单位详细地址 -----母亲
          mWorkAddress:null,
          //单位电话 -----母亲
          mWorkTelephone:null,
          //住宅电话 -----母亲
          mHomePhone:null,
          //手机 -----母亲
          mPhone:null,
        };
        this.$refs['form'].resetFields();
      },
      async add() {
        this.$Spin.show();
        let res = await studentApi.addStudent(this.form);
        this.$Message.success(res.msg);
        this.$Spin.hide();
        this.resetForm();
        this.$emit('on-form-close');
      },
      async update() {
        this.$Spin.show();
        let res = await studentApi.updateStudent(this.form);
        this.$Message.success(res.msg);
        this.$Spin.hide();
        this.resetForm();
        this.$emit('on-form-close');
      }
    }
  };
</script>