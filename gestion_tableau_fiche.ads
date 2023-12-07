WITH gestion_fiche;
USE gestion_fiche;

PACKAGE Gestion_Tableau_Fiches IS
   TYPE T_TabFiche IS ARRAY (Integer RANGE 1..R) OF T_Fiche;
   PROCEDURE Visualiser_Fiche(F : T_Fiche);
   PROCEDURE Inscrire_Enfant_Fiche(T : IN OUT T_TabFiche; S : Gestion_Fiche.T_Sport);
END Gestion_Tableau_Fiches;
