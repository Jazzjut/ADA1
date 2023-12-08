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
   M : CONSTANT Integer := 5;
   R : Natural;-- range
    --R := M*T_Sport'RANGE; Ã  mettre dans l'adb
-- inscription d'un nouvel enfant
   PROCEDURE Inscription (F : IN OUT T_Fiche);
END Gestion_Fiche;

