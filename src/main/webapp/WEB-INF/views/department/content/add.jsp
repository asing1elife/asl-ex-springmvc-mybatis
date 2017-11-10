<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<div id="departmentAddPanel">
	<div class="headline">
		<h2>新增部门</h2>
	</div>
	<form class="real-content-form form" name="department" action="${ctx }/department/content/save" method="post">
		<div class="form-group">
			<label class="input-label">编码</label> 
			<input name="code" class="input-content" type="text" autofocus>
		</div>
		<div class="form-group">
			<label class="input-label">名称</label> <input name="name" class="input-content" type="text" placeholder="请输入名称">
		</div>
		<div class="form-group">
			<label class="input-label">描述</label>
			<textarea name="description" class="textarea-content" placeholder="请输入描述"></textarea>
		</div>
	</form>
	<div class="bottom-menu-panel">
		<button class="btn btn-bg save-department-btn">保存</button>
		<button class="btn btn-bg">取消</button>
	</div>
</div>

<script>
	$(function () {
		var $departmentAddPanel = $("#departmentAddPanel");
		var $departmentContentForm = $departmentAddPanel.find("form");
		
		// 初始化表单提交
		$departmentContentForm.on("submit", function (e) {
			// 阻止表单默认提交事件
			e.preventDefault();
			
			var $this = $(this);

			// jquery-form的异步提交方式
			$this.ajaxSubmit({
				beforeSubmit: function (data, $form) {
					var code = $form.find("input[name='code']");
					var name = $form.find("input[name='name']");
					var description = $form.find("textarea[name='description']");
					
					// 非空验证
					if ($.trim(code.val()) === "") {
						return showInputTip(code, "请输入编码");
					} else {
						hideInputTip(code);
					}
					
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
				success: function () {
					// 刷新页面
					triggerCurrentMenu();
				}
			});
		});	
		
		// 保存部门
		$departmentAddPanel.find(".save-department-btn").on("click", function () {
			$departmentContentForm.trigger("submit");
		});
	});
</script>