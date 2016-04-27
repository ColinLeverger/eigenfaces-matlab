# Étapes du projet

1. Redimentionner toutes les images
2. Normaliser les images pour qu’elles aient toute la même moyenne et le même écart type (donc le même niveau de gris)

X = X — mean(T,2) / std(T,2);

3. Mettre bout à bout toutes les lignes de chaque photo normalisée (pour faire un très long vecteur 1->2576, soit 56 * 46) et dans le même tableau 2D toutes ces lignes (il devrait faire 400 * 2576 lignes) --> c’est le tableau standard, tableau « individu/attribut »
4. Reduire la taille du vecteur sur les abscisses avec une fonction spéciale qui permet de garder 48 paramètres au lieu de 2576. Voir ACP ou PCA. 48, car c’est le nombre de détecteurs mpeg4. Par contre, on peut changer le 48, en prendre plus, mais on risque de noyer la reconnaissance dans trop d’information, ou moins au risque d’avoir une chute dans le taux de reconnaissance. Cette étape est la procédure centrale du programme.
5. Calculer les vecteurs propres : on va pouvoir s’en servir pour faire les comparaisons : ce seront les hagenface. La fonction doit donc renvoyer deux vecteurs.

Analyse en fonction principale : svd
