<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<div id="roleAddPanel">
	<div class="headline">
		<h2>
			<c:if test="${role.id == 0 }">
			新增角色
		</c:if>
			<c:if test="${role.id != 0 }">
			更新角色
		</c:if>
		</h2>
	</div>
	<form class="real-content-form form" name="role" action="${ctx }/role/content/save" method="post">
		<input type="hidden" name="id" value="${role.id }">
		<div class="form-group">
			<label class="input-label">名称</label> 
			<input name="name" class="input-content" type="text" placeholder="请输入名称" value="${role.name }" autofocus>
		</div>
		<div class="form-group">
			<label class="input-label">权限</label>
			<div class="checkbox-content">
				<c:forEach var="jurisdiction" items="${jurisdictions }" varStatus="status">
					<label><input name="jurisdiction" type="checkbox" value="${jurisdiction.id }"> ${jurisdiction.name }</label>
				</c:forEach>
			</div>
		</div>
		<div class="form-group textarea-group">
			<label class="input-label">描述</label>
			<textarea name="description" class="textarea-content" placeholder="请输入描述">${role.description }</textarea>
		</div>
	</form>
	<div class="bottom-menu-panel">
		<button class="btn btn-bg save-role-btn">保存</button>
		<button class="btn btn-bg cancel-btn">取消</button>
	</div>
</div>

<script>
	$(function() {
		var $roleAddPanel = $("#roleAddPanel");
		var $roleContentForm = $roleAddPanel.find("form");
		
		// 初始化表单提交
		$roleContentForm.html5Validate(function () {
			// 执行表单提交
			$roleContentForm.ajaxSubmit({
				success : function() {
					// 刷新页面
					triggerCurrentMenu();
				}
			});
		}, {
			// 执行表单验证
			validate: function () {
				var name = $roleContentForm.find("input[name='name']");
				var jurisdictions = $roleContentForm.find("input[type='checkbox']:checked");
				var description = $roleContentForm.find("textarea[name='description']");

				if ($.trim(name.val()) === "") {
					return showInputTip(name, "请输入名称");
				} else {
					hideInputTip(name);
				}
				
				// 非空验证
				if (jurisdictions.length === 0) {
					return showInputTip($roleContentForm.find(".checkbox-content"), "请选择权限");
				} else {
					// 隐藏提示
					hideInputTip($roleContentForm.find(".checkbox-content"));
					
					// 循环遍历被选中的复选框
					jurisdictions.each(function (index) {
						$(this).prop("name", "jurisdictions[" + index + "].id");
					});
				}

				if ($.trim(description.val()) === "") {
					return showInputTip(description, "请输入描述");
				} else {
					hideInputTip(description);
				}
				
				// 所有的验证通过后，必须返回true，来告知该插件可以进入表单提交方法
				return true;
			}
		});

		// 保存角色
		$roleAddPanel.find(".save-role-btn").on("click", function() {
			$roleContentForm.trigger("submit");
		});

		// 取消保存
		$roleAddPanel.find(".cancel-btn").on("click", function() {
			// 刷新页面
			triggerCurrentMenu();
		});
	})
</script>