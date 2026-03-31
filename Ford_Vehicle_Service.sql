use Ford_car_service
GO				
				----DATA MODELLING
			----------------THIS IS MY FACT TABLE WHICH IS MADE OUT OF STAR SCHEMER----
		create table ford_service(
				CustomerID int,
				VehicleID int,
				MechanicID int,
				ServiceTicketID int,
				DateID INT,

				----MEASURES
				Service_Cost decimal(10,2),
				LABOUR_HOURS int,
				HOURS_Worked int,
				hours_billed decimal(10,2)
);
----////////////////////////////////////------------------------------
				Alter table Ford_service
				drop column parts_cost  ---I have removed the parts_cost because I have dim_parts which
										-----is dimensional table

										Alter table ford_dervice
										drop column 

				alter table ford_service
				add hours_billed decimal(10,2) -----added a new column to help get the accurate amount of how the client has been 
												----charged


go
	create Table Dim_Customer(
		customerID int PRIMARY KEY,
		FirstName varchar(50),
		lastName varchar(50),
		city varchar(50),
		email varchar(50),
		contact varchar(15)

	);
	use Ford_car_service
	go
		insert into dim_customer( customerID,	FirstName,lastName,city,email,contact)
		VALUES
		(101, 'welcome','shongwe','witbank','welcomeshongwe1016@gmail.com','0728639659' ),

	insert into dim_customer( customerID,	FirstName,lastName,city,email,contact)
	VALUES
		(102, 'Sizo','Mabaso','Denellton','shongwe1016@gmail.com','07286396598' )
go
			insert into dim_customer( customerID,	FirstName,lastName,city,email,contact)
		VALUES
		(103, 'Snco','Khoza','Kwamhlanga','mabaso6@gmail.com','072863965558' ),
		(104, 'Kwenzi','Nkuna','PHOOKO','2117143@vut.ac.za','072863965777' ),
		(105, 'Msotra','Lakhozeni','Malelane','Mabaso@gmail.com','07286396666' )




		SELECT *FROM Dim_Customer----helps by showing all the table

		UPDATE Dim_Customer    ---// I was had to write the email is correct
		SET EMAIL = 'welcomeshongwe101@gmail.com'
		where customerID = 101
---------------------------------------------------------------------------------------------

	go
		create Table dim_Vehicle(
		VehicleID int PRIMARY KEY,
		RegistrationNumber varchar(50),
		carMake varchar(50),
		carModel varchar(50),
		vinNumber varchar(50),
		fuelType varchar(50),
		year int
		);
go
		insert into dim_Vehicle(VehicleID,RegistrationNumber,carMake,carModel,vinNumber,fuelType,year)
		Values
		(1,'mp 12345','Ford','Ranger','1FTFW1E5XJFB12345','Diesel',2018),
		(2,'Gp 54321','Ford','Mustang','1FA6P8TH5J5105432','Petrol',2020),
		(3,'KZN 67890','Ford','Focus','1FADP3F26JL123456','Petrol',2019),
		(4,'L 98765','Ford','Explorer','1FM5K8D89JGA54321','Diesel',2021),
		(5,'FS 24680','Ford','Escape','1FMCU9G96JUA12345','Petrol',2017)

		SELECT *FROM dim_Vehicle
-------------------------------------------------------------------------------------				

		CREATE TABLE dim_Mechanic(
		MechanicID int PRIMARY KEY,
		firstName varchar(50),
		LastName varchar(50),

		Certificate varchar(50),
		Shift varchar(50),
		Status varchar(50),
		Specialization varchar(50),
);

