

use usuariocredencial;

-- 2. Tablas Semilla en MySQL 

-- Tabla Semilla nombre
CREATE TABLE Semilla_Nombre (
	ID INT PRIMARY KEY,
    Nombre VARCHAR(50)
);

INSERT INTO Semilla_Nombre (ID, Nombre) VALUES
(1, 'María'), (2, 'Juan'), (3, 'Lucía'), (4, 'Carlos'), (5, 'Sofía'), (6, 'Pedro'), (7, 'Valentina'), (8, 'Julián'), 
(9, 'Camila'),  (10, 'Mateo'),(11, 'Florencia'), (12, 'Tomás'), (13, 'Martina'), (14, 'Agustín'), (15, 'Paula'), 
(16, 'Benjamín'), (17, 'Antonella'), (18, 'Facundo'), (19, 'Julieta'), (20, 'Diego'), (21, 'Milagros'),(22, 'Nicolás'),(23, 'Abril'),
(24, 'Lautaro'),(25, 'Micaela'), (26, 'Franco'), (27, 'Agustina'), (28, 'Bruno'), (29, 'Carla'), (30, 'Emiliano'),
(31, 'Melina'), (32, 'Lucas'), (33, 'Josefina'), (34, 'Iván'), (35, 'Renata'), (36, 'Gonzalo'), (37, 'Bianca'), (38, 'Ramiro'),
(39, 'Catalina'), (40, 'Santiago'), (41, 'Ailén'), (42, 'Nahuel'), (43, 'Malena'), (44, 'Ivana'), (45, 'Leandro'), (46, 'Selena'),
(47, 'Federico'), (48, 'Noelia'), (49, 'Alan'), (50, 'Juliana'), (51, 'Ariana'), (52, 'Bautista'), (53, 'Celeste'), (54, 'Damián'),
(55, 'Elena'), (56, 'Esteban'), (57, 'Gabriela'), (58, 'Hernán'), (59, 'Isabel'), (60, 'Joaquín'), (61, 'Karina'), (62, 'Leonardo'),
(63, 'Marina'), (64, 'Nicolás'), (65, 'Olivia'), (66, 'Pablo'), (67, 'Rocío'), (68, 'Sergio'), (69, 'Tamara'), (70, 'Ulises'),
(71, 'Verónica'), (72, 'Walter'), (73, 'Ximena'), (74, 'Yamila'), (75, 'Zoe'), (76, 'Adrián'), (77, 'Brenda'), (78, 'Ciro'),
(79, 'Daniela'), (80, 'Ezequiel'), (81, 'Fiorella'), (82, 'Gustavo'), (83, 'Helena'), (84, 'Ignacio'), (85, 'Jimena'), (86, 'Kevin'),
(87, 'Lorena'), (88, 'Manuel'), (89, 'Nadia'), (90, 'Oscar'), (91, 'Patricia'), (92, 'Raúl'), (93, 'Sabrina'),
(94, 'Thiago'), (95, 'Uma'), (96, 'Valentín'), (97, 'Wanda'), (98, 'Xavier'), (99, 'Yanina'), (100, 'Zacarías'), (101, 'Aarón'), (102, 'Abigail'), (103, 'Adriana'), (104, 'Alan'), (105, 'Alba'),
(106, 'Alberto'), (107, 'Alejandra'), (108, 'Alejandro'), (109, 'Alexia'), (110, 'Alfredo'),
(111, 'Alicia'), (112, 'Amparo'), (113, 'Andrés'), (114, 'Aníbal'), (115, 'Anita'),
(116, 'Ariadna'), (117, 'Armando'), (118, 'Arturo'), (119, 'Azul'), (120, 'Beatriz'),
(121, 'Belén'), (122, 'Bernardo'), (123, 'Berta'), (124, 'Blanca'), (125, 'Brisa'),
(126, 'Candelaria'), (127, 'Carina'), (128, 'Carmen'), (129, 'Cecilia'), (130, 'Celina'),
(131, 'Cintia'), (132, 'Clara'), (133, 'Claudio'), (134, 'Clemente'), (135, 'Conrado'),
(136, 'Cristina'), (137, 'Dafne'), (138, 'Dalia'), (139, 'Darío'), (140, 'Débora'),
(141, 'Delfina'), (142, 'Denis'), (143, 'Diana'), (144, 'Dino'), (145, 'Dolores'),
(146, 'Eduardo'), (147, 'Elías'), (148, 'Elsa'), (149, 'Emilia'), (150, 'Emilio'),
(151, 'Erika'), (152, 'Ernesto'), (153, 'Estela'), (154, 'Eugenia'), (155, 'Eulalia'),
(156, 'Eva'), (157, 'Evelyn'), (158, 'Fabio'), (159, 'Fabiola'), (160, 'Fátima'),
(161, 'Felipe'), (162, 'Fermín'), (163, 'Flavio'), (164, 'Frida'), (165, 'Gaspar'),
(166, 'Genaro'), (167, 'Geraldine'), (168, 'Gerardo'), (169, 'Gilda'), (170, 'Graciela'),
(171, 'Gregorio'), (172, 'Guadalupe'), (173, 'Guido'), (174, 'Héctor'), (175, 'Hilda'),
(176, 'Homero'), (177, 'Hugo'), (178, 'Inés'), (179, 'Irina'), (180, 'Ismael'),
(181, 'Jacinta'), (182, 'Jazmín'), (183, 'Jeremías'), (184, 'Jesica'), (185, 'Jesús'),
(186, 'Joaquina'), (187, 'Jonás'), (188, 'Josefa'), (189, 'Josué'), (190, 'Juana'),
(191, 'Justina'), (192, 'Karen'), (193, 'Katia'), (194, 'Kiara'), (195, 'Lara'),
(196, 'Laura'), (197, 'Leila'), (198, 'Leticia'), (199, 'Lidia'), (200, 'Lila'),
(201, 'Lisandro'), (202, 'Lola'), (203, 'Lorena'), (204, 'Lourdes'), (205, 'Luciana'),
(206, 'Lucrecia'), (207, 'Luis'), (208, 'Luisa'), (209, 'Luján'), (210, 'Luna'),
(211, 'Magalí'), (212, 'Maia'), (213, 'Manuela'), (214, 'Marcela'), (215, 'Marcos'),
(216, 'Margarita'), (217, 'Mariano'), (218, 'Marilina'), (219, 'Matías'), (220, 'Maximiliano'),
(221, 'Mercedes'), (222, 'Miranda'), (223, 'Miriam'), (224, 'Moisés'), (225, 'Morena'),
(226, 'Nahir'), (227, 'Naiara'), (228, 'Nancy'), (229, 'Natacha'), (230, 'Nayla'),
(231, 'Nélida'), (232, 'Nerea'), (233, 'Nicolasa'), (234, 'Noemí'), (235, 'Norberto'),
(236, 'Norma'), (237, 'Octavio'), (238, 'Ofelia'), (239, 'Oriana'), (240, 'Osvaldo'),
(241, 'Pascual'), (242, 'Paulina'), (243, 'Paz'), (244, 'Pedro'), (245, 'Penélope'),
(246, 'Priscila'), (247, 'Rafael'), (248, 'Ramona'), (249, 'Rebeca'), (250, 'Reina'),
(251, 'Renzo'), (252, 'Ricardo'), (253, 'Rita'), (254, 'Roberto'), (255, 'Rogelio'),
(256, 'Rosa'), (257, 'Rosalía'), (258, 'Rubén'), (259, 'Rufina'), (260, 'Salvador'),
(261, 'Samuel'), (262, 'Sandra'), (263, 'Sebastián'), (264, 'Selva'), (265, 'Silvia'),
(266, 'Simón'), (267, 'Soledad'), (268, 'Susana'), (269, 'Tadeo'), (270, 'Teodoro'),
(271, 'Teresa'), (272, 'Tobías'), (273, 'Trinidad'), (274, 'Ubaldo'), (275, 'Úrsula'),
(276, 'Valeria'), (277, 'Vicente'), (278, 'Violeta'), (279, 'Virginia'), (280, 'Viviana'),
(281, 'Wilfredo'), (282, 'Xaviera'), (283, 'Xiomara'), (284, 'Yésica'), (285, 'Yolanda'),
(286, 'Yoselin'), (287, 'Yuliana'), (288, 'Zaira'), (289, 'Zenaida'), (290, 'Zulema'),
(291, 'Aitana'), (292, 'Alina'), (293, 'Amira'), (294, 'Anabella'), (295, 'Anselmo'),
(296, 'Araceli'), (297, 'Ariadne'), (298, 'Aurelio'), (299, 'Ayelén'), (300, 'Azucena'),
(301, 'Bárbara'), (302, 'Benedicto'), (303, 'Betina'), (304, 'Blas'), (305, 'Bruno'),
(306, 'Calixto'), (307, 'Candela'), (308, 'Carolina'), (309, 'Casandra'), (310, 'Cayetano'),
(311, 'Ciro'), (312, 'Clotilde'), (313, 'Cristian'), (314, 'Damián'), (315, 'Dante'),
(316, 'Delia'), (317, 'Diana'), (318, 'Dora'), (319, 'Edgardo'), (320, 'Elba'),
(321, 'Elvio'), (322, 'Emilce'), (323, 'Ernesto'), (324, 'Esther'), (325, 'Eugenio'),
(326, 'Eusebio'), (327, 'Fabiana'), (328, 'Felicitas'), (329, 'Fermina'), (330, 'Flora'),
(331, 'Francisca'), (332, 'Gaspar'), (333, 'Genoveva'), (334, 'Gerardo'), (335, 'Gilberto'),
(336, 'Griselda'), (337, 'Guillermo'), (338, 'Héctor'), (339, 'Herminia'), (340, 'Hilda'),
(341, 'Hipólito'), (342, 'Horacio'), (343, 'Ignacio'), (344, 'Irma'), (345, 'Isidoro'),
(346, 'Jacinta'), (347, 'Jazmín'), (348, 'Jenifer'), (349, 'Jesús'), (350, 'Joaquina'),
(351, 'Jorge'), (352, 'Josefa'), (353, 'Juanita'), (354, 'Julio'), (355, 'Justina'),
(356, 'Lázaro'), (357, 'Leonor'), (358, 'Lidia'), (359, 'Lisandro'), (360, 'Lorenzo'),
(361, 'Lucio'), (362, 'Luisa'), (363, 'Magdalena'), (364, 'Manuel'), (365, 'Marcelo'),
(366, 'Marcos'), (367, 'Maruja'), (368, 'Matilde'), (369, 'Maximiliano'), (370, 'Melisa'),
(371, 'Mercedes'), (472, 'Mauro'), (473, 'Melina'), (474, 'Mía'), (475, 'Mireya'), (476, 'Moisés'),
(477, 'Nadia'), (478, 'Nahuel'), (479, 'Nancy'), (480, 'Natalia'), (481, 'Nayra'),
(482, 'Nélida'), (483, 'Nerea'), (484, 'Nicolás'), (485, 'Nilda'), (486, 'Noemí'),
(487, 'Norberto'), (488, 'Norma'), (489, 'Octavio'), (490, 'Olga'), (491, 'Orlando'),
(492, 'Oscar'), (493, 'Osvaldo'), (494, 'Pablo'), (495, 'Pamela'), (496, 'Patricio'),
(497, 'Paula'), (498, 'Pedro'), (499, 'Penélope'), (500, 'Pía'), (501, 'Pilar'),
(502, 'Ramiro'), (503, 'Raquel'), (504, 'Reinaldo'), (505, 'Renata'), (506, 'Ricardo'),
(507, 'Rita'), (508, 'Roberto'), (509, 'Rocío'), (510, 'Rodrigo'), (511, 'Román'),
(512, 'Romina'), (513, 'Rosa'), (514, 'Rubén'), (515, 'Salvador'), (516, 'Samuel'),
(517, 'Sandra'), (518, 'Sebastián'), (519, 'Selena'), (520, 'Sergio'), (521, 'Silvana'),
(522, 'Silvia'), (523, 'Simón'), (524, 'Soledad'), (525, 'Sofía'), (526, 'Susana'),
(527, 'Tamara'), (528, 'Tatiana'), (529, 'Teodoro'), (530, 'Teresa'), (531, 'Thiago'),
(532, 'Tomás'), (533, 'Trinidad'), (534, 'Ulises'), (535, 'Úrsula'), (536, 'Valentina'),
(537, 'Valeria'), (538, 'Valentín'), (539, 'Vanesa'), (540, 'Verónica'), (541, 'Vicente'),
(542, 'Victoria'), (543, 'Violeta'), (544, 'Virginia'), (545, 'Viviana'), (546, 'Walter'),
(547, 'Wanda'), (548, 'Wilfredo'), (549, 'Xaviera'), (550, 'Ximena'), (551, 'Xiomara'),
(552, 'Yamila'), (553, 'Yanina'), (554, 'Yésica'), (555, 'Yolanda'), (556, 'Yoselin'),
(557, 'Yuliana'), (558, 'Zaira'), (559, 'Zenaida'), (560, 'Zoe'), (561, 'Zoraida'),
(562, 'Zulema'), (563, 'Adela'), (564, 'Adrián'), (565, 'Aída'), (566, 'Ailén'),
(567, 'Aixa'), (568, 'Alba'), (569, 'Aldana'), (570, 'Alejo'), (571, 'Alina'),
(572, 'Alma'), (573, 'Amalia'), (574, 'Amira'), (575, 'Anahí'), (576, 'Anastasia'),
(577, 'Aníbal'), (578, 'Anselmo'), (579, 'Antonia'), (580, 'Araceli'), (581, 'Ariadna'),
(582, 'Aurelio'), (583, 'Ayelén'), (584, 'Azucena'), (585, 'Bárbara'), (586, 'Bautista'),
(587, 'Benedicto'), (588, 'Betina'), (589, 'Blas'), (590, 'Candela'), (591, 'Carina'),
(592, 'Casandra'), (593, 'Cayetano'), (594, 'Clotilde'), (595, 'Cristian'), (596, 'Dante'),
(597, 'Delia'), (598, 'Dora'), (599, 'Edgardo'), (600, 'Elba');

