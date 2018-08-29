<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="${pageContext.request.contextPath}/sistema/lib/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/sistema/lib/css/bootstrap.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/sistema/lib/css/padrao.css"
	rel="stylesheet" type="text/css">
<title>Sistema WEB</title>
</head>
<body>
	<div class="section section-primary text-justify">
		<div class="container">
			<div class="row text-center">
				<div class="col-md-12 text-center">
					<h1 class="text-center">Sistema de Gestão de Cursos</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<form class="form-horizontal" role="form" method="post"
						action="/ProjetoWeb/LoginController">
						<div class="form-group">
							<div class="col-sm-3">
								<label for="inputEmail3" class="control-label">Informar
									o CPF:</label>
							</div>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="cpf" id="cpf"
									placeholder="cpf" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}"
									title="Digite um CPF no formato: xxx.xxx.xxx-xx" required>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-3">
								<label for="senha" class="control-label">Informar a
									Senha:</label>
							</div>
							<div class="col-sm-4">
								<input type="password" name="senha" class="form-control"
									id="senha" placeholder="Senha" required>
							</div>
						</div>

						<button type="submit" class="btn btn-danger">Entrar</button>

					</form>
					<br>
					<c:choose>
						<c:when test="${erro != null}">
							<div class="alert alert-danger" role="alert">${erro}</div>
						</c:when>
						<c:when test="${sucesso != null}">
							<div class="alert alert-success" role="alert">${sucesso}</div>
						</c:when>
						<c:otherwise>

						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<div class="navbar navbar-fixed-bottom section-primary">
			<div class="container">
				<div class="row">
					<div class="col-sm-12 text-center" style="top: 13px; color: #fff;">Sistema
						de Gestão de Cursos</div>
				</div>
			</div>
		</div>
	</footer>


	<script type="text/javascript"
		src="${pageContext.request.contextPath}/sistema/lib/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/sistema/lib/js/bootstrap.min.js"></script>
</body>
</html>