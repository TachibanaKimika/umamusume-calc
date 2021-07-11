/*
 * @Author: your name
 * @Date: 2021-07-08 13:29:38
 * @LastEditTime: 2021-07-11 12:27:24
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: \fake-hpf:\My Repo\umamusume-calc\src\jsfile\util\initChartsOption.js
 */
var initChartsOption_boxplot = function (Rawdata) {
    let option = {
        title: [{
            text: '模拟结果',
            left: 'center'
        }, ],
        dataset: [{
            // dimensions: ['name','num'],
            source: [Rawdata[0].num, Rawdata[1].num, Rawdata[2].num, Rawdata[3].num, Rawdata[4].num]
        }, {
            transform: {
                type: 'boxplot',
                itemNameFormatter: function (params) {
                    return 'expr ' + params;
                }
            }
        }, {
            fromDatasetIndex: 1,
            fromTransformResult: 1
        }],
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
        series: [{
                name: 'boxplot',
                type: 'boxplot',
                tooltip: {
                    formatter: function (params) {
                        var name = ''
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
                        }



                        return [
                            '类别名称: ' + name,
                            '最小值: ' + params.data[1],
                            '后25%: ' + params.data[2],
                            '中位数: ' + params.data[3],
                            '前25%: ' + params.data[4],
                            '最大边界: ' + params.data[5]
                        ].join('<br/>')
                    }
                },
                datasetIndex: 1
            },
            {
                name: 'outlier',
                type: 'scatter',
                encode: {
                    x: 1,
                    y: 0
                },
                // tooltip:{
                //     formatter:function(params){
                //         return params.data
                //     }
                // },
                datasetIndex: 2
            }
        ]
    };
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