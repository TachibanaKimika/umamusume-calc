/*
 * @Author: your name
 * @Date: 2021-07-08 13:29:38
 * @LastEditTime: 2021-08-21 03:04:20
 * @LastEditors: Akarichan
 * @Description: In User Settings Edit
 * @FilePath: \fake-hpf:\My Repo\umamusume-calc\src\jsfile\util\initChartsOption.js
 */
var initChartsOption_boxplot = function (Rawdata) {
    // console.log(`THIS IS INITCHARTS
    // RAWDATA IS`)
    // console.log(Rawdata)
    let data = []
    Rawdata.forEach((ele)=>{
        data.push(ele.num)
    })
    console.log(data)


    let option = {
        title: [{
            text: '模拟结果',
            left: 'center'
        }, ],
        dataset: [
            // {
            //     // dimensions: ['name','num'],
            //     source: [Rawdata[0].num, Rawdata[1].num, Rawdata[2].num, Rawdata[3].num, Rawdata[4].num],

            //     // 每一个练习对应一个dataset
            //     // TODO
            // }, {
            //     transform: {
            //         type: 'boxplot',
            //         // itemNameFormatter: function (params) {
            //         //     return 'expr ' + params;
            //         // }
            //     }
            // }, {
            //     fromDatasetIndex: 1,
            //     fromTransformResult: 1
            // }
        ],
        tooltip: {
            trigger: 'item',
            axisPointer: {
                type: 'shadow'
            },

        },
        grid: {
            left: '10%',
            right: '10%',
            bottom: '15%'
        },
        yAxis: {
            type: 'category',
            // data: ['speed','stamina', 'power', 'konnjyo', 'kashikosa', 'skill'],
            boundaryGap: true,
            nameGap: 30,
            splitArea: {
                show: false
            },
            splitLine: {
                show: false
            }
        },
        xAxis: {
            type: 'value',
            splitArea: {
                show: true
            }
        },
        series: [
            // {
            //     name: 'boxplot',
            //     type: 'boxplot',
            //     tooltip: {
            //         formatter: function (params) {
            //             var name = ''
            //             switch (params.name) {
            //                 case '0':
            //                     name = '速度';
            //                     break;
            //                 case '1':
            //                     name = '体力';
            //                     break;
            //                 case '2':
            //                     name = '力量';
            //                     break;
            //                 case '3':
            //                     name = '根性';
            //                     break;
            //                 case '4':
            //                     name = '智力';
            //                     break;
            //             }
            //             return [
            //                 '类别名称: ' + name,
            //                 '最小值: ' + params.data[1],
            //                 '后25%: ' + params.data[2],
            //                 '中位数: ' + params.data[3],
            //                 '前25%: ' + params.data[4],
            //                 '最大边界: ' + params.data[5]
            //             ].join('<br/>')
            //         }
            //     },
            //     datasetIndex: 1
            // },
            // {
            //     name: 'outlier',
            //     type: 'scatter',
            //     encode: {
            //         x: 1,
            //         y: 0
            //     },
            //     // tooltip:{
            //     //     formatter:function(params){
            //     //         return params.data
            //     //     }
            //     // },
            //     datasetIndex: 2
            // }
        ]
    }
    let keyArr = ['speed','stamina', 'power', 'konnjyo', 'kashikosa', 'skill']
    data.forEach((ele, index)=>{
        // 每个练习应该建立一个数组
        let source = [[],[],[],[],[],[]]
        ele.forEach((inEle)=>{
            // 此处为某一个练习的单变量=>{speed: 10, power: 20}
            Object.keys(inEle).forEach((objkey)=>{
                // 此处为object的key=>'speed', 0; 'power',1
                source[keyArr.findIndex(objkey)].push(inEle[objkey])
            })
        })
        option.dataset.push({source: source})
        option.dataset.push(
            {
                transform: 
                {
                    type: 'boxplot',
                    config: { itemNameFormatter: function (params){
                        let keyArrConfig = ['speed','stamina', 'power', 'konnjyo', 'kashikosa', 'skill']
                        return keyArrConfig[params.value]
                    }}
                },
                fromDatasetIndex: index*3
            })
        option.dataset.push({fromDatasetIndex: index*3+1,fromTransformResult: 1})
        let color = '#000000'
        switch(index){
            case 0: color='#007af4';break;
            case 1: color='#f8a0a0';break;
            case 2: color='#ffbb1e';break;
            case 3: color='#d611ff';break;
            case 4: color='#68ff2f';break;
            case 5: color='#FF0000';break;
        }
        option.series.push({
            name: 'boxplot',
            type: 'boxplot',
            tooltip: {
                formatter: function (params) {
                    console.log(params)
                    let name = ''
                    let type = ''
                    switch (params.name) {
                        case '0':
                            name = '速度';
                            break;
                        case '1':
                            name = '体力';
                            break;
                        case '2':
                            name = '力量';
                            break;
                        case '3':
                            name = '根性';
                            break;
                        case '4':
                            name = '智力';
                            break;
                        case '5':
                            name = '技能点';
                            break;
                    }
                    switch (params.seriesIndex){
                        case 0:
                            type = '速度';
                            break;
                        case 2:
                            type = '体力';
                            break;
                        case 4:
                            type = '力量';
                            break;
                        case 6:
                            type = '根性';
                            break;
                        case 8:
                            type = '智力';
                            break;
                    }
                    return [
                        `${type}练习`,
                        '练习时加成的数值: ' + params.name,
                        '极小值: ' + params.data[1],
                        '后25%: ' + params.data[2],
                        '中位数: ' + params.data[3],
                        '前25%: ' + params.data[4],
                        '极大值: ' + params.data[5]
                    ].join('<br/>')
                }
            },
            datasetIndex: index*3 + 1,
            itemStyle:{
                normal:{
                    color: color
                }
            }
        })
        option.series.push({
            name: 'outlier',
            type: 'scatter',
            encode: {
                x: 1,
                y: 0
            },
            datasetIndex: index*3+2
        })
    })
    console.log(option)
    return option;
}

