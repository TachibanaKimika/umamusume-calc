<template>
    <div>
  <!-- <el-row :gutter="20">
    <el-col :span="7">
      <el-cascader filterable
      v-model="sc[0]"
      :options='items'
      :props="optionProps"
      clearable 
      placeholder="支援卡1">
      <template slot-scope="{ node, data }">
        <span>{{ data.Name }}</span>
        <span v-if="!data.children"> - {{ data.SecName }} </span>
      </template>
    </el-cascader>
  </el-col>
    <el-col :span="5">
      <el-input-number 
      v-model="scl[0]" 
      :min="1" 
      :max="50" 
      label="レベル">
    </el-input-number>
    </el-col>
    <el-col :span="7">
      <el-cascader filterable
      v-model="sc[1]"
      :options='items'
      :props="optionProps"
      clearable 
      placeholder="支援卡2">
      <template slot-scope="{ node, data }">
        <span>{{ data.Name }}</span>
        <span v-if="!data.children"> - {{ data.SecName }} </span>
      </template>
    </el-cascader>
    </el-col>
    <el-col :span="5">
      <el-input-number 
      v-model="scl[1]" 
      :min="1" 
      :max="50" 
      label="レベル">
    </el-input-number>
    </el-col>
    <el-col :span="7">
      <el-cascader filterable
      v-model="sc[2]"
      :options='items'
      :props="optionProps"
      clearable 
      placeholder="支援卡1">
      <template slot-scope="{ node, data }">
        <span>{{ data.Name }}</span>
        <span v-if="!data.children"> - {{ data.SecName }} </span>
      </template>
    </el-cascader>
  </el-col>
    <el-col :span="5">
      <el-input-number 
      v-model="scl[2]" 
      :min="1" 
      :max="50" 
      label="レベル">
    </el-input-number>
    </el-col>
    <el-col :span="7">
      <el-cascader filterable
      v-model="sc[3]"
      :options='items'
      :props="optionProps"
      clearable 
      placeholder="支援卡2">
      <template slot-scope="{ node, data }">
        <span>{{ data.Name }}</span>
        <span v-if="!data.children"> - {{ data.SecName }} </span>
      </template>
    </el-cascader>
    </el-col>
    <el-col :span="5">
      <el-input-number 
      v-model="scl[3]" 
      :min="1" 
      :max="50" 
      label="レベル">
    </el-input-number>
    </el-col>
    <el-col :span="7">
      <el-cascader filterable
      v-model="sc[4]"
      :options='items'
      :props="optionProps"
      clearable 
      placeholder="支援卡5">
      <template slot-scope="{ node, data }">
        <span>{{ data.Name }}</span>
        <span v-if="!data.children"> - {{ data.SecName }} </span>
      </template>
    </el-cascader>
  </el-col>
    <el-col :span="5">
      <el-input-number 
      v-model="scl[4]" 
      :min="1" 
      :max="50" 
      label="レベル">
    </el-input-number>
    </el-col>
    <el-col :span="7">
      <el-cascader filterable
      v-model="sc[5]"
      :options='items'
      :props="optionProps"
      clearable 
      placeholder="支援卡6">
      <template slot-scope="{ node, data }">
        <span>{{ data.Name }}</span>
        <span v-if="!data.children"> - {{ data.SecName }} </span>
      </template>
    </el-cascader>
    </el-col>
    <el-col :span="5">
      <el-input-number 
      v-model="scl[5]" 
       
      :min="1" 
      :max="50" 
      label="レベル">
    </el-input-number>
    </el-col>
    <el-col :span="12">
      <el-select v-model="umaname" filterable placeholder="SecletUma" >
        <el-option
          v-for="item in umaitems"
          :key="item.id"
          :label="`${item.Name} - ${item.SecName}`"
          :value="item.id"
          >
        </el-option>
      </el-select>
    </el-col>
    <el-col :span="12">
      <el-button type="primary" style="width:100%" @click="updatenewumaVue(umaname,sc,scl)">提交数据</el-button>
    </el-col>
  </el-row> -->
  </div>
</template>

<script>
export default {
    name: 'UpdateSingleUma',
    data() {
        return{
            valuea: [],
            umaname:'',
            sc:'',//支援卡id
            scl:'',//支援卡等级
            items: [],
            umaitems:[],
            optionProps: {
                value: 'id',
                label: 'Name',
                children: 'children',
                //multiple: true,
                expandTrigger: 'hover'
            }
        }
    }
}
</script>