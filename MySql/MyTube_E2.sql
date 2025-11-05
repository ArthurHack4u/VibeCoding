-- Equipo:
-- Inurreta Del Valle Rafael Enrique
-- Moran Escalante Arturo Brayan
-- Gonzales Mass ^2

DROP DATABASE IF EXISTS MyTube_E2;
CREATE DATABASE MyTube_E2;
USE MyTube_E2;
-- Tabla: usuario
-- Tabla: Categoria
CREATE TABLE Categoria (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Tabla: usuario
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(150) NOT NULL UNIQUE,
    contrasena VARCHAR(150) NOT NULL,
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    categoria_usuario INT NOT NULL,
    CONSTRAINT fk_usuario_categoria FOREIGN KEY (categoria_usuario) REFERENCES Categoria(id_categoria)
);

-- Tabla: canal
CREATE TABLE canal (
    id_canal INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT NULL,
    suscriptores INT DEFAULT 0,
    like_totales INT DEFAULT 0,
    usuario INT NOT NULL,
    CONSTRAINT fk_canal_usuario FOREIGN KEY (usuario) REFERENCES usuario(id_usuario)
);

-- Tabla: video
CREATE TABLE video (
    id_video INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    descripcion TEXT NULL,
    ruta_video VARCHAR(255) NOT NULL,
    miniatura VARCHAR(255) NULL,
    calidad VARCHAR(50) NULL,
    subtitulos BOOLEAN DEFAULT FALSE,
    fecha_publicacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    monetizacion BOOLEAN DEFAULT FALSE,
    retencion DECIMAL(5,2) NULL,
    duracion INT NOT NULL,
    visibilidad VARCHAR(20) NOT NULL,
    vistas INT DEFAULT 0,
    reacciones INT DEFAULT 0,
    canal INT NOT NULL,
    categoria INT NOT NULL,
    CONSTRAINT fk_video_canal FOREIGN KEY (canal) REFERENCES canal(id_canal),
    CONSTRAINT fk_video_categoria FOREIGN KEY (categoria) REFERENCES Categoria(id_categoria)
);

-- Tabla: Comentario
CREATE TABLE Comentario (
    id_comentario INT AUTO_INCREMENT PRIMARY KEY,
    texto TEXT NOT NULL,
    fecha DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    likes INT DEFAULT 0,
    usuario INT NOT NULL,
    video INT NOT NULL,
    id_respuesta INT NULL,
    CONSTRAINT fk_comentario_usuario FOREIGN KEY (usuario) REFERENCES usuario(id_usuario),
    CONSTRAINT fk_comentario_video FOREIGN KEY (video) REFERENCES video(id_video),
    CONSTRAINT fk_comentario_respuesta FOREIGN KEY (id_respuesta) REFERENCES Comentario(id_comentario)
);

-- Tabla: Historial
CREATE TABLE Historial (
    id_historial INT AUTO_INCREMENT PRIMARY KEY,
    usuario INT NOT NULL,
    video INT NOT NULL,
    tiempo_reproduccion INT NOT NULL,
    fecha_visto DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_historial_usuario FOREIGN KEY (usuario) REFERENCES usuario(id_usuario),
    CONSTRAINT fk_historial_video FOREIGN KEY (video) REFERENCES video(id_video)
);

-- Tabla: Anuncio
CREATE TABLE Anuncio (
    id_anuncio INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(100) NOT NULL,
    enlace VARCHAR(255) NULL,
    tiempo_duracion INT NOT NULL,
    categoria_usuario INT NOT NULL,
    CONSTRAINT fk_anuncio_categoria FOREIGN KEY (categoria_usuario) REFERENCES Categoria(id_categoria)
);

-- Tabla: Lista_Reproduccion
CREATE TABLE Lista_Reproduccion (
    id_lista INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT NULL,
    usuario INT NOT NULL,
    CONSTRAINT fk_lista_usuario FOREIGN KEY (usuario) REFERENCES usuario(id_usuario)
);

-- Tabla: Lista_Video
CREATE TABLE Lista_Video (
    id_lista_video INT AUTO_INCREMENT PRIMARY KEY,
    lista INT NOT NULL,
    video INT NOT NULL,
    CONSTRAINT fk_listavideo_lista FOREIGN KEY (lista) REFERENCES Lista_Reproduccion(id_lista),
    CONSTRAINT fk_listavideo_video FOREIGN KEY (video) REFERENCES video(id_video)
);

SHOW TABLES;
SELECT * FROM Categoria;
SELECT * FROM usuario;
SELECT * FROM canal;
SELECT * FROM video;
SELECT * FROM Comentario;
SELECT * FROM Historial;
SELECT * FROM Anuncio;
SELECT * FROM Lista_Reproduccion;
SELECT * FROM Lista_Video;