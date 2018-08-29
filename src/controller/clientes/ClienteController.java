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

//===========================================================  CONSULTA TODOS  ==================================================================================			

		case "consultartodos":

			try {

				List<Cliente> listaClientes = new ArrayList<>();

				listaClientes = ClienteDao.pesquisarTodos();
				request.setAttribute("listaClientes", listaClientes);
				request.getRequestDispatcher("/sistema/clientes/consultatodos.jsp").forward(request, response);

			} catch (SQLException e) {

				e.printStackTrace();
			}

			break;

//=========================================================================================================================================================			

		case "clienteAlterar":

			nome = request.getParameter("nome");
			email = request.getParameter("email");
			cpf = Long.parseLong(request.getParameter("cpf"));

			cliente = new Cliente();
			cliente.setNome(nome);
			cliente.setCpf(cpf);
			cliente.setEmail(email);

			request.setAttribute("cliente", cliente);
			request.getRequestDispatcher("/sistema/clientes/alteracao.jsp").forward(request, response);

			break;

//=========================================================================================================================================================			

		case "clienteDeletar":

			nome = request.getParameter("nome");
			email = request.getParameter("email");
			cpf = Long.parseLong(request.getParameter("cpf"));

			cliente = new Cliente();
			cliente.setNome(nome);
			cliente.setCpf(cpf);
			cliente.setEmail(email);

			request.setAttribute("cliente", cliente);
			request.getRequestDispatcher("/sistema/clientes/exclusao.jsp").forward(request, response);

			break;
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//=========================================================================================================================================================			

		nome = request.getParameter("nome");
		email = request.getParameter("email");
		cpfmascara = request.getParameter("cpf");
		cpfmascara = cpfmascara.replaceAll("[.-]", "");
		cpf = Long.parseLong(cpfmascara);
		session = request.getSession();
		action = request.getParameter("action");
		cliente = new Cliente();

//=========================================================================================================================================================			

		switch (action) {

//=============================================================  INSERIR   =================================================================================			

		case "inserir":

			cliente.setNome(nome);
			cliente.setCpf(cpf);
			cliente.setEmail(email);

			if ((nome != null) && (cpf != null) && (email != null)) {
				try {

					if (ClienteDao.pesquisarId(cliente) == null) {
						ClienteDao.inserir(cliente);
						request.setAttribute("sucesso", "Cadastro  Efetuado com Sucesso!");
						request.getRequestDispatcher("/sistema/clientes/cadastro.jsp").forward(request, response);
					} else {
						request.setAttribute("erro", "Erro ao cadastrar Cliente, CPF Já cadastrado!");
						request.getRequestDispatcher("/sistema/clientes/cadastro.jsp").forward(request, response);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}

			} else {
				session.setAttribute("erro", "Todos os campos precisam ser preenchidos corretamente!");
				request.getRequestDispatcher("/sistema/clientes/cadastro.jsp").forward(request, response);
			}

			break;

//===============================================================   PESQUISA   ===============================================================================			

		case "consulta":

			cpf = Long.parseLong(cpfmascara);
			
			cliente = new Cliente();
			cliente.setCpf(cpf);

			if (cpf != null) {
				try {
					if (ClienteDao.pesquisarId(cliente) != null) {
						Cliente cli = new Cliente();

						cli = ClienteDao.pesquisarId(cliente);
						request.setAttribute("cliente", cli);
						request.getRequestDispatcher("/sistema/clientes/consulta.jsp").forward(request, response);

					}else {
						request.setAttribute("erro", "Erro ao buscar Cliente, CPF não encontrado");
						request.getRequestDispatcher("/sistema/clientes/consulta.jsp").forward(request, response);
					}
					
				} catch (Exception e) {
					request.setAttribute("erro", "Erro ao buscar Cliente" + e);
					request.getRequestDispatcher("/sistema/clientes/consulta.jsp").forward(request, response);

				}
			} else {
				request.setAttribute("erro", "Todos os campos precisam ser preenchidos corretamente!");
				request.getRequestDispatcher("/sistema/clientes/consulta.jsp").forward(request, response);

			}

			break;

// =============================================================== DELETE  ===============================================================================

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
						request.setAttribute("sucesso", "Cliente excluido com sucesso!");
						request.getRequestDispatcher("/sistema/clientes/exclusao.jsp").forward(request, response);

					} else {
						request.setAttribute("erro", "Erro ao excluir Cliente, CPF não encontrado!");
						request.getRequestDispatcher("/sistema/clientes/exclusao.jsp").forward(request, response);
					}

				} catch (SQLException e) {
					e.printStackTrace();
				}
			} else {
				request.setAttribute("erro", "CPF precisa ser preenchido corretamente!");
				request.getRequestDispatcher("/sistema/clientes/exclusao.jsp").forward(request, response);

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

				e.printStackTrace();
			}

			break;

// =============================================================== ALTERAR ===============================================================================

		case "alterar":

			cpfmascara = request.getParameter("cpf");
			cpfmascara = cpfmascara.replaceAll("[.-]", "");
			cpf = Long.parseLong(cpfmascara);

			cliente = new Cliente();
			cliente.setCpf(cpf);

			cliente.setCpf(cpf);
			cliente.setEmail(email);
			cliente.setNome(nome);

			if ((cpf != null) && (nome != null) && (email != null)) {
				try {

					if (ClienteDao.pesquisarId(cliente) != null) {
						ClienteDao.alterar(cliente);
						request.setAttribute("sucesso", "Cliente alterado com sucesso!");
						request.getRequestDispatcher("/sistema/clientes/alteracao.jsp").forward(request, response);

					} else {
						request.setAttribute("erro", "Erro ao alterar Cliente, Cliente não encontrado!");
						request.getRequestDispatcher("/sistema/clientes/alteracao.jsp").forward(request, response);
					}

				} catch (SQLException e) {
					e.printStackTrace();
				}
			} else {
				request.setAttribute("erro", "Todos os campos precisam ser preenchidos corretamente!");
				request.getRequestDispatcher("/sistema/clientes/alteracao.jsp").forward(request, response);

			}

			break;

//=========================================================================================================================================================			

		default:
			break;
		}

	}
}
