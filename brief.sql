set LINESIZE 150
SET PAGESIZE 30

drop table COMMENTS;
drop table POSTS;
drop table CATEGORIES;
drop table USERS;


/*==============================================================*/
/* Table : UTILISATEUR                                          */
/*==============================================================*/
create table USERS (
    id int primary key,
    username varchar(30) not null UNIQUE,
    email varchar(50) not null UNIQUE,
    password_hash varchar(100) not null,
    role varchar(15) not null,
    created_at date default SYSDATE not null
);

/*==============================================================*/
/* Table : CATEGORIE                                            */
/*==============================================================*/
create table CATEGORIES (
    id int primary key,
    name varchar(15) not null,
    description varchar(200)
);

/*==============================================================*/
/* Table : ARTICLE                                              */
/*==============================================================*/
create table POSTS (
    id int primary key,
    title varchar(50) not null,
    content varchar(100) not null,
    image_url varchar(50) not null,
    created_at date not null,
    updated_at date not null,
    user_id int,
    category_id int,
    status varchar(15),
    view_count int default 0,
    foreign Key (user_id) REFERENCES USERS(id),
    foreign Key (category_id) REFERENCES CATEGORIES(id)
);

/*==============================================================*/
/* Table : COMMENTAIRE                                          */
/*==============================================================*/
create table COMMENTS (
    id int primary key,
    email varchar(50),
    content varchar(100) not null, 
    created_at date not null,
    post_id int,
    status varchar(15) not null,
    author_id int null,
    foreign Key (author_id) REFERENCES USERS(id),
    foreign Key (post_id) REFERENCES POSTS(id)
);

