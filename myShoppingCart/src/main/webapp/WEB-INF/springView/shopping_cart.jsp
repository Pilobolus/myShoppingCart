<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Shopping Cart</title>
	<script src="../js/jquery.min.js"></script>
	
	<link rel="stylesheet" href="../css/bootstrap.min.css" />
	<script src="../js/bootstrap.min.js"></script>
	
	<script src="../js/angular.min.js"></script>
	
	<script type="text/javascript">

		var app = angular.module("myApp", []);
		app.controller("myCtrl", function($scope){
			$scope.modify_click = function(name, id){
				$scope.modifyName = name;
				$scope.modifyId = id;
			}
			$scope.modify_confirm = function(modiUrl, mQuantity){
				
				if(mQuantity == ""){
					alert("quantity can not be empty");
				}else{
					let num = parseFloat(mQuantity, 10);
					
					if(!Number.isInteger(num)){
						alert("quantity should be an integer");
					}else if(num < 0){
						alert("quantity is less than 0");
					}else if(num > 99){
						alert("you can't buy that much");
					}else{
						location.replace(modiUrl);
					}
				}

				
			}
			
			$scope.modify_url = function(murl){
				let modiUrl = murl + $scope.modifyId + "/" + $scope.modiQuantity;
				let modiQuan = document.getElementById("modifyInput").value;
				$scope.modify_confirm(modiUrl, modiQuan);
			}
		});


		var checkout_confirm = function(curl){
			location.replace(curl);
		}
	</script>
</head>
<body ng-app="myApp" ng-controller="myCtrl">

	<div class="container">
		<h2>Shopping Cart</h2>
		<table class="table table-secondary table-striped table-bordered">
			<thead>
				<tr>
					<th>id</th>
					<th>name</th>
					<th>image</th>
					<th>quantity</th>
					<th>subSum</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:set var="subSum" value="0"></c:set>
				<c:forEach var="item" items="${itemList }">
					<c:set var="subSum" value="${subSum + item.product.price * item.quantity }"></c:set>
					
					<tr>
						<td>${item.product.id }</td>
						<td>${item.product.name }</td>
						<td>
							<img alt="${item.product.name }" src="${pageContext.request.contextPath }/${item.product.image }" width="200px" height="150px" />
						</td>
						<td>${item.quantity }</td>
						<td>${item.quantity * item.product.price }</td>
						<td>
							<a href="#" data-toggle="modal" data-target="#modify_modal" class="link-primary" ng-click="modify_click('${item.product.name }', '${item.product.id }')">modify</a>
						</td>
					</tr>
				</c:forEach>
				
				<tr>
					<td colspan="6" align="right">
						<h4>Total : ${subSum }</h4>
					</td>
				</tr>
				
				
			</tbody>
			
			<tfoot class="table-borderless">
				<tr>
					<td colspan="3">
						<h4>
							<a href="../products" class="link-primary">Continue Shopping</a>
						</h4>
					</td>
					
					<td colspan="3" align="right">
						<h4>
							<a href="#" class="link-primary" data-toggle="modal" data-target="#checkout_modal">Checkout</a>
						</h4>
					</td>
				</tr>
			</tfoot>
		</table>

	</div>
	
	
	<!-- Modify Modal -->
	<div class="modal" id="modify_modal">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<div class="modal-header">
					<h2>{{modifyName}}'s Modification</h2>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<p>改成多少{{modifyName}}?</p>
					<input type="number" min="0" max="99" ng-model="modiQuantity" ng-init="modiQuantity=1" id="modifyInput" />
				</div>
				<div class="modal-footer">
					<button class="btn btn-danger" ng-click="modify_url('${pageContext.request.contextPath }/cart/modify/')">確定</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
				</div>
				
			</div>
		</div>
	</div>
	
	
	<!-- Checkout Modal -->
	<div class="modal" id="checkout_modal">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<div class="modal-header">
					<h2>Checkout Confirm</h2>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<p>確定要結帳?</p>
				</div>
				<div class="modal-footer">
					<button class="btn btn-danger" onclick="checkout_confirm('${pageContext.request.contextPath }/cart/checkout')">確定</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
				</div>
				
			</div>
		</div>
	</div>
	
</body>
</html>