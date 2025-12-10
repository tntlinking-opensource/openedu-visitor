<template>
  <div>
    <Form ref="form" :rules="formValidate" :label-width="90" :model="form">
          <FormItem label="所属社区" prop="communityId">
             <Select v-model="form.communityId"  @on-change="queryList">
                <Option v-for="item in communitys" :value="item.id" :key="item.id">{{ item.name }}</Option>
            </Select>
          </FormItem>
          <FormItem label="小区名称" prop="name">
            <Input v-model="form.name" />
          </FormItem>
          <FormItem label="备注" prop="remark">
            <Input v-model="form.remark" />
          </FormItem>
    </Form>
    <Row class="code-row-bg" justify="end" type="flex">
      <Button @click="cancel" style="margin-right:10px">取消</Button>
      <Button @click="save" type="primary">保存</Button>
    </Row>
  </div>
</template>
<script>
  import { plotApi } from '@/api/plot';
  export default {
    name: 'PlotListForm',
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
        communitys: [],
        //表单数据
        form: {
         //社区id
         communityId:null,
         //名称
         name:null,
         //备注
         remark:null,
        },
        //表单验证
        formValidate: {
        //社区id
        communityId:[{ type:'number',required: true, message: '请选择所属社区', trigger: 'blur' }],
        //名称
        name:[{ required: true, message: '请输入名称', trigger: 'blur' }],
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
    mounted() {
      this.getCommunitys();
    },
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
          //社区id
          communityId:null,
          //名称
          name:null,
          //备注
          remark:null,
        };
        this.$refs['form'].resetFields();
      },
      async add() {
        this.$Spin.show();
        let res = await plotApi.addPlot(this.form);
        this.$Message.success(res.msg);
        this.$Spin.hide();
        this.resetForm();
        this.$emit('on-form-close');
      },
      async update() {
        this.$Spin.show();
        let res = await plotApi.updatePlot(this.form);
        this.$Message.success(res.msg);
        this.$Spin.hide();
        this.resetForm();
        this.$emit('on-form-close');
      },
      //加载所属社区信息
      async getCommunitys (){
          let result = await plotApi.getCommunitys();
          this.communitys = result;
      },
    }
  };
</script>