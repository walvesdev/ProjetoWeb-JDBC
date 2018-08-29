<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/sistema/template/header.jsp" />
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<h3 class="tt_menu">&gt;&gt; CURSOS - EXCLUIR UM CURSO &lt;&lt;</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal" role="form" method="post"
					action="${pageContext.request.contextPath}/CursosController">
					<div class="form-group">
						<div class="col-sm-3">
							<label for="inputCPF" class="control-label">Informar o
								CURSO a ser EXCLUÍDO:</label>
						</div>
						<div class="col-sm-9">
							<input type="number" name="codcurso" class="form-control"
								id="inputCPF" value="${curso.codCurso}" required>
						</div>
					</div>
					<input type="hidden" name="action" value="delete">
					<button type="submit" class="btn btn-danger">Excluir</button>

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
				<br>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/sistema/template/footer.jsp" />