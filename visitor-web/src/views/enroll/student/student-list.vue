<template>
    <div>
        <Card class="smart-query-card">
            <!------ 查询条件第一行 begin------->
            <Row class="smart-query-form-row">
                <Col span="2" class="cl_right">姓名&nbsp;&nbsp;</Col>
                <Col span="4">
                    <Input placeholder="请输入姓名" style="width: 180px" v-model="queryForm.name" />
                </Col>
                <Col span="2" class="cl_right">性别&nbsp;&nbsp;</Col>
                <Col span="4">
                    <Select v-model="queryForm.gender" clearable  style="width:180px" @on-change="queryList">
                        <Option v-for="item in genders" :value="item.value" :key="item.value">{{ item.label }}</Option>
                    </Select>
                </Col>
                <Col span="2" class="cl_right">身份证号&nbsp;&nbsp;</Col>
                <Col span="4">
                    <Input placeholder="请输入身份证号" style="width: 180px" v-model="queryForm.idCard" />
                </Col>
                <Col span="6">
                    <ButtonGroup>
                    <Button
                            @click="queryList"
                            icon="ios-search"
                            type="primary"
                            v-privilege="'student-list-query'"
                    >查询</Button>
                    <Button
                            @click="resetQueryList"
                            icon="md-refresh"
                            type="default"
                            v-privilege="'student-list-query'"
                    >重置</Button>
                </ButtonGroup>

                <Button
                        @click="showMoreQueryConditionFlag = !showMoreQueryConditionFlag"
                        icon="md-more"
                        style="margin-left: 20px"
                        type="primary"
                        v-privilege="'student-list-query'"
                >{{showMoreQueryConditionFlag?'隐藏':'展开'}}</Button>
                </Col>
            </Row>
            <!------ 查询条件第一行 begin------->

            <!------ 查询条件第二行 begin------->
            <Row class="smart-query-form-row" v-show="showMoreQueryConditionFlag">
                <Col span="2" class="cl_right">家长姓名&nbsp;&nbsp;</Col>
                <Col span="4">
                    <Input placeholder="请输入父亲/母亲姓名" style="width: 180px" v-model="queryForm.parentName" />
                </Col>
                <Col span="2" class="cl_right">社区信息&nbsp;&nbsp;</Col>
                <Col span="4">
                    <Input placeholder="请输入社区名称/小区名称" style="width: 180px" v-model="queryForm.plot" />
                </Col>
            </Row>
            <!------ 查询条件第二行 end------->
        </Card>

        <Card class="warp-card">
            <!-------操作按钮行 begin------->
            <Row class="marginBottom10">
                <!-- <Button
                        @click="showAddStudentForm"
                        icon="md-add"
                        size="small"
                        type="primary"
                        v-privilege="'student-list-add'"
                >新建数据</Button>
                <Button
                        @click="showBatchDeleteModal"
                        class="marginLeft10"
                        icon="ios-trash-outline"
                        size="small"
                        type="error"
                        v-privilege="'student-list-batch-delete'"
                >批量删除</Button> -->

                <!-- <Button
                        :loading="allExportBtnLoading"
                        @click="exportWord"
                        class="marginLeft10 float-right"
                        icon="ios-cloud-download-outline"
                        size="small"
                        type="info"
                        v-privilege="'student-list-export-all'"
                >批量下载Word</Button> -->

                <Button
                        :loading="batchExportBtnLoading"
                         @click="exportExcel"
                        class="marginLeft10 float-right"
                        icon="ios-download-outline"
                        size="small"
                        type="warning"
                        v-privilege="'student-list-batch-export'"
                >批量导出Excel</Button>

            </Row>
            <!-------操作按钮行 end------->

            <!-------表格列表 begin------->
            <Table
                    :columns="mainTable.columnArray"
                    :data="mainTable.data"
                    :loading="mainTable.loading"
                    @on-sort-change="handleSortChange"
                    border
                    highlight-row
                    ref="mainTable"
            ></Table>

            <Page
                    :current="queryForm.pageNum"
                    :page-size="queryForm.pageSize"
                    :page-size-opts="mainTablePage.pageSizeOps"
                    :total="mainTablePage.total"
                    @on-change="changeMainTablePagePageNum"
                    @on-page-size-change="changeMainTablePagePageSize"
                    class="smart-query-table-page"
                    show-elevator
                    show-sizer
                    show-total
            />
        </Card>
        <!-------表格列表 end------->

        <!-------批量删除Modal begin------->
        <Modal title="批量删除" v-model="batchDeleteModal.show" width="450">
            <Form :label-width="80">
                <FormItem>
                    <h3 class="error-color">确定要删除以下数据吗？</h3>
                </FormItem>
                <FormItem label="删除数据">
                    <Card style="width:350px;height:250px;overflow-y:scroll;">
                        <ul>
                            <li v-for="item in mainTableSelectArray">
                                <a href="#">{{ item.id }}</a>
                            </li>
                        </ul>
                    </Card>
                </FormItem>
            </Form>
            <div slot="footer">
                <Button @click="batchDeleteModal.show = false" size="small" type="default">取消</Button>
                <Button @click="batchDelete" size="small" type="primary">确定删除</Button>
            </div>
        </Modal>
        <!-------批量删除Modal end------->

        <!-------添加、更新 Form表单 begin------->
        <Modal
                :footer-hide="true"
                :title="saveModal.isUpdate?'更新':'新建'"
                v-model="saveModal.show"
                @on-cancel="saveFormClose"
                width="500"
        >
            <StudentListForm
                    :isUpdate="saveModal.isUpdate"
                    :updateData="saveModal.updateData"
                    @on-form-close="saveFormClose"
            />
        </Modal>
        <!-------添加、更新 Form表单 end------->

         <!-------查看Form表单 begin------->
        <Modal
                :footer-hide="true"
                v-model="infoModal.show"
                @on-cancel="infoFormClose"
                class-name="vertical-center-modal"
                width="900"
        >
            <StudentListInfo
                    :infoData="infoModal.infoData"
                    @on-form-close="infoFormClose"
            />
        </Modal>
        <!-------查看Form表单 end------->
    </div>
