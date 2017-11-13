<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<div id="departmentManageListPanel">
	<div class="toolbar-menu-panel">
		<button class="btn btn-bg add-department-btn">添加</button>
		<button class="btn btn-bg">删除</button>
	</div>
	<div class="real-content-panel">
		<table class="table table-stripe table-hover">
			<thead>
				<th width="100px">序号</th>
				<th width="150px">编码</th>
				<th>名称</th>
				<th>创建时间</th>
				<th>操作</th>
			</thead>
			<tbody>
				<c:forEach var="department" items="${departments }" varStatus="status">
					<tr data-id="${department.id }">
						<td><input type="checkbox" name="ids">&nbsp;${status.count }</td>
						<td>${department.code }</td>
						<td>${department.name }</td>	
						<td>${department.createTime }</td>
						<td>
							<button class="btn btn-xs edit-department-btn">
								<i class="fa fa-pencil"></i>
							</button>
							<button class="btn btn-xs">
								<i class="fa fa-trash-o"></i>
							</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

<script>
	$(function () {
		var $departmentManageListPanel = $("#departmentManageListPanel");
		
		// 添加部门
		$departmentManageListPanel.find(".add-department-btn").on("click", function () {
			loadMainContent("/department/content/add", function () {
				
			}, {departmentId: -1});
		});
		
		// 编辑部门
		$departmentManageListPanel.find(".edit-department-btn").on("click", function () {
			var $this = $(this);
			var departmentId = $this.parent().parent().data("id");
			
			loadMainContent("/department/content/add", function () {
				
			}, {departmentId: departmentId});
		});
	});
</script>