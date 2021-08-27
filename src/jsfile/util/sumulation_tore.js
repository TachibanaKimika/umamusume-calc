var simulation = function (cards_item,options) {
    var stdtore = [
        {
            cost:21,
            lv:[[10,0,5,0,0,2],
            [11,0,5,0,0,2],
            [12,0,5,0,0,2],
            [13,0,6,0,0,2],
            [14,0,7,0,0,2]]
        },
        {
            cost:19,
            lv:[[0,9,0,4,0,2],
            [0,10,0,4,0,2],
            [0,11,0,4,0,2],
            [0,12,0,5,0,2],
            [0,13,0,6,0,2]]
        },
        {
            cost:20,
            lv:[[0,5,8,0,0,2],
            [0,5,9,0,0,2],
            [0,5,10,0,0,2],
            [0,6,11,0,0,2],
            [0,7,12,0,0,2]]
        },
        {
            cost:22,
            lv:[[4,0,4,8,0,2],
            [4,0,4,9,0,2],
            [4,0,4,10,0,2],
            [5,0,4,11,0,2],
            [5,0,5,12,0,2]]
        },
        {
            cost:-5,
            lv:[[2,0,0,0,9,4],
            [2,0,0,0,10,4],
            [2,0,0,0,11,4],
            [3,0,0,0,12,4],
            [4,0,0,0,13,4]]
        },
    ];
    var mytore = [
        {
            card:[],
            level:1,
            result:[0,0,0,0,0,0],
        },{
            card:[],
            level:1,
            result:[0,0,0,0,0,0],
        },{
            card:[],
            level:1,
            result:[0,0,0,0,0,0],
        },{
            card:[],
            level:1,
            result:[0,0,0,0,0,0],
        },{
            card:[],
            level:1,
            result:[0,0,0,0,0,0],
        }
    ];
    for(var i in options.torelv){
        mytore[i].level = options.torelv[i];
    }
    //计算卡在各个训练中出现的概率并加入到其中
    for(let i in cards_item){
        //tmpnum = calc_card_position(cards_item[i].spc_attribute,cards_item[i].spc_tokuitu);
        let tmpnum = calc_card_position(cards_item[i].spc_attribute,cards_item[i].spc_tokuitu);
        if(tmpnum!=-1&&mytore[tmpnum].card.length<5){
            mytore[tmpnum].card.push(cards_item[i])
        }
        //mytore[calc_card_position(cards_item[i].spc_attribute,cards_item[i].spc_tokuitu)].card.push(cards_item[i])
    }
    console.warn(cards_item)
    //开始模拟
    for(let i in mytore){
        //let result = [0,0,0,0,0,0];
        //获得基础值
        var result = stdtore[i].lv[mytore[i].level-1];
        let youujoUP = 1;
        let yarukiUP = 0;
        let toreUP = 1;
        for(var j in mytore[i].card){
            //友情ボーナス補正
            if((mytore[i].card[j].spc_attribute-1)==i&&mytore[i].card[j].spc_kizuna>80){
                //console.log("youujo")
                youujoUP = youujoUP*(100+mytore[i].card[j].spc_youujo)/100;
            }
            //やる気効果補正
            yarukiUP = yarukiUP+mytore[i].card[j].spc_youujo/100;

            //トレーニング効果補正
            // console.log("トレーニング効果補正");
            // console.log(mytore[i].card[j].spc_tore)
            // console.log(mytore[i].card[j].spc_tore/100);
            toreUP = toreUP+mytore[i].card[j].spc_tore/100;
        }
        yarukiUP = 1+((options.yaruki-1)*(1+yarukiUP));

        //人数補正
        let cardUP = 1 + 0.05*mytore[i].card.length;
        //上昇基礎値
        for(var j in mytore[i].card){
            for(var k in mytore[i].card[j].spc_bonasu_pt){
                // console.log(mytore[i].card[j].spc_bonasu_pt[k])
                // console.log(result)
                // console.log( result[k])

                if(mytore[i].card[j].spc_bonasu_pt[k]!=0 && result[k]!=0){
                    result[k] = result[k] + mytore[i].card[j].spc_bonasu_pt[k];
                }
            }
        }
        for(var j in result){
            result[j] = result[j] * youujoUP * yarukiUP * toreUP * cardUP;
            result[j] = parseInt(result[j]);
            if(result[j]>100){
                result[j] = 100
            }
        }
        mytore[i].result = result;
    }
    console.log(mytore[0]);
    return mytore;
}

//只需要得意练习属性以及得意率,返回做哪一个练习
var calc_card_position = function(spc_attribute,card_tokuritu,mode){
    let attribute = spc_attribute - 1;//属性要-1=>速度为0
    //出现率计算
    let awareritu = (card_tokuritu+100)/(card_tokuritu+100+450);
    //不出现:
    let noawareritu = (50)/(card_tokuritu+100+450);
    //其他练习出现率
    let othertoreritu = ( 1 - awareritu - noawareritu )/4;

    if(mode == 1){
        return [awareritu,othertoreritu,noawareritu]; 
    }

    let rituArr = [0,0,0,0,0,0];
    for(let i in rituArr){
        rituArr[i] = othertoreritu;
        if(i == attribute){
            //console.log(i)
            rituArr[i] = awareritu;
        }
        if(i == 5){
            rituArr[i] = noawareritu;
        }
    }
    // console.log(rituArr);
    // console.log(calcArrSum(rituArr,4));
    // console.log(calcArrSum(rituArr,6));
    let ranNUM = Math.random();
    //console.log(ranNUM);
    switch(true){
        case ranNUM>=0 && ranNUM<calcArrSum(rituArr,1):
            return 0;
        case ranNUM>=calcArrSum(rituArr,1) && ranNUM<calcArrSum(rituArr,2):
            return 1;
        case ranNUM>=calcArrSum(rituArr,2) && ranNUM<calcArrSum(rituArr,3):
            return 2;
        case ranNUM>=calcArrSum(rituArr,3) && ranNUM<calcArrSum(rituArr,4):
            return 3;
        case ranNUM>=calcArrSum(rituArr,4) && ranNUM<calcArrSum(rituArr,5):
            return 4;
        case ranNUM>=calcArrSum(rituArr,5) && ranNUM<calcArrSum(rituArr,6):
            return -1;
    }

}

//计算数组前n项和
var calcArrSum = function( arr, index){
    let sum = 0;
    for(var i=0; i<index; i++){
        sum+=arr[i];
    }
    return sum;
}

// 计算练习性能
var calcSingleCard = function(cards_item,basenum,yaruki){
    //not youjyo
    let commonTore = basenum;
    let youjyoTore = [];
    for(var i in commonTore){
        basenum[i] *= yaruki;// =1.x
        commonTore[i]+=cards_item.spc_bonasu_pt[i];
        commonTore[i]*=(1+cards_item.spc_tokuitu/100);
        commonTore[i]*=(1+(yaruki-1)*(1+cards_item.spc_yaruki/100));
    }
}



export {
    simulation,calcSingleCard
}