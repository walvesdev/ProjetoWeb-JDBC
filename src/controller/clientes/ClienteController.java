package controller.clientes;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ClienteDao;
import model.Cliente;

@WebServlet("/ClienteController")
public class ClienteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Cliente cliente;
	HttpSession session;

	public ClienteController() {

	}

	@SuppressWarnings("unused")
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		session = request.getSession();

		String cpfmascara = request.getParameter("cpf");
		cpfmascara = cpfmascara.replaceAll("[.-]", "");
		Long cpf = Long.parseLong(cpfmascara);
		int idFormulario = Integer.parseInt(request.getParameter("idformulario"));

		cliente = new Cliente();
		cliente.setCpf(cpf);

		switch (idFormulario) {
		case 1:
			
			break;
		case 2:
			if ((cpf != null)) {
				try {
					Cliente cli = new Cliente();

					cli = ClienteDao.pesquisarId(cliente);
					session.setAttribute("cliente", cli);
					response.sendRedirect("sistema/clientes/consultatodos.jsp");

				} catch (Exception e) {
					session.setAttribute("mensagem", "Erro ao buscar Cliente" + e);
					response.sendRedirect("sistema/clientes/consultatodos.jsp");
				}
			} else {
				session.setAttribute("mensagem", "Todos os campos precisam ser preenchidos corretamente!");
				response.sendRedirect("sistema/clientes/consultatodos.jsp");
			}

			break;
		default:
			break;
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		session = request.getSession();

		String nome = request.getParameter("nome");
		String cpfmascara = request.getParameter("cpf");
		String email = request.getParameter("email");
		cpfmascara = cpfmascara.replaceAll("[.-]", "");
		Long cpf = Long.parseLong(cpfmascara);

		cliente = new Cliente();
		cliente.setNome(nome);
		cliente.setCpf(cpf);
		cliente.setEmail(email);

		if ((nome != null) && (cpf != null) && (email != null)) {
			try {
				ClienteDao.inserir(cliente);
				session.setAttribute("mensagem", "Cadastro  Efetuado com Sucesso!");
				response.sendRedirect("sistema/clientes/cadastro.jsp");
			} catch (Exception e) {
				session.setAttribute("mensagem", "Erro ao cadastrar Cliente" + e);
				response.sendRedirect("sistema/clientes/cadastro.jsp");
			}
		} else {
			session.setAttribute("mensagem", "Todos os campos precisam ser preenchidos corretamente!");
			response.sendRedirect("sistema/clientes/cadastro.jsp");
		}

	}

	protected void doPut(HttpServletRequest rerequestq, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
