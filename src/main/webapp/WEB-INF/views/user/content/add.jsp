<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>

<div id="userAddPanel">
	<div class="headline">
		<h2>
			<c:if test="${user.id == 0 }">
			新增用户
			</c:if>
			<c:if test="${user.id != 0 }">
			更新用户
			</c:if>
		</h2>
	</div>
	<form class="real-content-form form" name="user" action="${ctx }/user/content/save" method="post">
		<input type="hidden" name="id" value="${user.id }">
		<div class="form-group">
			<label class="input-label">编码</label> <input name="code" class="input-content" type="text" placeholder="自动生成" value="${user.code }" disabled>
		</div>
		<div class="form-group">
			<label class="input-label">姓名</label> <input name="name" class="input-content" type="text" placeholder="请输入名称" value="${user.name }" autofocus>
		</div>
		<div class="form-group">
			<label class="input-label">密码</label> <input name="password" class="input-content" type="password" placeholder="请输入密码" value="${user.password }">
		</div>
		<div class="form-group">
			<label class="input-label">手机</label> <input name="mobile" class="input-content" type="text" placeholder="请输入手机" value="${user.mobile }">
		</div>
		<div class="form-group">
			<label class="input-label">部门</label> 
			<select class="select-content" name="department.id">
				<c:forEach var="department" items="${departments }">
					<option value="${department.id }" <c:if test="${department.id == user.department.id }">selected</c:if>>${department.code } - ${department.name }</option>
				</c:forEach>
			</select> <i class="select-arrow"></i>
		</div>
		<div class="form-group">
			<label class="input-label">角色</label> 
			<select class="select-content" name="role.id">
				<c:forEach var="role" items="${roles }">
					<option value="${role.id }" <c:if test="${role.id == user.role.id }">selected</c:if>>${role.name }</option>
				</c:forEach>
			</select> <i class="select-arrow"></i>
		</div>
		<div class="form-group">
			<label class="input-label">性别</label> 
			<div class="radio-content">
				<label><input type="radio" name="gender" value="male" checked> 男</label>
				<label><input type="radio" name="gender" value="female" <c:if test="${user.gender == 'female' }">checked</c:if>> 女</label>
			</div>
		</div>
		<div class="form-group">
			<label class="input-label">状态</label> 
			<div class="radio-content">
				<label><input type="radio" name="status" value="true" checked> 启用</label>
				<label><input type="radio" name="status" value="false" <c:if test="${!user.status }">checked</c:if>> 禁用</label>
			</div>
		</div>
	</form>
	<div class="bottom-menu-panel">
		<button class="btn btn-bg save-user-btn">保存</button>
		<button class="btn btn-bg cancel-btn">取消</button>
	</div>
</div>

<script>
	$(function() {
		var $userAddPanel = $("#userAddPanel");
		var $userContentForm = $userAddPanel.find("form");

		// 初始化表单提交
		$userContentForm.on("submit", function(e) {
			// 阻止表单默认提交事件
			e.preventDefault();

			var $this = $(this);

			// jquery-form的异步提交方式
			$this.ajaxSubmit({
				beforeSubmit : function(data, $form) {
					var name = $form.find("input[name='name']");

					if ($.trim(name.val()) === "") {
						return showInputTip(name, "请输入名称");
					} else {
						hideInputTip(name);
					}
				},
				success : function() {
					// 刷新页面
					triggerCurrentMenu();
				}
			});
		});

		// 保存用户
		$userAddPanel.find(".save-user-btn").on("click", function() {
			$userContentForm.trigger("submit");
		});

		// 取消保存
		$userAddPanel.find(".cancel-btn").on("click", function() {
			// 刷新页面
			triggerCurrentMenu();
		});
	})
</script>