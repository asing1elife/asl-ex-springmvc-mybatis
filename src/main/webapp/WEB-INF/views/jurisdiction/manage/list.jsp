<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<div id="jurisdictionManageListPanel">
	<div class="toolbar-menu-panel">
		<button class="btn btn-bg add-jurisdiction-btn">添加</button>
		<button class="btn btn-bg remove-jurisdictions-btn">删除</button>
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
				<c:forEach var="jurisdiction" items="${jurisdictions }" varStatus="status">
					<tr data-id="${jurisdiction.id }">
						<td><input type="checkbox" class="jurisdiction-item-id" value="${jurisdiction.id }">&nbsp;${status.count }</td>
						<td>${jurisdiction.name }</td>
						<td>${jurisdiction.createTime }</td>
						<td>
							<button class="btn btn-xs edit-jurisdiction-btn">
								<i class="fa fa-pencil"></i>
							</button>
							<button class="btn btn-xs remove-jurisdiction-btn">
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
		var $jurisdictionManageListPanel = $("#jurisdictionManageListPanel");

		// 添加权限
		$jurisdictionManageListPanel.find(".add-jurisdiction-btn").on("click", function() {
			loadMainContent("/jurisdiction/content/add", function() {

			}, {
				jurisdictionId : -1
			});
		});

		// 编辑权限
		$jurisdictionManageListPanel.find(".edit-jurisdiction-btn").on("click", function() {
			var $this = $(this);
			var jurisdictionId = $this.parent().parent().data("id");

			loadMainContent("/jurisdiction/content/add", function() {

			}, {
				jurisdictionId : jurisdictionId
			});
		});

		// 删除权限
		$jurisdictionManageListPanel.find(".remove-jurisdiction-btn").on("click", function() {
			var $this = $(this);
			var jurisdictionId = $this.parent().parent().data("id");

			// 操作确认
			if (!confirm("确定删除该权限？")) {
				return false;
			}

			doAction("/jurisdiction/content/remove", {
				jurisdictionId : jurisdictionId
			}, function(data) {
				// 刷新列表
				triggerCurrentMenu();
			}, "删除成功！");
		});
		
		// 选中所有
		$jurisdictionManageListPanel.find(".check-all-btn").on("click", function () {
			// 获取所有复选框数量
			var allItemNum = $jurisdictionManageListPanel.find(".jurisdiction-item-id").length;
			
			// 获取被选中的复选框数量
			var checkedItemNum = $jurisdictionManageListPanel.find(".jurisdiction-item-id:checked").length;
			
			// 对比复选框是否全部被选中
			var isChecked = allItemNum === checkedItemNum;
			
			// 如果全部被选中，则反选，否则全选
			$jurisdictionManageListPanel.find(".jurisdiction-item-id").prop("checked", !isChecked);
		});
		
		// 删除多个权限
		$jurisdictionManageListPanel.find(".remove-jurisdictions-btn").on("click", function () {
			// 获取被选中复选框
			var checkedItems = $jurisdictionManageListPanel.find(".jurisdiction-item-id:checked");
			
			// 非空判断
			if (checkedItems.length === 0) {
				alert("请选择待删除权限！");
				return false;
			}
			
			// 操作确认
			if (!confirm("确定删除选中权限？")) {
				return false;
			}
			
			// 获取所有被选中项的id列表
			var jurisdictionIds = "";
			
			// 循环遍历被选中项
			checkedItems.each(function () {
				jurisdictionIds += $(this).val() + ",";
			});
			
			// 截取多余字符
			jurisdictionIds = jurisdictionIds.substr(0, jurisdictionIds.length - 1);
			
			doAction("/jurisdiction/content/removes", {
				jurisdictionIds: jurisdictionIds
			}, function () {
				// 刷新列表
				triggerCurrentMenu();
			}, "删除成功！");
		});
	});
</script>