WITH gestion_fiche;
USE gestion_fiche;

PACKAGE Gestion_Tableau_Fiches IS
   TYPE T_TabFiche IS ARRAY (Integer RANGE 1..R) OF T_Fiche;
   PROCEDURE visualisation_fiche(F : IN T_Fiche);
   PROCEDURE Fiche_inscription_enfant(T : IN OUT T_TabFiche; S : IN OUT Gestion_Fiche.T_Sport);
END Gestion_Tableau_Fiches;
