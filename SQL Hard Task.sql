CREATE DATABASE Cinema
USE Cinema

CREATE	TABLE Genres
(
  Id int identity(1,1) PRIMARY KEY,
  [Name] nvarchar(250) NOT NULL
)

CREATE TABLE Actors
(
 Id int identity(1,1) PRIMARY KEY,
 [Name] nvarchar(50),
 Surname nvarchar(60),
 Age int
)
CREATE TABLE Films
(
  Id int identity(1,1) PRIMARY KEY,
  [Name] nvarchar(50),
  ReleaseDate date
)
CREATE TABLE FilmActors
(
  Id int identity(1,1) PRIMARY KEY,
  FilmId int references Films(Id),
  ActorId int references Actors(Id)
)
CREATE TABLE Customer
(
  Id int identity(1,1) PRIMARY KEY,
  [Name] nvarchar(50),
  Surname nvarchar(60),
  Age int
)
CREATE TABLE Sessionss
( 
 Id int identity(1,1) PRIMARY KEY,
 [Time] time
)
CREATE TABLE FilmGenres
(
  Id int identity(1,1) PRIMARY KEY,
  FilmId int references Films(Id),
  GenreId int references Genres(Id)
)
CREATE TABLE Hall
(
  Id int identity(1,1) PRIMARY KEY,
  [Name] nvarchar(50),
  SeatCount int
)
CREATE TABLE Tickets
(
  Id int identity(1,1) PRIMARY KEY,
  SoldDate datetime,
  Price decimal,
  Place int,
  CustomerId int references Customer(Id),
  HallId int references Hall(Id),
  FilmId int references Films(Id),
  SessionId int references Sessionss(Id)
)

--SELECT * FROM Tickets
--SELECT * FROM Hall
--SELECT * FROM Actors
--SELECT * FROM FilmActors
--SELECT * FROM FilmGenres
--SELECT * FROM Films
--SELECT * FROM Customer
--SELECT * FROM Sessionss
--SELECT * FROM Genres