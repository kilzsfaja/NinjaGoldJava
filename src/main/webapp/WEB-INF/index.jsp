<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS -->
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Ninja Gold Game</title>
</head>
<body>
	<div class="container">
	<div class="row my-3">
	<div class="col-2">
		<p>Your Gold: <c:out value="${gold}"/></p>
	</div>
	<div class="col-10"></div>
	</div>
	<div class="row gap-5 my-5">
	<div class="col border rounded-2">
	<div class="p-2">
	<form action="/process" method="post">
		<h5>Farm</h5>
		<p>(earns 10-20 gold)</p>
		<input type="hidden" value="farm" name="category"/>
	    <input type="hidden" name="gold"/>
		<button class="btn btn-warning">Find Gold!</button>
	</form>
	</div>
	</div>
	<div class="col border rounded-2">
	<div class="p-2">
	<form action="/process" method="post">
		<h5>Cave</h5>
		<p>(earns 5-10 gold)</p>
		<input type="hidden" value="cave" name="category"/>
	    <input type="hidden" name="gold"/>
		<button class="btn btn-warning">Find Gold!</button>
	</form>
	</div>
	</div>
	<div class="col border rounded-2">
	<div class="p-2">
	<form action="/process" method="post">
		<h5>House</h5>
		<p>(earns 2-5 gold)</p>
		<input type="hidden" value="house" name="category"/>
	    <input type="hidden" name="gold"/>
		<button class="btn btn-warning">Find Gold!</button>
	</form>
	</div>
	</div>
	<div class="col border rounded-2">
	<div class="p-2">
	<form action="/process" method="post">
		<h5>Quest</h5>
		<p>(earns 0-50 gold)</p>
		<input type="hidden" value="quest" name="category"/>
	    <input type="hidden" name="gold"/>
		<button class="btn btn-warning">Find Gold!</button>
	</form>
	</div>
	</div>	
	</div>
	<br>
	<h5>Activities:</h5>
	<div class="border rounded-2">
	<c:forEach items="${activities}" var="activity">
	<p><c:out value="${activity}}"/></p>	
	</c:forEach>
	</div>
	</div>
</body>
</html>