WITH Outils;
Use Outils;

PACKAGE Gestion_Fiche IS
   TYPE T_Fiche IS RECORD
      Nom : T_Mot := (others => ' ');
      Prenom : T_Mot := (others => ' ');
      Sexe : Boolean := false; -- false = garçon, true = fille
      Age : Positive := 4;
      NbFS : Natural := 0;
      PxH : Float := 0.0;
      SP : T_TabSport;
      Vide : boolean := true; -- si vide = true, la case est vide
   END RECORD;
-- inscription d'un nouvel enfant
   PROCEDURE Inscription (F : IN OUT T_Fiche);
   PROCEDURE AffichageSP (SP : IN T_TabSport);
   --PROCEDURE Visualisation_Fiche(F : IN T_Fiche);
   FUNCTION Calcul_Prix (F : T_Fiche) RETURN Float;
   
END Gestion_Fiche;
