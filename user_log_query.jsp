<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="DATAMODEL" scope="request" class="com.pamo.frame.core.model.DataModel" />
<%
	
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
	<meta content="width=device-width, initial-scale=1" name="viewport"/>
	<meta content="" name="description"/>
	<meta content="" name="author"/>
	<title>用户日志查询</title>
	<link href="static/plugin/bootstrap/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <style>
       body{
    	    overflow-x: hidden;
       }
        tbody tr td {
            text-align: center;
        }
        .red{
            color:#5BC0DE;
        }
        body .laypage_btn{
            border-radius: 3px;
        }
        body .laypage_main button{
            background: #5BC0DE;
            color: #fff;
            border:none;
        }
        body .row{
        	margin:0;padding:0;
        }
    </style>
    <script type="text/javascript">
		var basePath = '<%=basePath%>';	
	</script>
</head>
<body>
<div style="border:1px solid #ccc;border-bottom:none;margin-left:4px;">
    <h3 style="border-bottom:1px solid #ccc;background: #5BC0DE;padding:5px;color:#fff;margin-top:0;">用户日志查询</h3>     
    <form name="pullyform"  id="pullyform">
    	<input type="hidden"  name="QUERYCONDITION" id="QUERYCONDITION" />
        <div class="row" style="margin:0;padding:0;margin-top:10px;border-bottom:1px dotted #ccc;padding-bottom:7px;">
            <div class="col-md-6" style="text-align:right;">
                <div class="row">
                    <div class="col-md-9">
                        <span>用户名</span>
                        <input type="text" id="YHM" name="YHM" class="val empty" qbetype="text"
                               style="width: 50%;  outline: none; border: 1px solid #CCCCCC; border-radius: 4px; padding: 5px;"/>
                    </div>
                    <div class="error col-md-3" style="text-align: left;line-height:32px; ">

                    </div>
                </div>
            </div>
            <div class="col-md-6" style="text-align:right;">
                <div class="row">
                    <div class="col-md-9">
                        <span>用户IP</span>
                        <input type="text" id="YHIP" name="YHIP" class="val empty" qbetype="text"
                               style="width: 50%;  outline: none; border: 1px solid #CCCCCC; border-radius: 4px; padding: 5px;"/>
                    </div>
                    <div class="error col-md-3" style="text-align: left;line-height:32px; ">

                    </div>

                </div>
            </div>
        </div>
        <div class="row" style="margin:0;padding:0;margin-top:10px;border-bottom:1px dotted #ccc;padding-bottom:7px;">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-9" style="text-align: right ">
                        <span>登陆时间</span>
                        <input type="hidden"  name="DLSJ" id="DLSJ"  qbetype="date"/>
                        <input type="text" id="DLSJ_T" name="DLSJ_T" class="val"
                               style="width: 50%;  outline: none; border: 1px solid #CCCCCC; border-radius: 4px; padding: 5px;" onclick="laydate({istime:true, format: 'YYYY-MM-DD'})"/>
                    </div>
                    <div class="error col-md-3" style="text-align: left;line-height:34px; ">

                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-9" style="text-align: right ">
                        <span>最后活动时间</span>
                        <input type="hidden"  name="ZHHDSJ" id="ZHHDSJ"  qbetype="date"/>
                        <input type="text" id="ZHHDSJ_T" name="ZHHDSJ_T" class="val"
                               style="width: 50%;  outline: none; border: 1px solid #CCCCCC; border-radius: 4px; padding: 5px;" onclick="laydate({istime:true, format: 'YYYY-MM-DD'})"/>
                    </div>
                    <div class="error col-md-3" style="text-align: left;line-height:34px; ">

                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="margin:0;padding:0;margin-top:10px;border-bottom:1px dotted #ccc;padding-bottom:7px;">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-9" style="text-align: right ">
                        <span>注销时间</span>
                        <input type="hidden"  name="ZXSJ" id="ZXSJ"  qbetype="date"/>
                        <input type="text" id="ZXSJ_T" name="ZXSJ_T" class="val"
                               style="width: 50%;  outline: none; border: 1px solid #CCCCCC; border-radius: 4px; padding: 5px;" onclick="laydate({istime:true, format: 'YYYYMMDD'})"/>
                    </div>
                    <div class="error col-md-3" style="text-align: left;line-height:34px; ">

                    </div>
                </div>
            </div>
        </div>

    <div class="row" style="margin:0;padding:0;margin-top:10px;padding-bottom:9px;border-bottom:1px solid #ccc;">
        <div class="col-md-6" style="text-align: right">
            <input type="button" id="search" class="btn btn-info" value="查询"/>
        </div>
        <div class="col-md-6" style="text-align: left">
            <input type="reset" id="reset" class="btn btn-info" value="重置"/>
        </div>
    </div>
    </form>
    <div id="parent" style="width:100%;margin:0 auto;display: none">
        <div id="search_detail" style="overflow-x: hidden">
            <h3 style="border-bottom:1px solid #ccc;background: #5BC0DE;padding:5px;color:#fff;margin:0">用户访问页面日志列表</h3>
            <table id="table" class="table table-striped table-bordered" style="margin:0;">
                <thead>
                <tr>
                    <th style="text-align: center">序号</th>
                    <th style="text-align: center">用户姓名</th>
                    <th style="text-align: center">用户IP</th>
                    <th style="text-align: center">登陆时间</th>
                    <th style="text-align: center">最后活动时间 </th>
                    <th style="text-align: center">注销时间</th>
                    <th class="spc" style="text-align: center">操作</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</div>
 <div id="pageParent" style="position:relative;margin-top:5px;">
                <div id="page1" style="text-align:center"></div>
                <div id="sort" style="position:absolute;left:0;top:0;"></div>
 </div>
