<%@page import="model.Cliente"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/sistema/template/header.jsp" />
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<h3 class="tt_menu">&gt;&gt; CLIENTES - CONSULTAR CLIENTES</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<form class="form-horizontal" role="form" method="post"
					action="${pageContext.request.contextPath}/ClienteController">
					<div class="form-group">
						<div class="col-sm-2">
							<label for="inputEmail3" class="control-label">Informar o
								CPF:</label>
						</div>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputEmail3"
								name="cpf" placeholder="CPF" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}"
								title="Digite um CPF no formato: xxx.xxx.xxx-xx" required>
						</div>

					</div>
					<input type="hidden" name="action" value="consulta">
					<button type="submit" class="btn btn-danger">Consultar</button>
					<br>
					<br>
					<br>
					<br>
							<table width="100%" border="1">
			<tr>
				<td align="center"><strong>Nome</strong></td>
				<td align="center"><strong>CPF</strong></td>
				<td align="center"><strong>EMAIL</strong></td>
			</tr>

			<c:choose>
				<c:when test="${empty(listaClientes)}">
					<td colspan="3" align="center">Nenhum Cliente cadastrado</td>
				</c:when>
				<c:otherwise>
					<c:forEach var="c" items="${listaClientes}">
						<tr>
							<c:url var="editarContatoUrl" value="/ClienteController?action=clienteAlterar">
								<c:param name="cpf">${c.cpf}</c:param>
								<c:param name="nome">${c.nome}</c:param>
								<c:param name="email">${c.email}</c:param>
							</c:url>

							<c:url var="excluirContatoUrl" value="/ClienteController?action=clienteDeletar">
								<c:param name="cpf">${c.cpf}</c:param>
							</c:url>

							<td align="center">${c.nome}</td>
							<td align="center">${c.cpf}</td>
							<td align="center">${c.email}</td>
							<td align="center"><A href="${excluirContatoUrl}">Excluir</A></td>
							<td align="center"><A href="${editarContatoUrl}">Editar</A></td>
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