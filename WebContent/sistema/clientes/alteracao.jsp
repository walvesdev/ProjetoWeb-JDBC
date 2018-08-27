<jsp:include page="/sistema/template/header.jsp" />
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h3 class="tt_menu">&gt;&gt; CLIENTES - ALTERAR UM CLIENTE
						&lt;&lt;</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<form class="form-horizontal" role="form" method="post" action="/ProjetoWeb/ClienteController">
						<div class="form-group">
							<div class="col-sm-2">
								<label for="inputEmail3" class="control-label">Informar
									o CPF:</label>
							</div>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="cpf"
									id="inputEmail3" placeholder="cpf"
									pattern="\d{3}\.\d{3}\.\d{3}-\d{2}"
									title="Digite um CPF no formato: xxx.xxx.xxx-xx" required>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<label for="inputNome" class="control-label">Informar o
									NOME:</label>
							</div>
							<div class="col-sm-10">
								<input type="text" name="nome" class="form-control"
									id="inputNome" placeholder="Nome" required>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-2">
								<label for="inputEMAIL" class="control-label">Informar o
									EMAIL:</label>
							</div>
							<div class="col-sm-10">
								<input type="email" name="email" class="form-control"
									id="inputEMAIL" placeholder="E-mail">
							</div>
						</div>
						<input type="hidden" name="idformulario" value="1">
						<input type="hidden" name="tipoformulario" value="14">
						<button type="submit" class="btn btn-danger">Alterar</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center corrigir">
					<a class="btn btn-default" href="javascript:window.history.go(-1)">Voltar</a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/sistema/template/footer.jsp" />