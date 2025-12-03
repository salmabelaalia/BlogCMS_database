/* 1. INSERT - Création d'un nouvel utilisateur
Insérer un nouvel utilisateur avec :
- Username : "jdupont"
- Email : "jean.dupont@email.com"
- Rôle : "éditeur"
- Mot de passe : "$2y$10$..."
*/
insert into USERS values(21, 'jdupont', 'jean.dupont@email.com', '$2y$10$...', 'éditeur', sysdate);

-- 2. SELECT - Récupération d'articles
-- Récupérer tous les articles avec leur titre, date de création et statut
select title, created_at, status
from posts;

-- res :
/*
TITLE                                              CREATED_ STATUS
-------------------------------------------------- -------- ---------------
Intro PHP                                          10/01/24 published
JS Moderne                                         15/01/24 published
Base SQL                                           05/02/24 published
Santé Bien                                         10/02/24 published
Recette Fac                                        12/02/24 published
Voyage Maroc                                       18/02/24 published
Sport Fitness                                      22/02/24 draft
Éducation En                                       01/03/24 published
Finance Perso                                      05/03/24 published
Mode 2024                                          10/03/24 published
PHP Avancé                                         15/03/24 published
React Guide                                        20/03/24 published
Voyage Japon                                       25/03/24 draft
Cuisine Ital                                       01/04/24 published
Yoga Débutant                                      05/04/24 published
Python Intro                                       10/04/24 published
Investir                                           15/04/24 published
Style Hiver                                        20/04/24 published
MySQL Perf                                         25/04/24 draft
Méditation                                         01/05/24 published
Voyage Grèce                                       05/05/24 published
Pâtisserie                                         10/05/24 published
Running                                            15/05/24 published
Apprendre                                          20/05/24 published
Crypto                                             25/05/24 draft
Style Été                                          30/05/24 published
Docker                                             03/06/24 published
Vegan                                              08/06/24 published
Randonnée                                          12/06/24 published
IA Débutant                                        17/06/24 published

30 rows selected.
*/

-- 3. UPDATE - Modification de statut
-- Changer le statut de tous les articles "brouillon" créés avant 2024 en "archivé"
UPDATE POSTS 
SET status = 'archived' 
WHERE status = 'draft' 
AND created_at < TO_DATE('2024-01-01', 'YYYY-MM-DD');

-- rep :
-- 0 rows updated.

-- 4. DELETE - Nettoyage des commentaires
-- Supprimer tous les commentaires marqués comme "spam" et datant de plus d'un an
delete from COMMENTS  
where status = 'spam' and created_at < SYSDATE - 365;

-- rep :
-- 3 rows deleted.


/* Niveau 2 : Interrogation de Données
5. WHERE - Filtrage temporel
Récupérer les articles publiés après le 1er décembre 2024
*/
SELECT * FROM POSTS 
WHERE created_at > TO_DATE('2024-12-01', 'YYYY-MM-DD');

-- rep :
no rows selected

-- 6. ORDER BY - Tri chronologique
-- Trier les utilisateurs par date d'inscription (du plus ancien au plus récent)
SELECT * FROM USERS 
ORDER BY created_at;

