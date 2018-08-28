<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- As 3 meta tags acima *devem* vir em primeiro lugar dentro do `head`; qualquer outro conteúdo deve vir *após* essas tags -->
<title>Sistema de Gerenciamento de Cursos</title>
<link href="${pageContext.request.contextPath}/sistema/lib/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/sistema/lib/css/padrao.css" rel="stylesheet">
</head>
<body>
<header>
		<div class="section section-primary text-justify">
			<div class="container">
				<div class="row text-center">
					<div class="col-md-12 text-center">
						<h1 class="text-center">Sistema de Gerenciamento de Cursos</h1>
						<p class="text-right">Usuario: ${usuario.nome}</p>
						<p class="text-right">Permissãp: ${usuario.grupo}</p>
						<p class="text-right p1">
							<span class="label label-warning"><a
								href="/ProjetoWeb/Logout">Sair</a></span>
						</p>
					</div>
				</div>
			</div>
		</div>
		<c:choose>
			<c:when test="${usuario.grupo == 'ADMINISTRADOR'}">
				<nav class="navbar navbar-default">
					<div class="container-fluid">
						<div class="navbar-header">
							<a class="navbar-brand" href="#"></a>
							<ul class="nav navbar-nav navbar-left">
								<li><a
									href="${pageContext.request.contextPath}/sistema/index.jsp">Início</a></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">Clientes <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a
											href="${pageContext.request.contextPath}/sistema/clientes/cadastro.jsp">Cadastrar</a></li>
										<li><a href="/ProjetoWeb/ListarClientes">Consultar
												Todos</a></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/clientes/consulta.jsp">Consultar
												Cliente Específico</a></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/clientes/alteracao.jsp">Alterar
												um Cliente</a></li>
										<li role="separator" class="divider"></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/clientes/exclusao.jsp">Excluir
												um Cliente</a></li>
									</ul></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">Cursos <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a
											href="${pageContext.request.contextPath}/sistema/cursos/cadastro.jsp">Cadastrar</a></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/cursos/consulta.jsp">Consultar
												Todos</a></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/cursos/consulta.jsp">Consultar
												Curso Específico</a></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/cursos/alteracao.jsp">Alterar
												um Curso</a></li>
										<li role="separator" class="divider"></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/cursos/exclusao.jsp">Excluir
												um Curso</a></li>
									</ul></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">Pagamentos <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a
											href="${pageContext.request.contextPath}/sistema/pagamentos/cadastro.jsp">Cadastrar</a></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/pagamentos/consulta.jsp">Consultar
												Todos</a></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/pagamentos/consulta.jsp">Consultar
												Pagamento Específico</a></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/pagamentos/alteracao.jsp">Alterar
												um Pagamento</a></li>
										<li role="separator" class="divider"></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/pagamentoss/exclusao.jsp">Excluir
												um Pagamento</a></li>
									</ul></li>
									<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">Admin <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a
											href="${pageContext.request.contextPath}/sistema/pagamentos/cadastro.jsp">Cadastrar</a></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/pagamentos/consulta.jsp">Consultar
												Todos</a></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/pagamentos/consulta.jsp">Consultar
												Pagamento Específico</a></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/pagamentos/alteracao.jsp">Alterar
												um Pagamento</a></li>
										<li role="separator" class="divider"></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/pagamentoss/exclusao.jsp">Excluir
												um Pagamento</a></li>
									</ul></li>
							</ul>
						</div>
					</div>

				</nav>
			</c:when>
			<c:otherwise>
			<nav class="navbar navbar-default">
					<div class="container-fluid">
						<div class="navbar-header">
							<a class="navbar-brand" href="#"></a>
							<ul class="nav navbar-nav navbar-left">
								<li><a
									href="${pageContext.request.contextPath}/sistema/index.jsp">Início</a></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">Clientes <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a
											href="${pageContext.request.contextPath}/sistema/clientes/cadastro.jsp">Cadastrar</a></li>
										<li><a href="/ProjetoWeb/ListarClientes">Consultar
												Todos</a></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/clientes/consulta.jsp">Consultar
												Cliente Específico</a></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/clientes/alteracao.jsp">Alterar
												um Cliente</a></li>
										<li role="separator" class="divider"></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/clientes/exclusao.jsp">Excluir
												um Cliente</a></li>
									</ul></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">Cursos <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a
											href="${pageContext.request.contextPath}/sistema/cursos/cadastro.jsp">Cadastrar</a></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/cursos/consulta.jsp">Consultar
												Todos</a></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/cursos/consulta.jsp">Consultar
												Curso Específico</a></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/cursos/alteracao.jsp">Alterar
												um Curso</a></li>
										<li role="separator" class="divider"></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/cursos/exclusao.jsp">Excluir
												um Curso</a></li>
									</ul></li>
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">Pagamentos <span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a
											href="${pageContext.request.contextPath}/sistema/pagamentos/cadastro.jsp">Cadastrar</a></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/pagamentos/consulta.jsp">Consultar
												Todos</a></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/pagamentos/consulta.jsp">Consultar
												Pagamento Específico</a></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/pagamentos/alteracao.jsp">Alterar
												um Pagamento</a></li>
										<li role="separator" class="divider"></li>
										<li><a
											href="${pageContext.request.contextPath}/sistema/pagamentoss/exclusao.jsp">Excluir
												um Pagamento</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
				</nav>						
			</c:otherwise>
		</c:choose>

	</header>