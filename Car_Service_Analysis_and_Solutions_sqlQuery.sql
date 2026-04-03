
	--1. INNER JOIN: Retrieve all service records with customer full name, vehicle model, mechanic
--name, and service cost.
							select 
							A.LastName as CustomerName,
							B.firstName as mechanicNname,
							 C.Carmodel as CarModel, 
							D.service_cost, 
							D.hours_billed
						from ford_service D
						left join Dim_Customer  A on D.CustomerID = A.customerID 
					left join dim_Mechanic B on D.MechanicID =B.MechanicID
						left join dim_Vehicle C on D.VehicleID = C.VehicleID
					

							-

							SELECT TOP 10 * FROM DIM_VEHICLE;

------2. LEFT JOIN: Show all customers and their service records, including those who never serviced a
---car.
			SELECT * FROM ford_service
			ALTER TABLE ford_service
			DROP COLUMN VehicleID,CUSTOMERID,MECHANICID,ServiceTicketID,DateID

			----HERE I WAS SORTING OUT THE COLUMN FOR MEASURES TO BE IN THE CORRECT TABLE, 
			---I DROPPED THE COLUMNS TO BE ABLE TO JOIN THE TABLES WITHOUT ANY ISSUE, I WILL RECREATE THE COLUMNS LATER

			---2. LEFT JOIN: Show all customers and their service records, including those who never serviced a
			---car.
						SELECT A.firstName,
						A.LastName,
						A.contact,
						B.ServiceID
						from Dim_Customer as A
						left join Dim_ServiceTicket  as B 
						on A.customerID = B.
						

						alter table ford_service
						add CustomerID int,
						VehicleID INT,
						PartID int,
						ServiceID int,
						Service_Ticket_ID Int,
						MechanicID int


	SELECT 
    c.FirstName,
    v.CarModel,
    f.Service_Cost,
	B.service_status
FROM ford_service f

LEFT JOIN Dim_Customer c
    ON f.CustomerID = c.CustomerID

LEFT JOIN Dim_Vehicle v
    ON f.VehicleID = v.VehicleID

	left join Dim_ServiceTicket as B 
	on f.Service_Ticket_ID = B.service_Ticket_ID


	select * from ford_service


	SELECT * 
FROM ford_service
WHERE CustomerID IS NULL 
   OR VehicleID IS NULL 
   OR Service_Ticket_ID IS NULL;

   SELECT 
    f.CustomerID,
    c.CustomerID,
    c.FirstName
FROM ford_service f
LEFT JOIN Dim_Customer c
    ON f.CustomerID = c.CustomerID;

	SELECT 
    f.VehicleID,
    v.VehicleID,
    v.CarModel
FROM ford_service f
LEFT JOIN Dim_Vehicle v
    ON f.VehicleID = v.VehicleID;

	SELECT *
FROM ford_service f
WHERE f.CustomerID NOT IN (
    SELECT CustomerID FROM Dim_Customer
);

SELECT DISTINCT CustomerID
FROM ford_service;

SELECT CustomerID
FROM Dim_Customer;

UPDATE ford_service
SET CustomerID = 101,
    VehicleID = 201,
    Service_Ticket_ID = 301
WHERE Service_Cost = 2500;


UPDATE ford_service
SET 
    CustomerID = CASE 
        WHEN Service_Cost = 5000.00 THEN 101
        WHEN Service_Cost = 7000.00 THEN 102
        WHEN Service_Cost = 11000.00 THEN 103
        WHEN Service_Cost = 150000.00 THEN 104
        WHEN Service_Cost = 45000.00 THEN 105
    END,

    VehicleID = CASE 
        WHEN Service_Cost = 5000.00 THEN 1
        WHEN Service_Cost = 7000.00 THEN 2
        WHEN Service_Cost = 11000.00 THEN 3
        WHEN Service_Cost = 150000.00 THEN 4
        WHEN Service_Cost = 45000.00 THEN 5
    END;

UPDATE ford_service
SET 

		DateID = CASE 
        WHEN Service_Cost = 5000.00 THEN 1
        WHEN Service_Cost = 7000.00 THEN 2
        WHEN Service_Cost = 11000.00 THEN 3
        WHEN Service_Cost = 150000.00 THEN 4
        WHEN Service_Cost = 45000.00 THEN 5

		END;