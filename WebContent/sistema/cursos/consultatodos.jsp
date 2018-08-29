<%@page import="model.Curso"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/sistema/template/header.jsp" />
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<h3 class="tt_menu">&gt;&gt; CURSOS - CONSULTAR CURSOS</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal" role="form" method="post"
					action="${pageContext.request.contextPath}/CursosController">
					<div class="form-group">
						<div class="col-sm-2">
							<label for="inputEmail3" class="control-label">Informar o Codigo do Curso:</label>
						</div>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputEmail3"
								name="codcurso" placeholder="Cod Curso" title="Digite o Cod do curso" required>
						</div>

					</div>
					<input type="hidden" name="action" value="consulta">
					<button type="submit" class="btn btn-danger">Consultar</button>
					<br> <br> <br> <br>
					<table width="100%" border="1">
						<tr>
							<td align="center"><strong>CÓDIGO</strong></td>
							<td align="center"><strong>NOME</strong></td>
							<td align="center"><strong>SITE</strong></td>
							<td align="center"><strong>VALOR</strong></td>
						</tr>

						<c:choose>
							<c:when test="${empty(listaCursos)}">
								<td colspan="3" align="center">Nenhum Curso cadastrado</td>
							</c:when>
							<c:otherwise>
								<c:forEach var="c" items="${listaCursos}">
									<tr>
										<c:url var="editarCursoUrl"
											value="/CursosController?action=CursoAlterar">
											<c:param name="codcurso">${c.codCurso}</c:param>
											<c:param name="nome">${c.nome}</c:param>
											<c:param name="site">${c.site}</c:param>
											<c:param name="valor">${c.valor}</c:param>
										</c:url>

										<c:url var="excluirCursoUrl"
											value="/CursosController?action=CursoDeletar">
											<c:param name="codcurso">${c.codCurso}</c:param>
										</c:url>


										<td align="center">${c.codCurso}</td>
										<td align="center">${c.nome}</td>
										<td align="center">${c.site}</td>
										<td align="center">R$ ${c.valor}</td>
										<td align="center"><A href="${excluirCursoUrl}">Excluir</A></td>
										<td align="center"><A href="${editarCursoUrl}">Editar</A></td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>

					</table>
				</form>
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

<jsp:include page="/sistema/template/footer.jsp" />