insert into dim_Mechanic(MechanicID,firstName,LastName,Certificate,Shift,Status,Specialization)
Values
(1,'John','Doe','Mechanic','Morning','Active','Engine Repair'),
(2,'Jane','Smith','Transmission engineer','Afternoon','Active','Transmission Repair'),
(3,'Mike','Johnson','Suspension engineer ','Evening','Rest','Brake Repair'),
(4,'Emily','Davis','Auto electrician','Morning','Active','Electrical Systems'),
(5,'David','Wilson'
,'Suspension engineer','Afternoon','pending','Suspension Repair')
	
	select * from dim_Mechanic
	------------------------------------------------------------------------------------------------------------------------------
	-----////////////////////////////////////////////////////////////-----------//////////////////////////////////


	create table Dim_ServiceTicket(
		Service_Ticket_ID int primary key,
		service_status varchar(50),
		Service_type varchar(50),
		Priority_Level varchar(50),
		Booking_source varchar(50),
		Customer_complaint varchar(50),
		first_visit varchar (15)
	);
	go
	insert into Dim_ServiceTicket( Service_Ticket_ID,service_status,Service_type,Priority_Level,Booking_source,Customer_complaint,first_visit)
	Values

	(001,'in progress','Brake service','emergency','walk in','missing screws','no'),
	(002,'in progress','Mechanic repair','Low priority','walk in','Car still making the same noise','no'),
	(003,'Completed','Electric repair','Ready for collection','Online booking','beeping sound in my dashboard','yes'),
	(004,'Cancelled','Transmission issue','Customer waiting','walk in','car it is difficult to start','no'),
	(005,'waiting for approval','Engine leaking','emergency','Online booking','this car is consuming lot of oil','no'),
	(006,'waiting for parts','Engine','Customer waiting','walk in','engine vibration','yes')

	select * from Dim_ServiceTicket
	------------------------------------------------------------------------------------------------------------------------------------------
	create table dim_parts(
		partID int primary key,
		partName varchar(50),
		PartSerialNumber varchar(50),
		price decimal(10,2),
		quantity int,
		partCategory varchar(50)
	);
	
	insert into dim_parts(partID,partName,PartSerialNumber,price,quantity,partCategory)
	Values
	(1,'Brake Pad','BP12345',1500.00,20,'Brakes'),
	(2,'Oil Filter','OF54321',1100.00,50,'Engine'),
	(3,'Spark Plug','SP67890',1200.00,100,'Ignition'),
	(4,'Pistols','AF98765',31000.00,40,'Engine'),
	(5,'Battery','BT24680',200.00,15,'Electrical')

	select * from dim_parts
	------------------------------------------------------------------------------------------------------------------------------
	----/////////////////////////////////////////////////////////////////////////////////////////////////////////-------------
	create table Dim_Date(
		DateID int primary key,
		Date date,
		DayOfWeek varchar(50),
		Month varchar(50),
		Quarter varchar(50),
		Year int,
		time varchar(50)
	);

	insert into Dim_Date(DateID,Date,DayOfWeek,Month,Quarter,Year)
	values
	 ( 1,'2026-01-01','Monday','January','Q1',2026),
	 (2,'2026-02-15','Thursday','February','Q1',2026),
	 (3,'2026-03-10','Sunday','March','Q1',2026),
	 (4,'2026-04-05','Friday','April','Q2',2026),
	 (5,'2026-05-20','Monday','May','Q2',2026)
	 ----I need to accurate include the time of the service ticket

ALTER TABLE dim_DATE
DROP COLUMN datetime-------I was removing a column in an exisiting table

ALTER TABLE dim_DATE
DROP COLUMN time ------column removed

Alter Table Dim_Date
add time int  ----added an new column in an existing table

--EXEC sp_rename 'Dim_Date.time' --renamed a column in an existing table
--------------------------------------------------------------------------------------------------------------------------------
----//////////////////////////////////////////////////////////////////////////////////////////////////////----------------

--UTILIZING THE MEASURES FROM THE FACT TABLE

---*WE HAVE	*Service_Cost decimal(10,2),*Total amount spent 
			---*LABOUR_HOURS-- mechanic have to finish the job at the giben time
				---* HOURS_Worked---  time spent by the mechanic in fixing the vehicle
				----*Hours_billed * Time spent on task a client needs to pay 

				insert into Ford_service (CustomerID,MechanicID,HOURS_Worked,LABOUR_HOURS,hours_billed,Service_Cost)
							values
							(103,1,7,5,6,5000),
							(104,2,7,6,7,7000),
							(105,3,8,4,6,11000),
							(101,5,24,15,28,150000),
							(102,4,11,7,9,45000)



						With CTE AS (
									SELECT *, ROW_NUMBER() OVER( PARTITION BY CustomerID,MechanicID,HOURS_Worked,LABOUR_HOURS,hours_billed,Service_Cost
									ORDER BY (SELECT NULL)) AS RowNum
									from ford_service)
									delete from CTE
									where RowNum >1; --------here I had duplicates of same rows and column ,everything was the same 
													---So I used the Common Table Expression, I needed only  single data that is why I applied 
													--the >1 operator to remove all the duplicates and leave 1

													delete from ford_service ---I had mis matching values from customerId
													where CustomerID= 101
													--------
														delete from ford_service
													where CustomerID in( 101, 102)--we used the in to multiple delete 
																	--the IN allows you to put multiple values in a single line