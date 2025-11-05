INSERT INTO User_ VALUES(
2,
'Arturo',
'arturosql@gmail.com',
MD5('hola12345'),
'2025-08-25',
'Mexico',
true
);

Insert Into User_
(username, email, password_hash, date_joined, country, is_verified
) VALUES ('arthurhackc4u', 'prueba2@gmail.com', SHA2('contraseña', 256),'2025-08-25', 'Mexico', false);

INSERT Into Channel_ (channel_id, user_id, name_, description_, created_at
)VALUES (2, '1', 'moran', 'canal de prueba', '2025-08-25');

INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized)
VALUES (2, 'Mi primer Video', 'Video de prueba', '2025-08-25', 'mytube.com', '21389139', 320, false);

INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized)
VALUES (4, 'SIMRACING', 'rank', '2025-08-26', 'mytube.1398u1', '0', 560, false);

INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Mi primer Video', 'Video de prueba', '2025-08-25', 'mytube.com/1', '21389139', 320, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Tutorial de SQL', 'Aprende SQL básico', '2025-08-25', 'mytube.com/2', '120394', 450, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Vlog de Viaje', 'Visitando la playa', '2025-08-25', 'mytube.com/3', '89342', 600, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Receta Fácil', 'Cómo hacer pasta', '2025-08-25', 'mytube.com/4', '23456', 300, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Unboxing', 'Abriendo un paquete', '2025-08-25', 'mytube.com/5', '56789', 420, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Review de Gadget', 'Probando nuevo teléfono', '2025-08-25', 'mytube.com/6', '67890', 510, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Gameplay', 'Jugando Minecraft', '2025-08-25', 'mytube.com/7', '78901', 900, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Noticias', 'Resumen semanal', '2025-08-25', 'mytube.com/8', '89012', 360, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Podcast', 'Charlando con amigos', '2025-08-25', 'mytube.com/9', '90123', 1800, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Corto Animado', 'Animación divertida', '2025-08-25', 'mytube.com/10', '12345', 120, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 191', 'Descripción 191', '2025-08-25', 'mytube.com/191', '191000', 191, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 192', 'Descripción 192', '2025-08-25', 'mytube.com/192', '192000', 192, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 193', 'Descripción 193', '2025-08-25', 'mytube.com/193', '193000', 193, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 194', 'Descripción 194', '2025-08-25', 'mytube.com/194', '194000', 194, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 195', 'Descripción 195', '2025-08-25', 'mytube.com/195', '195000', 195, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 196', 'Descripción 196', '2025-08-25', 'mytube.com/196', '196000', 196, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 197', 'Descripción 197', '2025-08-25', 'mytube.com/197', '197000', 197, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 198', 'Descripción 198', '2025-08-25', 'mytube.com/198', '198000', 198, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 199', 'Descripción 199', '2025-08-25', 'mytube.com/199', '199000', 199, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 200', 'Descripción 200', '2025-08-25', 'mytube.com/200', '200000', 200, true);

INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 201', 'Descripción 201', '2025-08-25', 'mytube.com/201', '201000', 201, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 202', 'Descripción 202', '2025-08-25', 'mytube.com/202', '202000', 202, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 203', 'Descripción 203', '2025-08-25', 'mytube.com/203', '203000', 203, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 204', 'Descripción 204', '2025-08-25', 'mytube.com/204', '204000', 204, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 205', 'Descripción 205', '2025-08-25', 'mytube.com/205', '205000', 205, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 206', 'Descripción 206', '2025-08-25', 'mytube.com/206', '206000', 206, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 207', 'Descripción 207', '2025-08-25', 'mytube.com/207', '207000', 207, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 208', 'Descripción 208', '2025-08-25', 'mytube.com/208', '208000', 208, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 209', 'Descripción 209', '2025-08-25', 'mytube.com/209', '209000', 209, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 210', 'Descripción 210', '2025-08-25', 'mytube.com/210', '210000', 210, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 211', 'Descripción 211', '2025-08-25', 'mytube.com/211', '211000', 211, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 212', 'Descripción 212', '2025-08-25', 'mytube.com/212', '212000', 212, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 213', 'Descripción 213', '2025-08-25', 'mytube.com/213', '213000', 213, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 214', 'Descripción 214', '2025-08-25', 'mytube.com/214', '214000', 214, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 215', 'Descripción 215', '2025-08-25', 'mytube.com/215', '215000', 215, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 216', 'Descripción 216', '2025-08-25', 'mytube.com/216', '216000', 216, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 217', 'Descripción 217', '2025-08-25', 'mytube.com/217', '217000', 217, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 218', 'Descripción 218', '2025-08-25', 'mytube.com/218', '218000', 218, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 219', 'Descripción 219', '2025-08-25', 'mytube.com/219', '219000', 219, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 220', 'Descripción 220', '2025-08-25', 'mytube.com/220', '220000', 220, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 1', 'Descripción 1', '2025-08-25', 'mytube.com/1', '1001', 101, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 2', 'Descripción 2', '2025-08-25', 'mytube.com/2', '1002', 102, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 3', 'Descripción 3', '2025-08-25', 'mytube.com/3', '1003', 103, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 4', 'Descripción 4', '2025-08-25', 'mytube.com/4', '1004', 104, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 5', 'Descripción 5', '2025-08-25', 'mytube.com/5', '1005', 105, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 6', 'Descripción 6', '2025-08-25', 'mytube.com/6', '1006', 106, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 7', 'Descripción 7', '2025-08-25', 'mytube.com/7', '1007', 107, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 8', 'Descripción 8', '2025-08-25', 'mytube.com/8', '1008', 108, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 9', 'Descripción 9', '2025-08-25', 'mytube.com/9', '1009', 109, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 10', 'Descripción 10', '2025-08-25', 'mytube.com/10', '1010', 110, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 11', 'Descripción 11', '2025-08-25', 'mytube.com/11', '1011', 111, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 12', 'Descripción 12', '2025-08-25', 'mytube.com/12', '1012', 112, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 13', 'Descripción 13', '2025-08-25', 'mytube.com/13', '1013', 113, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 14', 'Descripción 14', '2025-08-25', 'mytube.com/14', '1014', 114, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 15', 'Descripción 15', '2025-08-25', 'mytube.com/15', '1015', 115, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 16', 'Descripción 16', '2025-08-25', 'mytube.com/16', '1016', 116, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 17', 'Descripción 17', '2025-08-25', 'mytube.com/17', '1017', 117, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 18', 'Descripción 18', '2025-08-25', 'mytube.com/18', '1018', 118, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 19', 'Descripción 19', '2025-08-25', 'mytube.com/19', '1019', 119, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 20', 'Descripción 20', '2025-08-25', 'mytube.com/20', '1020', 120, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 21', 'Descripción 21', '2025-08-25', 'mytube.com/21', '1021', 121, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 22', 'Descripción 22', '2025-08-25', 'mytube.com/22', '1022', 122, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 23', 'Descripción 23', '2025-08-25', 'mytube.com/23', '1023', 123, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 24', 'Descripción 24', '2025-08-25', 'mytube.com/24', '1024', 124, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 25', 'Descripción 25', '2025-08-25', 'mytube.com/25', '1025', 125, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 26', 'Descripción 26', '2025-08-25', 'mytube.com/26', '1026', 126, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 27', 'Descripción 27', '2025-08-25', 'mytube.com/27', '1027', 127, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 28', 'Descripción 28', '2025-08-25', 'mytube.com/28', '1028', 128, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 29', 'Descripción 29', '2025-08-25', 'mytube.com/29', '1029', 129, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 30', 'Descripción 30', '2025-08-25', 'mytube.com/30', '1030', 130, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 31', 'Descripción 31', '2025-08-25', 'mytube.com/31', '1031', 131, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 32', 'Descripción 32', '2025-08-25', 'mytube.com/32', '1032', 132, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 33', 'Descripción 33', '2025-08-25', 'mytube.com/33', '1033', 133, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 34', 'Descripción 34', '2025-08-25', 'mytube.com/34', '1034', 134, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 35', 'Descripción 35', '2025-08-25', 'mytube.com/35', '1035', 135, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 36', 'Descripción 36', '2025-08-25', 'mytube.com/36', '1036', 136, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 37', 'Descripción 37', '2025-08-25', 'mytube.com/37', '1037', 137, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 38', 'Descripción 38', '2025-08-25', 'mytube.com/38', '1038', 138, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 39', 'Descripción 39', '2025-08-25', 'mytube.com/39', '1039', 139, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 40', 'Descripción 40', '2025-08-25', 'mytube.com/40', '1040', 140, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 41', 'Descripción 41', '2025-08-25', 'mytube.com/41', '1041', 141, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 42', 'Descripción 42', '2025-08-25', 'mytube.com/42', '1042', 142, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 43', 'Descripción 43', '2025-08-25', 'mytube.com/43', '1043', 143, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 44', 'Descripción 44', '2025-08-25', 'mytube.com/44', '1044', 144, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 45', 'Descripción 45', '2025-08-25', 'mytube.com/45', '1045', 145, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 46', 'Descripción 46', '2025-08-25', 'mytube.com/46', '1046', 146, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 47', 'Descripción 47', '2025-08-25', 'mytube.com/47', '1047', 147, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 48', 'Descripción 48', '2025-08-25', 'mytube.com/48', '1048', 148, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 49', 'Descripción 49', '2025-08-25', 'mytube.com/49', '1049', 149, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 50', 'Descripción 50', '2025-08-25', 'mytube.com/50', '1050', 150, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 51', 'Descripción 51', '2025-08-25', 'mytube.com/51', '1051', 151, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 52', 'Descripción 52', '2025-08-25', 'mytube.com/52', '1052', 152, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 53', 'Descripción 53', '2025-08-25', 'mytube.com/53', '1053', 153, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 54', 'Descripción 54', '2025-08-25', 'mytube.com/54', '1054', 154, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 55', 'Descripción 55', '2025-08-25', 'mytube.com/55', '1055', 155, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 56', 'Descripción 56', '2025-08-25', 'mytube.com/56', '1056', 156, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 57', 'Descripción 57', '2025-08-25', 'mytube.com/57', '1057', 157, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 58', 'Descripción 58', '2025-08-25', 'mytube.com/58', '1058', 158, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 59', 'Descripción 59', '2025-08-25', 'mytube.com/59', '1059', 159, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 60', 'Descripción 60', '2025-08-25', 'mytube.com/60', '1060', 160, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 61', 'Descripción 61', '2025-08-25', 'mytube.com/61', '1061', 161, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 62', 'Descripción 62', '2025-08-25', 'mytube.com/62', '1062', 162, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 63', 'Descripción 63', '2025-08-25', 'mytube.com/63', '1063', 163, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 64', 'Descripción 64', '2025-08-25', 'mytube.com/64', '1064', 164, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 65', 'Descripción 65', '2025-08-25', 'mytube.com/65', '1065', 165, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 66', 'Descripción 66', '2025-08-25', 'mytube.com/66', '1066', 166, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 67', 'Descripción 67', '2025-08-25', 'mytube.com/67', '1067', 167, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 68', 'Descripción 68', '2025-08-25', 'mytube.com/68', '1068', 168, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 69', 'Descripción 69', '2025-08-25', 'mytube.com/69', '1069', 169, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 70', 'Descripción 70', '2025-08-25', 'mytube.com/70', '1070', 170, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 71', 'Descripción 71', '2025-08-25', 'mytube.com/71', '1071', 171, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 72', 'Descripción 72', '2025-08-25', 'mytube.com/72', '1072', 172, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 73', 'Descripción 73', '2025-08-25', 'mytube.com/73', '1073', 173, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 74', 'Descripción 74', '2025-08-25', 'mytube.com/74', '1074', 174, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 75', 'Descripción 75', '2025-08-25', 'mytube.com/75', '1075', 175, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 76', 'Descripción 76', '2025-08-25', 'mytube.com/76', '1076', 176, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 77', 'Descripción 77', '2025-08-25', 'mytube.com/77', '1077', 177, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 78', 'Descripción 78', '2025-08-25', 'mytube.com/78', '1078', 178, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 79', 'Descripción 79', '2025-08-25', 'mytube.com/79', '1079', 179, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 80', 'Descripción 80', '2025-08-25', 'mytube.com/80', '1080', 180, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 81', 'Descripción 81', '2025-08-25', 'mytube.com/81', '1081', 181, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 82', 'Descripción 82', '2025-08-25', 'mytube.com/82', '1082', 182, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 83', 'Descripción 83', '2025-08-25', 'mytube.com/83', '1083', 183, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 84', 'Descripción 84', '2025-08-25', 'mytube.com/84', '1084', 184, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 85', 'Descripción 85', '2025-08-25', 'mytube.com/85', '1085', 185, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 86', 'Descripción 86', '2025-08-25', 'mytube.com/86', '1086', 186, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 87', 'Descripción 87', '2025-08-25', 'mytube.com/87', '1087', 187, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 88', 'Descripción 88', '2025-08-25', 'mytube.com/88', '1088', 188, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 89', 'Descripción 89', '2025-08-25', 'mytube.com/89', '1089', 189, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 90', 'Descripción 90', '2025-08-25', 'mytube.com/90', '1090', 190, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 91', 'Descripción 91', '2025-08-25', 'mytube.com/91', '1091', 191, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 92', 'Descripción 92', '2025-08-25', 'mytube.com/92', '1092', 192, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 93', 'Descripción 93', '2025-08-25', 'mytube.com/93', '1093', 193, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 94', 'Descripción 94', '2025-08-25', 'mytube.com/94', '1094', 194, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 95', 'Descripción 95', '2025-08-25', 'mytube.com/95', '1095', 195, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 96', 'Descripción 96', '2025-08-25', 'mytube.com/96', '1096', 196, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 97', 'Descripción 97', '2025-08-25', 'mytube.com/97', '1097', 197, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 98', 'Descripción 98', '2025-08-25', 'mytube.com/98', '1098', 198, true);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 99', 'Descripción 99', '2025-08-25', 'mytube.com/99', '1099', 199, false);
INSERT INTO Videos (channel_id, title, description_, upload_date, url, views, duration_second, is_monetized) VALUES (2, 'Video 100', 'Descripción 100', '2025-08-25', 'mytube.com/100', '1100', 200, true);