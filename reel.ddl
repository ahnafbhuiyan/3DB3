connect to SE3DB3;


-- Initializing table Person
create table Person(
    PersonID bigint not null,
	FirstName varchar(60),
	LastName varchar(60),
    Age int,
	Street varchar(60),
	City varchar(60),
	Country varchar(60),
	primary key (PersonID)
);

-- Initializing table 
create table PhoneNumbers(
    PersonID bigint not null,
	PhoneNum bigint not null,
	NumType varchar(60),
	primary key (PhoneNum),
	foreign key (PersonID) references Person (PersonID) on delete cascade
);

-- Initializing table Goer
create table Goer(
    PersonID bigint not null,
	CardNumber bigint,
    PointBalance bigint,
    ActivationDate date,
	primary key (PersonID),
    foreign key (PersonID) references Person on delete cascade
);

-- Initializing table Actor
create table Actor(
    PersonID bigint not null,
	AgentName varchar(60),
    NetWorth bigint,
	primary key (PersonID),
    foreign key (PersonID) references Person on delete cascade
);

-- Initializing table Director
create table Director(
    PersonID bigint not null,
	Studio varchar(60),
    NetWorth bigint,
    YearsOfExp int,
	primary key (PersonID), 
    foreign key (PersonID) references Person on delete cascade
);

-- Initializing table Movie
create table Movie(
    MovieID bigint not null,
	Title varchar(60),
    Genre varchar(60),
    ReleaseDate date,
    GrossEarnings bigint,
	primary key (MovieID) 
);

-- Initializing table Award
create table Award(
    MovieID bigint not null,
    PersonID bigint not null,
	AwardName varchar(60),
    Genre varchar(60),
    YearGiven int,
    Budget bigint,
    primary key (MovieID,PersonID),
    foreign key (MovieID) references Movie (MovieID) on delete cascade,
    foreign key (PersonID) references Director (PersonID) on delete cascade
);

-- Initializing table Oscar
create table Oscar(
    MovieID bigint not null,
    PersonID bigint not null,
	ActorRole varchar(60),
    YearGiven int,
    primary key (MovieID,PersonID),
    foreign key (MovieID) references Movie (MovieID) on delete cascade,
    foreign key (PersonID) references Actor (PersonID) on delete cascade
);

-- Initializing table Visits
create table Visits(
    PersonID bigint not null,
	PaymentMethod varchar(60),
    ReleaseDate date,
    TicketPrice float,
    primary key (PersonID), 
    foreign key (PersonID) references Goer (PersonID) on delete cascade
);

-- Initializing table Theatre
create table Theatre(
    TheatreID bigint not null,
	TheatreName varchar(60),
	Street varchar(60),
	City varchar(60),
	Country varchar(60),
    NumberOfScreens int,
	primary key (TheatreID)
);

-- Initializing table Concession
create table Concession(
    ConcessionID bigint not null,
    TheatreID bigint not null,
    ConcType varchar(60),
	primary key (ConcessionID, TheatreID),
    foreign key (TheatreID) references Theatre (TheatreID)
);

-- Initializing table TheatreShowing
create table TheatreShowing(
    MovieID bigint not null,
    TheatreID bigint not null,
    ShowingDay varchar(60),
    ShowingTime time,
    TicketPrice float,
    ScrnNum int,
	primary key (MovieID,TheatreID),
    foreign key (MovieID) references Movie (MovieID) on delete cascade,
    foreign key (TheatreID) references Theatre (TheatreID)
);

-- Initializing table Product
create table Product(
    SKU bigint not null,
    ProdName varchar(60),
    Price float,
    Category varchar(60),
    primary key (SKU)
);

-- Initializing table Transactions
create table Transactions(
    TransactionID bigint not null,
    PersonID bigint not null,
	TransactionDate date,
	Amount float,
    PaymentMethod varchar (60),
    primary key (TransactionID, PersonID),
    foreign key (PersonID) references Goer (PersonID)
);

create table ActorInMovie(
    PersonID bigint not null,
    MovieID bigint not null,
    ActorRole varchar (60),
    primary key (PersonID, MovieID),
    foreign key (PersonID) references Actor (PersonID)on delete cascade,
	foreign key (MovieID) references Movie (MovieID) on delete cascade
);

create table ProductSoldInTransaction(
    SKU bigint not null,
    TransactionID bigint not null,
    Quantity int,
    primary key (SKU,TransactionID),
    foreign key (SKU) references Product on delete cascade,
	foreign key (TransactionID) references Transactions on delete cascade
);













