<!--
 * @Author: your name
 * @Date: 2021-07-08 13:29:38
 * @LastEditTime: 2021-07-08 15:12:15
 * @LastEditors: your name
 * @Description: In User Settings Edit
 * @FilePath: \fake-hpf:\My Repo\umamusume-calc\src\components\child\SelectWindowOfRegistedCard.vue
-->
<template>
    <div>
        <el-row>
        <el-col :span='18'>
        <el-checkbox-group v-model="checkListType">
            <el-checkbox label='1' true>スビート</el-checkbox>
            <el-checkbox label='2' true>スタミナ</el-checkbox>
            <el-checkbox label='3' >パワー</el-checkbox>
            <el-checkbox label='4' >根性</el-checkbox>
            <el-checkbox label='5' >賢さ</el-checkbox>
            <el-checkbox label='6' >友人</el-checkbox>
        </el-checkbox-group>
        </el-col>
        <el-col :span="6">
        <el-checkbox-group v-model="checkListRare">
            <el-checkbox label='3' true>SSR</el-checkbox>
            <el-checkbox label='2' true>SR</el-checkbox>
        </el-checkbox-group>
        </el-col>
        <el-col :span='12'>
        <el-checkbox-group v-model="checkListLevel">
            <el-checkbox label='50' true>50</el-checkbox>
            <el-checkbox label='45' >45</el-checkbox>
            <el-checkbox label='40' >40</el-checkbox>
            <el-checkbox label='35' >35</el-checkbox>
            <el-checkbox label='30' >30</el-checkbox>
            <el-checkbox label='25' >25</el-checkbox>
        </el-checkbox-group>
        </el-col>
        <el-col :span='12'>
            <el-button @click="submitCard" type="success">选择</el-button>
        </el-col>
        </el-row>

        <el-radio-group v-model="checkedItem">
            <el-radio v-for="item in cards" v-if="hasType(item)" :label="item" border style="margin-top: 20px" >{{item.spc_name}}</el-radio>
        </el-radio-group>
    </div>
</template>

<script>
export default {
    name: 'SelectWindowOfRegistedCard',
    props: {
        cards:Array
    },
    data(){
        return{
            checkListType:['1'],
            checkListRare:['2','3'],
            checkListLevel:['50','45'],
            checkedItem:{id:0}
        }
    },
    mounted(){console.log(this.cards)},
    methods:{
        hasType(item){
            for(var i in this.checkListType){
                if(item.spc_attribute == this.checkListType[i]){
                    for(var j in this.checkListRare){
                        if(item.spc_lv == this.checkListLevel[j]){
                            return true
                        }
                    }
                }
            }
            return false;
        },
        submitCard(){
            console.log(this.cards)
            console.log(this.checkedItem)
            if(this.checkedItem.id!=0){
                this.$emit('getCardFromChild',this.checkedItem)
            }else{
                this.$message("请选择一张卡")
            }
                
        }
    }
}
</script>