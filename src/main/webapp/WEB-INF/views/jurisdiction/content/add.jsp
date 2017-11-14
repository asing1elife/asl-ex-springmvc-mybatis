<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<div id="jurisdictionAddPanel">
	<div class="headline">
		<h2>
			<c:if test="${jurisdiction.id == 0 }">
			新增权限
		</c:if>
			<c:if test="${jurisdiction.id != 0 }">
			更新权限
		</c:if>
		</h2>
	</div>
	<form class="real-content-form form" name="jurisdiction" action="${ctx }/jurisdiction/content/save" method="post">
		<input type="hidden" name="id" value="${jurisdiction.id }">
		<div class="form-group">
			<label class="input-label">名称</label> <input name="name" class="input-content" type="text" placeholder="请输入名称" value="${jurisdiction.name }">
		</div>
		<div class="form-group textarea-group">
			<label class="input-label">描述</label>
			<textarea name="description" class="textarea-content" placeholder="请输入描述">${jurisdiction.description }</textarea>
		</div>
	</form>
	<div class="bottom-menu-panel">
		<button class="btn btn-bg save-jurisdiction-btn">保存</button>
		<button class="btn btn-bg cancel-btn">取消</button>
	</div>
</div>

<script>
	$(function() {
		var $jurisdictionAddPanel = $("#jurisdictionAddPanel");
		var $jurisdictionContentForm = $jurisdictionAddPanel.find("form");

		// 初始化表单提交
		$jurisdictionContentForm.on("submit", function(e) {
			// 阻止表单默认提交事件
			e.preventDefault();

			var $this = $(this);

			// jquery-form的异步提交方式
			$this.ajaxSubmit({
				beforeSubmit : function(data, $form) {
					var name = $form.find("input[name='name']");
					var description = $form.find("textarea[name='description']");

					if ($.trim(name.val()) === "") {
						return showInputTip(name, "请输入名称");
					} else {
						hideInputTip(name);
					}

					if ($.trim(description.val()) === "") {
						return showInputTip(description, "请输入描述");
					} else {
						hideInputTip(description);
					}
				},
				success : function() {
					// 刷新页面
					triggerCurrentMenu();
				}
			});
		});

		// 保存权限
		$jurisdictionAddPanel.find(".save-jurisdiction-btn").on("click", function() {
			$jurisdictionContentForm.trigger("submit");
		});

		// 取消保存
		$jurisdictionAddPanel.find(".cancel-btn").on("click", function() {
			// 刷新页面
			triggerCurrentMenu();
		});
	})
</script>