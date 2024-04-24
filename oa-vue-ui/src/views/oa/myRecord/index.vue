<template>
  <div class="app-container">
<!--    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">-->
<!--      <el-form-item label="打卡时间">-->
<!--        <el-date-picker-->
<!--          v-model="daterangeAttendanceTime"-->
<!--          style="width: 240px"-->
<!--          value-format="yyyy-MM-dd"-->
<!--          type="daterange"-->
<!--          range-separator="-"-->
<!--          start-placeholder="开始日期"-->
<!--          end-placeholder="结束日期"-->
<!--        ></el-date-picker>-->
<!--      </el-form-item>-->
<!--      <el-form-item>-->
<!--        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>-->
<!--        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>-->
<!--      </el-form-item>-->
<!--    </el-form>-->

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['oa:record:add']"
        >打卡</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['oa:record:edit']"
        >查看</el-button>
      </el-col>
<!--      <el-col :span="1.5">-->
<!--        <el-button-->
<!--          type="danger"-->
<!--          plain-->
<!--          icon="el-icon-delete"-->
<!--          size="mini"-->
<!--          :disabled="multiple"-->
<!--          @click="handleDelete"-->
<!--          v-hasPermi="['oa:record:remove']"-->
<!--        >删除</el-button>-->
<!--      </el-col>-->
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['oa:record:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

<!--    <el-table v-loading="loading" :data="recordList" @selection-change="handleSelectionChange">-->
<!--      <el-table-column type="selection" width="55" align="center" />-->
<!--      <el-table-column label="ID" align="center" prop="id" />-->
<!--      <el-table-column label="创建者" align="center" prop="createBy" />-->
<!--      <el-table-column label="打卡时间" align="center" prop="attendanceTime" width="180">-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.attendanceTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->
<!--      <el-table-column label="创建时间" align="center" prop="createTime" width="180">-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->
<!--      <el-table-column label="更新者" align="center" prop="updateBy" />-->
<!--      <el-table-column label="更新时间" align="center" prop="updateTime" width="180">-->
<!--        <template slot-scope="scope">-->
<!--          <span>{{ parseTime(scope.row.updateTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>-->
<!--        </template>-->
<!--      </el-table-column>-->
<!--      <el-table-column label="备注" align="center" prop="remark" />-->
<!--      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">-->
<!--        <template slot-scope="scope">-->
<!--          <el-button-->
<!--            size="mini"-->
<!--            type="text"-->
<!--            icon="el-icon-edit"-->
<!--            @click="handleUpdate(scope.row)"-->
<!--            v-hasPermi="['oa:record:edit']"-->
<!--          >c查看</el-button>-->
<!--&lt;!&ndash;          <el-button&ndash;&gt;-->
<!--&lt;!&ndash;            size="mini"&ndash;&gt;-->
<!--&lt;!&ndash;            type="text"&ndash;&gt;-->
<!--&lt;!&ndash;            icon="el-icon-delete"&ndash;&gt;-->
<!--&lt;!&ndash;            @click="handleDelete(scope.row)"&ndash;&gt;-->
<!--&lt;!&ndash;            v-hasPermi="['oa:record:remove']"&ndash;&gt;-->
<!--&lt;!&ndash;          >删除</el-button>&ndash;&gt;-->
<!--        </template>-->
<!--      </el-table-column>-->
<!--    </el-table>-->

    <el-date-picker
      v-model="yearParams"
      type="month"
      placeholder="选择月">
    </el-date-picker>
    <el-button style="margin-left: 10px" type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>

<!--    <pagination-->
<!--      v-show="total>0"-->
<!--      :total="total"-->
<!--      :page.sync="queryParams.pageNum"-->
<!--      :limit.sync="queryParams.pageSize"-->
<!--      @pagination="getList"-->
<!--    />-->

    <div style="margin-left: 20px;margin-top:30px;width: 100%"></div>
    <el-row :gutter="24" class="mb8">
      <el-col :span="12">
        <el-row style="margin-left: 50px;" :gutter="10" class="mb8">
          <el-col :span="2">周日</el-col>
          <el-col :span="2">周一</el-col>
          <el-col :span="2">周二</el-col>
          <el-col :span="2">周三</el-col>
          <el-col :span="2">周四</el-col>
          <el-col :span="2">周五</el-col>
          <el-col :span="2">周六</el-col>
        </el-row>
        <el-row v-for="(item, index) in recordList" :key="index" style="margin-left: 50px;" :gutter="10" class="mb8">
          <div v-for="(item2, index2) in item.list" :key="index2">
            <el-col :span="2">
              <div @click="handleViewdetails(item2,index,index2)" style="height: 80px;border: #00afff 1px"  :class="{ 'selected': (index*limit+index2) === selectedItem }" >
                <div v-if="item2.day==null">

                </div>
                <div v-else>
                  {{ item2.day }}
                  <!--            <div v-if="item2.holiday!=null">-->
                  <!--              {{item2.typeDes}}-->
                  <!--            </div>-->
                  <!--            <div v-else>-->
                  <!--              {{item2.chineseday}}-->
                  <!--            </div>-->

                  <div>
                    {{item2.chineseday}}
                  </div>
                </div>
              </div>
            </el-col>
          </div>
        </el-row>
      </el-col>
      <el-col :span="12">
        <el-row v-if="Viewdetails">
          <el-row>
            <div class="grid-content bg-purple">
              日期：{{myAttendanceStatisticsVo.year}}-{{myAttendanceStatisticsVo.month}}-{{details.day}}
            </div>
          </el-row>
          <el-row>
            <div class="grid-content bg-purple">
              上班时间：{{myAttendanceStatisticsVo.startTime}}
            </div>
          </el-row>
          <el-row>
            <div class="grid-content bg-purple">
              下班时间：{{myAttendanceStatisticsVo.endTime}}
            </div>
          </el-row>
          <el-row  v-if="(details.list==null || details.list.length===0) && nowYear===details.year
            && nowMonth === details.month && nowDay == details.day ">
            <div class="grid-content bg-purple">
              <el-col :span="5" :xs="24">
                <el-button type="primary" @click="submitForm">上班打卡</el-button>
              </el-col>
            </div>
          </el-row>

          <el-row  v-else-if="details.list.length>=1">
            <div class="grid-content bg-purple">
              上班打卡时间 {{parseTime(details.attendanceTime,'{y}-{m}-{d} {h}:{i}:{s}')}}
            </div>
          </el-row>
          <el-row v-else-if="details.list.length===1">
            <div class="grid-content bg-purple">
              <el-col :span="5" :xs="24">
                下班打卡时间 {{parseTime(details.attendanceTime,'{y}-{m}-{d} {h}:{i}:{s}')}}
              </el-col>
              <el-col :span="5" :xs="24">
                <el-button type="primary" @click="submitForm">更新打卡</el-button>
              </el-col>
            </div>
          </el-row>

        </el-row>
      </el-col>
    </el-row>

    <!-- 添加或修改打卡记录对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
         <el-row :gutter="10" class="mb8">
           <el-col :span="8" :xs="24">
             <span>上班时间： {{ruleInfo.startTime}}</span>
           </el-col>
           <el-col :span="5" :xs="24">
             <el-button type="primary" @click="submitForm">上班打卡</el-button>
           </el-col>
         </el-row>
        <el-row :gutter="10" class="mb8">
          <el-col :span="8" :xs="24">
            <span>下班时间： {{ruleInfo.endTime}}</span>
          </el-col>
          <el-col :span="5" :xs="24">
            <el-button type="primary" @click="submitForm">下班打卡</el-button>
          </el-col>
        </el-row>
          <el-row :gutter="10" class="mb8">工作日 周一,周二，周三，周四，周五</el-row>
          <el-row :gutter="10" class="mb8">休息日 周六，周日</el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
<!--        <el-button type="primary" @click="submitForm">确 定</el-button>-->
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { myAttendanceStatistics,myListRecord, getRecord, delRecord, addRecord, updateRecord } from "@/api/oa/record";
import {listRule} from "@/api/oa/rule";
import {parseTime} from "@/utils/ruoyi";

export default {
  name: "myRecord",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 打卡记录表格数据
      recordList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 备注时间范围
      daterangeAttendanceTime: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        attendanceTime: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      },
      ruleInfo: {},
      yearParams: '',
      myAttendanceStatisticsVo: {},
      myAttendanceParams: {
        params: {

        }
      },
      limit: 7,
      Viewdetails: false,
      details: {},
      selectedItem: null,
      nowDate: null,
      nowYear: null,
      nowMonth: null,
      nowDay: null,
    };
  },
  created() {
    listRule(this.queryParams).then(response => {
      this.ruleInfo = response.rows[0];
    });
    //this.getList();
    this.myAttendance();
    this.nowDate = new Date();
    // 获取当前年、月、日
    this.nowYear = this.nowDate.getFullYear();
    this.nowMonth = this.nowDate.getMonth() + 1; // 月份从0开始，需要加1
    this.nowDay = this.nowDate.getDate();

  },
  methods: {
    /** 查询打卡记录列表 */
    getList() {
      // this.loading = true;
      // this.queryParams.params = {};
      // if (null != this.daterangeAttendanceTime && '' != this.daterangeAttendanceTime) {
      //   this.queryParams.params["beginAttendanceTime"] = this.daterangeAttendanceTime[0];
      //   this.queryParams.params["endAttendanceTime"] = this.daterangeAttendanceTime[1];
      // }
      // myListRecord(this.queryParams).then(response => {
      //   this.recordList = response.rows;
      //   this.total = response.total;
      //   this.loading = false;
      // });
      this.myAttendance();
    },
    myAttendance() {
      this.loading = true;
      this.myAttendanceParams.params = {};
      if ('' != this.yearParams) {
        this.myAttendanceParams.params["year"] = parseTime(this.yearParams, '{y}');
        this.myAttendanceParams.params["month"] = parseTime(this.yearParams, '{m}');
      }
      myAttendanceStatistics(this.myAttendanceParams).then(response => {
        this.myAttendanceStatisticsVo = response.data;
        const recordList = [];
        console.log("当前时间"+this.nowMonth)
        for (let i = 0; i < response.data.list.length; i++) {
          let a = response.data.list[i];
          if (a.year===this.nowYear&&a.month===this.nowMonth&&a.day===this.nowDay) {

            this.details = a;
            this.Viewdetails = true;
            this.selectedItem = i;
            console.log(this.selectedItem);
            return;
          }
        }
        for(let i=0; i<5; i++) {
          const item = {
            list: response.data.list.slice(i*this.limit, (i+1) * this.limit)
          }
          recordList.push(item);
        }
        this.recordList = recordList;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        createBy: null,
        attendanceTime: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      //this.getList();
      this.myAttendance();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.daterangeAttendanceTime = [];
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "打卡";
      //this.submitForm();
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getRecord(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改打卡记录";
      });
    },
    /** 提交按钮 */
    submitForm() {
      addRecord(this.form).then(response => {
        this.$modal.msgSuccess("新增成功");
        this.open = false;
        this.getList();
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除打卡记录编号为"' + ids + '"的数据项？').then(function() {
        return delRecord(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('oa/record/export', {
        ...this.queryParams
      }, `record_${new Date().getTime()}.xlsx`)
    },
    handleViewdetails(details,index,index2) {
      this.Viewdetails = true;
      this.details = details;
      this.selectedItem = index*this.limit + index2;
      console.log(this.selectedItem);
    }
  },
  computed: {
    limitedItems() {
      return this.recordList.slice(0, this.limit); // 使用slice方法限制循环次数
    }
  }
};
</script>
<style>
.selected {
  background-color: lightblue; /* 选中时的背景颜色 */
}
</style>
