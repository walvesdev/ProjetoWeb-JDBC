package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Curso;
import util.ConectarBD;

public class CursoDao {

	public static void inserir(Curso curso) {

		String consulta = "insert into cursos (codCurso, nome, site, valor) values (?, ?, ?,?);";

		try (Connection connection = ConectarBD.Conectar();
				PreparedStatement stmt = connection.prepareStatement(consulta);) {

			stmt.setInt(1, curso.getCodCurso());
			stmt.setString(2, curso.getNome());
			stmt.setString(3, curso.getSite());
			stmt.setDouble(4, curso.getValor());
			stmt.execute();
			// System.out.println(curso.getNome() + curso.getCpf() + curso.getEmail()
			// );

		} catch (Exception e) {
			System.out.println(e);

		}
	}

	public static Curso pesquisarId(Curso codCurso) throws SQLException {

		Curso curso = null;
		String consulta = "select * from cursos where codCurso = ?";

		try (Connection connection = ConectarBD.Conectar();
				PreparedStatement stmt = connection.prepareStatement(consulta);) {
			stmt.setLong(1, codCurso.getCodCurso());
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				curso = new Curso();
				curso.setId(rs.getInt("id"));
				curso.setNome(rs.getString("nome"));
				curso.setSite(rs.getString("site"));
				curso.setValor(rs.getDouble("valor"));

			}
		}
		return curso;
	}

	public static List<Curso> pesquisarTodos() throws SQLException {
		Curso curso = null;
		List<Curso> listaCurso = new ArrayList<>();

		String consulta = "select * from cursos;";

		try (Connection connection = ConectarBD.Conectar();
				PreparedStatement stmt = connection.prepareStatement(consulta);) {

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				curso = new Curso();
				curso.setId(rs.getInt("id"));
				curso.setNome(rs.getString("nome"));
				curso.setSite(rs.getString("site"));
				curso.setValor(rs.getDouble("valor"));

				listaCurso.add(curso);
			}
		}

		return listaCurso;

	}

	public static void excluir(Curso curso) throws SQLException {
		String consulta = "delete from cursos where codCurso = ?;";

		try (Connection connection = ConectarBD.Conectar();
				PreparedStatement stmt = connection.prepareStatement(consulta);) {

			stmt.setInt(1, curso.getCodCurso());
			stmt.execute();

		}
	}

	public static void alterar(Curso curso) throws SQLException {
		
		String consulta = "update cursos set codCurso = ?, nome = ?, site = ?, valor =? where codCurso = ?;";
			

		try (Connection connection = ConectarBD.Conectar();
				PreparedStatement stmt = connection.prepareStatement(consulta);) {

			stmt.setInt(1, curso.getCodCurso());
			stmt.setString(2, curso.getNome());
			stmt.setString(3, curso.getSite());
			stmt.setDouble(4, curso.getValor());
			stmt.setInt(5, curso.getCodCurso());
			stmt.execute();

			
			}
	}
}