
DROP DATABASE IF EXISTS ArtGalery;
CREATE DATABASE ArtGalery;
USE ArtGalery;

CREATE TABLE Artist (
    artistId INT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    interviewDate DATE,
    interviewerName VARCHAR(50),
    areaCode CHAR(3),
    telephoneNumber CHAR(10),
    street VARCHAR(100),
    zip CHAR(5),
    salesLastYear DECIMAL(10,2),
    salesYearToDate DECIMAL(10,2),
    socialSecurityNumber CHAR(11),
    usualMedium VARCHAR(50),
    usualStyle VARCHAR(50),
    usualType VARCHAR(50)
);

CREATE TABLE Zips (
    zip CHAR(5) PRIMARY KEY,
    city VARCHAR(50),
    state CHAR(2)
);

CREATE TABLE PotentialCustomer (
    potentialCustomerId INT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    areaCode CHAR(3),
    telephoneNumber CHAR(10),
    street VARCHAR(100),
    zip CHAR(5),
    dateFilledIn DATE,
    preferredArtistId INT,
    preferredMedium VARCHAR(50),
    preferredStyle VARCHAR(50),
    preferredType VARCHAR(50)
);

CREATE TABLE Artwork (
    artworkId INT PRIMARY KEY,
    artistId INT,
    workTitle VARCHAR(100),
    askingPrice DECIMAL(10,2),
    dateListed DATE,
    dateReturned DATE,
    dateShown DATE,
    status VARCHAR(20),
    workMedium VARCHAR(50),
    workSize VARCHAR(50),
    workStyle VARCHAR(50),
    workType VARCHAR(50),
    workYearCompleted INT,
    collectorSocialSecurityNumber CHAR(11)
);

CREATE TABLE ShownIn (
    artworkId INT,
    showTitle VARCHAR(100),
    PRIMARY KEY (artworkId, showTitle)
);

CREATE TABLE Collector (
    socialSecurityNumber CHAR(11) PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    street VARCHAR(100),
    zip CHAR(5),
    interviewDate DATE,
    interviewerName VARCHAR(50),
    areaCode CHAR(3),
    telephoneNumber CHAR(10),
    salesLastYear DECIMAL(10,2),
    salesYearToDate DECIMAL(10,2),
    collectionArtistId INT,
    collectionMedium VARCHAR(50),
    collectionStyle VARCHAR(50),
    collectionType VARCHAR(50)
);

CREATE TABLE Shoow (
    showTitle VARCHAR(100) PRIMARY KEY,
    showFeaturedArtistId INT,
    showClosingDate DATE,
    showTheme VARCHAR(100),
    showOpeningDate DATE
);

CREATE TABLE Buyer (
    buyerId INT PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    street VARCHAR(100),
    zip CHAR(5),
    areaCode CHAR(3),
    telephoneNumber CHAR(10),
    purchasesLastYear DECIMAL(10,2),
    purchasesYearToDate DECIMAL(10,2)
);

CREATE TABLE Sale (
    invoiceNumber INT PRIMARY KEY,
    artworkId INT,
    amountRemittedToOwner DECIMAL(10,2),
    saleDate DATE,
    salePrice DECIMAL(10,2),
    saleTax DECIMAL(10,2),
    buyerId INT,
    salespersonSocialSecurityNumber CHAR(11)
);

CREATE TABLE Salesperson (
    socialSecurityNumber CHAR(11) PRIMARY KEY,
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    street VARCHAR(100),
    zip CHAR(5)
);
