-- Définition des exceptions pour le module ABR
package ABR_Exceptions is

	--Exception levée lorsqu'une opération sur un Arbre est tentée sur un arbre qui est vide
	--Exemple : On veut accéder à la valeur d'un Arbre qui est vide
	Arbre_Vide : Exception;	

	--Exception levée lorsqu'un fils gauche est null
	--Exemple : On veut récupérer le fils gauche d'un Arbre qui n'en possède pas 
  	Fils_Gauche_Vide : Exception; 

	--Exception levée lorsqu'un fils droit est null
	--Exemple : On veut récupérer le fils droit d'un Arbre qui n'en possède pas 
	Fils_Droit_Vide : Exception; 


end ABR_Exceptions;
