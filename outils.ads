PACKAGE Outils IS

   TYPE T_Sport IS (Judo,Tennis,Natation,Football,Danse,Rugby);
   TYPE T_TabSport IS ARRAY (T_Sport) OF Boolean;
   SUBTYPE T_Mot IS String(1..50);
   PROCEDURE Saisie (Mot : OUT T_Mot);
   PROCEDURE Saisie_Ch (Ch : OUT Natural);
   PROCEDURE AffichageSP (SP : IN T_TabSport);
   FUNCTION Reduc (Nbfs : IN Integer; PxH : IN Float) RETURN Float;

END Outils;






