-- Définition des exceptions pour le module ABR
package ABR_Exceptions is

	Arbre_Vide : Exception;	-- Cette exception est levée lorsqu'une opération sur un Arbre est tentée sur un arbre qui est vide
  	Fils__Gauche_Vide : Exception; --Cette exception est levée lorsqu'une opération sur un Arbre est tentée sur un arbre dont le fils gauche est vide
	Fils__Droit_Vide : Exception; --Cette exception est levée lorsqu'une opération sur un Arbre est tentée sur un arbre dont le fils droit est vide


end ABR_Exceptions;
