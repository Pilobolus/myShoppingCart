<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Products</title>
	
	<script src="js/jquery.min.js"></script>
	
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<script src="js/bootstrap.min.js"></script>
	
	<script src="js/angular.min.js"></script>
	
	<script type="text/javascript">

		var buy_click = function(inputId){
			let qinput = document.getElementById(inputId).value;

			if(qinput == ""){
				alert("quantity can not be empty");
				return false;
			}

			let num = parseFloat(qinput, 10);
			if(!Number.isInteger(num)){
				alert("quantity should be an integer");
				return false;
			}else if(num == 0){
				alert("quantity is 0");
				return false;
			}else if(num < 0){
				alert("quantity is less than 0");
				return false;
			}else if(num > 99){
				alert("you can't buy that much");
				return false;
			}else{
				return true;
			}
		}
		
	</script>
</head>
<body>

	<div class="container">
	
		<h2>Products</h2>
		
		<table class="table table-secondary table-striped table-bordered">
			<thead>
				<tr>
					<th>id</th>
					<th>name</th>
					<th>image</th>
					<th>price</th>
					<th>quantity</th>
					<th>Buy</th>
				</tr>
			</thead>
			
			<tbody ng-app="">
				
				<c:forEach var="product" items="${productList }">
					
					<tr>
					
						<td>${product.id }</td>
						<td>${product.name }</td>
						<td>
							<img alt="${product.name }" src="${pageContext.request.contextPath }/${product.image }" width="200px" height="150px"/>
						</td>
						<td>${product.price }</td>
						

						<td>
							
							<input type="number" min="1" max="99" id="quantity_${product.id }" ng-model="quantity_${product.id }" ng-init="quantity_${product.id }=1" />
							
						</td>
						<td>
							<a href="${pageContext.request.contextPath }/cart/buy/${product.id }/{{ quantity_${product.id } }}" onclick="return buy_click('quantity_${product.id }')" >Buy Now</a>
						</td>

					</tr>
					
				</c:forEach>
				
				<tr>
					<td colspan="6">
						<h4>
							<a href="${pageContext.request.contextPath }/cart/show">Shopping Cart</a>
						</h4>
					</td>
				</tr>
			</tbody>
		</table>
	
	</div>
</body>
</html>