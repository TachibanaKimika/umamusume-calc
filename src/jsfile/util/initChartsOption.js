/*
 * @Author: your name
 * @Date: 2021-07-08 13:29:38
 * @LastEditTime: 2021-07-10 21:01:57
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

var initChartsOption_Bar_singleCard = function(result) {
    
    let options = {
        legend: {},
        tooltip: {},
        dataset: {
            dimensions: ['product', '2015', '2016', '2017'],
            source: [
                {product: 'Matcha Latte', '2015': 43.3, '2016': 85.8, '2017': 93.7},
                {product: 'Milk Tea', '2015': 83.1, '2016': 73.4, '2017': 55.1},
                {product: 'Cheese Cocoa', '2015': 86.4, '2016': 65.2, '2017': 82.5},
                {product: 'Walnut Brownie', '2015': 72.4, '2016': 53.9, '2017': 39.1}
            ]
        },
        xAxis: {type: 'category'},
        yAxis: {},
        // Declare several bar series, each will be mapped
        // to a column of dataset.source by default.
        series: [
            {type: 'bar'},
            {type: 'bar'},
            {type: 'bar'}
        ]
    }
}

export {
    initChartsOption_boxplot,
    initChartsOption_Bar_singleCard
}