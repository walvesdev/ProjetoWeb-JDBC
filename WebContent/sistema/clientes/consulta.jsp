<%@page import="model.Cliente"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<form class="form-horizontal" role="form" method="get"
					action="/ProjetoWeb/ClienteController">
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
					<input type="hidden" name="idformulario" value="2"> 
					<button type="submit" class="btn btn-danger">Consultar</button><br><br><br><br>
					<table width="100%" border="1">
					<tr>
						<td align="center"><strong>Nome</strong></td>
						<td align="center"><strong>CPF</strong></td>
						<td align="center"><strong>EMAIL</strong></td>
					</tr>

					<c:choose>
						<c:when test="${empty(cliente)}">
							<td colspan="3" align="center">Nenhum Cliente Encontrado</td>
						</c:when>
						<c:otherwise>
							
								<tr>
									<c:url var="editarContatoUrl" value="/Editar">
										<c:param name="id">${cliente.id}</c:param>
									</c:url>

									<c:url var="excluirContatoUrl" value="/Excluir">
										<c:param name="id">${cliente.id}</c:param>
									</c:url>

									
									<td align="center">${cliente.nome}</td>
									<td align="center">${cliente.cpf}</td>
									<td align="center">${cliente.email}</td>
									<td align="center"><A href="${excluirContatoUrl}">Excluir</A></td>
								</tr>
							
						</c:otherwise>
					</c:choose>

				</table>
				</form>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/sistema/template/footer.jsp" />