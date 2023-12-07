PACKAGE BODY gestion_fiche IS
   PROCEDURE Inscription (F : OUT T_Fiche) IS
      Nom_Length : Natural;
      Prenom_Length : Natural;
   BEGIN
      -- inscription d'un nouvel enfant
      Put("Entrez le Nom : ");
      Get_Line(F.Nom, Last => Nom_Length);
      Put("Entrez le Prenom : ");
      Get_Line(F.Prenom, Last => Prenom_Length);
      Put("Entrez l'age : ");
      Get(F.Age);skip_line;
      Put("Entrez le nombre de frere et soeur :");
      Get(F.NbFS);skip_line;
            -- Initialisation des sports
      for I in T_Sport loop
         Put("L'enfant pratique-t-il le sport ");
         Put(T_Sport'image(I));
         Put(" ? (OUI/NON)");new_line;
        -- Put(F.SP(I));
      end loop;

      -- Calcul du prix
      F.PxH := 0.0;
      for S in T_Sport loop
         if F.SP(S) then
            F.PxH := F.PxH + 1.0;
         end if;
      end loop;

      -- Affichage des informations d'inscription
      Put_Line("Inscription réussie !");
      Put_Line("Informations de la fiche :");
      Put("Nom : "); Put_Line(F.Nom);
      Put("Prenom : "); Put_Line(F.Prenom);
     -- Put("Age : "); Put_Line(F.Age);
    --  Put("Nombre de freres et soeurs : "); Put_Line(F.NbFS'Image);
    --  Put("Prix hebdomadaire : "); Put_Line(F.PxH'Image);
   END Inscription;
END Gestion_Fiche;


