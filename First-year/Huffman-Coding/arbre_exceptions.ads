-- Définition des exceptions pour le module ABR
package ABR_Exceptions is

	Arbre_Vide : Exception;	-- Exception levée lorsqu'une opération sur un Arbre est tentée sur un arbre qui est vide
  	Fils_Gauche_Vide : Exception; --Exception levée lorsqu'un fils gauche est null
	Fils_Droit_Vide : Exception; --Exception levée lorsqu'un fils droit est null


end ABR_Exceptions;
