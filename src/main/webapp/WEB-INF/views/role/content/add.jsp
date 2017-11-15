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
			<label class="input-label">名称</label> <input name="name" class="input-content" type="text" placeholder="请输入名称" value="${role.name }" autofocus>
		</div>
		<div class="form-group">
			<label class="input-label">权限</label>
			<div class="checkbox-content">
				<c:forEach var="jurisdiction" items="${jurisdictions }">
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
		$roleContentForm.html5Validate(function() {
			// 对表单进行提交
			// jquery-form的异步提交方式
			$roleContentForm.ajaxSubmit({
				success : function() {
					// 刷新页面
					triggerCurrentMenu();
				}
			});
		}, {
			// 对表单数据做有效性验证
			validate : function() {
				var name = $roleContentForm.find("input[name='name']");
				var jurisdictions = $roleContentForm.find("input[type='checkbox']:checked");
				var description = $roleContentForm.find("textarea[name='description']");

				if ($.trim(name.val()) === "") {
					return showInputTip(name, "请输入名称");
				} else {
					hideInputTip(name);
				}

				if (jurisdictions.length === 0) {
					return showInputTip($roleContentForm.find(".checkbox-content"), "请选择权限");
				} else {
					// 验证通过，隐藏提示
					hideInputTip($roleContentForm.find(".checkbox-content"));

					// 循环遍历被选中的复选框，并填充有效的name属性
					jurisdictions.each(function(index) {
						$(this).prop("name", "jurisdictions[" + index + "].id");
					});
				}

				if ($.trim(description.val()) === "") {
					return showInputTip(description, "请输入描述");
				} else {
					hideInputTip(description);
				}
				
				// 当表单数据验证全部通过之后，需要返回true，告知插件验证通过，可以进行表单提交
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