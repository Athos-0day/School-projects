--Définition de la structure de données d'un arbre binaire
--type (ABR)
with LCA ; -- Pour stocker le parcourt infixe de l'arbre

generic
    type T_ID is private ;
    type T_Valeur is private;

package ABR is

    type T_ABR is limited private ;

    Arbre_Vide_Exception : Exception ;
    Fils_Vide_Exception : Exception ;

    package LCA_Entier is
            new LCA(T_Cle    => ,
                    T_Valeur => )



    --Initialiser un Arbre. L'Arbre est vide
    procedure Initialiser(Arbre : out T_ABR) with
            Post => Est_Vide (Arbre);

    --Détruire un Arbre, l'Arbre n'existe plus en mémoire
    procedure Detruire(Arbre : in out T_ABR);

    --Obtenir la taille d'un arbre i.e son nombre de noeuds
    function Taille(Arbre : in T_ABR) return Integer with
            Post => Taille'Result >= 0
            and (Taille'Result = 0) = Est_Vide (Arbre);

    --Vérifier si un arbre est vide
    function Est_Vide(Arbre : in T_ABR) return Boolean ;

    --Vérifier si un arbre est une feuille
    function Est_Feuille(Arbre: in T_ABR) return Boolean ;

    --Récupérer le fils gauche d'un arbre
    --On lève l'exception Fils_Vide_Exception lorsque le fils gauche est null
    function Fils_Gauche(Arbre : in T_ABR) return T_ABR with
            Pre => not Est_Vide(Arbre) ;

    --Récupérer le fils droit d'un arbre
    --On lève l'exception Fils_Vide_Exception lorsque le fils gauche est null
    function Fils_Droit(Arbre : in T_ABR) return T_ABR with
            Pre => not Est_Vide(Arbre) ;

    --Récupérer la valeur d'un noeud
    --On lève l'exception Arbre_Vide_Exception lorsque l'arbre est null
    function La_Valeur(Arbre : in T_ABR) return T_Valeur ;

    --Récupérer l'identifiant d'un Noeud
    --On lève l'exception Arbre_Vide_Exception lorsque l'arbre est null
    function L_Identifiant(Arbre : in T_ABR) return T_ID ;

    --Fusionner deux arbres à partir de leurs racines
    --Avec Abr1 (resp. Abr2) qui sera le fils gauche (resp. le fils droit)
    --Le résultat sera stocké dans Abr1 et on libère la mémoire de Abr2
    procedure Fusionner_Arbres(Abr1 : in out T_ABR, Abr2 : in T_ABR) with
            Post => Taille (Abr1) = (Taille (Abr2) + Taille (Abr1)'Old + 1) ;

    --Créer un arbre qui est une seule feuille 
    --On donnera une valeur et un identifiant
    procedure Creer_Feuille(Feuille : in out T_ABR, Valeur : in T_Valeur, Identifiant ; in T_ID) ;

    --Parcourt qui stocke les valeurs sur les branches dans une LCA jusqu'à une feuille
    --On effectue le parcourt en allant toujours à gauche puis à droite en cas de gils gauche absent
    function Parcourt_Infixe(Arbre : in T_ABR) return T_LCA;


private

    type T_Noeud ;

    type T_ABR is access T_Noeud ;

    type T_Noeud is record
        Identifiant : T_ID ;
        Valeur : T_Valeur ;
        Gauche : T_ABR ;
        Droit : T_ABR ;
    end record ;

end ABR ;
