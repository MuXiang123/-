<%@ page language="java" pageEncoding="gb2312"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>���ݹ���ϵͳ</title>
    <meta name="keywords" content="layuimini,layui,layuiģ��,layui��̨,��̨ģ��,admin,adminģ��,layui mini">
    <meta name="description" content="layuimini����layui��������ǰ�˺�̨�����ܣ����ࡢ���õĺ�̨���ģ�壬�������в�ε�ǰ��˳���,ֻ���ṩһ���ӿھ�ֱ�ӳ�ʼ��������ܣ����踴�Ӳ�����">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Access-Control-Allow-Origin" content="*">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="images/favicon.ico">
    <link rel="stylesheet" href="./lib/layui-v2.5.5/css/layui.css" media="all">
    <link rel="stylesheet" href="./css/layuimini.css?v=2.0.3" media="all">
    <link rel="stylesheet" href="./lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style id="layuimini-bg-color">
    </style>
</head>
<body class="layui-layout-body layuimini-all">
<div class="layui-layout layui-layout-admin">

    <div class="layui-header header">
        <div class="layui-logo layuimini-logo"></div>

        <div class="layuimini-header-content">
            <a>
                <div class="layuimini-tool"><i title="չ��" class="fa fa-outdent" data-side-fold="1"></i></div>
            </a>

            <!--���Զ�ͷ���˵�-->
            <ul class="layui-nav layui-layout-left layuimini-header-menu mobile layui-hide-xs layuimini-menu-header-pc">
            </ul>

            <!--�ֻ���ͷ���˵�-->
            <ul class="layui-nav layui-layout-left layuimini-header-menu mobile layui-hide-sm">
                <li class="layui-nav-item">
                    <a href="javascript:;"><i class="fa fa-list-ul"></i> ѡ��ģ��</a>
                    <dl class="layui-nav-child layuimini-menu-header-mobile">
                    </dl>
                </li>
            </ul>

            <ul class="layui-nav layui-layout-right" style="position: relative; right: 40px">

                <li class="layui-nav-item" lay-unselect>
                    <a href="javascript:;" data-refresh="ˢ��"><i class="fa fa-refresh"></i></a>
                </li>
                <li class="layui-nav-item" lay-unselect>
                    <a href="javascript:;" data-clear="����" class="layuimini-clear"><i class="fa fa-trash-o"></i></a>
                </li>
                <li class="layui-nav-item mobile layui-hide-xs" lay-unselect>
                    <a href="javascript:;" data-check-screen="full"><i class="fa fa-arrows-alt"></i></a>
                </li>
                <li class="layui-nav-item layuimini-setting">
                    <a href="javascript:;" id="login"><%=request.getParameter("id")%></a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="javascript:;" layuimini-content-href="page/staffinfo.jsp" data-title="��������" data-icon="fa fa-gears">��������<span class="layui-badge-dot"></span></a>
                        </dd>
                        <dd>
                            <hr>
                        </dd>
                        <dd>
                            <a href="http://localhost:8080/keshe_war_exploded/" class="login-out" onclick="flushstorage()">�˳���¼</a>
                        </dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>

    <!--���޼����˵�-->
    <div class="layui-side layui-bg-black layuimini-menu-left">
    </div>

    <!--��ʼ�����ز�-->
    <div class="layuimini-loader">
        <div class="layuimini-loader-inner"></div>
    </div>

    <!--�ֻ������ֲ�-->
    <div class="layuimini-make"></div>

    <!-- �ƶ����� -->
    <div class="layuimini-site-mobile"><i class="layui-icon">?</i></div>

    <div class="layui-body">

        <div class="layuimini-tab layui-tab-rollTool layui-tab" lay-filter="layuiminiTab" lay-allowclose="true">
            <ul class="layui-tab-title">
                <li class="layui-this" id="layuiminiHomeTabId" lay-id=""></li>
            </ul>
            <div class="layui-tab-control">
                <li class="layuimini-tab-roll-left layui-icon layui-icon-left"></li>
                <li class="layuimini-tab-roll-right layui-icon layui-icon-right"></li>
                <li class="layui-tab-tool layui-icon layui-icon-down">
                    <ul class="layui-nav close-box">
                        <li class="layui-nav-item">
                            <a href="javascript:;"><span class="layui-nav-more"></span></a>
                            <dl class="layui-nav-child">
                                <dd><a href="javascript:;" layuimini-tab-close="current">�� �� �� ǰ</a></dd>
                                <dd><a href="javascript:;" layuimini-tab-close="other">�� �� �� ��</a></dd>
                                <dd><a href="javascript:;" layuimini-tab-close="all">�� �� ȫ ��</a></dd>
                            </dl>
                        </li>
                    </ul>
                </li>
            </div>
            <div class="layui-tab-content">
                <div id="layuiminiHomeTabIframe" class="layui-tab-item layui-show"></div>
            </div>
        </div>

        <div class="layui-card-header"><i class="fa fa-credit-card icon icon-blue"></i>������</div>
        <div class="layui-card-body">
            <div class="welcome-module">
                <div class="layui-row layui-col-space10 layuimini-qiuck">
                    <div class="layui-col-xs3 layuimini-qiuck-module">
                        <a href="javascript:;" layuimini-content-href="page/menu.html" data-title="�˵�����" data-icon="fa fa-window-maximize">
                            <i class="fa fa-window-maximize"></i>
                            <cite>�˵�����</cite>
                        </a>
                    </div>
                    <div class="layui-col-xs3 layuimini-qiuck-module">
                        <a href="javascript:;" layuimini-content-href="page/setting.html" data-title="ϵͳ����" data-icon="fa fa-gears">
                            <i class="fa fa-gears"></i>
                            <cite>ϵͳ����</cite>
                        </a>
                    </div>
                    <div class="layui-col-xs3 layuimini-qiuck-module">
                        <a href="javascript:;" layuimini-content-href="page/table.html" data-title="���ʾ��" data-icon="fa fa-file-text">
                            <i class="fa fa-file-text"></i>
                            <cite>���ʾ��</cite>
                        </a>
                    </div>
                    <div class="layui-col-xs3 layuimini-qiuck-module">
                        <a href="javascript:;" layuimini-content-href="page/icon.html" data-title="ͼ���б�" data-icon="fa fa-dot-circle-o">
                            <i class="fa fa-dot-circle-o"></i>
                            <cite>ͼ���б�</cite>
                        </a>
                    </div>
                    <div class="layui-col-xs3 layuimini-qiuck-module">
                        <a href="javascript:;" layuimini-content-href="page/form.html" data-title="��ʾ��" data-icon="fa fa-calendar">
                            <i class="fa fa-calendar"></i>
                            <cite>��ʾ��</cite>
                        </a>
                    </div>
                    <div class="layui-col-xs3 layuimini-qiuck-module">
                        <a href="javascript:;" layuimini-content-href="page/404.html" data-title="404ҳ��" data-icon="fa fa-hourglass-end">
                            <i class="fa fa-hourglass-end"></i>
                            <cite>404ҳ��</cite>
                        </a>
                    </div>
                    <div class="layui-col-xs3 layuimini-qiuck-module">
                        <a href="javascript:;" layuimini-content-href="page/button.html" data-title="��ťʾ��" data-icon="fa fa-snowflake-o">
                            <i class="fa fa-snowflake-o"></i>
                            <cite>��ťʾ��</cite>
                        </a>
                    </div>
                    <div class="layui-col-xs3 layuimini-qiuck-module">
                        <a href="javascript:;" layuimini-content-href="page/layer.html" data-title="������" data-icon="fa fa-shield">
                            <i class="fa fa-shield"></i>
                            <cite>������</cite>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-header"><i class="fa fa-line-chart icon"></i>����ͳ��</div>
                <div class="layui-card-body">
                    <div id="echarts-records" style="width: 100%;min-height:500px"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="lib/layui-v2.5.5/layui.js" charset="utf-8"></script>