-- rep:
/*
 ID USERNAME                       EMAIL
---------- ------------------------------ --------------------------------------------------
PASSWORD_HASH                                                                                        ROLE            CREATED_
---------------------------------------------------------------------------------------------------- --------------- --------
         1 admin_blog                     admin@blogcms.com
$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW                                         admin           15/01/24

         2 marie_dubois                   marie.dubois@email.com
$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW                                         editor          10/02/24

         3 pierre_leroy                   pierre.leroy@gmail.com
$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW                                         author          15/02/24

         4 sophie_martin                  sophie.martin@protonmail.com
$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW                                         author          01/03/24

         5 jean_dupont                    jean.dupont@yahoo.fr
$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW                                         author          10/03/24

         6 lucie_bernard                  lucie.bernard@email.com
$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW                                         author          15/03/24

         7 thomas_petit                   thomas.petit@gmail.com
$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW                                         subscriber      20/03/24

         8 julie_roux                     julie.roux@protonmail.com
$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW                                         subscriber      01/04/24

         9 marc_vincent                   marc.vincent@yahoo.fr

        ID USERNAME                       EMAIL
---------- ------------------------------ --------------------------------------------------
PASSWORD_HASH                                                                                        ROLE            CREATED_
---------------------------------------------------------------------------------------------------- --------------- --------
$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW                                         author          05/04/24

        10 isabelle_leroy                 isabelle.leroy@gmail.com
$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW                                         subscriber      10/04/24

        11 david_morel                    david.morel@email.com
$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW                                         author          15/04/24

        12 caroline_duval                 caroline.duval@protonmail.com
$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW                                         editor          02/05/24

        13 nicolas_lambert                nicolas.lambert@gmail.com
$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW                                         author          10/05/24

        14 elodie_garnier                 elodie.garnier@email.com
$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW                                         subscriber      20/05/24

        15 antoine_chevalier              antoine.chevalier@yahoo.fr
$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW                                         author          01/06/24

        16 clara_royer                    clara.royer@protonmail.com
$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW                                         author          10/06/24

        17 quentin_menard                 quentin.menard@gmail.com
$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW                                         subscriber      15/06/24

        ID USERNAME                       EMAIL
---------- ------------------------------ --------------------------------------------------
PASSWORD_HASH                                                                                        ROLE            CREATED_
---------------------------------------------------------------------------------------------------- --------------- --------

        18 amelie_colin                   amelie.colin@email.com
$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW                                         author          03/07/24

        19 vincent_gauthier               vincent.gauthier@protonmail.com
$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW                                         editor          12/07/24

        20 marine_lebrun                  marine.lebrun@gmail.com
$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW                                         subscriber      20/07/24

        21 jdupont                        jean.dupont@email.com
$2y$10$...                                                                                           éditeur         03/12/25


21 rows selected.
*/

-- 7. LIMIT - Articles récents
-- Obtenir les 5 articles les plus récents (seulement titres et dates)
SELECT title, created_at 
FROM POSTS 
ORDER BY created_at DESC 
LIMIT 5;

-- 8. DISTINCT - Rôles uniques
SELECT DISTINCT role 
FROM USERS;

-- rep :
/*
ROLE
---------------
éditeur
subscriber
admin
editor
author
*/


/* Niveau 3 : Opérateurs Logiques
9. AND/OR - Articles par catégorie et statut
Récupérer les articles de la catégorie "Technologie" qui sont soit "publiés", soit en "brouillon avancé"
*/
SELECT p.*, c.name as category_name
FROM POSTS p
JOIN CATEGORIES c ON p.category_id = c.id
WHERE c.name = 'Technologie' AND (p.status = 'published' OR p.status = 'draft');

-- rep :
/*
 ID TITLE
---------- --------------------------------------------------
CONTENT
----------------------------------------------------------------------------------------------------
IMAGE_URL                                          CREATED_ UPDATED_    USER_ID CATEGORY_ID STATUS          VIEW_COUNT CATEGORY_NAME
-------------------------------------------------- -------- -------- ---------- ----------- --------------- ---------- ---------------
         1 Intro PHP
Contenu PHP...
php-intro.jpg                                      10/01/24 10/01/24          1           1 published              150 Technologie

         2 JS Moderne
JS ES6+...
js-modern.jpg                                      15/01/24 15/01/24          2           1 published              200 Technologie

         3 Base SQL
Guide SQL...
sql-guide.jpg                                      05/02/24 05/02/24          3           1 published              180 Technologie

        11 PHP Avancé
PHP OOP...
php-oop.jpg                                        15/03/24 15/03/24          1           1 published              135 Technologie

        12 React Guide
React tuto...
react.jpg                                          20/03/24 20/03/24          2           1 published              210 Technologie

        16 Python Intro
Python fo...
python.jpg                                         10/04/24 10/04/24          6           1 published              275 Technologie

        ID TITLE
---------- --------------------------------------------------
CONTENT
----------------------------------------------------------------------------------------------------
IMAGE_URL                                          CREATED_ UPDATED_    USER_ID CATEGORY_ID STATUS          VIEW_COUNT CATEGORY_NAME
-------------------------------------------------- -------- -------- ---------- ----------- --------------- ---------- ---------------

        19 MySQL Perf
Optimiser...
mysql.jpg                                          25/04/24 25/04/24          9           1 draft                    0 Technologie

        27 Docker
Conteneur...
docker.jpg                                         03/06/24 03/06/24          7           1 published              210 Technologie

        30 IA Débutant
Intro AI...
ai-intro.jpg                                       17/06/24 17/06/24         10           1 published              240 Technologie


9 rows selected.
*/

