var initChartsOption_boxplot=function(Rawdata){
    let option = {
        title: [
            {
                text: '模拟结果',
                left: 'center'
            },
        ],
        dataset: [{
            // dimensions: ['name','num'],
            source: [Rawdata[0].num,Rawdata[1].num,Rawdata[2].num,Rawdata[3].num,Rawdata[4].num]
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
        series: [
            {
                name: 'boxplot',
                type: 'boxplot',
                tooltip: {
                    formatter: function(params){
                        return [
                            '类别名称: ' + params.name,
                            '上边界: ' + params.data[1],
                            '下四分位数: ' + params.data[2],
                            '中位数: ' + params.data[3],
                            '上四分位数: ' + params.data[4],
                            '下边界: ' + params.data[5]
                        ].join('<br/>')
                    }
                },
                datasetIndex: 1
            },
            {
                name: 'outlier',
                type: 'scatter',
                encode: { x: 1, y: 0 },
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


export{
    initChartsOption_boxplot
}