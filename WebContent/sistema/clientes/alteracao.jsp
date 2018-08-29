<%@page import="model.Cliente"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/sistema/template/header.jsp" />
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12 text-center">
				<h3 class="tt_menu">&gt;&gt; CLIENTES - ALTERAR UM CLIENTE
					&lt;&lt;</h3>
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
							<input type="text" class="form-control" name="cpf"
								value="${cliente.cpf}" id="inputEmail3" placeholder="cpf"
								title="Digite um CPF no formato: xxx.xxx.xxx-xx" required>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2">
							<label for="inputNome" class="control-label">Informar o
								NOME:</label>
						</div>
						<div class="col-sm-10">
							<input type="text" name="nome" class="form-control"
								id="inputNome" placeholder="Nome" value="${cliente.nome}"
								required>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2">
							<label for="inputEMAIL" class="control-label">Informar o
								EMAIL:</label>
						</div>
						<div class="col-sm-10">
							<input type="email" name="email" class="form-control"
								value="${cliente.email}" id="inputEMAIL" placeholder="E-mail">
						</div>
					</div>
					<input type="hidden" name="action" value="alterar">
					<button type="submit" class="btn btn-danger">Alterar</button>
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