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

PROCEDURE AffichageSP (SP : IN T_TabSport) IS
BEGIN
   FOR I IN SP'RANGE LOOP
      IF SP (I) = True THEN
         Put(T_Sport'image(I));
      END IF;
      new_line;
   END LOOP;
END AffichageSP;

FUNCTION Reduc (Nbfs : IN Integer; PxH : IN Float) RETURN Float IS
BEGIN
   -- faudrais mettre les float en constante mais je sais pas où les mettre si t'a une idée
   IF Nbfs = 0 THEN RETURN PxH;
   ELSIF Nbfs = 1 THEN RETURN PxH*0.9;
   ELSIF Nbfs = 2 THEN RETURN PxH*0.8;
   ELSIF Nbfs = 3 THEN RETURN PxH*0.6;
   ELSE RETURN PxH*0.5;
   END IF;
end Reduc;
END Outils;