<script src="js/lay-config.js?v=2.0.0" charset="utf-8"></script>
<script>
    window.onload=function () {
        console.log(window.localStorage.getItem("id"));
        if(window.localStorage.getItem("id")==null)
            window.location.href="404.jsp";
    }

    function flushstorage()
    {
        window.localStorage.clear();
    }

layui.use(['jquery', 'layer', 'miniAdmin','miniTongji','echarts'], function () {
    var $ = layui.jquery,
        layer = layui.layer,
        miniAdmin = layui.miniAdmin,
        miniTongji = layui.miniTongji,
        echarts = layui.echarts;

    var options = {
        iniUrl: "api/init.json",    // ��ʼ���ӿ�
        clearUrl: "api/clear.json", // ��������ӿ�
        urlHashLocation: true,      // �Ƿ��hash��λ
        bgColorDefault: 0,          // ����Ĭ������
        multiModule: true,          // �Ƿ�����ģ��
        menuChildOpen: false,       // �Ƿ�Ĭ��չ���˵�
        loadingTime: 0,             // ��ʼ������ʱ��
        pageAnim: true,             // iframe���ڶ���
        maxTabNum: 20,              // ����tab������
    };
    miniAdmin.render(options);

    // �ٶ�ͳ�ƴ��룬ֻͳ��ָ������
    miniTongji.render({
        specific: true,
        domains: [
            '99php.cn',
            'layuimini.99php.cn',
            'layuimini-onepage.99php.cn',
        ],
    });

    $('.login-out').on("click", function () {
        layer.msg('�˳���¼�ɹ�', function () {
            window.location = '';
        });
    });

    /**
     * ������
     */
    var echartsRecords = echarts.init(document.getElementById('echarts-records'), 'walden');
    var optionRecords = {
        tooltip: {
            trigger: 'axis'
        },
        legend: {
            data:['�ʼ�Ӫ��','���˹��','��Ƶ���','ֱ�ӷ���','��������']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        toolbox: {
            feature: {
                saveAsImage: {}
            }
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            data: ['��һ','�ܶ�','����','����','����','����','����']
        },
        yAxis: {
            type: 'value'
        },
        series: [
            {
                name:'�ʼ�Ӫ��',
                type:'line',
                data:[120, 132, 101, 134, 90, 230, 210]
            },
            {
                name:'���˹��',
                type:'line',
                data:[220, 182, 191, 234, 290, 330, 310]
            },
            {
                name:'��Ƶ���',
                type:'line',
                data:[150, 232, 201, 154, 190, 330, 410]
            },
            {
                name:'ֱ�ӷ���',
                type:'line',
                data:[320, 332, 301, 334, 390, 330, 320]
            },
            {
                name:'��������',
                type:'line',
                data:[820, 932, 901, 934, 1290, 1330, 1320]
            }
        ]
    };
    echartsRecords.setOption(optionRecords);

    // echarts ������������Ӧ
    window.onresize = function(){
        echartsRecords.resize();
    }

});
</script>
</body>
</html>