-- 10. BETWEEN - Commentaires par période
-- Lister les commentaires postés entre le 1er et le 15 décembre 2024
SELECT * 
FROM COMMENTS 
WHERE created_at BETWEEN TO_DATE('2024-12-01', 'YYYY-MM-DD') AND TO_DATE('2024-12-15', 'YYYY-MM-DD');

-- rep :
-- no rows selected

-- 11. IN - Articles par catégories multiples
-- Trouver les articles appartenant aux catégories "PHP", "JavaScript" ou "Base de données"
SELECT p.*, c.name as category_name
FROM POSTS p
JOIN CATEGORIES c ON p.category_id = c.id
WHERE c.name IN ('Technologie', 'Voyage', 'Cuisine');

-- rep : 
/*
 ID TITLE
---------- --------------------------------------------------
CONTENT
----------------------------------------------------------------------------------------------------
IMAGE_URL                                          CREATED_ UPDATED_    USER_ID CATEGORY_ID STATUS          VIEW_COUNT CATEGORY_NAME
-------------------------------------------------- -------- -------- ---------- ----------- --------------- ---------- ---------------
         1 Intro PHP
Contenu PHP...
php-intro.jpg                                      10/01/24 10/01/24          1           1 published              150 Technologie

         2 JS Moderne
JS ES6+...
js-modern.jpg                                      15/01/24 15/01/24          2           1 published              200 Technologie

         3 Base SQL
Guide SQL...
sql-guide.jpg                                      05/02/24 05/02/24          3           1 published              180 Technologie

         5 Recette Fac
Recette cr...
recipe.jpg                                         12/02/24 12/02/24          5           4 published              300 Cuisine

         6 Voyage Maroc
Guide Maro...
morocco.jpg                                        18/02/24 18/02/24          6           3 published              250 Voyage

        11 PHP Avancé
PHP OOP...
php-oop.jpg                                        15/03/24 15/03/24          1           1 published              135 Technologie

        ID TITLE
---------- --------------------------------------------------
CONTENT
----------------------------------------------------------------------------------------------------
IMAGE_URL                                          CREATED_ UPDATED_    USER_ID CATEGORY_ID STATUS          VIEW_COUNT CATEGORY_NAME
-------------------------------------------------- -------- -------- ---------- ----------- --------------- ---------- ---------------

        12 React Guide
React tuto...
react.jpg                                          20/03/24 20/03/24          2           1 published              210 Technologie

        13 Voyage Japon
Guide Japa...
japan.jpg                                          25/03/24 25/03/24          3           3 draft                    0 Voyage

        14 Cuisine Ital
Pâtes rec...
pasta.jpg                                          01/04/24 01/04/24          4           4 published              160 Cuisine

        16 Python Intro
Python fo...
python.jpg                                         10/04/24 10/04/24          6           1 published              275 Technologie

        19 MySQL Perf
Optimiser...
mysql.jpg                                          25/04/24 25/04/24          9           1 draft                    0 Technologie

        21 Voyage Grèce
Îles grecq...

        ID TITLE
---------- --------------------------------------------------
CONTENT
----------------------------------------------------------------------------------------------------
IMAGE_URL                                          CREATED_ UPDATED_    USER_ID CATEGORY_ID STATUS          VIEW_COUNT CATEGORY_NAME
-------------------------------------------------- -------- -------- ---------- ----------- --------------- ---------- ---------------
greece.jpg                                         05/05/24 05/05/24          1           3 published              230 Voyage

        22 Pâtisserie
Desserts...
dessert.jpg                                        10/05/24 10/05/24          2           4 published              165 Cuisine

        27 Docker
Conteneur...
docker.jpg                                         03/06/24 03/06/24          7           1 published              210 Technologie

        28 Vegan
Recettes v...
vegan.jpg                                          08/06/24 08/06/24          8           4 published              185 Cuisine

        30 IA Débutant
Intro AI...
ai-intro.jpg                                       17/06/24 17/06/24         10           1 published              240 Technologie


16 rows selected.
*/

