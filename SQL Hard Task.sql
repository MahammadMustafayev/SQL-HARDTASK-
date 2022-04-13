CREATE DATABASE Cinema
USE Cinema

CREATE	TABLE Genres
(
  Id int identity(1,1) PRIMARY KEY,
  [Name] nvarchar(250) NOT NULL
)
INSERT INTO Genres(Name)
VALUES ('Action'),
       ('Horror'),
	   ('Comedy'),
	   ('Romance'),
	   ('Drama'),
	   ('Historic'),
	   ('Fantasy')

CREATE TABLE Actors
(
 Id int identity(1,1) PRIMARY KEY,
 [Name] nvarchar(50),
 Surname nvarchar(60),
 Age int
)

INSERT INTO Actors(Name,Surname,Age)
VALUES ('Will','Smith',53),
      ('Tom','Hanks',65),
	  ('Leonardo','Dicaprio',47),
	  ('Morgan ','Freeman',84),
	  ('Johnny','Depp',58),
	  ('Keanu ','Reeves',57),
	  ('Benedict','Cumberbatch',45),
	  ('Jennifer ','Lawrence',31),
	  ('Scarlett','Johansson',37),
	  ('Nicole','Kidman',54)
CREATE TABLE Films
(
  Id int identity(1,1) PRIMARY KEY,
  [Name] nvarchar(50),
  ReleaseDate date
)
INSERT INTO Films(Name,ReleaseDate)
VALUES ('GodFather',1974-03-14),
      ('Shawshank',1994-11-13),
      ('Lord of Rings',2003-12-03),
     ('Inception',2010-06-13),
	 ('The Matrix',1999-03-24)
CREATE TABLE FilmActors
(
  Id int identity(1,1) PRIMARY KEY,
  FilmId int references Films(Id),
  ActorId int references Actors(Id)
)
INSERT INTO FilmActors(FilmId,ActorId)
VALUES  (2,4),
        (5,6),
		(3,10),
		(4,7),
		(1,3)
CREATE TABLE Customer
(
  Id int identity(1,1) PRIMARY KEY,
  [Name] nvarchar(50),
  Surname nvarchar(60),
  Age int
)
INSERT INTO Customer(Name,Surname,Age)
VALUES  ('Şəmsəddin','Amanov',21),
       ('Anar','Qandayev',20),
	   ('Ayşə','Uluxanova',20),
	   ('Əsgər','Babayev',21),
	   ('Gülər','Rəsulova',24)
CREATE TABLE Sessionss
( 
 Id int identity(1,1) PRIMARY KEY,
 [Time] time
)
INSERT INTO Sessionss(Time)
VALUES (17:05:00),
       (17:00:00),
	   (17:25:00),
	   (12:10:00),
	   (19:50:00),
	   (22:35:00),
	   (22:25:00),
	   (23:15:00),
	   (23:20:00),
	   (19:50:00)
CREATE TABLE FilmGenres
(
  Id int identity(1,1) PRIMARY KEY,
  FilmId int references Films(Id),
  GenreId int references Genres(Id)
)
INSERT INTO FilmGenres(FilmId,GenreId)
VALUES (1,2),
       (3,6),
	   (4,5),
	   (2,4)
	  
CREATE TABLE Hall
(
  Id int identity(1,1) PRIMARY KEY,
  [Name] nvarchar(50),
  SeatCount int
)
INSERT INTO Hall (Name,SeatCount)
VALUES ('Deniz Mall',169),
       ('28 Mall',213),
	   ('Sumqayıt',110),
	   ('Gənclik Mall',145)
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
INSERT INTO Tickets(SoldDate,Price,Place,CustomerId,HallId,FilmId,SessionId)
VALUES (2022-12-12 00:00:00.000,7,3,1,2,5,2),
       (2022-03-04 00:00:00.000,5,1,2,3,1,10),
	   (2022-04-13 00:00:00.000,5,4,3,3,2,5),
	   (2022-04-13 00:00:00.000,6,5,3,4,4,5)

CREATE TABLE BuyTicket
(
  Id int identity(1,1) PRIMARY KEY,
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

--1--
--CREATE PROCEDURE usp_BuyTicket @HallId int,@SessionId int, @FilmId int,@CustomerId int
--AS
--INSERT INTO BuyTicket(HallId,SessionId,FilmId,CustomerId)
--VALUES (@HallId,@SessionId,@FilmId,@CustomerId)
--SELECT * FROM Tickets
--WHERE HallId=@HallId and SessionId=@SessionId and FilmId=@FilmId and CustomerId=@CustomerId

--EXEC usp_BuyTicket 1,2,3,4


--2--

--CREATE FUNCTION GetEmptySeat (@HallId int,@SessionId int)
--RETURNS int
--AS
--BEGIN 
--     DECLARE @Count int
--	 SELECT @Count =COUNT(*) FROM Tickets WHERE HallId < @HallId and SessionId < @SessionId
--	 RETURN @Count
--END

--SELECT dbo.GetEmptySeat(1,3)