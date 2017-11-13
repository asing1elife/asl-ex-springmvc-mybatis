<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<div id="departmentManageListPanel">
	<div class="toolbar-menu-panel">
		<button class="btn btn-bg add-department-btn">添加</button>
		<button class="btn btn-bg remove-departments-btn">删除</button>
	</div>
	<div class="real-content-panel">
		<table class="table table-stripe table-hover">
			<thead>
				<th class="check-all-btn cursor-pointer" width="100px">序号</th>
				<th width="150px">编码</th>
				<th>名称</th>
				<th>创建时间</th>
				<th>操作</th>
			</thead>
			<tbody>
				<c:forEach var="department" items="${departments }" varStatus="status">
					<tr data-id="${department.id }">
						<td><input type="checkbox" class="department-item-id" value="${department.id }">&nbsp;${status.count }</td>
						<td>${department.code }</td>
						<td>${department.name }</td>
						<td>${department.createTime }</td>
						<td>
							<button class="btn btn-xs edit-department-btn">
								<i class="fa fa-pencil"></i>
							</button>
							<button class="btn btn-xs remove-department-btn">
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
		var $departmentManageListPanel = $("#departmentManageListPanel");

		// 添加部门
		$departmentManageListPanel.find(".add-department-btn").on("click", function() {
			loadMainContent("/department/content/add", function() {

			}, {
				departmentId : -1
			});
		});

		// 编辑部门
		$departmentManageListPanel.find(".edit-department-btn").on("click", function() {
			var $this = $(this);
			var departmentId = $this.parent().parent().data("id");

			loadMainContent("/department/content/add", function() {

			}, {
				departmentId : departmentId
			});
		});

		// 删除部门
		$departmentManageListPanel.find(".remove-department-btn").on("click", function() {
			var $this = $(this);
			var departmentId = $this.parent().parent().data("id");

			// 操作确认
			if (!confirm("确定删除该部门？")) {
				return false;
			}

			doAction("/department/content/remove", {
				departmentId : departmentId
			}, function(data) {
				// 刷新列表
				triggerCurrentMenu();
			}, "删除成功！");
		});
		
		// 选中所有
		$departmentManageListPanel.find(".check-all-btn").on("click", function () {
			// 获取所有复选框数量
			var allItemNum = $departmentManageListPanel.find(".department-item-id").length;
			
			// 获取被选中的复选框数量
			var checkedItemNum = $departmentManageListPanel.find(".department-item-id:checked").length;
			
			// 对比复选框是否全部被选中
			var isChecked = allItemNum === checkedItemNum;
			
			// 如果全部被选中，则反选，否则全选
			$departmentManageListPanel.find(".department-item-id").prop("checked", !isChecked);
		});
		
		// 删除多个部门
		$departmentManageListPanel.find(".remove-departments-btn").on("click", function () {
			// 获取所有复选框
			var allItems = $departmentManageListPanel.find(".department-item-id");
			
			// 非空判断
			if (allItems.length === 0) {
				alert("请选择待删除部门！");
				return false;
			}
			
			// 操作确认
			if (!confirm("确定删除选中部门？")) {
				return false;
			}
			
			// 获取所有被选中项的id列表
			var departmentIds = "";
			
			// 循环遍历被选中项
			allItems.each(function () {
				departmentIds += $(this).val() + ",";
			});
			
			// 截取多余字符
			departmentIds = departmentIds.substr(0, departmentIds.length - 1);
			
			doAction("/department/content/removes", {
				departmentIds: departmentIds
			}, function () {
				// 刷新列表
				triggerCurrentMenu();
			}, "删除成功！");
		});
	});
</script>