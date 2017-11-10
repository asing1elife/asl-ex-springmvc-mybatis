<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>UMS-用户管理系统</title>
    <link rel="stylesheet" type="text/css" href="${ctx }/css/common.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/css/style.css">
    <link rel="stylesheet" type="text/css" href="${ctx }/plugins/font-awesome/css/font-awesome.min.css">
</head>

<body>
    <div id="topLogoPanel">
        <div class="top-logo-panel">
            <img src="${ctx }/images/logo.png">
        </div>
    </div>
    <div id="bottomContentPanel">
        <div class="bottom-content-panel">
            <div class="left-menu-panel">
                <ul class="menu-item-list">
                    <li class="active menu-item" data-url="/user/manage/list"><a href="javascript:;">用户管理</a></li>
                    <li class="menu-item" data-url="#"><a href="javascript:;">角色管理</a></li>
                    <li class="menu-item" data-url="#"><a href="javascript:;">权限管理</a></li>
                    <li class="menu-item" data-url="#"><a href="javascript:;">部门管理</a></li>
                </ul>
            </div>
            <div class="right-content-panel"></div>
        </div>
    </div>
    <script type="text/javascript" src="${ctx }/plugins/jquery-2.1.3.min.js"></script>
    <script type="text/javascript">
    		var g_rootPath = "${ctx}";
    		
    		var $bottomContentPanel = $("#bottomContentPanel");
    		var $menuItemList = $bottomContentPanel.find(".menu-item-list");
    		var $rightContentPanel = $bottomContentPanel.find(".right-content-panel");
    		
    		$(function () {
    			// 左侧菜单点击
    			$menuItemList.find(".menu-item").on("click", function () {
    				var $this = $(this);
    				var url = $this.data("url");
    				
    				$menuItemList.find(".menu-item").removeClass("active");
    				$this.addClass("active");
    				
    				if (url === "#") {
    					alert("后续功能开发中...");
    					return false;
    				}
    				
    				// 加载页面
    				$rightContentPanel.load(g_rootPath + url);
    			}).first().click();
    		});
    </script>
</body>

</html>