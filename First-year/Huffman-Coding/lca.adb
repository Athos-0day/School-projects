with Ada.Text_IO;            use Ada.Text_IO;
with SDA_Exceptions;         use SDA_Exceptions;
with Ada.Unchecked_Deallocation;

package body LCA is

	procedure Free is
		new Ada.Unchecked_Deallocation (T_Cellule,T_LCA);


	procedure Initialiser(Sda: out T_LCA) is
	begin
		Sda := null ;
	end Initialiser;


	procedure Detruire (Sda : in out T_LCA) is
	begin
        if Sda/=null then
            Detruire(Sda.all.Suivant) ;--on utilise une implémentation récursive
            Free(Sda) ;
        else
            null ;
        end if ;
	end Detruire;


	procedure Afficher_Debug (Sda : in T_LCA) is
	begin
        if Sda/=null then
            --affichage du premier élément
            Put("-->[") ;
            Afficher_Cle(Sda.all.Cle);
            Put(" : ");
            Afficher_Donnee(Sda.all.Valeur);
            Put("]");

            --affichage des autres éléments par appel récursif
            Afficher_Debug(Sda.all.Suivant);
        else
            -- cas de base
            Put("--E") ;

        end if;

	end Afficher_Debug;


	function Est_Vide (Sda : in T_LCA) return Boolean is
	begin
		return Sda=null ;
	end;


	function Taille (Sda : in T_LCA) return Integer is
    begin
        --on parcourt la liste récursivement
        if Sda=null then
            return 0 ;
        else
            return 1 + Taille(Sda.all.Suivant) ;
        end if ;
	end Taille;


    procedure Enregistrer (Sda : in out T_LCA ; Cle : in T_Cle ; Valeur : in T_Valeur) is
    begin
            --On va parcourir Sda pour trouver Cle
            --Le cas échéant on rajoute la nouvelle valeur à la fin de la liste

            --cas de base
        if Sda=null then
            Sda := new T_Cellule ;
            Sda.all.Cle := Cle ;
            Sda.all.Valeur := Valeur ;
            Sda.all.Suivant := null ;


            --cas où on trouve la clé
        elsif Sda.all.Cle=Cle then
                Sda.all.Valeur := Valeur ; --on change la valeur

            --sinon on parcourt la LCA
        else
                Enregistrer(Sda.all.Suivant,Cle,Valeur) ;

        end if ;

	end Enregistrer;


	function Cle_Presente (Sda : in T_LCA ; Cle : in T_Cle) return Boolean is
	begin
            --on cherche par parcourt récursif
            if Sda=null then
                return False ;
            elsif Sda.all.Cle=Cle then
                return True ;
            else
                return Cle_Presente(Sda.all.Suivant,Cle) ;
            end if ;
	end Cle_Presente;


	function La_Valeur (Sda : in T_LCA ; Cle : in T_Cle) return T_Valeur is
    begin
        if Sda=null then
            raise Cle_Absente_Exception ;
        elsif Sda.all.Cle=Cle then
            return Sda.all.Valeur ;
        else
            return La_Valeur(Sda.all.Suivant,Cle) ;
        end if ;
	end La_Valeur;


    procedure Supprimer (Sda : in out T_LCA ; Cle : in T_Cle) is
            Sda2 : T_LCA ;
    begin
        if not Cle_Presente(Sda,Cle ) then
            raise Cle_Absente_Exception ;

        elsif Sda.all.Cle = Cle then
            Sda2 := Sda ;
            Sda := Sda.all.Suivant ;
            Free(Sda2) ;

        else
            Supprimer(Sda.all.Suivant,Cle) ;

        end if ;

	end Supprimer;


	procedure Pour_Chaque (Sda : in T_LCA) is
	begin
        if Sda/=null then
            begin
                Traiter(Sda.all.Cle,Sda.all.Valeur);
            exception
                when others => Put_Line("erreur de traitement") ;
            end ;
            Pour_Chaque(Sda.all.Suivant);
        else
            null ;
        end if ;
	end Pour_Chaque;


end LCA;