/* Insertion */
-- Insertion des utilisateurs
INSERT INTO users VALUES (1, 'admin_blog', 'admin@blogcms.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'admin', TO_DATE('2024-01-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO users VALUES (2, 'marie_dubois', 'marie.dubois@email.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'editor', TO_DATE('2024-02-10 11:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO users VALUES (3, 'pierre_leroy', 'pierre.leroy@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'author', TO_DATE('2024-02-15 09:15:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO users VALUES (4, 'sophie_martin', 'sophie.martin@protonmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'author', TO_DATE('2024-03-01 14:20:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO users VALUES (5, 'jean_dupont', 'jean.dupont@yahoo.fr', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'author', TO_DATE('2024-03-10 16:45:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO users VALUES (6, 'lucie_bernard', 'lucie.bernard@email.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'author', TO_DATE('2024-03-15 08:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO users VALUES (7, 'thomas_petit', 'thomas.petit@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'subscriber', TO_DATE('2024-03-20 10:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO users VALUES (8, 'julie_roux', 'julie.roux@protonmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'subscriber', TO_DATE('2024-04-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO users VALUES (9, 'marc_vincent', 'marc.vincent@yahoo.fr', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'author', TO_DATE('2024-04-05 15:45:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO users VALUES (10, 'isabelle_leroy', 'isabelle.leroy@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'subscriber', TO_DATE('2024-04-10 18:20:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO users VALUES (11, 'david_morel', 'david.morel@email.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'author', TO_DATE('2024-04-15 09:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO users VALUES (12, 'caroline_duval', 'caroline.duval@protonmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'editor', TO_DATE('2024-05-02 14:10:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO users VALUES (13, 'nicolas_lambert', 'nicolas.lambert@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'author', TO_DATE('2024-05-10 11:45:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO users VALUES (14, 'elodie_garnier', 'elodie.garnier@email.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'subscriber', TO_DATE('2024-05-20 16:30:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO users VALUES (15, 'antoine_chevalier', 'antoine.chevalier@yahoo.fr', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'author', TO_DATE('2024-06-01 08:15:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO users VALUES (16, 'clara_royer', 'clara.royer@protonmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'author', TO_DATE('2024-06-10 10:40:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO users VALUES (17, 'quentin_menard', 'quentin.menard@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'subscriber', TO_DATE('2024-06-15 13:25:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO users VALUES (18, 'amelie_colin', 'amelie.colin@email.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'author', TO_DATE('2024-07-03 17:50:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO users VALUES (19, 'vincent_gauthier', 'vincent.gauthier@protonmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'editor', TO_DATE('2024-07-12 12:05:00', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO users VALUES (20, 'marine_lebrun', 'marine.lebrun@gmail.com', '$2y$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW', 'subscriber', TO_DATE('2024-07-20 15:20:00', 'YYYY-MM-DD HH24:MI:SS'));

-- Insertion des catégories
INSERT INTO CATEGORIES VALUES (1, 'Technologie', 'Actualités, tutoriels et analyses sur les nouvelles technologies');
INSERT INTO CATEGORIES VALUES (2, 'Santé', 'Conseils santé, bien-être et médecine préventive');
INSERT INTO CATEGORIES VALUES (3, 'Voyage', 'Récits de voyage, guides pratiques et conseils touristiques');
INSERT INTO CATEGORIES VALUES (4, 'Cuisine', 'Recettes, techniques culinaires et astuces de cuisine');
INSERT INTO CATEGORIES VALUES (5, 'Sport', 'Actualités sportives, conseils d''entraînement et nutrition');
INSERT INTO CATEGORIES VALUES (6, 'Éducation', 'Pédagogie, conseils d''apprentissage et innovations éducatives');
INSERT INTO CATEGORIES VALUES (7, 'Finance', 'Gestion budgétaire, investissements et actualités économiques');
INSERT INTO CATEGORIES VALUES (8, 'Mode', 'Tendances, conseils style et actualités de la mode');

-- Insertion des articles
INSERT INTO posts VALUES (1, 'Intro PHP', 'Contenu PHP...', 'php-intro.jpg', TO_DATE('2024-01-10 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-01-10 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1, 'published', 150);
INSERT INTO posts VALUES (2, 'JS Moderne', 'JS ES6+...', 'js-modern.jpg', TO_DATE('2024-01-15 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-01-15 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 1, 'published', 200);
INSERT INTO posts VALUES (3, 'Base SQL', 'Guide SQL...', 'sql-guide.jpg', TO_DATE('2024-02-05 11:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-02-05 11:20:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 1, 'published', 180);
INSERT INTO posts VALUES (4, 'Santé Bien', 'Conseils s...', 'health.jpg', TO_DATE('2024-02-10 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-02-10 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 2, 'published', 120);
INSERT INTO posts VALUES (5, 'Recette Fac', 'Recette cr...', 'recipe.jpg', TO_DATE('2024-02-12 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-02-12 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 4, 'published', 300);
INSERT INTO posts VALUES (6, 'Voyage Maroc', 'Guide Maro...', 'morocco.jpg', TO_DATE('2024-02-18 13:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-02-18 13:10:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 3, 'published', 250);
INSERT INTO posts VALUES (7, 'Sport Fitness', 'Exercices...', 'fitness.jpg', TO_DATE('2024-02-22 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-02-22 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 7, 5, 'draft', 0);
INSERT INTO posts VALUES (8, 'Éducation En', 'Pédagogie...', 'education.jpg', TO_DATE('2024-03-01 15:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-01 15:20:00', 'YYYY-MM-DD HH24:MI:SS'), 8, 6, 'published', 175);
INSERT INTO posts VALUES (9, 'Finance Perso', 'Budget ge...', 'finance.jpg', TO_DATE('2024-03-05 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-05 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 9, 7, 'published', 220);
INSERT INTO posts VALUES (10, 'Mode 2024', 'Tendances...', 'fashion.jpg', TO_DATE('2024-03-10 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-10 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 10, 8, 'published', 190);
INSERT INTO posts VALUES (11, 'PHP Avancé', 'PHP OOP...', 'php-oop.jpg', TO_DATE('2024-03-15 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-15 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1, 'published', 135);
INSERT INTO posts VALUES (12, 'React Guide', 'React tuto...', 'react.jpg', TO_DATE('2024-03-20 16:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-20 16:20:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 1, 'published', 210);
INSERT INTO posts VALUES (13, 'Voyage Japon', 'Guide Japa...', 'japan.jpg', TO_DATE('2024-03-25 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-25 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 3, 'draft', 0);
INSERT INTO posts VALUES (14, 'Cuisine Ital', 'Pâtes rec...', 'pasta.jpg', TO_DATE('2024-04-01 09:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-04-01 09:45:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 4, 'published', 160);
INSERT INTO posts VALUES (15, 'Yoga Débutant', 'Yoga base...', 'yoga.jpg', TO_DATE('2024-04-05 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-04-05 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 5, 'published', 110);
INSERT INTO posts VALUES (16, 'Python Intro', 'Python fo...', 'python.jpg', TO_DATE('2024-04-10 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-04-10 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 1, 'published', 275);
INSERT INTO posts VALUES (17, 'Investir', 'Investiss...', 'invest.jpg', TO_DATE('2024-04-15 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-04-15 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), 7, 7, 'published', 195);
INSERT INTO posts VALUES (18, 'Style Hiver', 'Mode hiver...', 'winter.jpg', TO_DATE('2024-04-20 10:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-04-20 10:10:00', 'YYYY-MM-DD HH24:MI:SS'), 8, 8, 'published', 145);
INSERT INTO posts VALUES (19, 'MySQL Perf', 'Optimiser...', 'mysql.jpg', TO_DATE('2024-04-25 15:35:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-04-25 15:35:00', 'YYYY-MM-DD HH24:MI:SS'), 9, 1, 'draft', 0);
INSERT INTO posts VALUES (20, 'Méditation', 'Méditer au...', 'meditation.jpg', TO_DATE('2024-05-01 08:50:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-01 08:50:00', 'YYYY-MM-DD HH24:MI:SS'), 10, 2, 'published', 180);
INSERT INTO posts VALUES (21, 'Voyage Grèce', 'Îles grecq...', 'greece.jpg', TO_DATE('2024-05-05 12:25:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-05 12:25:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 3, 'published', 230);
INSERT INTO posts VALUES (22, 'Pâtisserie', 'Desserts...', 'dessert.jpg', TO_DATE('2024-05-10 16:40:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-10 16:40:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 4, 'published', 165);
INSERT INTO posts VALUES (23, 'Running', 'Course à p...', 'running.jpg', TO_DATE('2024-05-15 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-15 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 5, 'published', 125);
INSERT INTO posts VALUES (24, 'Apprendre', 'Méthodes...', 'learn.jpg', TO_DATE('2024-05-20 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-20 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 6, 'published', 140);
INSERT INTO posts VALUES (25, 'Crypto', 'Cryptomon...', 'crypto.jpg', TO_DATE('2024-05-25 11:55:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-25 11:55:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 7, 'draft', 0);
INSERT INTO posts VALUES (26, 'Style Été', 'Mode été 2...', 'summer.jpg', TO_DATE('2024-05-30 10:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-05-30 10:20:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 8, 'published', 155);
INSERT INTO posts VALUES (27, 'Docker', 'Conteneur...', 'docker.jpg', TO_DATE('2024-06-03 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-06-03 13:45:00', 'YYYY-MM-DD HH24:MI:SS'), 7, 1, 'published', 210);
INSERT INTO posts VALUES (28, 'Vegan', 'Recettes v...', 'vegan.jpg', TO_DATE('2024-06-08 15:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-06-08 15:10:00', 'YYYY-MM-DD HH24:MI:SS'), 8, 4, 'published', 185);
INSERT INTO posts VALUES (29, 'Randonnée', 'Randonnée...', 'hiking.jpg', TO_DATE('2024-06-12 09:35:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-06-12 09:35:00', 'YYYY-MM-DD HH24:MI:SS'), 9, 5, 'published', 120);
INSERT INTO posts VALUES (30, 'IA Débutant', 'Intro AI...', 'ai-intro.jpg', TO_DATE('2024-06-17 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-06-17 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 10, 1, 'published', 240);

-- Insertion des commentaires
INSERT INTO comments VALUES (1, 'jean.martin@email.com', 'Excellent article, très bien documenté !', TO_DATE('2024-02-21 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 'approuvé', 1);
INSERT INTO comments VALUES (2, 'sophie.leroy@gmail.com', 'Je ne suis pas tout à fait d''accord sur certains points.', TO_DATE('2024-02-22 15:45:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 'approuvé', 2);
INSERT INTO comments VALUES (3, 'thomas.dubois@protonmail.com', 'Cela m''a beaucoup aidé, merci pour ces conseils.', TO_DATE('2024-02-25 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 'approuvé', 3);
INSERT INTO comments VALUES (4, 'marie.petit@yahoo.fr', 'Très bel article, les photos sont magnifiques !', TO_DATE('2024-02-26 10:15:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 'en attente', 4);
INSERT INTO comments VALUES (5, 'pierre.bernard@gmail.com', 'Je trouve que certains conseils sont dangereux.', TO_DATE('2024-02-27 14:20:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 'spam', 5);
INSERT INTO comments VALUES (6, 'julie.vincent@email.com', 'Parfait pour les débutants comme moi, merci !', TO_DATE('2024-02-28 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 'approuvé', 6);
INSERT INTO comments VALUES (7, 'marc.roux@protonmail.com', 'Très détaillé, j''ai appris beaucoup de choses.', TO_DATE('2024-02-29 09:45:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 'approuvé', 7);
INSERT INTO comments VALUES (8, 'isabelle.morel@yahoo.fr', 'C''est exactement ce que je cherchais, merci !', TO_DATE('2024-03-01 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 7, 'approuvé', 8);
INSERT INTO comments VALUES (9, 'david.colin@gmail.com', 'Je ne comprends pas la partie sur les investissements.', TO_DATE('2024-03-02 16:15:00', 'YYYY-MM-DD HH24:MI:SS'), 8, 'en attente', 9);
INSERT INTO comments VALUES (10, 'caroline.lambert@email.com', 'Super article, j''ai hâte de lire la suite !', TO_DATE('2024-03-03 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), 9, 'approuvé', 10);
INSERT INTO comments VALUES (11, 'nicolas.garnier@protonmail.com', 'Les tendances présentées sont déjà dépassées.', TO_DATE('2024-03-04 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 10, 'spam', 11);
INSERT INTO comments VALUES (12, 'elodie.chevalier@yahoo.fr', 'Je vais essayer la recette ce week-end !', TO_DATE('2024-03-05 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 11, 'approuvé', 12);
INSERT INTO comments VALUES (13, 'antoine.royer@gmail.com', 'Bonnes astuces pour économiser, merci.', TO_DATE('2024-03-06 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 'approuvé', 13);
INSERT INTO comments VALUES (14, 'clara.menard@email.com', 'Le style minimaliste n''est pas pour tout le monde.', TO_DATE('2024-03-07 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), 13, 'en attente', 14);
INSERT INTO comments VALUES (15, 'quentin.gauthier@protonmail.com', 'Très bon tutoriel sur l''IA pour débutants.', TO_DATE('2024-03-08 11:45:00', 'YYYY-MM-DD HH24:MI:SS'), 14, 'approuvé', 15);
INSERT INTO comments VALUES (16, 'amelie.lebrun@yahoo.fr', 'La méditation a changé ma vie, merci pour l''article.', TO_DATE('2024-03-09 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 15, 'approuvé', 16);
INSERT INTO comments VALUES (17, 'vincent.martin@gmail.com', 'Voyager avec un petit budget c''est possible !', TO_DATE('2024-03-10 13:15:00', 'YYYY-MM-DD HH24:MI:SS'), 16, 'approuvé', 17);
INSERT INTO comments VALUES (18, 'marine.dubois@email.com', 'Les plats marocains sont délicieux, merci.', TO_DATE('2024-03-11 16:30:00', 'YYYY-MM-DD HH24:MI:SS'), 17, 'en attente', 18);
INSERT INTO comments VALUES (19, 'alexandre.leroy@protonmail.com', 'Je me prépare pour le ski, merci pour les conseils.', TO_DATE('2024-03-12 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), 18, 'approuvé', 19);
INSERT INTO comments VALUES (20, 'sarah.petit@yahoo.fr', 'Quelles applications recommandez-vous pour les enfants ?', TO_DATE('2024-03-13 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 19, 'approuvé', 20);
INSERT INTO comments VALUES (21, 'paul.bernard@gmail.com', 'La bourse me fait peur, merci pour les explications.', TO_DATE('2024-03-14 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), 20, 'approuvé', 1);
INSERT INTO comments VALUES (22, 'laura.vincent@email.com', 'Je cherche justement un style casual chic, merci !', TO_DATE('2024-03-15 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), 21, 'en attente', 2);
INSERT INTO comments VALUES (23, 'mathieu.roux@protonmail.com', 'Important de parler de sécurité informatique.', TO_DATE('2024-03-16 15:45:00', 'YYYY-MM-DD HH24:MI:SS'), 22, 'approuvé', 3);
INSERT INTO comments VALUES (24, 'emma.morel@yahoo.fr', 'Je dors mal, merci pour ces conseils.', TO_DATE('2024-03-17 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 23, 'approuvé', 4);
INSERT INTO comments VALUES (25, 'hugo.colin@gmail.com', 'J''ai visité certains villages, ils sont magnifiques !', TO_DATE('2024-03-18 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), 24, 'approuvé', 5);