var initChartsOption_Bar_singleCard = function (cardArr, myoptions) {
    console.log(cardArr)
    console.log(myoptions)
    //每组柱状图表示当时卡的某属性加成数值, 各个柱子表示不同的卡
    let options = {
        legend: {},
        tooltip: {},
        dataset: {
            dimensions: [],
            source: [],
        },
        xAxis: {
            type: 'category'
        },
        yAxis: {},
        // Declare several bar series, each will be mapped
        // to a column of dataset.source by default.
        series: []
    }

    let staticData = {
        atb: ['スビート', 'スタミナ', 'パワー', '根性', '賢さ', 'スキル']
    }

    let flag = '';
    switch (myoptions.attribute) {
        case 0:
            flag = 'スビート';
            break;
        case 1:
            flag = 'スタミナ';
            break;
        case 2:
            flag = 'パワー';
            break;
        case 3:
            flag = '根性';
            break;
        case 4:
            flag = '賢さ';
            break;
    }

    let source2decade = []

    for (let i in cardArr) {
        var obj = {}
        obj.name = cardArr[i].spc_name
        for (let j in cardArr[i].spc_result.tore_Common_y[myoptions.attribute]) {
            cardArr[i].spc_result.tore_Common_y[myoptions.attribute][j] != 0 && j!=5 ? obj[staticData.atb[j]] = cardArr[i].spc_result.tore_Common_y[myoptions.attribute][j] : true
        }
        options.dataset.dimensions = Object.keys(obj)
        source2decade.push(obj)
    }
    //console.log(source2decade)
    options.dataset.source = source2decade
    const bar = {type: 'bar'}
    console.log(Object.keys(obj).length)
    for(let i =1; i < Object.keys(obj).length; i++){
        options.series.push(bar)
    }

    return options

    //const model = [{common:[1,1,1],common_y:[1,2,2,2,2,2]},{...a}] //=> [{}]



}







export {
    initChartsOption_boxplot,
    initChartsOption_Bar_singleCard
}