-- 12. LIKE - Recherche par email
SELECT username, email 
FROM USERS 
WHERE email LIKE '%@gmail.com';

-- rep :
/*
USERNAME                       EMAIL
------------------------------ --------------------------------------------------
pierre_leroy                   pierre.leroy@gmail.com
thomas_petit                   thomas.petit@gmail.com
isabelle_leroy                 isabelle.leroy@gmail.com
nicolas_lambert                nicolas.lambert@gmail.com
quentin_menard                 quentin.menard@gmail.com
marine_lebrun                  marine.lebrun@gmail.com

6 rows selected.
*/


/* Niveau 4 : Fonctions d'Agrégation
13. COUNT() - Statistique articles
Compter le nombre total d'articles publiés
*/
SELECT COUNT(*) as total_published_articles
FROM POSTS 
WHERE status = 'published';

/* rep : 
TOTAL_PUBLISHED_ARTICLES
------------------------
                      26
*/

-- 14. COUNT() avec GROUP BY - Articles par catégorie
-- Compter le nombre d'articles par catégorie
SELECT c.name, COUNT(p.id) as article_count
FROM CATEGORIES c
LEFT JOIN POSTS p ON c.id = p.category_id
GROUP BY c.name
ORDER BY article_count DESC;

/* rep : 
NAME            ARTICLE_COUNT
--------------- -------------
Technologie                 9
Cuisine                     4
Sport                       4
Voyage                      3
Finance                     3
Mode                        3
Santé                       2
Éducation                   2

8 rows selected.
*/

-- 15. AVG() - Longueur moyenne des articles
-- Calculer la longueur moyenne (en caractères) des articles publiés
SELECT ROUND(AVG(LENGTH(content)), 2) as avg_content_length
FROM POSTS 
WHERE status = 'published';

/* rep :
AVG_CONTENT_LENGTH
------------------
             12,19
*/

/* 16. MAX()/MIN() - Dates extrêmes
Trouver :
- La date du dernier article publié
- La date du premier commentaire du système
*/
SELECT MAX(created_at) as last_article_date
FROM POSTS 
WHERE status = 'published';
/* LAST_ART
--------
17/06/24
*/

-- La date du premier commentaire
SELECT MIN(created_at) as first_comment_date
FROM COMMENTS;
/* rep : 
FIRST_CO
--------
21/02/24
*/

/* 17. SUM() - Total des vues
Calculer le nombre total de vues de tous les articles
(Si vous avez une colonne `view_count`)*/
SELECT SUM(view_count) as total_views
FROM POSTS 
WHERE status = 'published';

/* rep : TOTAL_VIEWS
-----------
       4765
*/


/* Niveau 5 : Jointures et Relations
18. INNER JOIN - Articles avec auteurs
Lister tous les articles avec :
- Titre de l'article
- Nom de l'auteur
- Date de publication
*/
SELECT 
    p.title,
    u.username as author,
    p.created_at as publication_date
FROM POSTS p
INNER JOIN USERS u ON p.user_id = u.id
ORDER BY p.created_at DESC;

/*19. LEFT JOIN - Catégories complètes
Afficher toutes les catégories, même celles sans articles
Inclure le nombre d'articles par catégorie
*/
SELECT 
    c.name as category_name,
    COUNT(p.id) as article_count
