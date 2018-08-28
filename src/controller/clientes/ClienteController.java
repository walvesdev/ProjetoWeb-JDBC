package controller.clientes;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

	Cliente cliente = null;
	HttpSession session = null;
	String nome = null;
	String email = null;
	String cpfmascara = null;
	Long cpf = null;
	String action = null;

	public ClienteController() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		action = request.getParameter("action");

		switch (action) {

		// =============================================================== DELETE ===============================================================================

		case "delete":

			cpfmascara = request.getParameter("cpf");
			cpfmascara = cpfmascara.replaceAll("[.-]", "");
			cpf = Long.parseLong(cpfmascara);

			cliente = new Cliente();
			cliente.setCpf(cpf);

			if ((cpf != null)) {
				try {

					if (ClienteDao.pesquisarId(cliente) != null) {
						ClienteDao.excluir(cliente);
						session.setAttribute("mensagem", "Cliente excluido com sucesso!");
						response.sendRedirect("sistema/clientes/exclusao.jsp");
					} else {
						session.setAttribute("mensagem", "Erro ao cadastrar Cliente, CPF não encontrado!");
						response.sendRedirect("sistema/clientes/exclusao.jsp");
					}

				} catch (SQLException e) {
					System.out.println(e);
				}
			} else {
				session.setAttribute("mensagem", "CPF precisa ser preenchido corretamente!");
				response.sendRedirect("sistema/clientes/exclusao.jsp");

			}

			break;
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		action = request.getParameter("action");

//==============================================================================================================================================		

		switch (action) {

//=============================================================  INSERIR   =================================================================================			

		case "inserir":

			session = request.getSession();
			nome = request.getParameter("nome");
			email = request.getParameter("email");

			cpfmascara = request.getParameter("cpf");
			cpfmascara = cpfmascara.replaceAll("[.-]", "");
			cpf = Long.parseLong(cpfmascara);

			cliente = new Cliente();
			cliente.setNome(nome);
			cliente.setCpf(cpf);
			cliente.setEmail(email);

			if ((nome != null) && (cpf != null) && (email != null)) {
				try {

					if (ClienteDao.pesquisarId(cliente) == null) {
						ClienteDao.inserir(cliente);
						session.setAttribute("mensagem", "Cadastro  Efetuado com Sucesso!");
						response.sendRedirect("sistema/clientes/cadastro.jsp");
					} else {
						session.setAttribute("mensagem", "Erro ao cadastrar Cliente, CPF Já cadastrado!");
						response.sendRedirect("sistema/clientes/cadastro.jsp");
					}
				} catch (Exception e) {
					System.out.println(e);
				}

			} else {
				session.setAttribute("mensagem", "Todos os campos precisam ser preenchidos corretamente!");
				response.sendRedirect("sistema/clientes/cadastro.jsp");
			}

			break;

//===============================================================   PESQUISA   ===============================================================================			

		case "consulta":

			cpfmascara = request.getParameter("cpf");
			cpfmascara = cpfmascara.replaceAll("[.-]", "");
			cpf = Long.parseLong(cpfmascara);

			cliente = new Cliente();
			cliente.setCpf(cpf);

			if ((cpf != null)) {
				try {
					Cliente cli = new Cliente();

					cli = ClienteDao.pesquisarId(cliente);
					request.setAttribute("cliente", cli);
					request.getRequestDispatcher("/sistema/clientes/consulta.jsp").forward(request, response);

				} catch (Exception e) {
					request.setAttribute("mensagem", "Erro ao buscar Cliente" + e);
					request.getRequestDispatcher("/sistema/clientes/consulta.jsp").forward(request, response);

				}
			} else {
				request.setAttribute("mensagem", "Todos os campos precisam ser preenchidos corretamente!");
				request.getRequestDispatcher("/sistema/clientes/consulta.jsp").forward(request, response);

			}

			break;

//===============================================================  DELETE  ===============================================================================			

		case "delete":

			cpfmascara = request.getParameter("cpf");
			cpfmascara = cpfmascara.replaceAll("[.-]", "");
			cpf = Long.parseLong(cpfmascara);

			cliente = new Cliente();
			cliente.setCpf(cpf);

			if ((cpf != null)) {
				try {

					if (ClienteDao.pesquisarId(cliente) != null) {
						ClienteDao.excluir(cliente);
						session.setAttribute("mensagem", "Cliente excluido com sucesso!");
						response.sendRedirect("sistema/clientes/exclusao.jsp");
					} else {
						session.setAttribute("mensagem", "Erro ao cadastrar Cliente, CPF não encontrado!");
						response.sendRedirect("sistema/clientes/exclusao.jsp");
					}

				} catch (SQLException e) {
					System.out.println(e);
				}
			} else {
				session.setAttribute("mensagem", "CPF precisa ser preenchido corretamente!");
				response.sendRedirect("sistema/clientes/exclusao.jsp");

			}

			break;

//===========================================================  CONSULTA TODOS  ==================================================================================			

		case "consultartodos":

			try {

				List<Cliente> listaClientes = new ArrayList<>();

				listaClientes = ClienteDao.pesquisarTodos();
				request.setAttribute("listaClientes", listaClientes);
				request.getRequestDispatcher("/sistema/clientes/consultatodos.jsp").forward(request, response);

			} catch (SQLException e) {

				System.out.println(e);
			}

			break;

//===========================================================  ++++++++++++++++ ==================================================================================

		default:
			break;
		}

	}
}
