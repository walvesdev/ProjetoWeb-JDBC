<jsp:include page="/sistema/template/header.jsp" />
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h3 class="tt_menu">&gt;&gt; CURSOS - EXCLUIR UM CURSO
						&lt;&lt;</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<form class="form-horizontal" role="form" method="post"
						action="/ProjetoWeb/Controlador">
						<div class="form-group">
							<div class="col-sm-3">
								<label for="inputCPF" class="control-label">Informar o
									CURSO a ser EXCLUÍDO:</label>
							</div>
							<div class="col-sm-9">
								<input type="number" name="cdcurso" class="form-control"
									id="inputCPF" required>
							</div>
						</div>
						<input type="hidden" name="idformulario" value="2">
						 <input type="hidden" name="tipoformulario" value="25">
						<button type="submit" class="btn btn-danger">Excluir</button>

					</form>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="/sistema/template/footer.jsp" />