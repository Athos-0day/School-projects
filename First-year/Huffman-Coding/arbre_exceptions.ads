-- Définition des exceptions pour le module ABR
package ABR_Exceptions is

	--Exception levée lorsqu'une opération sur un Arbre vide est tentée
	--Exemple : On veut accéder à la valeur d'un Arbre qui est vide
	Arbre_Vide : Exception;	

	--Exception levée lorsqu'une opération veut accéder au fils gauche d'un arbre qui n'en possède pas
	--Exemple : On veut récupérer le fils gauche d'un Arbre sans fils gauche 
  	Fils_Gauche_Vide : Exception; 

	--Exception levée lorsqu'une opération veut accéder au fils droit d'un arbre qui n'en possède pas
	--Exemple : On veut récupérer le fils droit d'un Arbre sans fils droit 
	Fils_Droit_Vide : Exception; 


end ABR_Exceptions;
