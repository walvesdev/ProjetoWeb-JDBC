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


@WebServlet("/ListarClientes")
public class ListarClientes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;

    public ListarClientes() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Cliente> listaClientes = new ArrayList<>();
		
		try {
			
			session = request.getSession();
			listaClientes = ClienteDao.pesquisarTodos();
			request.setAttribute("listaClientes", listaClientes);
			request.getRequestDispatcher("/sistema/clientes/consultatodos.jsp").forward(request, response);
			
		} catch (SQLException e) {
			System.out.println(e);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
