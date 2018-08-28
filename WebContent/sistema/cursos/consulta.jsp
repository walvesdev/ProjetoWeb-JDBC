${pageContext.request.contextPath}/sistema/<jsp:include page="/sistema/template/header.jsp" />
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					<h3 class="tt_menu">&gt;&gt; CURSOS - CONSULTAR UM CURSO
						&lt;&lt;</h3>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<form class="form-horizontal" role="form" method="post"
						action="/ProjetoWeb/Controlador">
						<div class="form-group">
							<div class="col-sm-2">
								<label for="inputEmail3" class="control-label">Informar
									o CURSO:</label>
							</div>
							<div class="col-sm-10">
								<input type="number" name="cdcurso" class="form-control"
									id="inputEmail3" placeholder="CURSO" required>
							</div>
						</div>
						<input type="hidden" name="idformulario" value="2"> <input
							type="hidden" name="tipoformulario" value="22">
						<button type="submit" class="btn btn-danger">Consultar</button>

					</form>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<div class="navbar navbar-fixed-bottom section-primary">
			<div class="container">
				<div class="row">
					<div class="col-sm-12 text-center" style="top: 13px; color: #fff;">©
						ABCTreinamentos - Curso de Java 8 para Web</div>
				</div>
			</div>
		</div>
<jsp:include page="/sistema/template/footer.jsp" />