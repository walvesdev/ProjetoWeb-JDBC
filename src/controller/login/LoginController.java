package controller.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Usuario;
import util.ConectarBD;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();

		String cpfmascara = request.getParameter("cpf");
		cpfmascara = cpfmascara.replaceAll("[.-]", "");
		Long cpf = Long.parseLong(cpfmascara);
		String senha = request.getParameter("senha");

		String consulta = "select * from  public.usuarios where cpf=? and senha=?;";

		try (Connection connection = ConectarBD.Conectar();
				PreparedStatement stmt = connection.prepareStatement(consulta);) {

			stmt.setLong(1, cpf);
			stmt.setString(2, senha);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				Usuario usuario = new Usuario();
				usuario.setId(rs.getInt("id"));
				usuario.setNome(rs.getString("nome"));
				usuario.setGrupo(rs.getString("grupo"));
				
				session.setAttribute("usuario", usuario);
				
				session.setAttribute("login", "true");
				response.sendRedirect("sistema/index.jsp");
			} else {
				session.setAttribute("msg_erro_login", "Erro de autenticação");
				response.sendRedirect("login.jsp");

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