--  Tabla Semilla de apellidos
CREATE TABLE Semilla_Apellido (
    ID INT PRIMARY KEY,
    Apellido VARCHAR(50)
);


INSERT INTO Semilla_Apellido (ID, Apellido) VALUES
(1, 'Gómez'), (2, 'Pérez'), (3, 'Rodríguez'), (4, 'López'), (5, 'Martínez'), (6, 'Fernández'), (7, 'García'), (8, 'Sánchez'),
(9, 'Romero'), (10, 'Díaz'), (11, 'Torres'), (12, 'Ramírez'), (13, 'Flores'), (14, 'Acosta'), (15, 'Castro'), (16, 'Silva'),
(17, 'Ortiz'), (18, 'Molina'), (19, 'Ramos'), (20, 'Vera'), (21, 'Ruiz'), (22, 'Herrera'), (23, 'Medina'), (24, 'Morales'),
(25, 'Delgado'), (26, 'Cabrera'), (27, 'Ibarra'), (28, 'Vargas'), (29, 'Aguirre'), (30, 'Peralta'), (31, 'Navarro'), (32, 'Ríos'),
(33, 'Ponce'), (34, 'Suárez'), (35, 'Correa'), (36, 'Méndez'), (37, 'Barrios'), (38, 'Carrizo'), (39, 'Ferreyra'), (40, 'Benítez'), 
(41, 'Luna'), (42, 'Villalba'), (43, 'Quiroga'), (44, 'Sosa'), (45, 'Ojeda'), (46, 'Palacios'), (47, 'Figueroa'), (48, 'Montenegro'),
(49, 'Arce'), (50, 'Escobar'), (51, 'Alonso'), (52, 'Bermúdez'), (53, 'Córdoba'), (54, 'Domínguez'), (55, 'Escudero'), (56, 'Farias'),
(57, 'Gaitán'), (58, 'Hidalgo'), (59, 'Insúa'), (60, 'Jofré'), (61, 'Krause'), (62, 'Ledesma'), (63, 'Maldonado'), (64, 'Núñez'),
(65, 'Ocampo'), (66, 'Paredes'), (67, 'Quiñones'), (68, 'Riquelme'), (69, 'Serrano'), (70, 'Téllez'), (71, 'Ulloa'), (72, 'Valdez'),
(73, 'Wagner'), (74, 'Ximenes'), (75, 'Yañez'), (76, 'Zárate'), (77, 'Altamirano'), (78, 'Bustos'), (79, 'Cáceres'), 
(80, 'Del Valle'), (81, 'Espinoza'), (82, 'Figueroa'), (83, 'Giménez'), (84, 'Herrero'), (85, 'Iglesias'), (86, 'Juárez'),
(87, 'Klein'), (88, 'López'), (89, 'Montoya'), (90, 'Navarrete'), (91, 'Ojeda'), (92, 'Pizarro'), (93, 'Quinteros'),
(94, 'Roldán'), (95, 'Soria'), (96, 'Tapia'), (97, 'Urquiza'), (98, 'Villarreal'), (99, 'Weiss'), (100, 'Zúñiga'), (101, 'Abadie'), (102, 'Acevedo'), (103, 'Aguilera'), (104, 'Alarcón'), (105, 'Albornoz'),
(106, 'Almada'), (107, 'Almonte'), (108, 'Amaya'), (109, 'Améndola'), (110, 'Anaya'),
(111, 'Andrada'), (112, 'Antúnez'), (113, 'Aponte'), (114, 'Aragón'), (115, 'Aranda'),
(116, 'Aravena'), (117, 'Arévalo'), (118, 'Argüello'), (119, 'Arias'), (120, 'Arismendi'),
(121, 'Arrieta'), (122, 'Astorga'), (123, 'Avellaneda'), (124, 'Ayala'), (125, 'Azcurra'),
(126, 'Báez'), (127, 'Balbuena'), (128, 'Ballesteros'), (129, 'Barboza'), (130, 'Barragán'),
(131, 'Barrenechea'), (132, 'Barrios'), (133, 'Bartolomé'), (134, 'Basualdo'), (135, 'Batista'),
(136, 'Bazán'), (137, 'Bejarano'), (138, 'Beltrán'), (139, 'Berardi'), (140, 'Berazategui'),
(141, 'Bermejo'), (142, 'Bertone'), (143, 'Bidegain'), (144, 'Bignone'), (145, 'Blanco'),
(146, 'Bobadilla'), (147, 'Bonilla'), (148, 'Borja'), (149, 'Bosch'), (150, 'Bracamonte'),
(151, 'Bragado'), (152, 'Bravo'), (153, 'Brizuela'), (154, 'Burgos'), (155, 'Bustamante'),
(156, 'Caballero'), (157, 'Cabrales'), (158, 'Cáceres'), (159, 'Calderón'), (160, 'Calvo'),
(161, 'Camaño'), (162, 'Campbell'), (163, 'Campos'), (164, 'Canales'), (165, 'Cantero'),
(166, 'Cárdenas'), (167, 'Cardozo'), (168, 'Carranza'), (169, 'Carvajal'), (170, 'Casal'),
(171, 'Castañeda'), (172, 'Castellanos'), (173, 'Castiglione'), (174, 'Cattaneo'), (175, 'Cavallero'),
(176, 'Cayetano'), (177, 'Ceballos'), (178, 'Centurión'), (179, 'Cepeda'), (180, 'Cerda'),
(181, 'Cervantes'), (182, 'Chávez'), (183, 'Chirino'), (184, 'Cisneros'), (185, 'Clavijo'),
(186, 'Clemente'), (187, 'Cobo'), (188, 'Colombo'), (189, 'Colque'), (190, 'Comas'),
(191, 'Conde'), (192, 'Contreras'), (193, 'Corbalán'), (194, 'Cornejo'), (195, 'Coronel'),
(196, 'Cortés'), (197, 'Costilla'), (198, 'Crespo'), (199, 'Cuevas'), (200, 'Curcio'),
(201, 'Dávalos'), (202, 'De la Cruz'), (203, 'Del Canto'), (204, 'Del Río'), (205, 'Delgado'),
(206, 'Delmastro'), (207, 'Díaz Vélez'), (208, 'Diéguez'), (209, 'Duarte'), (210, 'Duhalde'),
(211, 'Durán'), (212, 'Echegaray'), (213, 'Echeverría'), (214, 'Elizalde'), (215, 'Encina'),
(216, 'Escalante'), (217, 'Espinosa'), (218, 'Estigarribia'), (219, 'Etcheverry'), (220, 'Falcón'),
(221, 'Fariña'), (222, 'Fasano'), (223, 'Favre'), (224, 'Feijoo'), (225, 'Fernández Paz'),
(226, 'Ferrari'), (227, 'Figueroa'), (228, 'Filippini'), (229, 'Fiorito'), (230, 'Fonseca'),
(231, 'Franco'), (232, 'Frías'), (233, 'Funes'), (234, 'Gaitán'), (235, 'Galán'),
(236, 'Gallego'), (237, 'Gallo'), (238, 'Gamarra'), (239, 'Gandolfo'), (240, 'García Lorca'),
(241, 'Garrido'), (242, 'Gaviria'), (243, 'Genta'), (244, 'Giaccone'), (245, 'Giménez'),
(246, 'Godoy'), (247, 'Gómez Ríos'), (248, 'González'), (249, 'Gracia'), (250, 'Granados'),
(251, 'Grassi'), (252, 'Gregorio'), (253, 'Grimaldi'), (254, 'Guerrero'), (255, 'Guillén'),
(256, 'Guzmán'), (257, 'Haedo'), (258, 'Herranz'), (259, 'Hidalgo'), (260, 'Iglesias'),
(261, 'Iriarte'), (262, 'Iturbe'), (263, 'Izaguirre'), (264, 'Jacinto'), (265, 'Jara'),
(266, 'Jofré'), (267, 'Juárez'), (268, 'Kaufman'), (269, 'Klein'), (270, 'Kraemer'),
(271, 'Lagos'), (272, 'Lamas'), (273, 'Landa'), (274, 'Lanzillotta'), (275, 'Larrea'),
(276, 'Laspina'), (277, 'Latorre'), (278, 'Leiva'), (279, 'Lemos'), (280, 'Lescano'),
(281, 'Lestido'), (282, 'Lezcano'), (283, 'Lima'), (284, 'Linares'), (285, 'Lloveras'),
(286, 'Lozano'), (287, 'Lucero'), (288, 'Luján'), (289, 'Luna'), (290, 'Maciel'),
(291, 'Maidana'), (292, 'Malaspina'), (293, 'Maldonado'), (294, 'Manrique'), (295, 'Marchetti'),
(296, 'Mariani'), (297, 'Marino'), (298, 'Marquez'), (299, 'Martel'), (300, 'Mas'),
(301, 'Massera'), (302, 'Matamala'), (303, 'Maturana'), (304, 'Medrano'), (305, 'Mejía'),
(306, 'Melgarejo'), (307, 'Menéndez'), (308, 'Merino'), (309, 'Mesa'), (310, 'Michelini'),
(311, 'Milla'), (312, 'Miranda'), (313, 'Molina Campos'), (314, 'Monasterio'), (315, 'Montero'),
(316, 'Montes'), (317, 'Moreno'), (318, 'Moyano'), (319, 'Mujica'), (320, 'Muñoz'),
(321, 'Murillo'), (322, 'Naranjo'), (323, 'Navia'), (324, 'Neira'), (325, 'Noriega'),
(326, 'Obando'), (327, 'Obregón'), (328, 'Olguín'), (329, 'Olivera'), (330, 'Ordoñez'),
(331, 'Orfila'), (332, 'Ortega'), (333, 'Ortubia'), (334, 'Osorio'), (335, 'Otero'),
(336, 'Oviedo'), (337, 'Pacheco'), (338, 'Padilla'), (339, 'Pagani'), (340, 'Palavecino'),
(341, 'Paniagua'), (342, 'Parodi'), (343, 'Parra'), (344, 'Pasquini'), (345, 'Patiño'),
(346, 'Peñaloza'), (347, 'Perdomo'), (348, 'Pereira'), (349, 'Perugini'), (350, 'Piedrabuena'),
(351, 'Pineda'), (352, 'Pizarro'), (353, 'Plaza'), (354, 'Portillo'), (355, 'Posse'),
(356, 'Prado'), (498, 'Zambrano'), (499, 'Zeballos'), (500, 'Zorrilla');



