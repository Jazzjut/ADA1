PACKAGE Gestion_Fiche IS
   TYPE T_Sport IS (Judo,Tennis,Natation,Football,Danse,Rugby);
   TYPE T_TabSport IS ARRAY (T_Sport) OF Boolean;
   SUBTYPE T_Mot is String(1..50);
   TYPE T_Fiche IS RECORD
      Nom : T_Mot;
      Prenom : T_Mot;
      Sexe : Boolean;
      Age : Positive RANGE 4..12;
      NbFS : Natural;
      PxH : Float;
      SP : T_TabSport;
   END RECORD;
   M : CONSTANT Integer := 5;
   R : Integer;
    --R := M*T_Sport'RANGE; à mettre dans l'adb
-- inscription d'un nouvel enfant
   PROCEDURE Inscription (F : OUT T_Fiche);
      Nom_Length : Natural;
   Prenom_Length : Natural;
   S:T_Sport;
END Gestion_Fiche;

