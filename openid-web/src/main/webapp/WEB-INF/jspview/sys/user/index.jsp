<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
</head>
<body >
    <div class="wrapper wrapper-content animated fadeInRight">
       <div class="row">
            <div class="col-sm-12">
                <div class="ibox ">
                    <div class="ibox-title">
                        <h5>用户管理 </h5>
                        <div class="ibox-tools">
                        </div>
                    </div>
                    
                    <div class="ibox-content">
                        <form role="form" class="form-inline">
                            <div class="form-group">
                                <label for="exampleInputEmail2" class="sr-only">姓名</label>
                                <input type="text" placeholder="姓名" id="_name" class="form-control">
                            </div>
                            <button class="btn btn-primary" type="button" id='_search'>查询</button>
                            <button class="btn btn-primary" type="button" id='_new'>新建</button>
                        </form>
                    </div>
                    
                    <div class="ibox-content ">
                         <table ID='dt_table_view' class="table table-striped table-bordered table-hover ">
                            <thead>
                                <tr>
									<th>id</th>
									<th>手机号码</th>
									<th>真实姓名</th>
									<th>性别</th>
									<th>备用电话</th>
									<th>电子邮件</th>
									<th>备注</th>
									<th>操作</th>
								</tr>
                            </thead>
                       		 <tbody>
                            </tbody>
                          </table>
                    </div>
                    
                </div>
            </div>
        </div>
   </div>
   
   <div id='_form' style="display: none;">
       <div class="ibox-content">
 		 <div class="row">
                            <div class="col-sm-12 b-r">
		                           <form class="form-horizontal" action="" method="get">
		                           <input name='id' type="hidden"/>
		                           	<table class='table table-bordered'>
		                           		<thead>
		                           		<tr style="text-align: center;" ><td colspan="6" ><h3>员工信息<h3></h3></td></tr>
		                           		</thead>
		                           		<tbody>
		                           			<tr>
		                           				<td>姓名</td>
		                           				<td> <input name='chinesename' type="text" class="form-control"></td>
		                           			</tr>
		                           			
		                           			<tr>
		                           			<td>性别</td>
		                           				<td>
												  <label class='checkbox-inline'>
												    <input type="radio" name="sex"  value="男" checked>
												    	男
												   </label>
												   <label class='checkbox-inline'>
												    <input type="radio" name="sex"  value="女">
												 	   女
												  </label>
		                           				</td>
		                           			</tr>
		                           			
		                           				
		                           			<tr>
		                           				<td>手机号码</td>
		                           				<td> <input name='username' type="text" class="form-control"></td>
		                           			</tr>
		                           			
		                           			<tr>
		                           				<td>备用号码</td>
		                           				<td> <input name='tel' type="text" class="form-control"></td>
		                           			</tr>
		                           			
		                           			
		                           			<tr>
		                           				<td>email</td>
		                           				<td> <input name='email'  type="text" class="form-control"></td>
		                           			</tr>
		                           			
											<tr>
												<td>责任范围</td>
		                           				<td> <textarea name='remark' rows="4" cols="" style="width: 80%"></textarea></td>
		                           			</tr>
		                           			
		                           			
		                           			<tr>
		                           				<td>角色</td>
		                           				<td> 
		                           				<c:forEach items="${roles }" var="bean">
		                           				  <label class='checkbox-inline'>
														<input type="checkbox" name="role" value="${bean.id }"> ${bean.name }
												</label>
		                           				</c:forEach>
												</td>
		                           			</tr>
		                           			
		                           		
		                           			<tr>
		                           				<td>提示</td>
		                           				<td > 
		                           					 <h4>提示</h4>
		                               					 <ol>
									    					<li>初始密码为123456，登记完成可以修改</li>
									    				</ol>
		                           				</td>
		                           			</tr>
		                           			<tr>
		                           				<td colspan="6"> 
		                           					 <div class="col-sm-4 col-sm-offset-2">
		                                  			  		<button class="btn btn-primary" type="button" onclick="submit_form()">提交</button>
		                                   				    <button class="btn btn-white" type="submit">取消</button>
		                               				 </div>
		                           				</td>
		                           			</tr>
		                           		</tbody>
		                           	</table>
		                           	</form>
                            </div>
                        </div>
                        </div>
   </div>
   <script>
    var table=null;
    
    function submit_form(){
    	$.ajax({
    		   type: "POST",
    		   url:  $.common.getContextPath() + "/sys/user/save",
    		   data: $("form").serialize(),
    		   success: function(msg){
    		     if(msg.code==1){
    		    	 toastr.success('操作成功');
    		    	 table.draw();
    		     }
    		     layer.closeAll() ;
    		   }
    		});
     }
    
    function fun_delete(id){
    	
    	layer.confirm('确定删除当前员工？', {
    		  btn: ['确定','取消'] //按钮
    		}, function(){
    			$.ajax({
    		 		   url:  $.common.getContextPath() + "/sys/user/delete?id="+id,
    		 		   success: function(msg){
    		 		     if(msg.code==1){
    		 		    	 toastr.success('操作成功');
    		 		    	 table.draw();
    		 		     }
    		 		     layer.closeAll() ;
    		 		   }
    		 	});
    		}, function(){
    			 layer.closeAll() ;
    		});
    	
    	
     }
    
    function fun_update(id){
    	$.ajax({
 		   url:  $.common.getContextPath() + "/sys/user/get?id="+id,
 		   success: function(msg){
 		     if(msg.code==1){
 		    	$("input[name='id']").val(msg.datas.id);
 		    	$("input[name='chinesename']").val(msg.datas.chinesename);
 		    	$("radio[name='sex']").val(msg.datas.sex);
 		   		$("input[name='username']").val(msg.datas.username);
 				$("input[name='tel']").val(msg.datas.tel);
 				$("input[name='email']").val(msg.datas.email);
 				$("textarea[name='remark']").val(msg.datas.remark);
 				$("input:checkbox[name='role']").prop('checked',false); 
 				for(var i=0;i<msg.datas.roles.length;i++){
 					$("input:checkbox[value='"+msg.datas.roles[i].id+"']").prop('checked',true); 
 				}
 				
 		    	layer.open({
      			  type: 1,
      			  skin: 'layui-layer-rim', 
      			  content: $("#_form"),
      			  area: "800px"
      			});
 		     }
 		   }
 		});
     }
    
    $(document).ready(function(){
        	$("#_new").click(function(){
        		$("input[name='id']").val("");
 		    	$("input[name='chinesename']").val("");
 		    	$("radio[name='sex']").val("");
 		   		$("input[name='username']").val("");
 				$("input[name='tel']").val("");
 				$("input[name='email']").val("");
 				$("textarea[name='remark']").val("");
        		layer.open({
        			  type: 1,
        			  skin: 'layui-layer-rim', //加上边框
        			  content: $("#_form"),
        			  area: "800px"
        			});
        	});
        	table=$('#dt_table_view').DataTable( {
        		"dom": "rt<'row'<'col-sm-5'i><'col-sm-7'p>>",
	            "ajax": {
	                "url":  $.common.getContextPath() + "/sys/user/list",
	                "type": "POST",
	                "dataSrc": "datas"
	              },
				"columns" : [{
					"data" : "id"
				}, {
					"data" : "username"
				},{
					"data" : "chinesename",
				},{
					"data" : "sex",
				},{
					"data" : "tel",
				},{
					"data" : "email",
				},{
					"data" : "remark",
				},{
					"data" : "id",
				}] ,
				 "columnDefs": [
				                {
				                    "render": function ( data, type, row ) {
				                        return "<a tager='_blank' href='javascript:void(0)' onclick='fun_delete("+data+")'>删除 </a>"+
				                        "<a tager='_blank' href='javascript:void(0)' onclick='fun_update("+data+")'>编辑 </a>";
				                    },
				                    "targets":7
				                }
				               
				            ],
        		"initComplete": function () {
        			var api = this.api();
        			$("#_search").on("click", function(){
            		 	api.draw();
        			} );
        		} 
        	 } ).on('preXhr.dt', function ( e, settings, data ) {
		        	data.value = $("#_name").val();
		        	data.columnname = 'chinesename';
		        	return true;
		     } ).on('xhr.dt', function ( e, settings, json, xhr ) {
		    		 $(".dataTables_processing").hide();	
		     } )
        });
    </script>
</body>

</html>
