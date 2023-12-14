WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils, Ada.Characters.Handling;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO, Outils, Ada.Characters.Handling;

PACKAGE BODY Gestion_Fiche IS
   PROCEDURE Inscription (F : IN OUT T_Fiche) IS
      Choix : Character;

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
      
      -- le prix = function calcul prix de F de T_fiche en gros diff d'affichage avec aft et exp et ici sa fonctionne 
      F.PxH := Calcul_Prix(F);

      -- si l'age ne correspond pas
      IF F.Age > 12 THEN
         Put_Line ("L'enfant est trop vieux pour s'inscrire.");
      ELSIF F.Age < 4 THEN
         Put_Line ("L'enfant est trop jeune pour s'inscrire.");
      END IF;
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
   
      FUNCTION Calcul_Prix(F : T_Fiche) RETURN Float IS
      -- calcul prix heb
      PxH : float := 0.0;
         Coef1 : CONSTANT Float := 0.9; 
         Coef2 : CONSTANT Float := 0.8; 
         Coef3 : CONSTANT Float := 0.6; 
         Coefmax : CONSTANT Float := 0.5;
         prxJ : constant float:=12.00;--judo prix
         PrxT : CONSTANT Float:=10.00;--tennis prix
         PrxN : CONSTANT Float:=15.00;--natation prix
         PrxF : CONSTANT Float:=10.00;--football prix           
         PrxD : CONSTANT Float:=8.00;--danse prix
         PrxR : CONSTANT Float:=12.00;--rugby

      BEGIN
         
      for S in T_Sport loop
         IF F.SP(S) THEN
            -- Ajouter le prix de l'activité spécifique
            CASE S IS
               WHEN Judo => PxH := PxH + prxJ; -- Prix pour le Judo
               WHEN Tennis => PxH := PxH + prxT; -- Prix pour le Tennis
               WHEN Natation => PxH := PxH + prxN; -- Prix pour la Natation
               WHEN Football => PxH := PxH + prxF; -- prix ...
               WHEN Danse => PxH := PxH + prxD;
               WHEN Rugby => PxH := PxH + prxR;
               WHEN OTHERS => -- Ne rien faire pour les autres activités
                  NULL;
            END CASE;
         END IF;
         END LOOP;
         
--Application du coefficient de reduction
         IF F.Nbfs = 0 THEN RETURN (PxH);
         ELSIF F.Nbfs = 1 THEN PxH := PxH*Coef1;
         ELSIF F.Nbfs = 2 THEN PxH := PxH*Coef2;
         ELSIF F.Nbfs = 3 THEN PxH := PxH*Coef3;
         ELSE PxH := PxH*Coefmax;
         END IF;
         RETURN (PxH);
         
         --Put_Line("Le prix hebdomadaire total est : "); -- affiche le prx hebdomadaire totale avec 2 ch après la virgule
      --Put(F.PxH,Aft=>2, Exp=>0);New_Line;
      --Put_Line("Reduction : ");
      -- appel de la fonction reduction pour le calcul de prix avec la reduc
      --Put(Reduc(F.NbFS,F.PxH),Aft=>2, Exp=>0);New_Line;
      END Calcul_Prix;
      
PROCEDURE AffichageSP (SP : IN T_TabSport) IS
BEGIN
   FOR I IN SP'RANGE LOOP
      IF SP (I) = True THEN
         Put(T_Sport'image(I));
      END IF;
      new_line;
   END LOOP;
END AffichageSP;
      
END Gestion_Fiche;




