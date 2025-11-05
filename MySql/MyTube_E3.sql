-- Integrantes Equipo 3
-- César Antonio Ix Sánchez
-- David Cervantes Malfavon
-- Jose Manuel Castillo Queh
-- Sergio David Foster Medina
-- Fernando Adriano Sabido Quijano

CREATE DATABASE MyTube_E3;
USE MyTube_E3;

CREATE TABLE User_ (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    date_joined DATE,
    country VARCHAR(255),
    is_verified BOOLEAN
);

CREATE TABLE Channel_ (
    channel_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    name_ VARCHAR(255) NOT NULL,
    description_ VARCHAR(255),
    created_at VARCHAR(255),
    
    FOREIGN KEY (user_id) REFERENCES User_ (user_id)
);

CREATE TABLE Videos (
	videos_id INT PRIMARY KEY AUTO_INCREMENT,
    channel_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description_ VARCHAR(255),
    upload_date VARCHAR(255),
    url VARCHAR(255) NOT NULL,
    views INT,
    duration_second INT,
    is_monetized BOOLEAN,
    
    FOREIGN KEY(channel_id) REFERENCES Channel_(channel_id)
);

CREATE TABLE Playlist (
	playlist_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    videos_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description_ VARCHAR(255),
    created_at VARCHAR(255),
    position_ INT,
    
    FOREIGN KEY(user_id) REFERENCES User_(user_id),
    FOREIGN KEY(videos_id) REFERENCES Videos(videos_id)
);

CREATE TABLE Watch_History (
	history_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
	title VARCHAR(255),
    videos_id INT NOT NULL,
    watched_at DATETIME NOT NULL,
    progress_seconds INT,
    
    FOREIGN KEY(user_id) REFERENCES User_(user_id),
    FOREIGN KEY(videos_id) REFERENCES Videos(videos_id)
);

CREATE TABLE Comments (
	comment_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
	posted_at DATETIME NOT NULL,
    text_ VARCHAR(255) NOT NULL,
    
    FOREIGN KEY(user_id) REFERENCES User_(user_id)
);

CREATE TABLE Reacciona (
	reaction_id INT PRIMARY KEY AUTO_INCREMENT,
	videos_id INT NOT NULL,
    user_id INT NOT NULL,
    type_ VARCHAR(255) NOT NULL,
    created_at DATETIME,
    
    FOREIGN KEY(user_id) REFERENCES User_(user_id),
    FOREIGN KEY(videos_id) REFERENCES Videos(videos_id)
);

CREATE TABLE Ads (
	ad_id INT PRIMARY KEY AUTO_INCREMENT,
	advertiser INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    url VARCHAR(255) NOT NULL,
    budget_usd FLOAT
);

CREATE TABLE Video_Stats (
	stat_id INT PRIMARY KEY AUTO_INCREMENT,
	videos_id INT NOT NULL,
    date_ DATE NOT NULL,
    views INT NOT NULL,
    ad_clicks INT,
    revenue_usd FLOAT,
    
    FOREIGN KEY(videos_id) REFERENCES Videos(videos_id)
);