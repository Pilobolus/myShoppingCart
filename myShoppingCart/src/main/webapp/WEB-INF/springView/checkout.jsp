<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Checkout</title>
	
	<script src="../js/jquery.min.js"></script>
	
	<link rel="stylesheet" href="../css/bootstrap.min.css" />
	<script src="../js/bootstrap.min.js"></script>
</head>
<body>
	
	<div class="container">
		<h2>Checkout</h2>
		<table class="table table-secondary">
			<tr>
				<td>
					<h5 align="center">Total : ${total }</h5>
				</td>
			</tr>
		
			<tr>
				<td>
					<h4 align="right">
						<a class="link-primary" href="${pageContext.request.contextPath }/products">Go Back Shopping</a>
					</h4>
				</td>
			</tr>
		</table>
	</div>
	
	
	
	
	
</body>
</html>