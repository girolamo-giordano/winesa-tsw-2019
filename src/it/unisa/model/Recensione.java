package it.unisa.model;

public class Recensione {
	
	private int code;
	private int id_utente;
	private String nomeut;
	private int id_product;
	private String titolo;
	private String descrizione;
	private int stelle;
	
	public Recensione()
	{
		code=0;
		id_utente=0;
		id_product=0;
		titolo=null;
		descrizione=null;
		stelle=0;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getId_utente() {
		return id_utente;
	}

	public void setId_utente(int id_utente) {
		this.id_utente = id_utente;
	}

	public int getId_product() {
		return id_product;
	}

	public void setId_product(int id_product) {
		this.id_product = id_product;
	}

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public int getStelle() {
		return stelle;
	}

	public void setStelle(int stelle) {
		this.stelle = stelle;
	}

	public String getNomeut() {
		return nomeut;
	}

	public void setNomeut(String nomeut) {
		this.nomeut = nomeut;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Recensione other = (Recensione) obj;
		if (code != other.code)
			return false;
		if (descrizione == null) {
			if (other.descrizione != null)
				return false;
		} else if (!descrizione.equals(other.descrizione))
			return false;
		if (id_product != other.id_product)
			return false;
		if (id_utente != other.id_utente)
			return false;
		if (stelle != other.stelle)
			return false;
		if (titolo == null) {
			if (other.titolo != null)
				return false;
		} else if (!titolo.equals(other.titolo))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Recensione [code=" + code + ", id_utente=" + id_utente + ", id_product=" + id_product + ", titolo="
				+ titolo + ", descrizione=" + descrizione + ", stelle=" + stelle + "]";
	}
	
	

}
