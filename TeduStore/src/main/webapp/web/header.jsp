<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
     uri="http://java.sun.com/jsp/jstl/core" %>


<header id="top" class="fixed_nav">
    <div id="logo" class="lf">
        <img class="animated jello" src="../images/header/logo.png" alt="logo"/>
    </div>
    <div id="top_input" class="lf">
        <input id="input" type="text" placeholder="請輸入您要搜索的內容" style="width: 340px"/>
        <a href="search.html" class="rt"><img id="search" src="../images/header/search.png" alt="搜索"/></a>
    </div>
    <div class="rt">
        <ul class="lf">
        	<li><a href="../user/showPassword.do">${user.username}</a></li>
            <li><a href="favorites.html" title="我的收藏"><img class="care" src="../images/header/care.png" alt=""/></a><b>|</b></li>
            <li><a href="orders.html" title="我的訂單"><img class="order" src="../images/header/order.png" alt=""/></a><b>|</b></li>
            <li><a href="cart.html" title="我的購物車"><img class="shopcar" src="../images/header/shop_car.png" alt=""/></a><b>|</b></li>
            <li><a href="help.html">幫助</a><b>|</b></li>
           <!-- 如果user==null，說明沒有登錄 -->
           <c:if test="${user==null}">
            <li><a href="../user/showLogin.do">登錄</a></li>
           </c:if>
           <!-- 如果user!=null，說明已經登錄 -->
           <c:if test="${user!=null}">
            <li><a href="../user/exit.do">退出</a></li>
           </c:if>
        </ul>
    </div>
</header>
<nav id="nav">
    <ul>
        <li><a href="index.html" class="acti">首頁</a></li>
        <li><a href="index.html#computer" >電腦辦公</a></li>
        <li><a href="index.html#stationery" >辦公文具</a></li>
    </ul>
</nav>
<!-- 我的訂單導航欄-->
<div id="nav_order">
    <ul>
        <li><a href="">首頁<span>&gt;</span>個人中心</a></li>
    </ul>
</div>