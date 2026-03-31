
	--1. INNER JOIN: Retrieve all service records with customer full name, vehicle model, mechanic
--name, and service cost.
							select 
							A.LastName as CustomerName,
							B.firstName as mechanicNname,
							 C.Carmodel as CarModel, 
							D.service_cost, 
							D.hours_billed
						from ford_service D
						inner join Dim_Customer  A on D.CustomerID = A.customerID 
					inner join dim_Mechanic B on D.MechanicID =B.MechanicID
						inner join dim_Vehicle C on D.VehicleID = C.VehicleID
					

							--------------	I can't find the car model ----
							SELECT DISTINCT C.VEHICLEID
							FROM ford_service AS D
							LEFT JOIN dim_Vehicle AS C ON D.VEHICLEID = C.VehicleID
							WHERE C.VehicleID IS not NULL

							SELECT TOP 10 * FROM DIM_VEHICLE;