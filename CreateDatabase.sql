
	CREATE DATABASE aviacompany

	use aviacompany 
	CREATE TABLE Client(
		ClientID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
		FirstName varchar(255) NOT NULL, 
		LastName varchar(255) NOT NULL, 
		DateOfBirth date NOT NULL
	);

	CREATE TABLE Plane(
		PlaneID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
		Manufacturer varchar(255) NOT NULL,
		DateOfManufacturing date NOT NULL
	);

	CREATE TABLE Airport(
		AirportID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
		AirportName varchar(255) NOT NULL,
		AirportLocationCity varchar(255) NOT NULL
	);

	CREATE TABLE Flight(
		FlightID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
		DateOfDeparture datetime NOT NULL,
		DateOfArrival datetime NOT NULL,
		DepartureAirportID int NOT NULL,
		ArrivalAirportID int NOT NULL,
		PlaneID int NOT NULL,
		FOREIGN KEY (DepartureAirportID) REFERENCES Airport(AirportID),
		FOREIGN KEY (ArrivalAirportID) REFERENCES Airport(AirportID),
		FOREIGN KEY (PlaneID) REFERENCES Plane(PlaneID)
	);

	CREATE TABLE Ticket(
		TicketID int NOT NULL IDENTITY(1,1) PRIMARY KEY,
		Price money NOT NULL,
		SellDate datetime NOT NULL,
		ClientID int NOT NULL,
		FlightID int NOT NULL,
		FOREIGN KEY (ClientID) REFERENCES Client(ClientID),
		FOREIGN KEY (FlightID) REFERENCES Flight(FlightID) 
	);





