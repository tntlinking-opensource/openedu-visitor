<template>
  <div>
    <Form ref="form" :rules="formValidate" :label-width="90" :model="form">
          <FormItem label="部门" prop="departmentId">
            <Select v-model="form.departmentId" @on-change='getEmployees'>
                <Option
                    :key="item.value"
                    :value="item.value"
                    v-for="item in departmentList"
                  >{{ item.label }}</Option>
            </Select>
        </FormItem>
          <FormItem label="审核人" prop="employeeId">
            <Select v-model="form.employeeId">
                <Option
                    :key="item.value"
                    :value="item.value"
                    v-for="item in employeesList"
                  >{{ item.label }}</Option>
            </Select>
          </FormItem>
    </Form>
    <Row class="code-row-bg" justify="end" type="flex">
      <Button @click="cancel" style="margin-right:10px">取消</Button>
      <Button @click="save" type="primary">保存</Button>
    </Row>
  </div>
</template>
<script>
  import { reviewerApi } from '@/api/reviewer';
  import { departmentApi} from '@/api/department';
  import departmentListVue from '../../../system/employee/department/department-list.vue';
  export default {
    name: 'ReviewerListForm',
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
        // 部门列表
          departmentList: [],
          // 员工列表
          employeesList: [],
        //表单数据
        form: {
          //部门
          departmentId:null,
          //审核人
          employeeId:null,
        },
        //表单验证
        formValidate: {
        //部门
        // departmentId: [
        //   {
        //     required: true,
        //     message: '部门不能为空',
        //     trigger: 'change'
        //   }
        // ],
        // //审核人
        // employeeId: [
        //   {
        //     required: true,
        //     message: '审核员不能为空',
        //     trigger: 'change'
        //   }
        // ],
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
      this.getAllDepartments();
    },
    methods: {

      async getAllDepartments(){
        const result = await departmentApi.getDepartmentAll();
        let datas = result.data;
        //console.log(datas);
        let list = [];
        datas.map(item => {
        list.push({
        value: item.id,
        label: item.name
        });
      });
        this.departmentList = list;
        //console.log(this.departmentList);
      },

      async getEmployees(){
        if(this.form.departmentId){
          this.employeesList = [];
          const result = await departmentApi.getListEmployeeByDepartmentId(this.form.departmentId);
          let datas = result.data;
          //console.log(datas.data);
          let list = [];
          datas.map(item => {
            list.push({
            value: item.id,
            label: item.actualName
            });
          });
          this.employeesList = list;
        }
      },
    
      cancel() {
        this.$emit('on-form-close');
      },
      save() {
       this.$refs['form'].validate(valid => {
         console.log(this.form.departmentId);
         if(this.form.departmentId == null || this.form.departmentId == ''){
           this.$Message.error('请选择部门!');
           return;
         }
         if(this.form.employeeId == null || this.form.employeeId == ''){
           this.$Message.error('请选择审核人!');
           return;
         }
         if (this.isUpdate) {
           this.update();
          } else {
            this.add();
          }
       });
      },
      resetForm() {
        this.form = {
          //自增
          id:null,
          //部门
          departmentId:'',
          //审核人
          employeeId:'',
        };
        //this.$refs['form'].resetFields();
      },
      async add() {
        //this.$Spin.show();
        //this.employeesList.add(this.form.employeesid);
        let res = await departmentApi.setReviewer(this.form);
        this.$Message.success(res.msg);
        //this.$Spin.hide();
        this.resetForm();
        this.$emit('on-form-close');
      },
      async update() {
        this.$Spin.show();
        let res = await reviewerApi.updateReviewer(this.form);
        this.$Message.success(res.msg);
        this.$Spin.hide();
        this.resetForm();
        this.$emit('on-form-close');
      }
    }
  };
</script>