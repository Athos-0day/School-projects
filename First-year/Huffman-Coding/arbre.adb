with Ada.Text_IO;            use Ada.Text_IO;
with Ada.Unchecked_Deallocation;
with ABR_Exceptions;         use ABR_Exceptions;

package body ABR is

    procedure Free is
            new Ada.Unchecked_Deallocation (T_Noeud, T_ABR) ;

    procedure Initialiser(Arbre : out T_ABR) is
    begin
        Arbre := null ;
    end Initialiser ;

    procedure Creer_Feuille(Feuille : in out T_ABR; Valeur : T_Valeur; Identifiant : T_ID) is 
    begin 
        Feuille := new T_Noeud'(Identifiant,Valeur,null,null) ;
    end Creer_Feuille ;

    procedure Detruire(Arbre : in out T_ABR) is
    begin
        if Arbre/=null then
            Detruire(Arbre.all.Gauche) ; --Supprime le fils gauche
            Detruire(Arbre.all.Droit) ; --Supprime le fils droit
            Free(Arbre) ; --Libère la mémoire
        else
            null ; --Cas de base l'arbre est null
        end if ;
    end Detruire ;

    function Est_Vide(Arbre : in T_ABR) return Boolean is
    begin
        return Arbre=null ;
    end Est_Vide ;

    function Est_Feuille(Arbre : in T_ABR) return Boolean is
    begin
        if Arbre=null then
            return false ;
        else 
            return Arbre.all.Gauche=null and Arbre.all.Droit=null ;
        end if;
    end Est_Feuille ;

    function Fils_Gauche(Arbre : in T_ABR) return T_ABR is
    begin
        if Arbre.all.Gauche=null then
            raise Fils_Gauche_Vide ;
        else
            return Arbre.all.Gauche ;
        end if ;
    end Fils_Gauche ;


    function Fils_Droit(Arbre : in T_ABR) return T_ABR is
    begin
        if Arbre.all.Droit=null then
            raise Fils_Droit_Vide ;
        else
            return Arbre.all.Droit ;
        end if ;
    end Fils_Droit ;

    function La_Valeur(Arbre : in T_ABR) return T_Valeur is
    begin
        if Arbre=null then
            raise Arbre_Vide_Exception;
        else
            return Arbre.all.Valeur ;
        end if ;
    end La_Valeur ;

    function L_Identifiant(Arbre : in T_ABR) return T_ID is
    begin
        if Arbre=null then
            raise Arbre_Vide_Exception;
        else
            return Arbre.all.Identifiant ;
        end if ;
    end L_Identifiant ;


    function Taille(Arbre : in T_ABR) return Integer is
    begin
        if Arbre=null then
            return  0 ;
        else
            return Taille(Arbre.all.Gauche) + Taille(Arbre.all.Droit) + 1 ;
        end if ;
    end Taille ;

    procedure Fusionner_Arbres(Abr1 : in out T_ABR; Abr2 : in T_ABR) is
        if Abr2=null then
            null ; --L'arbre 1 n'est pas modifié
        elsif Abr1=null then
            Abr1 := Abr2 ; --L'arbre 1 devient l'arbre 2
        else
            --Création du nouveau noeud
            Abr1 := new T_Noeud'(null,null,Abr1,Abr2) ; --Fusion des deux arbres mais on ne peut pas mettre de valeur
            --Libération de l'espace alloué à l'arbre 2
            Detruire(Abr2);
        end if ;
    end Fusionner_Arbres ;

    procedure Parcourt_Infixe(Arbre : in T_ABR; Parcourt : in out T_LCA) is 
    begin 
        --Cas où l'Arbre est vide 
        if Arbre=null then 
            null ;
        elsif Arbre.all.Gauche/=null then 
            --On ajoute un 0 à la LCA associé à la valeur de l'id (mais ne sera pas utile) 
            Enregistrer(Parcourt,