FROM CATEGORIES c
LEFT JOIN POSTS p ON c.id = p.category_id
GROUP BY c.name
ORDER BY c.name;

/*20. Jointure avec agrégation - Productivité des auteurs
Pour chaque utilisateur, afficher :
- Nom d'utilisateur
- Nombre d'articles écrits
- Nombre de commentaires reçus sur ses articles*/
SELECT 
    u.username,
    COUNT(DISTINCT p.id) as articles_written,
    COUNT(DISTINCT c.id) as comments_received
FROM USERS u
LEFT JOIN POSTS p ON u.id = p.user_id
LEFT JOIN COMMENTS c ON p.id = c.post_id
GROUP BY u.id, u.username
HAVING COUNT(DISTINCT p.id) > 0
ORDER BY articles_written DESC;


/*Exercices Contraintes et Avancés
21. Contraintes d'intégrité
Trouver tous les articles sans catégorie assignée
(Résultat devrait être vide si vos contraintes sont bonnes)
*/
SELECT p.* 
FROM POSTS p
LEFT JOIN CATEGORIES c ON p.category_id = c.id
WHERE c.id IS NULL OR p.category_id IS NULL;

/*22. Création de vue - Tableau de bord
Créer une vue "dashboard_articles" qui montre :
- Articles publiés seulement
- Avec nom d'auteur
- Catégorie
- Nombre de commentaires
- Date de dernière modification
*/
CREATE OR REPLACE VIEW dashboard_articles AS
SELECT 
    p.id,
    p.title,
    u.username as author,
    c.name as category,
    (SELECT COUNT(*) FROM COMMENTS cm WHERE cm.post_id = p.id AND cm.status = 'approuvé') as comment_count,
    p.updated_at
FROM POSTS p
JOIN USERS u ON p.user_id = u.id
JOIN CATEGORIES c ON p.category_id = c.id
WHERE p.status = 'published'
ORDER BY p.updated_at DESC;

/*23. HAVING - Catégories populaires
Trouver les catégories ayant plus de 5 articles
*/
SELECT c.name, COUNT(p.id) as article_count
FROM CATEGORIES c
JOIN POSTS p ON c.id = p.category_id
GROUP BY c.name
HAVING COUNT(p.id) > 5;

/*24. Sous-requêtes - Utilisateurs inactifs
Trouver les utilisateurs qui n'ont écrit aucun article
*/
SELECT u.*
FROM USERS u
WHERE u.id NOT IN (
    SELECT DISTINCT user_id 
    FROM POSTS 
    WHERE user_id IS NOT NULL
)
AND u.role IN ('author', 'editor')
ORDER BY u.created_at;

/*25. UPDATE avec jointure - Archivage automatique
Archiver tous les articles dont la catégorie est "Obsolète"
*/
INSERT INTO CATEGORIES (id, name, description) 
VALUES (9, 'Obsolète', 'Articles obsolètes à archiver');

-- Puis archiver les articles
UPDATE POSTS p
SET status = 'archived'
WHERE EXISTS (
    SELECT 1 FROM CATEGORIES c 
    WHERE c.id = p.category_id 
    AND c.name = 'Obsolète'
);


/* Bonus 1 : Analyse de contenu complet
Pour chaque article, afficher :
- Titre de l'article
- Nom de l'auteur
- Nom de la catégorie
- Nombre de commentaires
- Nombre de vues
- Pourcentage d'articles par auteur dans cette catégorie
Ordonné par nombre de commentaires décroissant
*/
WITH article_stats AS (
    SELECT 
        p.id,
        p.title,
        u.username as author,
        c.name as category,
        p.view_count,
        COUNT(DISTINCT cm.id) as comment_count
    FROM POSTS p
    JOIN USERS u ON p.user_id = u.id
    JOIN CATEGORIES c ON p.category_id = c.id
    LEFT JOIN COMMENTS cm ON p.id = cm.post_id
    WHERE p.status = 'published'
    GROUP BY p.id, p.title, u.username, c.name, p.view_count
)
SELECT 
    a.*,
    ROUND(
        (COUNT(*) OVER (PARTITION BY author, category) * 100.0 / 
         NULLIF(COUNT(*) OVER (PARTITION BY author), 0)), 
        2
    ) as author_category_percentage
