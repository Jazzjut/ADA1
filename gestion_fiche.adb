WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils, Ada.Characters.Handling;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils, Ada.Characters.Handling;

PACKAGE BODY Gestion_Fiche IS
   PROCEDURE Inscription (F : IN OUT T_Fiche) IS
      Choix : Character;
      prxJ : constant float:=12.00;--judo prix
      prxT : constant float:=10.00;--tennis prix
      prxN : constant float:=15.00;--natation prix
      prxF : constant float:=10.00;--football prix
      prxD : constant float:=8.00;--danse prix
      PrxR : CONSTANT Float:=12.00;--rugby prix

   BEGIN
      -- inscription d'un nouvel enfant
      Put("Entrez le Nom : ");
      Saisie(F.Nom);

      Put("Entrez le Prenom : ");
      Saisie(F.Prenom);

      Put("Saisir le sexe (G/F) : ");

      LOOP
         Get (Choix); Skip_Line;
         Choix := To_Upper(Choix);
         CASE Choix IS
            WHEN 'G' => F.Sexe := False; EXIT;
            WHEN 'F' => F.Sexe := True; EXIT;
            WHEN OTHERS => Put_Line ("Erreur de saisie, recommencez.");
         END CASE;
      END LOOP;

      Put("Entrez l'age : ");
      Saisie_Ch(F.Age);

      Put("Entrez le nombre de frere et soeur :");
      Saisie_Ch(F.NbFS);

            -- Initialisation des sports
      for I in T_Sport loop
         Put("L'enfant pratique-t-il le sport ");
         Put(T_Sport'image(I));
         Put(" ? (O/N)");New_Line;
         LOOP
            Get (Choix); Skip_Line;
            Choix := To_Upper(Choix);
            CASE Choix IS
               WHEN 'O' => F.SP(I) := True; EXIT;
               WHEN 'N' => F.SP(I) := False;  EXIT;
               WHEN OTHERS => Put_Line ("Erreur de saisie, recommencez.");
            END CASE;
         END LOOP;
      END LOOP;

      -- si l'age ne correspond pas
      IF F.Age > 12 THEN
         Put_Line ("L'enfant est trop vieux pour s'inscrire.");
      ELSIF F.Age < 4 THEN
         Put_Line ("L'enfant est trop jeune pour s'inscrire.");
      END IF;

      -- calcul prix heb
      F.PxH := 0.0; -- Initialiser le prix à zéro

      for S in T_Sport loop
         IF F.SP(S) THEN
            -- Ajouter le prix de l'activité spécifique
            CASE S IS
               WHEN Judo => F.PxH := F.PxH + prxJ; -- Prix pour le Judo
               WHEN Tennis => F.PxH := F.PxH + prxT; -- Prix pour le Tennis
               WHEN Natation => F.PxH := F.PxH + prxN; -- Prix pour la Natation
               WHEN Football => F.PxH := F.PxH + prxF; -- prix ...
               WHEN Danse => F.PxH := F.PxH + prxD;
               WHEN Rugby => F.PxH := F.PxH + prxR;
               WHEN OTHERS => -- Ne rien faire pour les autres activités
                  NULL;
            END CASE;
         END IF;
      END LOOP;
      Put_Line("Le prix hebdomadaire total est : "); -- affiche le prx hebdomadaire totale avec 2 ch après la virgule
      Put(F.PxH,Aft=>2, Exp=>0);New_Line;
      Put_Line("Reduction : ");
      -- appel de la fonction reduction pour le calcul de prix avec la reduc
      Put(Reduc(F.NbFS,F.PxH),Aft=>2, Exp=>0);New_Line;

      -- Affichage des informations d'inscription
      IF F. Age > 12 OR F.Age < 4 THEN
      put_line("Une autre inscription ?");
      ELSIF F. Age > 4 AND F. Age < 12 THEN
      Put_Line("Inscription reussie !");
      Put_Line("Informations de la fiche : ");
      Put("Prenom : "); Put_Line(F.Prenom);
      Put("Nom : "); F.Nom:= To_Upper(F.Nom);Put_Line(F.Nom);
      Put("Age : "); Put(F.Age); new_line;
      Put("Nombre de freres et soeurs : "); Put(F.NbFS); new_line;
      Put("Prix hebdomadaire : "); Put(F.PxH,Aft=>2, Exp=>0);new_line;
      Put_Line ("Sport pratiques :"); AffichageSP (F.SP);
      END IF;
      END Inscription;
END Gestion_Fiche;


