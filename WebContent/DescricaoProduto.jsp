<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<title>T-Shirt Games - Detalhes do Produto</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="resources/css/bootstrap/bootstrap.css">
	<link rel="stylesheet" href="resources/css/style.Descricao.css">
	
	<script type="text/javascript" src="resources/js/jquery/jquery.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap/popper.min.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="resources/js/script.DescricaoProduto.js"></script>
	<script type="text/javascript" src="resources/js/script.ExibirModal.js"></script>
	<script type="text/javascript" src="resources/js/bootstrap/bootstrap.min.js"></script>
</head>
<body>

 <c:import url="resources/template/nav.jsp"/>
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-lg-5 d-block mx-auto mt-5 ">
				<div class="card-img">
					<img class="w-100" id="lupa" src="resources/img/img-produtos/${imagem}">
				</div>
			</div>
			<form class="col-md-12 col-lg-7 d-block mx-auto mt-5">
				<div>
					<h1>
						<c:out value="${produto}"></c:out>
						<input type="hidden" name="id" value="${id}">
						<input type="hidden" name="referencia" value="${referencia}">
					</h1>
					<div class="row border mb-4">
						<div class="d-block mx-auto text-center col-md-6 pt-4 pb-3">
							<p class="text-center">Tamanho</p>
							<div class="custom-control center custom-radio custom-control-inline">
								<c:forEach var="lista" items="${listatamanho}">
									<label>
										<input type="radio" name="tamanho" class="custom-control-input d-block" value="${lista.tamanho}">
										<span class="btn btn-outline-tshirt mr-1">${lista.tamanho}</span>
									</label>
								</c:forEach>
							</div>
						</div>

						<div class="col-md-5 py-4 center">	
							<p class="text-center">Quantidade</p>
							<input type="number" class="form-control col-sm-8 col-md-10 col-lg-10 d-block mx-auto" id="quantidade" name="quantidade" value="${quantidade}" min="1" max="${quantidade_bd}" required>
						</div>
						<div class="col-md-6 pt-4 pb-3">
							<h1 class="text-center font-weight-bold">
								<c:out value="${valorf1}"></c:out>
							</h1>
							<p class="text-center font-weight-light">Parcelado em até ${parcela1}x de ${valorparcelado1} sem juros</p>
				
							<div class="custom-control custom-checkbox">
								<table class="table text-center mt-3 table-hover">
									<tbody>
										<tr>	
											<td><input type="radio" class="custom-control-input" name="fornecedor" value="1"></td>					
											<td>Loja</td>
											<td><strong><c:out value="${valorf1}"></c:out></strong><br>em até ${parcela1}x de ${valorparcelado1}</td>																			
										</tr>
																			
										<tr>
											<td><input type="radio" class="custom-control-input" name="fornecedor" value="2"></td>
											<td>Loja</td>
											<td><strong><c:out value="${valorf2}"></c:out></strong><br> em até ${parcela2}x de ${valorparcelado2}</td>
										</tr>
										
										<tr>
										 	<td><input type="radio" class="custom-control-input" name="fornecedor" value="3"></td>
											<td>Loja</td>
											<td><strong><c:out value="${valorf3}"></c:out></strong><br> em até ${parcela3}x de ${valorparcelado3}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<p class="text-center font-weight-light" id="parcela"></p>
						
						<div class="col-md-6 pt-4 pb-3">
							<input type="hidden" id="cor" name="cor" value="${cor}">
							<button class="btn btn-success d-block mb-1 mx-auto" formaction="Descricao" formmethod="post" type="submit">Comprar</button>
							<button class="btn btn-tshirt d-block mb-1 mx-auto" formaction="addCarrinho" formmethod="post" type="submit">adicionar ao carrinho</button>
						</div>
					</div>
					<div class="row border my-4 p-4">
						<div class="pl-3">
							<p>Digite aqui para saber o valor do frete e prazo</p>
						</div>
						<div class="form-inline col-md-12">
							<input class="form-control col-sm-9 col-md-9 col-lg-6" name="cep" id="cep" type="text">
							<button type="button" class="btn btn-tshirt col-sm-3 col-md-3 col-lg-2" data-loading-text="Carregando..." onclick="calculafrete()">Calcular</button>
						</div>
						<table class="table text-center mt-3">
							<thead class="thead-dark">
								<tr>
									<th scope="col"></th>
									<th scope="col">Serviço</th>
									<th scope="col">Valor</th>
									<th scope="col">Prazo</th>
								</tr>
							</thead>
							<tbody id="resultfrete">
							</tbody>
						</table>
					</div>
				</div>
			</form>
		</div>
		<div class="mt-5 mb-3">
			<h3>Quem viu esta camiseta, também viu estas outras iradas, saca só</h3>
		</div>

		<!-- CARROSEL -->
		<div class="container">
			<div class="row">
				<c:forEach var="produto" items="${lista_produto}">
					<div class="col-md-6 col-lg-3 mt-3">
						<div class="card">
							<div class="card-body">
								<img class="card-img" src="resources/img/img-produtos/${produto.imagem}">
								<h4 class="card-title pt-3 text-center" style="font-size: 1.2rem;">${produto.produto}</h4>
								<p class="card-text text-center font-italic">R$ ${produto.valor_venda}</p>
								<form action="Descricao" method="get" class="center">
									<button type="submit" class="btn btn-success btn-lg btn_sh btn_tam" name="id" value="${produto.idproduto}">Comprar</button>
									<button type="button" class=" btn btn-outline-danger btn-lg btn_cor btn_sh border-0">♥</button>
								</form>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<div class="my-5">
			<table class="table table-bordered">
				<thead>
					<tr>
						<td colspan="2"><h4 class="center text-tshirt">Detalhes
								do Produto</h4></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="2">
							<h5>Descrição:</h5>
							<p>${descricao}</p>
						</td>
					</tr>
					<tr>
						<th class="w-25 text-tshirt">Modelo:</th>
						<td>${modelo}</td>
					</tr>
					<tr>
						<th class="w-25 text-tshirt">Cor:</th>
						<td>${cor}</td>
					</tr>
					<tr>
						<th class="w-25 text-tshirt">Genero:</th>
						<td>${genero}</td>
					</tr>
					<tr>
						<th class="w-25 text-tshirt">Categoria:</th>
						<td>${categoria}</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<c:import url="resources/template/footer.jsp" />
	<c:import url="resources/template/modal.Mensagem.jsp"/>
</body>
</html>