</template>

<script>
    import {dateTimeRangeConvert} from '@/lib/util'
    import { PAGE_SIZE_OPTIONS } from '@/constants/table-page';
    import { studentApi } from '@/api/student';
    import StudentListForm from './components/student-list-form';
    import StudentListInfo from './components/student-list-info';
    const PAGE_SIZE_INIT = 20;
    export default {
        name: 'StudentList',
        components: {
                StudentListForm,
                StudentListInfo
        },
        props: {},
        data() {
            return {
                genders: [
                    {
                        "value":'1',
                        "label":"男"
                    },{
                        "value":'0',
                        "label":"女"
                    }
                ],
                /* -------------------------添加、更新表单 ------------------------- */
                saveModal: {
                    show: false,
                    isUpdate: false,
                    updateData: null
                },
                 /* -------------------------查看、详情表单 ------------------------- */
                infoModal: {
                    show: false,
                    infoData: null
                },
                /* -------------------------批量操作------------------------- */
                //批量刪除彈出框
                batchDeleteModal: {
                    show: false
                },
                //表格多选选中的元素数组
                mainTableSelectArray: [],
                /* -------------------------导出操作------------------------- */
                //批量导出loading按钮
                batchExportBtnLoading:false,
                //导出全部loading按钮
                allExportBtnLoading:false,
                /* -------------------------查询条件相关数据-------------------- */
                //搜索表单
                queryForm: {
                   //id
                   id:null,
                   //姓名
                   name:null,
                   //性别
                   gender:null,
                   //社区信息
                   plot: null,
                    //家长信息
                   parentName: null,
                   //身份证号
                   idCard:null,
                    createTimeRange: ["",""],
                    updateTimeRange: ["",""],
                    pageNum: 1,
                    pageSize: PAGE_SIZE_INIT,
                    orders: []
                },
                //是否展示更多搜索条件
                showMoreQueryConditionFlag: false,
                /*  -------------------------表格相关数据------------------------- */
                //表格分页
                mainTablePage: {
                    total: 0,
                    pageSizeOps: PAGE_SIZE_OPTIONS
                },
                //表格
                mainTable: {
                    //加载中
                    loading: false,
                    //表格数据
                    data: [],
                    //表格列
                    columnArray: [
                        {
                            type: 'selection',
                            width: 30,
                            align: 'center'
                        },
                                                {
                            title: 'ID',
                            key: 'id',
                            tableColumn: 'e_student.id',
                            width:100,
                        },
                                                {
                            title: '姓名',
                            key: 'name',
                            tableColumn: 'e_student.name',
                        },
                                                {
                            title: '性别',
                            key: 'genderStr',
                            tableColumn: 'e_student.gender',
                            width:70
                        },
                                                {
                            title: '出生年月日',
                            key: 'birthday',
                            tableColumn: 'e_student.birthday',
                            width:110

                        },
                                                {
                            title: '民族',
                            key: 'nation',
                            tableColumn: 'e_student.nation',
                            width:70
                        },                      {    
                            title: '身份证号',
                            key: 'idCard',
                            tableColumn: 'e_student.id_card',
                            width:200
                        },            
                                                {
                            title: '所属社区',
                            key: 'communityName',
                            tableColumn: 'e_student.plotId',
                        }, {
                            title: '小区名称',
                            key: 'plotName',
                            tableColumn: 'e_student.plotId',
                        },{
                            title: '户主姓名',
                            key: 'householdHead',
                            tableColumn: 'e_student.household_head',
                        },
                                                {
                            title: '幼儿园名称',
                            key: 'kindergarten',
                            tableColumn: 'e_student.kindergarten',
                        },
                                                {
                            title: '操作',
                            key: 'action',
                            align: 'right',
                            width: 80,
                            className: 'action-hide',
                            render: (h, params) => {
                                return h('div', [
                                    h('Button', {
                                        props: {
                                            type: 'primary',
                                            size: 'small'
                                        },
                                        style: {
                                            marginRight: '5px'
                                        },
                                        on: {
                                            click: () => {
                                                this.showInfoStudentForm(params.row);
                                            }
                                        }
                                    }, '查看'),
                                    // h('Button', {
                                    //     props: {
                                    //         type: 'info',
                                    //         size: 'small'
                                    //     },
                                    //     on: {
                                    //         click: () => {
                                    //             this.exportWordById(params.row.id);
                                    //         }
                                    //     }
                                    // }, '下载')
                                ]);
                            }
                        }
                    ]
                }
            };
        },
        computed: {},
        watch: {},
        filters: {},
        created() {},
        mounted() {
            this.queryList();
        },
        beforeCreate() {},
        beforeMount() {},
        beforeUpdate() {},
        updated() {},
        beforeDestroy() {},
        destroyed() {},
        activated() {},
        methods: {
            /* -------------------------查询相关 begin------------------------- */
            convertQueryParam(){
                let createTimeArray = dateTimeRangeConvert(this.queryForm.createTimeRange);
                let updateTimeArray = dateTimeRangeConvert(this.queryForm.updateTimeRange);
                return {...this.queryForm,
                    createTimeBegin:createTimeArray[0],
                    createTimeEnd:createTimeArray[1],
                    updateTimeBegin:updateTimeArray[0],
                    updateTimeEnd:updateTimeArray[1]
                };
            },
            //查询
            async queryList() {
                this.mainTable.loading = true;
                try {
                    let params = this.convertQueryParam();
                    let result = await studentApi.queryStudent(params);
                    this.mainTable.data = result.data.list;
                    this.mainTablePage.total = result.data.total;
                } finally {
                    this.mainTable.loading = false;
                }
            },
            //重置查询
            resetQueryList() {
                let pageSize = this.queryForm.pageSize;
                this.queryForm = {
                    id:null,
                    name:null,
                    gender:null,
                    idCard:null,
                    createTimeRange: ["",""],
                    updateTimeRange: ["",""],
                    pageNum: 1,
                    pageSize: pageSize,
                    orders: []
                };
                this.queryList();
            },
            //修改页码
            changeMainTablePagePageNum(pageNum) {
                this.queryForm.pageNum = pageNum;
                this.queryList();
            },
            //修改页大小
            changeMainTablePagePageSize(pageSize) {
                this.queryForm.pageNum = 1;
                this.queryForm.pageSize = pageSize;
                this.queryList();
            },
            //处理排序
            handleSortChange(column) {
                if (column.order === 'normal') {
                    this.queryForm.orders = [];
                } else {
                    this.queryForm.orders = [
                        {
                            column: column.column.tableColumn,
                            asc: 'asc' === column.order
                        }
                    ];
                }
                this.queryList();
            },
            /*-------------------------查询相关 end------------------------- */

            /*-------------------------批量操作 begin------------------------- */
            //显示批量删除弹窗
            showBatchDeleteModal() {
                if (!this.validateMainTableSelection()) {
                    return;
                }
                this.batchDeleteModal.show = true;
            },
            //批量删除
            async batchDelete() {
                this.$Spin.show();
                await studentApi.batchDeleteStudent(
                        this.mainTableSelectArray.map(e => e.id)
                );
                this.batchDeleteModal.show = false;
                this.$Message.success('刪除成功');
                this.$Spin.hide();
                this.queryList();
            },
            //清空选中
            clearMainTableSelection() {
                this.mainTableSelectArray = [];
            },
            //校验是否有选中
            validateMainTableSelection() {
                this.mainTableSelectArray = this.$refs.mainTable.getSelection();
                if (this.mainTableSelectArray.length < 1) {
                    this.$Message.error('请选择至少一条数据');
                    return false;
                }
                return true;
            },
            /*-------------------------批量操作 end------------------------- */

            /*-------------------------导入导出 begin------------------------- */
            //导出Excel
            async exportExcel(){
                try{
                    this.allExportBtnLoading = true;
                    let params = this.convertQueryParam();
                    await studentApi.exportExcel(params);
                }  catch(e){
                    console.log(e);
                }finally{
                    this.allExportBtnLoading = false;
                }
            },
            //导出Word
            async exportWord(){
                try{
                    this.allExportBtnLoading = true;
                    let params = this.convertQueryParam();
                    await studentApi.exportWord(params);
                }  catch(e){
                    console.log(e);
                }finally{
                    this.allExportBtnLoading = false;
                }
            },
            //导出Word
            async exportWordById(id){
                try{
                    let params = {
                        "id":id
                    }
                    await studentApi.exportWord(params);
                }  catch(e){
                    console.log(e);
                }
            },
            //批量导出
            async batchExport(){
                if (!this.validateMainTableSelection()) {
                    return;
                }
                try{
                    this.batchExportBtnLoading = true;
                    await studentApi.batchExport(this.mainTableSelectArray.map(e => e.id));
                }  catch(e){
                    console.log(e);
                }finally{
                    this.batchExportBtnLoading = false;
                }
            },
            /*-------------------------导入导出 end------------------------- */

            /*-------------------------添加，修改 表单 begin------------------------- */
            //显示添加表单
            showAddStudentForm() {
                this.saveModal.isUpdate = false;
                this.saveModal.show = true;
            },
            //显示修改表单
            showEditStudentForm(updateObject){
                this.saveModal.isUpdate =true;
                this.saveModal.updateData = updateObject;
                this.saveModal.show = true;
            },
            saveFormClose(){
                this.saveModal.show = false;
                this.queryList();
            },
            //显示查看表单
            showInfoStudentForm(infoObject){
                this.infoModal.infoData = infoObject;
                this.infoModal.show = true;
            },
            infoFormClose(){
                this.infoModal.show = false;
            }
            /*-------------------------添加，修改 表单 end------------------------- */
        }
    };
</script>
<style scoped>
    .cl_right{
        text-align: right;
        line-height: 30px;
    }
</style>
