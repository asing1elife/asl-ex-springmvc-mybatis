<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<div id="userManageListPanel">
	<div class="toolbar-menu-panel">
		<button class="btn btn-bg add-user-btn">添加</button>
		<button class="btn btn-bg">删除</button>
	</div>
	<div class="real-content-panel">
		<table class="table table-stripe table-hover">
			<thead>
				<th width="100px">序号</th>
				<th width="150px">编码</th>
				<th>姓名</th>
				<th>部门</th>
				<th>角色</th>
				<th>状态</th>
				<th>创建时间</th>
				<th>操作</th>
			</thead>
			<tbody>
				<c:forEach var="user" items="${users }" varStatus="status">
					<tr data-id="${user.id }">
						<td><input type="checkbox" name="user-item-id">&nbsp;${status.count }</td>
						<td>${user.code }</td>
						<td>${user.name }</td>
						<td>${user.department.name }</td>
						<td>${user.role.name }</td>
						<td>${user.statusStr }</td>
						<td>${user.createTime }</td>
						<td>
							<button class="btn btn-xs edit-user-btn">
								<i class="fa fa-pencil"></i>
							</button>
							<button class="btn btn-xs remove-user-btn">
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
	$(function() {
		var $userManageListPanel = $("#userManageListPanel");

		// 添加用户
		$userManageListPanel.find(".add-user-btn").on("click", function() {
			// 加载页面
			loadMainContent("/user/content/add", function() {

			}, {
				userId : -1
			});
		});
		
		// 更新用户
		$userManageListPanel.find(".edit-user-btn").on("click", function () {
			var $this = $(this);
			var userId = $this.parent().parent().data("id");
			
			// 加载页面
			loadMainContent("/user/content/add", function() {

			}, {
				userId : userId
			});
		});
	})
</script>