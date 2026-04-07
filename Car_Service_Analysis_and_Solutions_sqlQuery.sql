
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
					

							

------2. LEFT JOIN: Show all customers and their service records, including those who never serviced a
---car.
			SELECT * FROM ford_service
			ALTER TABLE ford_service
			DROP COLUMN VehicleID,CUSTOMERID,MECHANICID,ServiceTicketID,DateID

			----HERE I WAS SORTING OUT THE COLUMN FOR MEASURES TO BE IN THE CORRECT TABLE, 
			---I DROPPED THE COLUMNS TO BE ABLE TO JOIN THE TABLES WITHOUT ANY ISSUE, I WILL RECREATE THE COLUMNS LATER

			Select c.FirstName,
					c.LastName,
					s.service_status,
					v.RegistrationNumber,
					v.carModel,
					d.firstName as mechanic,
					d.specialization,
					m.service_cost,
					m.labour_hours,
					m.hours_billed

					from ford_service m
					left join dim_customer c on m.customerID =c.customerID
					left join dim_Vehicle v on m.vehicleId = v.vehicleId
					left join dim_Mechanic d on m.mechanicID = d.mechanicID
					left join Dim_ServiceTicket s on m.service_ticket_id= s.service_ticket_id

---Multi-Table JOIN: Display customer name, vehicle make & model, service type, mechanic
---specialization, and service cost.


Select c.FirstName,
					c.LastName,
					s.service_status,
					s.Service_type,
					v.RegistrationNumber,
					v.carModel,
					v.carMake,
					d.firstName as mechanic,
					d.specialization,
					m.service_cost,
					m.labour_hours,
					m.hours_billed
				
					from ford_service m
				join dim_customer c on m.customerID =c.customerID
					join dim_Vehicle v on m.vehicleId = v.vehicleId
				join dim_Mechanic d on m.mechanicID = v.VehicleID
					 join Dim_ServiceTicket s on m.service_ticket_id= s.service_ticket_id
			
		
		 ------Subquery: Find all services where Service_Cost is greater than the average service cost.
							
							select 
							service_type,
									m.service_cost
							from Dim_ServiceTicket d
									left join ford_service m on d.Service_Ticket_ID = m.service_Ticket_Id

									where m.Service_Cost > (select avg(service_cost) from ford_service)


									select avg(service_cost)
									from ford_service
							
						. ---Correlated Subquery: Find customers who have spent more than the average spending of all
						`	-----customers.
						
								select c.firstName ,
								c.LastName,
								m.service_cost as highest_customer_spender
								from Dim_Customer c
									left join ford_service m on c.customerID = m.customerID
									where m.Service_Cost > (select avg(service_cost) as customer_average from ford_service)

									--6. Window Function (ROW_NUMBER): For each mechanic, assign a row number based on highest
                                ---hours worked.
											Select d.FirstName,d.LastName,
													m.Hours_worked,
													Row_number () over(order by m.hours_worked Desc) as highest_hours_worked
													from dim_Mechanic d 
													left join ford_service m on d.MechanicID = m.MechanicID 

									--7	---Ranking: Rank mechanics based on total hours worked using RANK() and DENSE_RANK().
									Select d.FirstName,d.LastName,
													m.Hours_worked,
													dense_rank () over(order by m.hours_worked Desc) as dense_total_hours_worked,
													rank () over(order by m.hours_worked Desc) as ranked_total_hours_worked
													from dim_Mechanic d 
													left join ford_service m on d.MechanicID = m.MechanicID










UPDATE ford_service
SET HOURS_Worked= null
WHERE Service_Ticket_ID= 5
										
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