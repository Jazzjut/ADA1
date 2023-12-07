WITH Ada.Text_IO, Ada.Integer_Text_IO, gestion_fiche;
USE Ada.Text_IO, Ada.Integer_Text_IO, gestion_fiche;


PROCEDURE Projetada IS
   F: T_Fiche;
BEGIN
   Inscription(F);
   put(F.nom);
End Projetada;
