<jsp:include page="/sistema/template/header.jsp" />
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h3 class="tt_menu">&gt;&gt; CURSOS &lt;&lt;</h3>
					<div class="col-md-12  btn-group btn-group-lg btn-group-vertical">
						<a href="#" class="btn btn-default">Consultar Todos os Cursos</a>
						<a href="consulta.jsp" class="btn btn-default">Consultar um
							Curso Específico</a> <a href="cadastro.jsp" class="btn btn-default">Cadastrar
							um Novo Curso</a> <a href="alteracao.jsp" class="btn btn-default">Alterar
							um Curso</a> <a href="exclusao.jsp" class="btn btn-default">Excluir
							um Curso</a>
					</div>
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