<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="sistema/lib/js/jquery.min.js"></script>
<script type="text/javascript" src="sistema/lib/js/bootstrap.min.js"></script>
<link href="lib/css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="sistema/lib/css/bootstrap.css" rel="stylesheet"
	type="text/css">
<link href="sistema/lib/css/padrao.css" rel="stylesheet" type="text/css">
<title>Sistema WEB</title>
</head>
<body>
	<div class="section section-primary text-justify">
		<div class="container">
			<div class="row text-center">
				<div class="col-md-12 text-center">
					<h1 class="text-center">Sistema de Gerenciamento de Cursos</h1>
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
					<p class="msg_erro">${msg_erro_login}</p>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<div class="navbar navbar-fixed-bottom section-primary">
			<div class="container">
				<div class="row">
					<div class="col-sm-12 text-center" style="top: 13px; color: #fff;">Sistema de Gerenciamento de Cursos</div>
				</div>
			</div>
		</div>
	</footer>



</body>
</html>