drop database if exists Chinook_dw;
create database Chinook_dw;

use Chinook_dw;

create table dim_track (
    TrackId int,
    TrackName varchar(255),
    AlbumId int,
    AlbumTitle varchar(255),
    ArtistId int,
    ArtistName varchar(255),
    primary key (TrackId)
);

create table dim_customer (
	CustomerId int,
	CustomerName varchar(255),
	City varchar(255),
	Country varchar(255),
	primary key (CustomerId)
);

create table dim_time (
	TimeId datetime,
    DayId int,
    MonthId int,
	MonthName varchar(255),
	YearId int,
	primary key (TimeId)
);

create table fact_sales (
    InvoiceId int,
    InvoiceLineId int,
    Quantity int,
    UnitPrice decimal(10,2),
    LineTotal decimal(10,2),
    TrackId int,
    CustomerId int,
    TimeId datetime,
    primary key (InvoiceId, InvoiceLineId),
    foreign key (TrackId) references dim_track(TrackId),
    foreign key (CustomerId) references dim_customer(CustomerId),
    foreign key (TimeId) references dim_time(TimeId)
);
