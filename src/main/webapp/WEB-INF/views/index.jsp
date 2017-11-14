<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<title><spring:message code="title" /></title>
<link rel="stylesheet" type="text/css" href="${ctx }/css/common.css">
<link rel="stylesheet" type="text/css" href="${ctx }/css/style.css">
<link rel="stylesheet" type="text/css" href="${ctx }/plugins/font-awesome/css/font-awesome.min.css">
</head>

<body>
	<div id="topLogoPanel">
		<div class="top-logo-panel">
			<img src="${ctx }/images/logo.png">
			<div class="form select-langugae-panel">
				<div class="form-group">
					<select class="select-content select-content-btn">
						<option value="zh_CN" <c:if test="${encoding eq 'zh_CN' }">selected</c:if>>中文</option>
						<option value="en_US" <c:if test="${encoding eq 'en_US' }">selected</c:if>>English</option>
					</select> <i class="select-arrow"></i>
				</div>
			</div>
		</div>
	</div>
	<div id="bottomContentPanel">
		<div class="bottom-content-panel">
			<div class="left-menu-panel">
				<ul class="menu-item-list">
					<li class="active menu-item" data-url="/user/manage/list">
						<a href="javascript:;">
							<spring:message code="menu.user" />
						</a>
					</li>
					<li class="menu-item" data-url="#">
						<a href="javascript:;">
							<spring:message code="menu.role" />
						</a>
					</li>
					<li class="menu-item" data-url="/jurisdiction/manage/list">
						<a href="javascript:;">
							<spring:message code="menu.jurisdiction" />
						</a>
					</li>
					<li class="menu-item" data-url="/department/manage/list">
						<a href="javascript:;">
							<spring:message code="menu.department" />
						</a>
					</li>
				</ul>
			</div>
			<div class="right-content-panel"></div>
		</div>
	</div>
	<script type="text/javascript" src="${ctx }/plugins/jquery-2.1.3.min.js"></script>
	<script type="text/javascript" src="${ctx }/plugins/jquery-form/jquery.form.min.js"></script>
	<script type="text/javascript">
		var g_rootPath = "${ctx}";

		var $topLogoPanel = $("#topLogoPanel");
		var $bottomContentPanel = $("#bottomContentPanel");
		var $menuItemList = $bottomContentPanel.find(".menu-item-list");
		var $rightContentPanel = $bottomContentPanel.find(".right-content-panel");

		$(function() {
			// 左侧菜单点击
			$menuItemList.find(".menu-item").on("click", function() {
				var $this = $(this);
				var url = $this.data("url");

				$menuItemList.find(".menu-item").removeClass("active");
				$this.addClass("active");

				if (url === "#") {
					alert("后续功能开发中...");
					return false;
				}

				// 加载页面
				loadMainContent(url);
			}).first().click();

			// 切换语言
			$topLogoPanel.find(".select-content-btn").on("change", function() {
				var $this = $(this);
				var language = $this.val();

				// 刷新页面
				location.href = g_rootPath + "/index/" + language;
			});
		});

		// 加载主页面内容
		function loadMainContent(url, callbacks, params) {
			$rightContentPanel.load(g_rootPath + url, params, callbacks);
		}

		// 显示验证提示
		function showInputTip($input, value) {
			var $parent = $input.parent();

			$parent.addClass("error-group");
			$parent.find(".input-label span").remove();
			$parent.find(".input-label").append("<span>" + value + "</span>");
			$input.focus();

			return false;
		}

		// 隐藏验证提示
		function hideInputTip($input) {
			var $parent = $input.parent();

			$parent.removeClass("error-group");
			$parent.find(".input-label span").remove();
		}

		// 触发当前菜单点击
		function triggerCurrentMenu() {
			// 触发当前被激活的菜单项的点击事件
			$menuItemList.find(".menu-item.active").trigger("click");
		}

		// 通用异步请求
		function doAction(url, params, callback, message) {
			$.ajax({
				url : g_rootPath + url,
				type : "POST",
				dataType : "TEXT",
				data : params,
				success : function(data) {
					// 判断回调函数是否是一个方法
					if (typeof callback === "function") {
						// call()用于触发指定方法
						// 传入的参数将直接应用于具体方法上
						callback.call(data);
					}

					// 判断信息是否有效
					if (message === undefined || $.trim(message) === "") {
						return false;
					}

					alert(message);
				}
			})
		}
	</script>
</body>

</html>