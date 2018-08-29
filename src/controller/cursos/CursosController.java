package controller.cursos;

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

import dao.CursoDao;
import model.Curso;

@WebServlet("/CursosController")
public class CursosController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Curso curso = null;
	HttpSession session = null;
	String nome = null;
	String site = null;
	int codCurso = 0;
	double valor = 0;
	
	String action = null;

	public CursosController() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		action = request.getParameter("action");

		switch (action) {

//===========================================================  CONSULTA TODOS  ==================================================================================			

		case "consultartodos":

			try {

				List<Curso> listaCursos = new ArrayList<>();

				listaCursos = CursoDao.pesquisarTodos();
				request.setAttribute("listaCursos", listaCursos);
				request.getRequestDispatcher("/sistema/cursos/consultatodos.jsp").forward(request, response);

			} catch (SQLException e) {

				e.printStackTrace();
			}

			break;

//=========================================================================================================================================================			

		case "CursoAlterar":

			nome = request.getParameter("nome");
			site = request.getParameter("site");
			codCurso = Integer.parseInt(request.getParameter("codcurso"));
			valor = Double.parseDouble(request.getParameter("valor"));

			curso = new Curso();
			

			request.setAttribute("Curso", curso);
			request.getRequestDispatcher("/sistema/cursos/alteracao.jsp").forward(request, response);

			break;

//=========================================================================================================================================================			

		case "CursoDeletar":

			nome = request.getParameter("nome");
			site = request.getParameter("site");
			codCurso = Integer.parseInt(request.getParameter("codcurso"));
			valor = Double.parseDouble(request.getParameter("valor"));

			curso = new Curso();
			

			request.setAttribute("Curso", curso);
			request.getRequestDispatcher("/sistema/cursos/exclusao.jsp").forward(request, response);

			break;
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

// =========================================================================================================================================================



// =========================================================================================================================================================

		switch (action) {

// ============================================================= INSERIR =================================================================================

		case "inserir":

			nome = request.getParameter("nome");
			site = request.getParameter("site");
			codCurso = Integer.parseInt(request.getParameter("codcurso"));
			valor = Double.parseDouble(request.getParameter("valor"));

			curso = new Curso();
			curso.setNome(nome);
			curso.setCodCurso(codCurso);
			curso.setSite(site);
			curso.setValor(valor);		
			

			if ((nome != null) && (codCurso != 0) && (valor != 0)) {
				try {

					if (CursoDao.pesquisarId(curso) == null) {
						CursoDao.inserir(curso);
						request.setAttribute("sucesso", "Cadastro  Efetuado com Sucesso!");
						request.getRequestDispatcher("/sistema/cursos/cadastro.jsp").forward(request, response);
					} else {
						request.setAttribute("erro", "Erro ao cadastrar Curso, Codigo de curso Já cadastrado!");
						request.getRequestDispatcher("/sistema/cursos/cadastro.jsp").forward(request, response);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}

			} else {
				session.setAttribute("erro", "Todos os campos precisam ser preenchidos corretamente!");
				request.getRequestDispatcher("/sistema/cursos/cadastro.jsp").forward(request, response);
			}

			break;

// =============================================================== PESQUISA ===============================================================================

		case "consulta":

			codCurso = Integer.parseInt(request.getParameter("codcurso"));
			
			curso = new Curso();
			curso.setCodCurso(codCurso);

			if (codCurso != 0) {
				try {
					if (CursoDao.pesquisarId(curso) != null) {
						
						Curso curso1 = new Curso();

						curso1 = CursoDao.pesquisarId(curso);
						request.setAttribute("curso", curso1);
						request.getRequestDispatcher("/sistema/cursos/consulta.jsp").forward(request, response);

					} else {
						request.setAttribute("erro", "Erro ao buscar Curso, Codigo do curso não encontrado");
						request.getRequestDispatcher("/sistema/cursos/consulta.jsp").forward(request, response);
					}

				} catch (Exception e) {
					request.setAttribute("erro", "Erro ao buscar Curso" + e);
					request.getRequestDispatcher("/sistema/cursos/consulta.jsp").forward(request, response);

				}
			} else {
				request.setAttribute("erro", "Todos os campos precisam ser preenchidos corretamente!");
				request.getRequestDispatcher("/sistema/cursos/consulta.jsp").forward(request, response);

			}

			break;

// =============================================================== DELETE ===============================================================================

		case "delete":

			codCurso = Integer.parseInt(request.getParameter("codcurso"));

		
			curso = new Curso();
			curso.setCodCurso(codCurso);


			if ((codCurso != 0)) {
				try {

					if (CursoDao.pesquisarId(curso) != null) {
						CursoDao.excluir(curso);
						request.setAttribute("sucesso", "Curso excluido com sucesso!");
						request.getRequestDispatcher("/sistema/cursos/exclusao.jsp").forward(request, response);

					} else {
						request.setAttribute("erro", "Erro ao excluir Curso, Codigo do curso não encontrado!");
						request.getRequestDispatcher("/sistema/cursos/exclusao.jsp").forward(request, response);
					}

				} catch (SQLException e) {
					e.printStackTrace();
				}
			} else {
				request.setAttribute("erro", "CPF precisa ser preenchido corretamente!");
				request.getRequestDispatcher("/sistema/cursos/exclusao.jsp").forward(request, response);

			}

			break;
// =========================================================== CONSULTA TODOS ==================================================================================

		case "consultartodos":

			try {

				List<Curso> listaCursos = new ArrayList<>();

				listaCursos = CursoDao.pesquisarTodos();
				request.setAttribute("listaCursos", listaCursos);
				request.getRequestDispatcher("/sistema/cursos/consultatodos.jsp").forward(request, response);

			} catch (SQLException e) {

				e.printStackTrace();
			}

			break;

// =============================================================== ALTERAR ===============================================================================

		case "alterar":

			codCurso = Integer.parseInt(request.getParameter("codcurso"));

			curso = new Curso();
			curso.setCodCurso(codCurso);


			if ((codCurso != 0 ) && (nome != null) && (site != null)) {
				try {

					if (CursoDao.pesquisarId(curso) != null) {
						CursoDao.alterar(curso);
						request.setAttribute("sucesso", "Curso alterado com sucesso!");
						request.getRequestDispatcher("/sistema/cursos/alteracao.jsp").forward(request, response);

					} else {
						request.setAttribute("erro", "Erro ao alterar Curso, Curso não encontrado!");
						request.getRequestDispatcher("/sistema/cursos/alteracao.jsp").forward(request, response);
					}

				} catch (SQLException e) {
					e.printStackTrace();
				}
			} else {
				request.setAttribute("erro", "Todos os campos precisam ser preenchidos corretamente!");
				request.getRequestDispatcher("/sistema/cursos/alteracao.jsp").forward(request, response);

			}

			break;

// =========================================================================================================================================================

		default:
			break;
		}
	}

}
