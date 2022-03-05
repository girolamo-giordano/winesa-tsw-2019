package it.unisa.model;

import java.sql.SQLException;
import java.util.Collection;

//ci sono tutti i metodi per aggiungere un prodotto,cancellare o crearlo
//l'interfacca � implementata per ogni bean percio � generica
public interface ProductModel<T> {
	
	//cercare usando il codice 
	public T doRetrieveByKey(int code) throws SQLException;
	
	//recupera tutti i prodotti e li puo ordinare secondo un criterio
	public Collection<T> doRetrieveAll(String order) throws SQLException;
	
	//salvare un prodotto da zero
	public void doSave (T product) throws SQLException;
	
	//verifica che il prodotto esiste e lo aggiorna senza crearne nuovi
	public void doUpdate (T product) throws SQLException;
	
	//cancella e restituisce true o false a secondo che � riuscita la cancellazione o no
	public boolean doDelete (T product) throws SQLException;
	
	
}
