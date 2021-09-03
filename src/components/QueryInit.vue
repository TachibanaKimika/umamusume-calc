<!--
 * @Author: Akarichan
 * @LastEditors: Akarichan
-->
<template>
    <div class="QueryInit">
        <div class=QueryInit_btn>
            <button @click="printCardDataJson">打印卡的详细数据</button>
            <button @click="initQuery">更新数据库</button>
            <button @click="printCardsJson">打印单卡</button>
            <button @click="refresh">刷新数据</button>
            <!-- <button @click="printCardJson">打印单卡的数据</button> -->
        </div>
    </div>
</template>



<script>
    import axios from 'axios'
    export default {
        data() {
            return {
                // umaList: require('../assets/db/db.json').players,
                QueryStr: ''
            }
        },
        methods:{
            printCardDataJson(){
                console.log(JSON.stringify(this.cardTotal))
            },

            printCardsJson(){
                console.log(JSON.stringify(this.cards))
            },

            async initQuery(){
                // this.allCards = await 
                let res = await axios.get('https://raw.githubusercontent.com/wrrwrr111/pretty-derby/master/src/assert/db.json')
                console.log(res.data)
                let query = ``
                res.data.supports.forEach(item=>{
                    query += this.initCardQuery(item)
                    // console.log(this.initCardQuery(item))
                })
                // let str = this.initCardQuery(res.data.supports[0])
                console.log(query)
                // 下面是加成属性值和type的对照表
// {友情:1, yaruki:2,xx点:[3,4,5,6,7], 练习效果:8, 初始速度:9, suta:10, 
// powa:11, konnj:12, kashikosa:13, 初始羁绊:14, 比赛:15, 粉丝数:16, hit等级:17, hit率:18 
// 得意率:19, [20,21,22,23,24]:xx极限值提升 事件回复量:25, 事件效果:26, 失败率下降:27, 体力消耗下降:28, 小游戏效果?提升:29, 技能点加成:30, 友情回复量:31}
            },


            // 单卡执行的sql语句, 返回一串字符串数组, 由sql语句组成?
            initCardQuery(card){
                // console.log(this.cards.find({name:`【${card.name}】　－　${card.charaName}`}))
                // console.log(card)
                // console.log(card)
                let id = -1
                if(this.cards.find({name:`【${card.name}】　－　${card.charaName}`})!==undefined){
                    id = this.cards.find({name:`【${card.name}】　－　${card.charaName}`}).id
                }else if(this.cards.find({name:`【${card.baseAbility.name}】　－　${card.baseAbility.charaName}`})!==undefined){
                    id = this.cards.find({name:`【${card.baseAbility.name}】　－　${card.baseAbility.charaName}`}).id
                }else{
                    if(card.rare!='R'){
                        console.warn(card)
                    }
                    return
                }
                let sqlArr = ''
                let config = [
                    {label: 'spc_id', value: id, type:-1},
                    {label: 'spc_lv', value: 0, type:0},
                    {label: 'spc_youujo', value: 0, type:1},
                    {label: 'spc_yaruki', value: 0, type:2},
                    {label: 'spc_bonasu_pt', value: "[0,0,0,0,0,0]", type:3},
                    {label: 'spc_tore', value: 0, type:8},
                    {label: 'spc_init_stu', value: "[0,0,0,0,0]", type:9},
                    {label: 'spc_kizuna', value: 0, type:14},
                    {label: 'spc_race', value: 0, type:15},
                    {label: 'spc_fan', value: 0, type:16},
                    {label: 'spc_hit_lv', value: 0, type:17},
                    {label: 'spc_hit_ritu', value: 0, type:18},
                    {label: 'spc_tokuitu', value: 0, type:19},
                    {label: 'spc_limit_up', value: "[0,0,0,0,0]", type:20},
                    {label: 'spc_jiken_kaifuku_up', value: 0, type:25},
                    {label: 'spc_jiken_up', value: 0, type:26},
                    {label: 'spc_reduce_shipai', value: 0, type:27},
                    {label: 'spc_reduce_suta', value: 0, type:28},
                    {label: 'spc_game_up', value: 0, type:29},
                    {label: 'spc_kashi_kaifuku', value: 0, type:31},
                ]
                if(card.rare=="SSR"){
                    for(let lv=30; lv<=50; lv+=5){
                        sqlArr += this.initSingleQuery(JSON.stringify(card), JSON.stringify(config), lv)
                    }
                }else if(card.rare=="SR"){
                    for(let lv=25; lv<=45; lv+=5){
                        sqlArr += this.initSingleQuery(JSON.stringify(card), JSON.stringify(config), lv)
                    }
                }
                return sqlArr
            },
            // 单卡单等级, 返回单一的sql语句
            initSingleQuery(cardString, configString, level){
                let card = JSON.parse(cardString)
                let config = JSON.parse(configString)
                let unique_effect = card.unique_effect
                config.find({label:"spc_lv"}).value = level
                // 先初始化了config
                if(card.effects==undefined){
                    return ''
                }
                // 能力值计算
                card.effects.forEach(ability=>{
                    // 先找到对应的能力
                    // 能力点
                    if((3<=ability.type&&ability.type<=7)||(9<=ability.type&&ability.type<=13)||ability.type==30||(20<ability.type&&ability.type<24)){
                        if(ability.type==30){
                            let arr = JSON.parse(config.find({type:3}).value)
                            arr[5] += this.setValue(ability, level)
                            config.find({type:3}).value = JSON.stringify(arr)
                        }else if(ability.type<=7){
                            let arr = JSON.parse(config.find({type:3}).value)
                            arr[ability.type-3] += this.setValue(ability, level)
                            config.find({type:3}).value = JSON.stringify(arr)
                        }else if(ability.type<=13){
                            let arr = JSON.parse(config.find({type:9}).value)
                            arr[ability.type-9] += this.setValue(ability, level)
                            config.find({type:9}).value = JSON.stringify(arr)
                        }else if(ability.type<24){
                            let arr = JSON.parse(config.find({type:20}).value)
                            arr[ability.type-20] += this.setValue(ability, level)
                            config.find({type:20}).value = JSON.stringify(arr)
                        }
                    }else{
                        // console.log(config.find({type: ability.type}))
                        config.find({type: ability.type}).value = this.setValue(ability, level)
                    }
                })
                // console.log(card)
                // 固有计算
                if(card.unique_effect.lv<=level){
                    for(let i = 0; i<=1; i++){
                        let type = unique_effect[`type_${i}`]
                        let value = unique_effect[`value_${i}`]
                        switch(true){
                            case type==1||type==19:
                                if(config.find({type:type}).value>50){
                                    // console.log(config.find({type:type}).value)
                                    // console.log(value)
                                    // console.log((Number(((config.find({type:type}).value/100+1)*(value+100)/100)-1)*100).toFixed(0))
                                    // console.log(Number(((config.find({type:type}).value+100)*(value+100)/100)-100).toFixed(0))
                                }
                                config.find({type:type}).value = (Number(((config.find({type:type}).value/100+1)*(value+100)/100)-1)*100).toFixed(0)

                                break
                            case (3<=type&&type<=7)||(9<=type&&type<=13)||type==30||(20<type&&type<24):
                                if(type==30){
                                    let arr = JSON.parse(config.find({type:3}).value)
                                    arr[5] += value
                                    config.find({type:3}).value = JSON.stringify(arr)
                                }else if(type<=7){
                                    let arr = JSON.parse(config.find({type:3}).value)
                                    arr[type-3] += value
                                    config.find({type:3}).value = JSON.stringify(arr)
                                }else if(type<=13){
                                    let arr = JSON.parse(config.find({type:9}).value)
                                    arr[type-9] += value
                                    config.find({type:9}).value = JSON.stringify(arr)
                                }else if(ability.type<24){
                                    let arr = JSON.parse(config.find({type:20}).value)
                                    arr[type-20] += value
                                    config.find({type:20}).value = JSON.stringify(arr)
                                }
                                break;
                            default: 
                                config.find({type:type}).value += value
                                break;
                        }
                    }
                }
                let str1 = ``, str2 = ``
                config.forEach((item,index)=>{
                    str1 += `${item.label}`
                    str2 += `${typeof item.value==='string'?'\''+item.value+'\'':item.value}`
                    if(index != config.length-1){
                        str1+=','
                        str2+=','
                    }
                })
                //let Query = `insert into supportcard_stu (${str1}) values (${str2}) WHERE NOT EXISTS (SELECT * FROM supportcard_stu WHERE spc_id=${config.find({label:'spc_id'}).value} AND spc_lv=${config.find({label:'spc_lv'}).value};\n`
                let query = `
                INSERT INTO supportcard_stu (${str1}) 
                SELECT ${str2} FROM DUAL
                WHERE NOT EXISTS (SELECT spc_id, spc_lv FROM supportcard_stu WHERE spc_id=${config.find({label:'spc_id'}).value} AND spc_lv=${config.find({label:'spc_lv'}).value});
                `
                
                return query
            },
            // 辅助方法
            setValue(ability, level){
                // 过程

                // 初始的能力点



                // test DATA  lv30: 10, lv50: 20 ==> lv40==?
                ability[`limit_lv0`] = ability.init
                let level_start = 0

                // 开始有数值的等级 == 35
                let start_point = 0

                while(level_start<level){
                    if(ability[`limit_lv${level_start}`]!=-1){
                        start_point=level_start
                    }
                    level_start+=5
                }

                // 最近有数值的等级
                let level_end = level;
                let end_point = undefined;
                while(level_end<=50){
                    if(ability[`limit_lv${level_end}`]!=-1){
                        end_point=level_end // 找到最近的点
                        break;
                    }
                    level_end+=5
                }
                if(ability.type===25){
                    console.log(`start_point=${start_point}, end_point=${end_point}, lv=${level}`)
                }
                if(ability[`limit_lv${level}`]!=-1){
                    if(ability.type===25){
                        console.log(ability[`limit_lv${level}`])
                    }
                    return ability[`limit_lv${level}`]
                }
                // 能力值不会再加了, 返回起始点的数值, 或者为一直都没有能力值
                if(end_point===undefined||ability[`limit_lv${start_point}`]<=0){
                    if(ability.type===25){
                        console.log(ability[`limit_lv${start_point}`]<=0?0:ability[`limit_lv${start_point}`])
                    }
                    return ability[`limit_lv${start_point}`]<=0?0:ability[`limit_lv${start_point}`]
                }else{
                    if(ability.type===25){
                        console.log(Number((ability[`limit_lv${start_point}`]+(ability[`limit_lv${end_point}`]-ability[`limit_lv${start_point}`])*((level-start_point)/(end_point-start_point))).toFixed(0)))
                    }
                    // if startpoint = 20, num = 10, endpoint = 50, num = 20, lv= 30 => 10 + (20-10)*((30-20)/(50-20))
                    return Number((ability[`limit_lv${start_point}`]+(ability[`limit_lv${end_point}`]-ability[`limit_lv${start_point}`])*((level-start_point)/(end_point-start_point))).toFixed(0))
                }
            },
            updateUma(){
                let uma_str=''
                this.umaList.forEach(uma=>{
                    let umaconfig = {
                        baba: {
                            dato: uma.dirt,
                            shiba: uma.grass
                        },
                        kyori: {
                            mairu: uma.mile,
                            juukyori: uma.mediumDistance,
                            tankyori: uma.shortDistance,
                            cyoukyori: uma.longDistance,
                        },
                        kyakushitu: {
                            nige: uma.escape,
                            sashi: uma.insert,
                            oikomi: uma.tracking,
                            senkou: uma.leading
                        }
                    }
                    let singleQuery = `update uma set config = '${JSON.stringify(umaconfig)}' where (uma_name ='${uma.charaName}' and uma_secname='${uma.name}');\n`
                    uma_str += singleQuery
                })
                console.log(uma_str)
                this.QueryStr = uma_str
            },
            refresh(){
                this.$store.commit('dataInit')
            }
        },
        computed: {
            cardTotal(){
                return this.$store.state.myCardDb
            },
            cards(){
                return this.$store.state.cards
            }
        }
    }
</script>
