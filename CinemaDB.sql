CREATE DATABASE CinemaDB

USE CinemaDB

CREATE TABLE Movies
(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(20),
	Duration INT
)

INSERT INTO Movies
VALUES
('Spider man 1', 2),
('Spider man 2', 5),
('Spider man 3', 6),
('Spider man 4', 8),
('Spider man 5', 10),
('Spider man Back Home', 18),
('Spider man last', 20)

CREATE TABLE Actors
(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(20),
	Surname NVARCHAR(20)
)

INSERT INTO Actors
VALUES
('Andrew', 'Garfield'),
('Tobey', 'Magiure'),
('Tom', 'Holland'),
('Max', 'Charles'),
('Xosqedem', 'Hidayetqizi'),
('Jim', 'Kerry'),
('Alim', 'Qasimov'),
('Elcin', 'Babayev'),
('Abdulla', 'Qasimov'),
('Astan', 'Qasimov'),
('Azer', 'Qasimov'),
('Azad', 'Qasimov')


CREATE TABLE Genres
(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(20)
)

INSERT INTO Genres
VALUES
('Drama'),
('Romantic'),
('Comedy'),
('Thriller')

CREATE TABLE MoviesActors
(
	Id INT PRIMARY KEY IDENTITY,
	ActorId INT FOREIGN KEY REFERENCES Actors(Id),
	MovieId INT FOREIGN KEY REFERENCES Movies(Id)
)

INSERT INTO MoviesActors
VALUES
(1,1),
(1,2),
(2,3),
(3,3),
(1,4),
(4,5),
(5,6),
(6,7),
(7,4),
(7,1),
(6,2),
(5,4)

CREATE TABLE MoviesGenres
(
	Id INT PRIMARY KEY IDENTITY,
	MovieId INT FOREIGN KEY REFERENCES Movies(Id),
	GenreId INT FOREIGN KEY REFERENCES Genres(Id)
)

INSERT INTO MoviesGenres
VALUES
(1,1),
(1,2),
(2,3),
(1,4),
(4,4),
(3,3),
(5,1),
(6,2),
(7,1),
(7,3),
(6,4),
(5,4)

CREATE TABLE Halls
(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR(20),
	SeatsCount INT
)

INSERT INTO Halls
VALUES
('Hall1', 30),
('Hall2', 40),
('Hall3', 50),
('Hall4', 70)

CREATE TABLE Sessions
(
	Id INT PRIMARY KEY IDENTITY,
	StartTime DATETIME2,
	EndTime DATETIME2,
	MovieId INT FOREIGN KEY REFERENCES Movies(Id),
	HallId INT FOREIGN KEY REFERENCES Halls(Id)
)

INSERT INTO Sessions
VALUES
('2020-01-01', '2020-01-02', 1,1),
('2020-11-01', '2020-01-04', 2,3),
('2020-12-01', '2020-01-05', 4,4),
('2020-01-01', '2020-01-03', 3,1),
('2020-10-01', '2020-12-02', 5,3),
('2020-01-01', '2020-01-02', 6,4),
('2020-01-01', '2020-01-02', 7,2)


CREATE TABLE Customers
(
	Id INT PRIMARY KEY IDENTITY,
	FullName NVARCHAR(20),
	PhoneNumber NVARCHAR(20),
	SessionId INT FOREIGN KEY REFERENCES Sessions(Id),
	HallId INT FOREIGN KEY REFERENCES Halls(Id)
)

INSERT INTO Customers
VALUES
('Name1', '1234', 1, 1),
('Name2', '12314', 2, 2),
('Name3', '12324', 3, 3),
('Name4', '12334', 4, 4),
('Name5', '12344', 5, 1),
('Name6', '12354', 6, 2),
('Name1', '1234', 7, 3)

CREATE TABLE Tickets
(
	Id INT PRIMARY KEY IDENTITY,
	Price MONEY,
	SessionId INT FOREIGN KEY REFERENCES Sessions(Id),
	CustomerId INT FOREIGN KEY REFERENCES Customers(Id)
)

INSERT INTO Tickets
VALUES
(12, 1,1),
(14, 2,2),
(15, 3,3),
(16, 4,4),
(17, 5,4),
(18, 6,5),
(19, 7,6),
(20, 1,7),
(21, 2,2),
(22, 3,6)


CREATE VIEW showtickets
AS
SELECT Tickets.Id, Movies.Name, Halls.Name, Sessions.StartTime, Sessions.EndTime FROM Tickets
JOIN Movies ON Id = 