<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
       <%
	String path=request.getContextPath();  //douban
								//http					localhost				8080               douban
	String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/search.css" />

<title>显示所有用户</title>
</head>
<body>
	<table id="type_showuser_info" data-options="fit:true"></table>

	<script type="text/javascript">
	
	 $(function () {
         var datagrid; //定义全局变量datagrid
         var editRow = undefined; //定义全局变量：当前编辑的行
         datagrid = $("#type_showuser_info").datagrid({
             url: 'findAllUserByPage', //请求的数据源
            // iconCls: 'icon-save', //图标
             pagination: true, //显示分页
             pageSize: 15, //页大小
             pageList: [15, 30, 45, 60], //页大小下拉选项此项各value是pageSize的倍数
             fit: true, //datagrid自适应宽度
             fitColumn: false, //列自适应宽度
             striped: true, //行背景交换
             nowap: true, //列内容多时自动折至第二行
             border: false,
             idField: 'uid', //主键
             columns: [[//显示的列
             {field: 'uid', title: '用户ID', width: 100, sortable: true, checkbox: true },
              { field: 'uname', title: '用户名', width: 100, sortable: true,
                  editor: { type: 'validatebox', options: { required: true} }
              },
               { field: 'u_number', title: '用户账号', width: 100,
                   editor: { type: 'validatebox', options: { required: true} }
               },
                { field: 'upassword', title: '用户密码', width: 100,
                    editor: { type: 'validatebox', options: { required: true} }
                },
                { field: 'usex', title: '用户性别', width: 100,
                    editor: { type: 'validatebox', options: { required: true} }
                }
                ]],
             queryParams: { action: 'query' }, //查询参数
             toolbar: [{ text: '添加', iconCls: 'icon-add', handler: function () {//添加列表的操作按钮添加，修改，删除等
                 //添加时先判断是否有开启编辑的行，如果有则把开户编辑的那行结束编辑
                 if (editRow != undefined) {
                     datagrid.datagrid("endEdit", editRow);
                 }
                 //添加时如果没有正在编辑的行，则在datagrid的第一行插入一行
                 if (editRow == undefined) {
                     datagrid.datagrid("insertRow", {
                         index: 0, // index start with 0
                         row: {

                         }
                     });
                     //将新插入的那一行开户编辑状态
                     datagrid.datagrid("beginEdit", 0);
                     //给当前编辑的行赋值
                     editRow = 0;
                 }

             }
             }, '-',
              { text: '删除', iconCls: 'icon-remove', handler: function () {
            		//获取当前用户选中的行
  				var rows = datagridObj.datagrid("getChecked");
  				if(rows.length<=0){	//表示没有选中数据
  					$.messager.show({title:'温馨提示',msg:"请选择您要删除的用户...",timeout:2000,showType:'slide'});
  				}else{
  					$.messager.confirm('删除确认','您确定要删除这些数据吗?',function(result){
  						if( result ){
  							var uids = "";
  							for ( var i=0 ;i<rows.length-1;i++ ){
  								uids+=rows[i].uid+",";
  							}
  							//在for循环中少加了一次
  							uids += rows[i].uid;
  							
  													//json
  							$.post("delUser",{uid:uids},function(data){
  								if( data == "0" ){
  									$.messager.alert('失败提示','用户删除失败!','error');
  								}else{
  									$.messager.show({title:'成功提示',msg:'用户删除成功...',timeout:2000,showType:'slide'});
  									//重新加载数据
  									datagrid.datagrid("reload");
  								}
  							});
  						}
  					});
  				}
              }
              }, '-',
              { text: '修改', iconCls: 'icon-edit', handler: function () {
                  //修改时要获取选择到的行
                  var rows = datagrid.datagrid("getSelections");
                  //如果只选择了一行则可以进行修改，否则不操作
                  if (rows.length == 1) {
                      //修改之前先关闭已经开启的编辑行，当调用endEdit该方法时会触发onAfterEdit事件
                      if (editRow != undefined) {
                          datagrid.datagrid("endEdit", editRow);
                      }
                      //当无编辑行时
                      if (editRow == undefined) {
                          //获取到当前选择行的下标
                          var index = datagrid.datagrid("getRowIndex", rows[0]);
                          //开启编辑
                          datagrid.datagrid("beginEdit", index);
                          //把当前开启编辑的行赋值给全局变量editRow
                          editRow = index;
                          //当开启了当前选择行的编辑状态之后，
                          //应该取消当前列表的所有选择行，要不然双击之后无法再选择其他行进行编辑
                          datagrid.datagrid("unselectAll");
                      }
                  }
              }
              }, '-',
              { text: '保存', iconCls: 'icon-save', handler: function () {
                  //保存时结束当前编辑的行，自动触发onAfterEdit事件如果要与后台交互可将数据通过Ajax提交后台
            	  datagrid.datagrid("endEdit",editRow);//结束编辑
  				//要获取被编辑的数据
  				var rows = datagrid.datagrid("getChanges")[0];
  				
  				//发请求到数据库更新
  				if( rows ==  undefined ){ //说明用户没有进行任何的操作
  					datagrid.datagrid("rejectChanges");
  					datagrid.datagrid("unselectAll");	//取消所有选中的行
  					editRow = undefined;
  				}else {
  					console.info(rows);
  					//alert(rows);
  					  	$.post("updateUser",rows,function (data){
  						data = $.trim(data);
  						if( data == "1" ){
  							$.messager.show({title:'提示',msg:'用户信息修改成功...',timeout:2000,showType:'slide'});
  							
  							datagrid.datagrid("rejectChanges");
  							datagrid.datagrid("unselectAll");   //取消所有的选中的行
  							editRow = undefined;
  							rows == undefined;
  							//充新加载数据
  							datagrid.datagrid("reload");
  						}else{
  							$.messager.alert('失败提示',flag+'用户信息修改失败!','error');
  						}
  					});
  				}
              }
              }, '-',
              { text: '取消编辑', iconCls: 'icon-redo', handler: function () {
                  //取消当前编辑行把当前编辑行罢undefined回滚改变的数据,取消选择的行
            	  datagrid.datagrid("rejectChanges");
            	  datagrid.datagrid("endEdit",editRow);   //取消所有的选中的行
            	  datagrid.datagrid("unselectAll");
  				editRow = undefined;
              }
              }, '-'],
             onAfterEdit: function (rowIndex, rowData, changes) {
                 //endEdit该方法触发此事件
                 console.info(rowData);
                 editRow = undefined;
             },
             onDblClickRow: function (rowIndex, rowData) {
             //双击开启编辑行
                 if (editRow != undefined) {
                     datagrid.datagrid("endEdit", editRow);
                 }
                 if (editRow == undefined) {
                     datagrid.datagrid("beginEdit", rowIndex);
                     editRow = rowIndex;
                 }
             }
         });
     });
	
	
	</script>

</body>
</html>