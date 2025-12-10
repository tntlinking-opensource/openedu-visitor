<template>
  <div>
    <Form ref="form" :rules="formValidate" :label-width="90" :model="form">
          <FormItem label="社区名称" prop="name">
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
  import { communityApi } from '@/api/community';
  export default {
    name: 'CommunityListForm',
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
         //name
         name:null,
         //remark
         remark:null,
        },
        //表单验证
        formValidate: {
        //name
        name:[{ required: true, message: '请输入小区名称', trigger: 'blur' }],
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
          //name
          name:null,
          //remark
          remark:null,
        };
        this.$refs['form'].resetFields();
      },
      async add() {
        this.$Spin.show();
        let res = await communityApi.addCommunity(this.form);
        this.$Message.success(res.msg);
        this.$Spin.hide();
        this.resetForm();
        this.$emit('on-form-close');
      },
      async update() {
        this.$Spin.show();
        let res = await communityApi.updateCommunity(this.form);
        this.$Message.success(res.msg);
        this.$Spin.hide();
        this.resetForm();
        this.$emit('on-form-close');
      }
    }
  };
</script>