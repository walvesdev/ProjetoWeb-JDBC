package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
			//System.out.println(cliente.getNome() + cliente.getCpf() +  cliente.getEmail() );

		} catch (Exception e) {
			System.out.println(e);
			
		}
	}
	public static Cliente pesquisarId(Cliente idCliente) throws SQLException {
		
		Cliente cliente = null;
		String consulta = "select * from clientes where cpf = ?";
		
		try(Connection connection = ConectarBD.Conectar();
				PreparedStatement stmt = connection.prepareStatement(consulta);){
			stmt.setLong(1, idCliente.getCpf());
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()){
				cliente = new Cliente();
				cliente.setId(rs.getInt("id"));
				cliente.setNome(rs.getString("nome"));
				cliente.setEmail(rs.getString("email"));
				cliente.setCpf(rs.getLong("cpf"));
				
				
			}
		}
		return cliente;
	}
}
