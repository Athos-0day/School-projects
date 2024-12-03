--Définition de la structure de données d'un arbre binaire (ABR)

with LCA ;

generic
    type T_ID is private ;
    type T_Valeur is private;

package ABR is

    --On empêche les copies de l'Arbre pour l'utilisateur
    --Cela ne pose pas de problème ici
    type T_ABR is limited private ;

    
    package LCA_Entier_ID is
            new LCA(T_Cle    => T_ID,
                    T_Valeur => Integer)
    use LCA_Entier_ID ;

    package LCA_Entier_Valeur is 
            new LCA(T_Cle    => Integer,
                    T_Valeur => T_Valeur)
    use LCA_Entier_Valeur


    --Initialiser un Arbre
    --L'Arbre est initialisé à la valeur null
    procedure Initialiser(Arbre : out T_ABR) with
            Post => Est_Vide (Arbre);

    --Créer un arbre qui est une seule feuille 
    --L'arbre ne contient qu'un seule noeud 
    procedure Creer_Feuille(Feuille : in out T_ABR, Valeur : in T_Valeur, Identifiant ; in T_ID) ;
            Post => Taille(Feuille) = 1 ;

    --Détruire un Arbre
    --Libère l'espace mémoire alloué à l'Arbre
    procedure Detruire(Arbre : in out T_ABR);

    --Obtenir la taille d'un arbre 
    --Le taille de l'arbre est son nombre de noeuds
    --La fonction renverra 0 si l'Arbre est vide
    function Taille(Arbre : in T_ABR) return Integer with
            Post => Taille'Result >= 0
            and (Taille'Result = 0) = Est_Vide (Arbre);

    --Vérifier si un arbre est vide
    function Est_Vide(Arbre : in T_ABR) return Boolean ;

    --Vérifier si un arbre est une feuille
    --Cela veut dire que le noeud n'a pas de fils
    --Dans le cas où l'arbre est vide, on renvoie false
    function Est_Feuille(Arbre: in T_ABR) return Boolean ;

    --Récupérer le fils gauche d'un arbre
    --On lève l'exception Fils_Gauche_Vide lorsque l'arbre ne possède pas de fils gauche
    function Fils_Gauche(Arbre : in T_ABR) return T_ABR with
            Pre => not Est_Vide(Arbre) ;

    --Récupérer le fils droit d'un arbre
    --On lève l'exception Fils_Droit_Vide lorsque l'arbre ne possède pas de fils droit
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

    --Parcourt qui stocke les valeurs dans une chaine de caractère
    --Ce qui permettra de stocker l'arbre dans le fichier compresser 
    --On ne peut pas stocker directement le parcourt dans un type T_Octet 
    --En effet ce parcourt pourrait dépasser les 8 bits de l'octet dans une majorité des cas
    function Parcourt_Infixe(Arbre : in T_ABR) return T_LCA;

    --Construire l'arbre de Huffman à partir du parcourt infixe
    --Ce qui permettra de reconstruire l'arbre dans décompresser 
    

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
