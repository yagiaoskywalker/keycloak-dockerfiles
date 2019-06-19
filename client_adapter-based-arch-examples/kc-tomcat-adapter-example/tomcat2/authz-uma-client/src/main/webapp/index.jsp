<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
  response.setHeader("Expires", "-1");
  response.setHeader("Pragma","no-cache");
  response.setHeader("Cache-Control","no-cache");
%>

<html>

<head>
<title>Authz UMA Client</title>

<link rel="stylesheet" href="css/bootstrap.min.css" >
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<script src="https://sso.example.com/auth/js/keycloak.js"></script>
<script src="https://sso.example.com/auth/js/keycloak-authz.js"></script>
<script src="js/jquery-3.3.1.min.js" type="text/javascript" ></script>
<script src="js/jwt-decode.min.js" type="text/javascript" ></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/uma-client.js"type="text/javascript" ></script>


</head>

<%-- ログイン前に画面が見えるのを抑止 --%>
<body style="visibility:hidden">
<div class="container-fluid">

	<h3>ログインユーザー情報</h3>
	<div class="container-fluid">
	<table class="table table-striped">
		<tr>
			<th align="left">ユーザID</th>
			<td><div id="username"></div></td>
		</tr>
		<tr>
			<th align="left">メールアドレス</th>
			<td><div id="email"></div></td>
		</tr>
	</table>
	</div>

	<h3>Keycloak 操作</h3>
	<div class="container-fluid">
		<a href="javascript: location.href=keycloak.createAccountUrl().replace('account','account/resource');"  class="btn btn-primary btn-default active" role="button">マイリソース</a>
		<a href="javascript: keycloak.logout();" class="btn btn-default active" role="button">ログアウト</a>
	</div>

	<h3>UMA 操作</h3>
	<div class="container-fluid">
		<a href="createItem.jsp" class="btn btn-primary btn-default active" role="button">リソースの新規作成</a>
		<a href="#" onClick="getEntitlement()" class="btn btn-primary btn-default active" role="button">現在のアクセス権の確認</a>
	</div>

	<h3>UMA リソースアクセス</h3>
	<div class="container-fluid">
		<div class="resourcesTable" ></div>
	</div>

	<h3>詳細コンソール</h3>
	<div class="container-fluid">
		<textarea class="resultConsole" cols="100" rows="10" wrap="off"></textarea>
	</div>

	<h3>別の認可サービス</h3>
	<div class="container-fluid">
	<a href="https://authz.example.com/authz-app/"  class="btn btn-primary btn-default active" role="button">集中管理方式</a>
	</div>

</div>
</body>
</html>
