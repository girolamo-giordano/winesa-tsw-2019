package it.unisa.model;

public class ProductBuy {
	private int code;
	private int codut;
	private int codpr;
	private String name;
	private String description;
	private String type;
	private float price;
	private int quantity;
	private int anno;
	private String regione;
	private byte[] foto;
	
	public ProductBuy() {
		this.setCode(-1);
		this.setName("");
		this.setDescription("");
		this.setPrice(0);
		this.setQuantity(0);
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getType()
	{
		return type;
	}
	
	public void SetType(String type) {
		this.type=type;
	}
	
	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public byte[] getFoto() {
		return foto;
	}
	

	public void setFoto(byte[] foto) {
		this.foto = foto;
	}
	
	public int getCodut() {
		return codut;
	}

	public void setCodut(int codut) {
		this.codut = codut;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getCodpr() {
		return codpr;
	}

	public void setCodpr(int codpr) {
		this.codpr = codpr;
	}

	public int getAnno() {
		return anno;
	}

	public void setAnno(int anno) {
		this.anno = anno;
	}

	public String getRegione() {
		return regione;
	}

	public void setRegione(String regione) {
		this.regione = regione;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProductBuy other = (ProductBuy) obj;
		if (code != other.code)
			return false;
		/*if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (foto == null) {
			if (other.foto != null)
				return false;
		} else if (!foto.equals(other.foto))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (price != other.price)
			return false;
		if (quantity != other.quantity)
			return false;
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
			return false;*/
		return true;
	}

	@Override
	public String toString() {
		return "ProductBean [code=" + code + ", name=" + name + ", description=" + description + ", type=" + type
				+ ", price=" + price + ", quantity=" + quantity + ", foto=" + foto + "]";
	}
}
