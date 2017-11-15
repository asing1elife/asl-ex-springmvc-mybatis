<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<div id="roleManageListPanel">
	<div class="toolbar-menu-panel">
		<button class="btn btn-bg add-role-btn">添加</button>
		<button class="btn btn-bg remove-roles-btn">删除</button>
	</div>
	<div class="real-content-panel">
		<table class="table table-stripe table-hover">
			<thead>
				<th class="check-all-btn cursor-pointer" width="100px">序号</th>
				<th>名称</th>
				<th>创建时间</th>
				<th>操作</th>
			</thead>
			<tbody>
				<c:forEach var="role" items="${roles }" varStatus="status">
					<tr data-id="${role.id }">
						<td><input type="checkbox" class="role-item-id" value="${role.id }">&nbsp;${status.count }</td>
						<td>${role.name }</td>
						<td>${role.createTime }</td>
						<td>
							<button class="btn btn-xs edit-role-btn">
								<i class="fa fa-pencil"></i>
							</button>
							<button class="btn btn-xs remove-role-btn">
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
		var $roleManageListPanel = $("#roleManageListPanel");

		// 添加角色
		$roleManageListPanel.find(".add-role-btn").on("click", function() {
			loadMainContent("/role/content/add", function() {

			}, {
				roleId : -1
			});
		});

		// 编辑角色
		$roleManageListPanel.find(".edit-role-btn").on("click", function() {
			var $this = $(this);
			var roleId = $this.parent().parent().data("id");

			loadMainContent("/role/content/add", function() {

			}, {
				roleId : roleId
			});
		});

		// 删除角色
		$roleManageListPanel.find(".remove-role-btn").on("click", function() {
			var $this = $(this);
			var roleId = $this.parent().parent().data("id");

			// 操作确认
			if (!confirm("确定删除该角色？")) {
				return false;
			}

			doAction("/role/content/remove", {
				roleId : roleId
			}, function(data) {
				// 刷新列表
				triggerCurrentMenu();
			}, "删除成功！");
		});
		
		// 选中所有
		$roleManageListPanel.find(".check-all-btn").on("click", function () {
			// 获取所有复选框数量
			var allItemNum = $roleManageListPanel.find(".role-item-id").length;
			
			// 获取被选中的复选框数量
			var checkedItemNum = $roleManageListPanel.find(".role-item-id:checked").length;
			
			// 对比复选框是否全部被选中
			var isChecked = allItemNum === checkedItemNum;
			
			// 如果全部被选中，则反选，否则全选
			$roleManageListPanel.find(".role-item-id").prop("checked", !isChecked);
		});
		
		// 删除多个角色
		$roleManageListPanel.find(".remove-roles-btn").on("click", function () {
			// 获取被选中复选框
			var checkedItems = $roleManageListPanel.find(".role-item-id:checked");
			
			// 非空判断
			if (checkedItems.length === 0) {
				alert("请选择待删除角色！");
				return false;
			}
			
			// 操作确认
			if (!confirm("确定删除选中角色？")) {
				return false;
			}
			
			// 获取所有被选中项的id列表
			var roleIds = "";
			
			// 循环遍历被选中项
			checkedItems.each(function () {
				roleIds += $(this).val() + ",";
			});
			
			// 截取多余字符
			roleIds = roleIds.substr(0, roleIds.length - 1);
			
			doAction("/role/content/removes", {
				roleIds: roleIds
			}, function () {
				// 刷新列表
				triggerCurrentMenu();
			}, "删除成功！");
		});
	});
</script>