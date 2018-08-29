package model;

public class Curso {

	private int id;
	private int codCurso;
	private String nome;
	private String site;
	private double valor;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCodCurso() {
		return codCurso;
	}
	public void setCodCurso(int codCurso) {
		this.codCurso = codCurso;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public double getValor() {
		return valor;
	}
	public void setValor(double valor) {
		this.valor = valor;
	}
	
	@Override
	public String toString() {
		return "Curso [id=" + id + ", codCurso=" + codCurso + ", nome=" + nome + ", site=" + site + ", valor=" + valor
				+ "]";
	}
	
	
	
	
}
