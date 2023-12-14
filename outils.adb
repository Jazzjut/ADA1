WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;

PACKAGE BODY Outils IS

   PROCEDURE Saisie (Mot : OUT T_Mot) IS
      K : integer;
   BEGIN

      Mot := (OTHERS => ' ');
      Get_Line (Mot,K);

   END Saisie;

PROCEDURE Saisie_Ch (Ch : OUT Natural) IS
   -- déclare var pour stocker la saisie

   Begin
   loop
   Begin
      get(Ch);skip_line;
         EXIT;
      EXCEPTION
      WHEN Data_Error => Skip_Line; Put_Line("Erreur de saisie, recommencez");
         -- on tape autre chose qu'un entier
         -- pas de constraint_error pour user affiche si il est trop vieux ou trop jeune
   END;
END LOOP;
END Saisie_Ch;

END Outils;

