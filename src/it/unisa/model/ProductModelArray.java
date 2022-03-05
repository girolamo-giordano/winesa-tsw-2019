package it.unisa.model;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;

public interface ProductModelArray<T> {
	
	public ArrayList<T> doRetrieveByKey(int code) throws SQLException;
	
	//recupera tutti i prodotti e li puo ordinare secondo un criterio
	public Collection<T> doRetrieveAll(String order) throws SQLException;
	
	//salvare un prodotto da zero
	public void doSave (T product) throws SQLException;
	
	//verifica che il prodotto esiste e lo aggiorna senza crearne nuovi
	public void doUpdate (T product) throws SQLException;
	
	//cancella e restituisce true o false a secondo che è riuscita la cancellazione o no
	public boolean doDelete (T product) throws SQLException;
	

}