-- 3. Carga masiva
-- *********************************************************************************
-- ** SCRIPT DE CARGA MASIVA OPTIMIZADO: ELIMINA EL BUCLE 'WHILE' POR INEFICIENCIA **
-- *********************************************************************************

DELIMITER //

CREATE PROCEDURE GenerarUsuariosYCredenciales(IN cantidad INT)

BEGIN
    -- Declaramos una variable de sesión para llevar el conteo de forma secuencial
    SET @row_number = COALESCE((SELECT MAX(id) FROM usuario), 0);

    -- 1. INSERT INTO Usuario: Generación masiva en una sola transacción
    INSERT INTO usuario (
        eliminado, nombre, apellido, username, email, activo, fechaRegistro
    )
    SELECT
        -- Eliminado: 0 (fijo)
        0,
        
        -- Nombre y Apellido: Uso eficiente del JOIN + RAND() para selección al azar
        sn.Nombre,
        sa.Apellido,
        
        -- Username y Email: Se garantiza unicidad con una variable de sesión secuencial
        CONCAT('usuario', (@row_number := @row_number + 1)),
        CONCAT('correo', @row_number, '@dominio.com'),
        
        -- Activo: 95% activo
        IF(RAND() < 0.95, 1, 0),
        
        -- Fecha de Registro: Pseudoaleatoriedad con sesgo (hasta 5 años atrás)
        DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 365 * 5) DAY)
        
    FROM
        -- Truco para generar N filas (JOIN de tablas pequeñas del sistema)
        information_schema.tables AS t1
    CROSS JOIN
        information_schema.tables AS t2
    -- Hay que asegurarse de que las tablas semilla tengan suficientes combinaciones
    CROSS JOIN Semilla_Nombre sn
    CROSS JOIN Semilla_Apellido sa
    -- La clave es el LIMIT
    LIMIT cantidad;

    -- 2. INSERT INTO CredencialAcceso: Enlaza todas las credenciales con los nuevos usuarios
    INSERT INTO credencial (
        id_usuario, eliminado, contraseña, salt, ultimo_cambio, require_reset
    )
    SELECT
        u.id, -- Capturamos el ID_Usuario que AUTO_INCREMENT acaba de generar
        0, -- Eliminado
        SHA2(CONCAT(RAND(), u.id), 256), -- Contraseña hasheada (simulación)
        SUBSTRING(MD5(RAND()), 1, 8), -- Salt (simulación)
        DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 365) DAY), -- Último cambio (hasta 1 año)
        IF(RAND() < 0.1, 1, 0) -- Requiere reset (10% de sesgo)
    FROM
        usuario u
    WHERE
        u.id > (COALESCE((SELECT MAX(id) FROM usuario) - cantidad, 0));
        
END //

DELIMITER ;

-- *********************************************************************************
-- ** LLAMADA **
-- *********************************************************************************
-- Esto generará 300000 filas en segundos, evitando el time-out
CALL GenerarUsuariosYCredenciales(300000); 



-----------------------------------------------
-- El siguiente bloque solo se debe ejecutar si se quiere vacíar las tablas con las combinaciones

-- BLOQUE DE GENERACIÓN DE DATOS DE PRUEBA

-- 1. Desactiva temporalmente el chequeo de Claves Foráneas.
--    Esto permite TRUNCATE la tabla 'usuario' (la referenciada) sin fallar.
SET FOREIGN_KEY_CHECKS = 0;

-- 2. Limpieza de Tablas (IMPORTANTE: Mantiene el DROP/CREATE simple)
TRUNCATE TABLE credencial;
TRUNCATE TABLE usuario;

-- 3. Reactiva el chequeo de Claves Foráneas.
--    Esto es crucial para que los INSERTs en el procedimiento respeten las reglas.
SET FOREIGN_KEY_CHECKS = 1;

-- 4. Ejecuta el procedimiento para poblar las tablas
CALL GenerarUsuariosYCredenciales(300000);
