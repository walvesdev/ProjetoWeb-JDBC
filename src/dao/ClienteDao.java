package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Cliente;
import util.ConectarBD;

public class ClienteDao {

	public static void inserir(Cliente cliente) {

		String consulta = "insert into clientes (nome, cpf, email) values (?, ?, ?);";

		try (Connection connection = ConectarBD.Conectar();
				PreparedStatement stmt = connection.prepareStatement(consulta);) {

			stmt.setString(1, cliente.getNome());
			stmt.setLong(2, cliente.getCpf());
			stmt.setString(3, cliente.getEmail());
			stmt.execute();
			// System.out.println(cliente.getNome() + cliente.getCpf() + cliente.getEmail()
			// );

		} catch (Exception e) {
			System.out.println(e);

		}
	}

	public static Cliente pesquisarId(Cliente cpfCliente) throws SQLException {

		Cliente cliente = null;
		String consulta = "select * from clientes where cpf = ?";

		try (Connection connection = ConectarBD.Conectar();
				PreparedStatement stmt = connection.prepareStatement(consulta);) {
			stmt.setLong(1, cpfCliente.getCpf());
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				cliente = new Cliente();
				cliente.setId(rs.getInt("id"));
				cliente.setNome(rs.getString("nome"));
				cliente.setEmail(rs.getString("email"));
				cliente.setCpf(rs.getLong("cpf"));

			}
		}
		return cliente;
	}

	public static List<Cliente> pesquisarTodos() throws SQLException {
		Cliente cliente = null;
		List<Cliente> listaCliente = new ArrayList<>();
		
		String consulta = "select * from clientes;";

		try (Connection connection = ConectarBD.Conectar();
				PreparedStatement stmt = connection.prepareStatement(consulta);) {

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				cliente = new Cliente();
				cliente.setId(rs.getInt("id"));
				cliente.setNome(rs.getString("nome"));
				cliente.setEmail(rs.getString("email"));
				cliente.setCpf(rs.getLong("cpf"));

				listaCliente.add(cliente);
			}
		}

		return listaCliente;

	}

	public static void excluir(Cliente cliente) throws SQLException {
		String consulta = "delete from clientes where cpf = ?;";

		try (Connection connection = ConectarBD.Conectar();
				PreparedStatement stmt = connection.prepareStatement(consulta);) {

			stmt.setLong(1, cliente.getCpf());
			stmt.execute();

			
			}
		}
	public static void alterar(Cliente cliente) throws SQLException {
		
		String consulta = "update clientes set nome = ?, cpf = ?, email = ? where cpf = ?;";
			

		try (Connection connection = ConectarBD.Conectar();
				PreparedStatement stmt = connection.prepareStatement(consulta);) {

			stmt.setString(1, cliente.getNome());
			stmt.setLong(2, cliente.getCpf());
			stmt.setString(3, cliente.getEmail());
			stmt.setLong(4, cliente.getCpf());
			stmt.execute();

			
			}
	}

	}

