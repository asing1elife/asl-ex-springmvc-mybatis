<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<div id="userManageListPanel">
	<div class="toolbar-menu-panel">
		<button class="btn btn-bg add-user-btn">添加</button>
		<button class="btn btn-bg remove-users-btn">删除</button>
	</div>
	<div class="real-content-panel">
		<table class="table table-stripe table-hover">
			<thead>
				<th class="check-all-btn cursor-pointer" width="100px">序号</th>
				<th width="150px">编码</th>
				<th>姓名</th>
				<th>用户</th>
				<th>角色</th>
				<th>状态</th>
				<th>创建时间</th>
				<th>操作</th>
			</thead>
			<tbody>
				<c:forEach var="user" items="${users }" varStatus="status">
					<tr data-id="${user.id }">
						<td><input type="checkbox" class="user-item-id" value="${user.id }">&nbsp;${status.count }</td>
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
		
		// 删除用户
		$userManageListPanel.find(".remove-user-btn").on("click", function () {
			var $this = $(this);
			var userId = $this.parent().parent().data("id");

			// 确认操作
			if (!confirm("确认删除该用户？")) {
				return false;
			}
			
			doAction("/user/content/remove", {
				userId: userId
			}, function (data) {
				// 刷新页面
				triggerCurrentMenu();
			}, "删除成功！");
		});
		// 选中所有
		$userManageListPanel.find(".check-all-btn").on("click", function () {
			// 获取所有复选框数量
			var allItemNum = $userManageListPanel.find(".user-item-id").length;
			
			// 获取被选中的复选框数量
			var checkedItemNum = $userManageListPanel.find(".user-item-id:checked").length;
			
			// 对比复选框是否全部被选中
			var isChecked = allItemNum === checkedItemNum;
			
			// 如果全部被选中，则反选，否则全选
			$userManageListPanel.find(".user-item-id").prop("checked", !isChecked);
		});
		
		// 删除多个用户
		$userManageListPanel.find(".remove-users-btn").on("click", function () {
			// 获取被选中复选框
			var checkedItems = $userManageListPanel.find(".user-item-id:checked");
			
			// 非空判断
			if (checkedItems.length === 0) {
				alert("请选择待删除用户！");
				return false;
			}
			
			// 操作确认
			if (!confirm("确定删除选中用户？")) {
				return false;
			}
			
			// 获取所有被选中项的id列表
			var userIds = "";
			
			// 循环遍历被选中项
			checkedItems.each(function () {
				userIds += $(this).val() + ",";
			});
			
			// 截取多余字符
			userIds = userIds.substr(0, userIds.length - 1);
			
			doAction("/user/content/removes", {
				userIds: userIds
			}, function () {
				// 刷新列表
				triggerCurrentMenu();
			}, "删除成功！");
		});
	})
</script>