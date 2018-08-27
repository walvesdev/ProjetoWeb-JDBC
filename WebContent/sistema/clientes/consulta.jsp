<jsp:include page="/sistema/template/header.jsp" />
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h3 class="tt_menu">&gt;&gt; CLIENTES - CONSULTAR UM NOVO
						CLIENTE &lt;&lt;</h3>
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
								<input type="text" class="form-control" id="inputEmail3"
									name="cpf" placeholder="CPF"
									pattern="\d{3}\.\d{3}\.\d{3}-\d{2}"
									title="Digite um CPF no formato: xxx.xxx.xxx-xx" required>
							</div>
						</div>
						<input type="hidden" name="idformulario" value="1">
						<input type="hidden" name="tipoformulario" value="12">
						<button type="submit" class="btn btn-danger">Consultar</button>

					</form>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/sistema/template/footer.jsp" />