WITH gestion_fiche, outils;
USE gestion_fiche, outils;

PACKAGE Gestion_Tableau_Fiches IS
   TYPE T_TabFiche IS ARRAY (Integer RANGE 1..R) OF T_Fiche;
   PROCEDURE Fiche_inscription_enfant(T : IN OUT T_TabFiche; S : IN OUT Outils.T_Sport);
END Gestion_Tableau_Fiches;