FROM article_stats a
ORDER BY comment_count DESC NULLS LAST;


/*Bonus 2 : Rapport d'activité mensuel
Créer un rapport mensuel montrant :
- Mois/Année (format: "Janvier 2024")
- Nombre d'articles publiés
- Nombre de nouveaux utilisateurs
- Nombre total de commentaires
- Article le plus commenté du mois
Pour les 6 derniers mois complets*/
WITH monthly_stats AS (
    SELECT 
        TRUNC(created_at, 'MM') as month,
        TO_CHAR(created_at, 'Month YYYY') as month_display
    FROM POSTS
    WHERE status = 'published'
    AND created_at >= ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -6)
    GROUP BY TRUNC(created_at, 'MM'), TO_CHAR(created_at, 'Month YYYY')
)
SELECT 
    m.month_display,
    COUNT(DISTINCT p.id) as articles_published,
    COUNT(DISTINCT u.id) as new_users,
    COUNT(DISTINCT c.id) as total_comments,
    FIRST_VALUE(p.title) OVER (
        PARTITION BY m.month 
        ORDER BY COUNT(cm.id) DESC
    ) as most_commented_article
FROM monthly_stats m
LEFT JOIN POSTS p ON TRUNC(p.created_at, 'MM') = m.month AND p.status = 'published'
LEFT JOIN USERS u ON TRUNC(u.created_at, 'MM') = m.month
LEFT JOIN COMMENTS c ON p.id = c.post_id
LEFT JOIN COMMENTS cm ON p.id = cm.post_id
GROUP BY m.month, m.month_display, p.title
ORDER BY m.month DESC;


/*Bonus 3 : Relations multiples complexes
Trouver tous les utilisateurs qui ont :
1. Écrit au moins 2 articles
2. Reçu des commentaires sur au moins un de leurs articles
3. Ces articles sont dans au moins 2 catégories différentes
Afficher :
- Nom d'utilisateur
- Nombre total d'articles
- Catégories distinctes (sous forme de liste)
- Note moyenne des commentaires reçus*/
WITH qualified_users AS (
    SELECT 
        u.id,
        u.username,
        COUNT(DISTINCT p.id) as total_articles,
        COUNT(DISTINCT p.category_id) as distinct_categories,
        LISTAGG(DISTINCT cat.name, ', ') WITHIN GROUP (ORDER BY cat.name) as categories_list,
        COUNT(DISTINCT cm.id) as total_comments
    FROM USERS u
    LEFT JOIN POSTS p ON u.id = p.user_id
    LEFT JOIN CATEGORIES cat ON p.category_id = cat.id
    LEFT JOIN COMMENTS cm ON p.id = cm.post_id
    WHERE u.role IN ('author', 'editor')
    GROUP BY u.id, u.username
    HAVING 
        COUNT(DISTINCT p.id) >= 2
        AND COUNT(DISTINCT p.category_id) >= 2
        AND COUNT(DISTINCT cm.id) > 0
)
SELECT * FROM qualified_users
ORDER BY total_articles DESC;


