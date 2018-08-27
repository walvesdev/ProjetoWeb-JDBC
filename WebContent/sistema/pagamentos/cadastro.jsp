<jsp:include page="/sistema/template/header.jsp" />
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h3 class="tt_menu">&gt;&gt; PAGAMENTOS - CADASTRAR UM NOVO
						PAGAMENTO &lt;&lt;</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<form class="form-horizontal" role="form" method="post"
						action="/ProjetoWeb/Controlador">
						<div class="form-group">
							<div class="col-sm-3">
								<label for="inputCPF" class="control-label">Informar o
									CPF:</label>
							</div>
							<div class="col-sm-9">
								<input type="text" name="cpf" class="form-control" id="inputCPF"
									placeholder="CPF" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}"
									title="Digite um CPF no formato: xxx.xxx.xxx-xx" required>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-3">
								<label for="inputCURSO" class="control-label">Informar o
									CURSO:</label>
							</div>
							<div class="col-sm-9">
								<input type="number" name="cdcurso" class="form-control"
									id="inputCURSO" placeholder="CURSO" required>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-3">
								<label for="inputDATA" class="control-label">Informar a
									DATA DE INSCRIÇÃO:</label>
							</div>
							<div class="col-sm-9">
								<input type="date" name="datainscricao" class="form-control"
									id="inputDATA" title="Preencha o campo Nome" required>
							</div>
						</div>
						<input type="hidden" name="idformulario" value="3"> <input
							type="hidden" name="tipoformulario" value="33">
						<button type="submit" class="btn btn-danger">Cadastrar</button>
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