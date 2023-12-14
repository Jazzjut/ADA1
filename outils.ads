PACKAGE Outils IS

   TYPE T_Sport IS (Judo,Tennis,Natation,Football,Danse,Rugby);
   TYPE T_TabSport IS ARRAY (T_Sport) OF Boolean;
   SUBTYPE T_Mot IS String(1..50);
   M : CONSTANT Integer := 5;
   R : Natural;-- range
    --R := M*T_Sport'RANGE;
   PROCEDURE Saisie (Mot : OUT T_Mot);
   PROCEDURE Saisie_Ch (Ch : OUT Natural);

END Outils;
