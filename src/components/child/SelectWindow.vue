<template>
    <div>
        <el-row>
        <el-col :span='14'>
        <el-checkbox-group v-model="checkListType">
            <el-checkbox label='1' true>スビート</el-checkbox>
            <el-checkbox label='2' true>スタミナ</el-checkbox>
            <el-checkbox label='3' >パワー</el-checkbox>
            <el-checkbox label='4' >根性</el-checkbox>
            <el-checkbox label='5' >賢さ</el-checkbox>
            <el-checkbox label='6' >友人</el-checkbox>
        </el-checkbox-group>
        </el-col>
        <el-col :span='4'>
        <el-checkbox-group v-model="checkListRare">
            <el-checkbox label='3' true>SSR</el-checkbox>
            <el-checkbox label='2' true>SR</el-checkbox>
        </el-checkbox-group>
        </el-col>
        <el-col :span='6'>
            <el-button @click="submitCard" type="success">选择</el-button>
        </el-col>
        </el-row>
        <el-radio-group v-model="checkedItem">
            <el-radio v-for="item in cards" v-if="hasType(item)" :label="item" border style="margin-top: 20px" >{{item.name}}</el-radio>
        </el-radio-group>
    </div>
</template>

<script>
export default {
    name: 'SelectWindow',
    props: {
        cards:Array
    },
    data(){
        return{
            checkListType:['1'],
            checkListRare:['3'],
            checkedItem:{id:0}
        }
    },
    methods:{
        hasType(item){
            for(var i in this.checkListType){
                if(item.atb == this.checkListType[i]){
                    for(var j in this.checkListRare){
                        if(item.rare == this.checkListRare[j]){
                            return true
                        }
                    }
                }
            }
            return false;
        },
        submitCard(){
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