/*Bonus 4 : Statistiques avancées par catégorie
Pour chaque catégorie, calculer :
- Nombre total d'articles
- Nombre moyen de commentaires par article
- Date du dernier article publié
- Utilisateur le plus actif (celui qui a écrit le plus d'articles)
- Pourcentage que cette catégorie représente dans le total des articles
Seulement pour les catégories avec plus de 3 articles
Ordonné par activité décroissante
*/
WITH category_details AS (
    SELECT 
        c.id,
        c.name,
        COUNT(DISTINCT p.id) as total_articles,
        COUNT(DISTINCT cm.id) as total_comments,
        MAX(p.created_at) as last_article_date
    FROM CATEGORIES c
    LEFT JOIN POSTS p ON c.id = p.category_id AND p.status = 'published'
    LEFT JOIN COMMENTS cm ON p.id = cm.post_id
    GROUP BY c.id, c.name
),
category_authors AS (
    SELECT 
        p.category_id,
        p.user_id,
        COUNT(*) as article_count,
        ROW_NUMBER() OVER (PARTITION BY p.category_id ORDER BY COUNT(*) DESC) as rank
    FROM POSTS p
    WHERE p.status = 'published'
    GROUP BY p.category_id, p.user_id
),
total_stats AS (
    SELECT COUNT(*) as total_articles
    FROM POSTS 
    WHERE status = 'published'
)
SELECT 
    cd.name as category_name,
    cd.total_articles,
    ROUND(
        CASE 
            WHEN cd.total_articles > 0 THEN cd.total_comments * 1.0 / cd.total_articles
            ELSE 0 
        END, 2
    ) as avg_comments_per_article,
    cd.last_article_date,
    u.username as most_active_user,
    ROUND(
        (cd.total_articles * 100.0 / ts.total_articles), 
        2
    ) as percentage_of_total
FROM category_details cd
CROSS JOIN total_stats ts
LEFT JOIN category_authors ca ON cd.id = ca.category_id AND ca.rank = 1
LEFT JOIN USERS u ON ca.user_id = u.id
WHERE cd.total_articles > 3
ORDER BY cd.total_articles DESC;


/*Bonus 5 : Rapport de modération complet
Créer un rapport de modération incluant :
1. Articles avec des commentaires en attente d'approbation
   (afficher titre article + nombre de commentaires en attente)
2. Commentaires marqués comme spam 
   (avec nom de l'auteur du commentaire et titre de l'article)
3. Utilisateurs avec plus de 3 commentaires rejetés
   (et date de leur dernier commentaire)
4. Articles non modifiés depuis plus d'un an mais toujours publiés
   (suggérer de les archiver)
5. Catégories sans modérateur assigné
Ordonné par priorité de modération
*/
SELECT 
    p.title as article_title,
    COUNT(c.id) as pending_comments_count
FROM POSTS p
JOIN COMMENTS c ON p.id = c.post_id
WHERE c.status = 'en attente'
GROUP BY p.id, p.title
HAVING COUNT(c.id) > 0
ORDER BY pending_comments_count DESC;

-- 2. Commentaires marqués comme spam
SELECT 
    c.content as spam_content,
    c.email as commenter_email,
    p.title as article_title,
    c.created_at
FROM COMMENTS c
JOIN POSTS p ON c.post_id = p.id
WHERE c.status = 'spam'
ORDER BY c.created_at DESC;

-- 3. Utilisateurs avec plus de 3 commentaires rejetés
SELECT 
    u.username,
    u.email,
    COUNT(c.id) as spam_count,
    MAX(c.created_at) as last_spam_date
FROM USERS u
JOIN COMMENTS c ON u.id = c.author_id
WHERE c.status = 'spam'
GROUP BY u.id, u.username, u.email
HAVING COUNT(c.id) > 3
ORDER BY spam_count DESC;

-- 4. Articles non modifiés depuis plus d'un an mais toujours publiés
SELECT 
    p.title,
    c.name as category,
    p.updated_at,
    ROUND(MONTHS_BETWEEN(SYSDATE, p.updated_at)) as months_since_update,
    'À archiver' as recommendation
FROM POSTS p
JOIN CATEGORIES c ON p.category_id = c.id
WHERE p.status = 'published'
AND MONTHS_BETWEEN(SYSDATE, p.updated_at) > 12
ORDER BY months_since_update DESC;

-- 5. Catégories sans modérateur assigné
SELECT 
    cat.name as category_name,
    COUNT(p.id) as article_count,
    'Aucun éditeur assigné' as status
FROM CATEGORIES cat
LEFT JOIN POSTS p ON cat.id = p.category_id
LEFT JOIN USERS u ON p.user_id = u.id AND u.role = 'editor'
WHERE u.id IS NULL
GROUP BY cat.id, cat.name
HAVING COUNT(p.id) > 0
ORDER BY article_count DESC;

