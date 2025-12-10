<template>
  <div>
    <Form ref="form" :rules="formValidate" :label-width="90" :model="form">
          <FormItem label="部门编号" prop="code">
            <Input v-model="form.code" />
          </FormItem>
          <FormItem label="部门名称" prop="name">
            <Input v-model="form.name" />
          </FormItem>
          <FormItem label="部门简称" prop="shortName">
            <Input v-model="form.shortName" />
          </FormItem>
          <FormItem label="英文名称" prop="engName">
            <Input v-model="form.engName" />
          </FormItem>
          <FormItem label="部门负责人" prop="managerName">
            <Select v-model="form.managerId" filterable>
                <Option
                    :key="item.value"
                    :value="item.value"
                    v-for="item in employees"
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
  import { departmentApi } from '@/api/department';
  import { employeeApi} from '@/api/employee';
  export default {
    name: 'DepartmentListForm',
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
        // 负责人下拉框
        employees:[],
        //表单数据
        form: {
         //部门名称
         name:null,
         //部门简称
         shortName:null,
         //部门负责人
         managerName:'',
         //部门编号
         code:null,
         //部门英文名称
         engName:null,
         // 员工id
         managerId:''
        },
        //表单验证
        formValidate: {
        //部门名称
        name:[{ required: true, message: '请输入部门名称', trigger: 'blur' }],
        //部门简称
        //shortName:[{ required: true, message: '请输入部门简称', trigger: 'blur' }],
        //部门负责人id
        //managerName:[{ required: true, message: '请输入部门负责人', trigger: 'blur' }],
        // 部门编号
        code:[{ required: true, message: '请输入部门编号', trigger: 'blur' }],
        //部门英文名称
        //engName:[{ required: true, message: '请输入部门英文名称', trigger: 'blur' }],
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
          //部门主键id
          id:null,
          //部门名称
          name:null,
          //部门简称
          shortName:null,
          //部门负责人id
          managerName:'',
          //部门编号
          code:null,
          //部门英文名称
          engName:null,
          //
          managerId:null
        };
        this.$refs['form'].resetFields();
      },
      async add() {
        this.$Spin.show();
        let res = await departmentApi.addDepartment(this.form);
        this.$Message.success(res.msg);
        this.$Spin.hide();
        this.resetForm();
        this.$emit('on-form-close');
      },
      async update() {
        this.$Spin.show();
        let res = await departmentApi.updateDepartment(this.form);
        this.$Message.success(res.msg);
        this.$Spin.hide();
        this.resetForm();
        this.$emit('on-form-close');
      },
      // 查询负责人
      async getEmployees(){
        this.employees = [];
        const result = await employeeApi.getAllEmployee();
        let datas = result.data;
        //console.log(datas.data);
        let list = [];
        datas.map(item => {
        list.push({
        value: item.id,
        label: item.actualName
        });
      });
        this.employees = list;
        //console.log(this.employeesList);
      },
    }
  };
</script>