<script src="static/plugin/bootstrap/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="static/js/laydate/laydate.js"></script>
<script src="static/js/laypage-v1.2/laypage/laypage.js"></script>
<script src="static/js/famework_qbe.js"></script>
<script>
    //查询按钮
    $('#search').click(function () {     
     var option_DLSJ = $("#DLSJ_T").val().replace(/-/g,"");
     var option_ZHHDSJ = $("#ZHHDSJ_T").val().replace(/-/g,"");
     var option_ZXSJ = $("#ZXSJ_T").val().replace(/-/g,"");
     
     $("#DLSJ").val(option_DLSJ);
     $("#ZHHDSJ").val(option_ZHHDSJ);
     $("ZXSJ").val(option_ZXSJ);
     setQueryCondition("pullyform");
        page();
    });
    //分页查询
    function page(curr) {
        var pageSize = 8;
        var dlaccount = $('#user').val();
        var dlname = $('#userIP').val();
        var loginTime = $('#loginTime').val();
        var lastActiveTime = $('#lastActiveTime').val();
        var exitTime = $('#exitTime').val();
        
        setQueryCondition('pullyform');
        
        //以下将以jquery.ajax为例，演示一个异步分页
        $.post(basePath+'/logController/queryLog', {    //获得json数据
                    page: curr || 1,
                    pageSize: pageSize,
                    dlaccount:dlaccount,
                    dlname:dlname,
                    loginTime:loginTime,
                    lastActiveTime:lastActiveTime,
                    exitTime:exitTime,
                    QUERYCONDITION:$("#QUERYCONDITION").val()
                },
                function (res) { //从第1页开始请求。返回的json格式可以任意定义
                    laypage({
                        cont: 'page1', //容器。值支持id名、原生dom对象，jquery对象。【如该容器为】：<div id="page1"></div>
                        pages: res.TotalPage, //通过后台拿到的总页数
                        //pages: Math.ceil(res.Total/pageSize), //通过后台拿到的总页数
                        curr: curr || 1,
                        first: 1, //若不显示，设置false即可
                        //last: res.TotalPage, //若不显示，设置false即可
                        //prev: '<', //若不显示，设置false即可
                        //next: '>', //若不显示，设置false即可
                        skip:true,
                        groups:4,
                        skin:'#5BC0DE',
                        jump: function (obj,first) { //触发分页后的回调
                            if(!first){ //点击跳页触发函数自身，并传递当前页：obj.curr
                                page(obj.curr);
                            }
                        }
                    });
                    $('#parent').show();
                    $('#sort').html('');
                    $('#sort').append('<p class="red">共'+res.Total+'条&nbsp;&nbsp;&nbsp;&nbsp;共'+res.TotalPage+'页&nbsp;&nbsp;&nbsp;&nbsp;当前第'+res.Index+'页</p>');
                    $('#table>tbody').empty();
                    $.each(res.data, function (i) {
                            $('#table>tbody').append('<tr>' +
                                '<td>' + res.data[i].XH + '</td><td>' + res.data[i].YHXM + '</td>' +
                                '<td>' + res.data[i].YHIP + '</td><td>' + res.data[i].DLSJ_S + '</td>' +
                                '<td>' + res.data[i].ZHHDSJ_S + '</td><td>'+ (null==res.data[i].ZXSJ_S?"":res.data[i].ZXSJ_S)+
                                '</td><td><input id = "option_s" type="button" value="操作查询" onclick="page1(' + res.data[i].DLBH + ')" class="btn btn-info"/>'+
                                '<input id="visit_s" type="button" onclick="page2(' + res.data[i].DLBH + ')" style = "margin-left:5px;" value="访问查询" class="btn btn-info"/></td>'+ 
                                '</tr>');
                  
                    });
                },"json");
                
            
    }
    
     $('#option_s').click(function(){
             page1();	
             
         });
         
         function page1(dlbh){

         	window.location.href="href/action?_NEXTPAGE=operation/log/user_logs&DLBH="+dlbh;
         }
         
      $('#visit_s').click(function(){
      		 page2();
      });
      function page2(dlbh){
      alert(xh);
      window.location.href="href/action?_NEXTPAGE=operation/log/user_logs&DLBH="+dlbh;
      }
</script>
</body>
</html>
