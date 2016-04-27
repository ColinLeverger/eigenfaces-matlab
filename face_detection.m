% 1. redimentionner toute les images
% 1.2 normaliser les images pour qu'elles ait toutes la meme moyenne et le meme ecart type (donc le meme niveau de gris)
% 2. mettre bout ? bout toutes les lignes de chaque photo normalis?e (pour faire un tr?s long vecteur 1->2576 , soit 56 * 46)
% 3. et dans le meme tableau 2D toutes ces lignes (il devrait faire 400 * 2576 lignes) --> c'est le tableau standard, tableau "individu / attribu"
% 4. reduire la taille du vecteur sur les abscices avec une fonction speciale qui permet de garder 48 parametres au lieu de 2576. Voir ACP ou PCA. 48 car c'est le nombre de detecteur mpeg4... par contre on peut changer le 48, en prendre plus mais on risque de noyer la reconnaicance dans trop d'information, ou moins au risque d'avoir une chute dans le taux de reconnaissance. cette etape est la procedure centrale du programme.
% 5. Calculer les vecteurs propres : on va pouvoir s'en servir pour faire les comparaisons : ce seront les hagenface
%    Note : la fonction doit donc renvoyer deux vecteurs

% Analyse en fonction principale : svd