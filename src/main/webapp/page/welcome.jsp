<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>首页</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="../lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">
    <link rel="stylesheet" href="../css/public.css" media="all">
    <style>
        .layuimini-qiuck-module a i {
            display: inline-block;
            width: 100%;
            height: 60px;
            line-height: 60px;
            text-align: center;
            border-radius: 2px;
            font-size: 30px;
            background-color: #F8F8F8;
            color: #333;
            transition: all .3s;
            -webkit-transition: all .3s;
        }

        .layuimini-qiuck-module a cite {
            position: relative;
            top: 2px;
            display: block;
            color: #666;
            text-overflow: ellipsis;
            overflow: hidden;
            white-space: nowrap;
            font-size: 14px;
        }

        .panel {
            background-color: #fff;
            border: 1px solid transparent;
            border-radius: 3px;
            -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, .05);
            box-shadow: 0 1px 1px rgba(0, 0, 0, .05)
        }

        .panel-body {
            padding: 10px
        }

        .panel-title {
            margin-top: 0;
            margin-bottom: 0;
            font-size: 12px;
            color: inherit
        }

        .label {
            display: inline;
            padding: .2em .6em .3em;
            font-size: 75%;
            font-weight: 700;
            line-height: 1;
            color: #fff;
            text-align: center;
            white-space: nowrap;
            vertical-align: baseline;
            border-radius: .25em;
            margin-top: .3em;
        }

        .main_btn > p {
            height: 40px;
        }

    </style>
</head>
<body>
<div class="layuimini-container">

    <div class="layuimini-main">
        <div class="layui-top-box">
            <div class="layui-row layui-col-space10">

                <div class="layui-col-md3">
                    <div class="col-xs-6 col-md-3">
                        <div class="panel layui-bg-cyan">
                            <div class="panel-body">
                                <div class="panel-title">
                                    <span class="label pull-right layui-bg-blue">实时</span>
                                    <h5>当前住户总数</h5>
                                </div>
                                <div class="panel-content">
                                    <h1 class="no-margins">214</h1>
                                    <div class="stat-percent font-bold text-gray"><i class="fa fa-commenting"></i> 1560
                                    </div>
                                    <small>历史入住数</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="layui-col-md3">
                    <div class="col-xs-6 col-md-3">
                        <div class="panel layui-bg-blue">
                            <div class="panel-body">
                                <div class="panel-title">
                                    <span class="label pull-right layui-bg-cyan">实时</span>
                                    <h5>当前空余房间</h5>
                                </div>
                                <div class="panel-content">
                                    <h1 class="no-margins">1022</h1>
                                    <div class="stat-percent font-bold text-gray"><i class="fa fa-commenting"></i>1236
                                    </div>
                                    <small>房间总数</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="layui-col-md3">
                    <div class="col-xs-6 col-md-3">
                        <div class="panel layui-bg-green">
                            <div class="panel-body">
                                <div class="panel-title">
                                    <span class="label pull-right layui-bg-orange">实时</span>
                                    <h5>当前预定总数</h5>
                                </div>
                                <div class="panel-content">
                                    <h1 class="no-margins">90</h1>
                                    <div class="stat-percent font-bold text-gray"><i class="fa fa-commenting"></i> 1020
                                    </div>
                                    <small>累计预定总数</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="layui-col-md3">
                    <div class="col-xs-6 col-md-3">
                        <div class="panel layui-bg-orange">
                            <div class="panel-body">
                                <div class="panel-title">
                                    <span class="label pull-right layui-bg-green">实时</span>
                                    <h5>当日入住数</h5>
                                </div>
                                <div class="panel-content">
                                    <h1 class="no-margins">80</h1>
                                    <div class="stat-percent font-bold text-gray"><i class="fa fa-commenting"></i> 1011
                                    </div>
                                    <small>历史入住数</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<br>
<div class="layuimini-container">

    <div class="layui-row layui-col-space15">
        <div class="layui-col-xs12 layui-col-md9">
            <div id="echarts-records"
                 style="background-color:#ffffff;min-height:400px;padding: 10px"></div>
        </div>
        <div class="layui-col-xs12 layui-col-md3">
            <div id="echarts-pies"
                 style="background-color:#ffffff;min-height:400px;padding: 10px"></div>
        </div>
    </div>
</div>

<script src="../lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script src="../js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>
    layui.use(['layer', 'echarts'], function () {
        var $ = layui.jquery,
            layer = layui.layer,
            echarts = layui.echarts;

        /**
         * 报表功能
         */
        // echarts是layui中的自定义扩展中的图表扩展
        var echartsRecords = echarts.init(document.getElementById('echarts-records'), 'walden');

        var optionRecords = {
            title: {
                text: '预计入住数量'
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross',
                    label: {
                        backgroundColor: '#6a7985'
                    }
                }
            },
            legend: {
                data: ['豪华套房入住','单人房入住','三人房入住','双人房入住','总入住人数']
            },
            toolbox: {
                feature: {
                    saveAsImage: {}
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'category',
                    boundaryGap: false,
                    data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
                }
            ],
            yAxis: [
                {
                    type: 'value'
                }
            ],
            series: [
                {
                    name: '入住总人数',
                    type: 'line',
                    stack: '总量',
                    areaStyle: {},
                    data: [120, 132, 101, 134, 90, 230, 210]
                },
                {
                    name: '豪华套房入住',
                    type: 'line',
                    areaStyle: {},
                    data: [220, 182, 191, 234, 290, 330, 310]
                },
                {
                    name: '单人房入住',
                    type: 'line',
                    stack: '总量',
                    areaStyle: {},
                    data: [150, 232, 201, 154, 190, 330, 410]
                },
                {
                    name: '三人房入住',
                    type: 'line',
                    stack: '总量',
                    areaStyle: {},
                    data: [320, 332, 301, 334, 390, 330, 320]
                },
                {
                    name: '双人房入住',
                    type: 'line',
                    stack: '总量',
                    label: {
                        normal: {
                            show: true,
                            position: 'top'
                        }
                    },
                    areaStyle: {},
                    data: [820, 932, 901, 934, 1290, 1330, 1320]
                }
            ]
        };
        echartsRecords.setOption(optionRecords);


        /**
         * 玫瑰图表
         */
        var echartsPies = echarts.init(document.getElementById('echarts-pies'), 'walden');
        var optionPies = {
            title: {
                text: '每日期望入住',
                left: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c} ({d}%)'
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: ['单人房入住', '双人房入住', '三人房入住', '豪华房入住']
            },
            series: [
                {
                    name: '入住人数',
                    type: 'pie',
                    radius: '55%',
                    center: ['50%', '60%'],
                    roseType: 'radius',
                    data: [
                        {value: 251, name: '单人房入住'},
                        {value: 333, name: '双人房入住'},
                        {value: 238, name: '三人房入住'},
                        {value: 145, name: '豪华房入住'}
                    ],
                    emphasis: {
                        itemStyle: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        echartsPies.setOption(optionPies);

        // echarts 窗口缩放自适应
        window.onresize = function () {
            echartsRecords.resize();
        }
    });
</script>
</body>
</html>
