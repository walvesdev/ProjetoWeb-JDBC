<%@page import="model.Cliente"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/sistema/template/header.jsp" />
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<h3 class="tt_menu">&gt;&gt; CLIENTES - CONSULTAR TODOS
					CLIENTES &lt;&lt;</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">

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
									<c:url var="editarContatoUrl" value="/Editar">
										<c:param name="id">${c.id}</c:param>
									</c:url>

									<c:url var="excluirContatoUrl" value="/Excluir">
										<c:param name="id">${c.id}</c:param>
									</c:url>

									<td align="center"><A href="${editarContatoUrl}">${c.nome}</A></td>
									<td align="center">${c.cpf}</td>
									<td align="center">${c.email}</td>
									<td align="center"><A href="${excluirContatoUrl}">Excluir</A></td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>

				</table>

			</div>
		</div>
	</div>
</div>
<jsp:include page="/sistema/template/footer.jsp" />