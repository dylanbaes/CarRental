DROP TABLE IF EXISTS "RENTAL";
DROP TABLE IF EXISTS "VEHICLE";
DROP TABLE IF EXISTS "CUSTOMER";
DROP TABLE IF EXISTS "RATE";


CREATE TABLE IF NOT EXISTS "RENTAL" (
	"CustID"	INTEGER NOT NULL,
	"VehicleID"	VARCHAR(30) NOT NULL,
	"StartDate"	VARCHAR(30) NOT NULL,
	"OrderDate"	VARCHAR(30) NOT NULL,
	"RentalType"	INTEGER NOT NULL,
	"Qty"	INTEGER NOT NULL,
	"ReturnDate"	VARCHAR(30) NOT NULL,
	"TotalAmount"	INTEGER NOT NULL,
	"PaymentDate"	VARCHAR(30),
	FOREIGN KEY("CustID") REFERENCES "CUSTOMER"("CustID")
    FOREIGN KEY("VehicleID") REFERENCES "VEHICLE"("VehicleID")
);
CREATE TABLE IF NOT EXISTS "VEHICLE" (
	"VehicleID"	VARCHAR(30) NOT NULL,
	"Description"	VARCHAR(50) NOT NULL,
	"Year"	INTEGER NOT NULL,
	"Type"	INTEGER NOT NULL,
	"Category"	INTEGER NOT NULL,
	PRIMARY KEY("VehicleID")
);
CREATE TABLE IF NOT EXISTS "CUSTOMER" (
	"CustID" INTEGER NOT NULL,
	"Name"	VARCHAR(30),
	"Phone"	VARCHAR(15),
	PRIMARY KEY("CustID")
);
CREATE TABLE IF NOT EXISTS "RATE" (
	"Type"	VARCHAR(30),
	"Category"	VARCHAR(30),
	"Weekly"	NUMERIC,
	"Daily"	NUMERIC
);

INSERT INTO "VEHICLE" VALUES ('19VDE1F3XEE414842','Acura ILX',2014,1,1);
INSERT INTO "VEHICLE" VALUES ('1FDEE3FL6EDA29122','Ford E 350',2014,6,0);
INSERT INTO "VEHICLE" VALUES ('1FDRF3B61FEA87469','Ford Super Duty Pickup',2015,5,0);
INSERT INTO "VEHICLE" VALUES ('1FTNF1CF2EKE54305','Ford F Series Pickup',2014,5,0);
INSERT INTO "VEHICLE" VALUES ('1G1JD5SB3E4240835','Chevrolet Optra',2014,1,0);
INSERT INTO "VEHICLE" VALUES ('1GB3KZCG1EF117132','Chevrolet Silverado',2014,5,0);
INSERT INTO "VEHICLE" VALUES ('1HGCR2E3XEA305302','Honda Accord',2014,2,0);
INSERT INTO "VEHICLE" VALUES ('1N4AB7AP2EN855026','Nissan Sentra',2014,1,0);
INSERT INTO "VEHICLE" VALUES ('1N6BA0EJ9EN516565','Nissan Titan',2014,5,0);
INSERT INTO "VEHICLE" VALUES ('1N6BF0KM0EN101134','Nissan NV',2014,6,0);
INSERT INTO "VEHICLE" VALUES ('1VWCH7A3XEC037969','Volkswagen Passat',2014,2,1);
INSERT INTO "VEHICLE" VALUES ('2HGFB2F94FH501940','Honda Civic',2015,1,0);
INSERT INTO "VEHICLE" VALUES ('2T3DFREV0FW317743','Toyota RAV4',2015,4,0);
INSERT INTO "VEHICLE" VALUES ('3MZBM1L74EM109736','Mazda 3',2014,1,0);
INSERT INTO "VEHICLE" VALUES ('3N1CE2CP0FL409472','Nissan Versa Note',2015,1,0);
INSERT INTO "VEHICLE" VALUES ('3N1CN7APXEK444458','Nissan Versa',2014,1,0);
INSERT INTO "VEHICLE" VALUES ('3VW2A7AU1FM012211','Volkswagen Golf',2015,1,0);
INSERT INTO "VEHICLE" VALUES ('4S4BRCFC1E3203823','Subaru Outback',2014,4,0);
INSERT INTO "VEHICLE" VALUES ('4S4BSBF39F3261064','Subaru Outback',2015,4,0);
INSERT INTO "VEHICLE" VALUES ('4S4BSELC0F3325370','Subaru Outback',2015,4,0);
INSERT INTO "VEHICLE" VALUES ('5J6RM4H90FL028629','Honda CR-V',2015,4,0);
INSERT INTO "VEHICLE" VALUES ('5N1AL0MM8EL549388','Infiniti JX35',2014,4,1);
INSERT INTO "VEHICLE" VALUES ('5NPDH4AE2FH565275','Hyundai Elantra',2015,1,0);
INSERT INTO "VEHICLE" VALUES ('5TDBKRFH4ES26D590','Toyota Highlander',2014,4,0);
INSERT INTO "VEHICLE" VALUES ('5XYKT4A75FG610224','Kia Sorento',2015,4,0);
INSERT INTO "VEHICLE" VALUES ('5XYKU4A7XFG622415','Kia Sorento',2015,4,0);
INSERT INTO "VEHICLE" VALUES ('5XYKUDA77EG449709','Kia Sorento',2014,4,0);
INSERT INTO "VEHICLE" VALUES ('JF1GPAA61F8314971','Subaru Impreza',2015,1,0);
INSERT INTO "VEHICLE" VALUES ('JH4KC1F50EC800004','Acura RLX',2014,3,1);
INSERT INTO "VEHICLE" VALUES ('JH4KC1F56EC000095','Acura RLX',2014,3,1);
INSERT INTO "VEHICLE" VALUES ('JM1BM1V35E1210570','Mazda 3',2014,1,0);
INSERT INTO "VEHICLE" VALUES ('JM3KE4DY4F0441471','Mazda CX5',2015,4,0);
INSERT INTO "VEHICLE" VALUES ('JM3TB3DV0E0015742','Mazda CX9',2014,4,0);
INSERT INTO "VEHICLE" VALUES ('JN8AS5MV0FW760408','Nissan Rogue Select',2015,4,0);
INSERT INTO "VEHICLE" VALUES ('JTEZUEJR7E5081641','Toyota 4Runner',2014,4,0);
INSERT INTO "VEHICLE" VALUES ('JTHBW1GG1F120DU53','Lexus ES 300h',2015,2,1);
INSERT INTO "VEHICLE" VALUES ('JTHCE1BL3F151DE04','Lexus GS 350',2015,2,1);
INSERT INTO "VEHICLE" VALUES ('JTHDL5EF9F5007221','Lexus LS 460',2015,3,1);
INSERT INTO "VEHICLE" VALUES ('JTHFF2C26F135BX45','Lexus IS 250C',2015,1,1);
INSERT INTO "VEHICLE" VALUES ('JTJHY7AX2F120EA11','Lexus LX 570',2015,4,1);
INSERT INTO "VEHICLE" VALUES ('JTJJM7FX2E152CD75','Lexus GX460',2014,4,1);
INSERT INTO "VEHICLE" VALUES ('JTMBFREV1FJ019885','Toyota RAV4',2015,4,0);
INSERT INTO "VEHICLE" VALUES ('KM8SN4HF0FU107203','Hyundai Santa Fe',2015,4,0);
INSERT INTO "VEHICLE" VALUES ('KMHJT3AF1FU028211','Hyundai Tucson',2015,4,0);
INSERT INTO "VEHICLE" VALUES ('KMHTC6AD8EU998631','Hyundai Veloster',2014,1,0);
INSERT INTO "VEHICLE" VALUES ('KNAFZ4A86E5195865','KIA Sportage',2014,4,0);
INSERT INTO "VEHICLE" VALUES ('KNAFZ4A86E5195895','KIA Forte',2014,1,0);
INSERT INTO "VEHICLE" VALUES ('KNAGN4AD2F5084324','Kia Optima Hybrid',2015,2,0);
INSERT INTO "VEHICLE" VALUES ('KNALN4D75E5A57351','Kia Cadenza',2014,3,0);
INSERT INTO "VEHICLE" VALUES ('KNALU4D42F6025717','Kia K900',2015,3,0);
INSERT INTO "VEHICLE" VALUES ('KNDPCCA65F7791085','KIA Sportage',2015,4,0);
INSERT INTO "VEHICLE" VALUES ('WA1LGAFE8ED001506','Audi Q7',2014,4,1);
INSERT INTO "VEHICLE" VALUES ('WAU32AFD8FN005740','Audi A8',2015,3,1);
INSERT INTO "VEHICLE" VALUES ('WAUTFAFH0E0010613','Audi A5',2014,1,1);
INSERT INTO "VEHICLE" VALUES ('WBA3A9G51ENN73366','BMW 3 Series',2014,1,1);
INSERT INTO "VEHICLE" VALUES ('WBA3B9C59EP458859','BMW 3 Series',2014,1,1);
INSERT INTO "VEHICLE" VALUES ('WBAVL1C57EVR93286','BMW X1',2014,4,1);
INSERT INTO "VEHICLE" VALUES ('WDCGG0EB0EG188709','Mercedes_Benz GLK',2014,1,1);
INSERT INTO "VEHICLE" VALUES ('YV440MDD6F2617077','Volvo XC60',2015,4,1);
INSERT INTO "VEHICLE" VALUES ('YV4940NB5F1191453','Volvo XC70',2015,4,1);
INSERT INTO "CUSTOMER" VALUES (201,'A. Parks','(214) 555-0127');
INSERT INTO "CUSTOMER" VALUES (202,'S. Patel','(849) 811-6298');
INSERT INTO "CUSTOMER" VALUES (203,'A. Hernandez','(355) 572-5385');
INSERT INTO "CUSTOMER" VALUES (204,'G. Carver','(753) 763-8656');
INSERT INTO "CUSTOMER" VALUES (205,'Sh. Byers','(912) 925-5332');
INSERT INTO "CUSTOMER" VALUES (206,'L. Lutz','(931) 966-1775');
INSERT INTO "CUSTOMER" VALUES (207,'L. Bernal','(884) 727-0591');
INSERT INTO "CUSTOMER" VALUES (208,'I. Whyte','(811) 979-7345');
INSERT INTO "CUSTOMER" VALUES (209,'L. Lott','(954) 706-2219');
INSERT INTO "CUSTOMER" VALUES (210,'G. Clarkson','(309) 625-1838');
INSERT INTO "CUSTOMER" VALUES (211,'Sh. Dunlap','(604) 581-6642');
INSERT INTO "CUSTOMER" VALUES (212,'H. Gallegos','(961) 265-8638');
INSERT INTO "CUSTOMER" VALUES (213,'L. Perkins','(317) 996-3104');
INSERT INTO "CUSTOMER" VALUES (214,'M. Beach','(481) 422-0282');
INSERT INTO "CUSTOMER" VALUES (215,'C. Pearce','(599) 881-5189');
INSERT INTO "CUSTOMER" VALUES (216,'A. Hess','(516) 570-6411');
INSERT INTO "CUSTOMER" VALUES (217,'M. Lee','(369) 898-6162');
INSERT INTO "CUSTOMER" VALUES (218,'R. Booker','(730) 784-6303');
INSERT INTO "CUSTOMER" VALUES (219,'A. Crowther','(325) 783-4081');
INSERT INTO "CUSTOMER" VALUES (220,'H. Mahoney','(212) 262-8829');
INSERT INTO "CUSTOMER" VALUES (221,'J. Brown','(644) 756-0110');
INSERT INTO "CUSTOMER" VALUES (222,'H. Stokes','(931) 969-7317');
INSERT INTO "CUSTOMER" VALUES (223,'J. Reeves','(940) 981-5113');
INSERT INTO "CUSTOMER" VALUES (224,'A. Mcghee','(838) 610-5802');
INSERT INTO "CUSTOMER" VALUES (225,'L. Mullen','(798) 331-7777');
INSERT INTO "CUSTOMER" VALUES (226,'R. Armstrong','(325) 783-4081');
INSERT INTO "CUSTOMER" VALUES (227,'J. Greenaway','(212) 262-8829');
INSERT INTO "CUSTOMER" VALUES (228,'K. Kaiser Acosta','(228) 576-1557');
INSERT INTO "CUSTOMER" VALUES (229,'D. Kirkpatrick','(773) 696-8009');
INSERT INTO "CUSTOMER" VALUES (230,'A. Odonnell','(439) 536-8929');
INSERT INTO "CUSTOMER" VALUES (231,'K. Kay','(368) 336-5403');
INSERT INTO "RATE" VALUES ('1','0',480,80);
INSERT INTO "RATE" VALUES ('1','1',600,100);
INSERT INTO "RATE" VALUES ('2','0',530,90);
INSERT INTO "RATE" VALUES ('2','1',660,110);
INSERT INTO "RATE" VALUES ('3','0',600,100);
INSERT INTO "RATE" VALUES ('3','1',710,120);
INSERT INTO "RATE" VALUES ('4','0',685,115);
INSERT INTO "RATE" VALUES ('4','1',800,135);
INSERT INTO "RATE" VALUES ('5','0',780,130);
INSERT INTO "RATE" VALUES ('6','0',685,115);
INSERT INTO "RENTAL" VALUES (203,'JM3KE4DY4F0441471','9/9/2019','5/22/2019',1,4,'9/13/2019',460,'9/9/2019');
INSERT INTO "RENTAL" VALUES (210,'19VDE1F3XEE414842','11/1/2019','10/28/2019',7,2,'11/15/2019',1200,'NULL');
INSERT INTO "RENTAL" VALUES (210,'JTHFF2C26F135BX45','5/1/2019','4/15/2019',7,1,'5/8/2019',600,'5/8/2019');
INSERT INTO "RENTAL" VALUES (210,'JTHFF2C26F135BX45','11/1/2019','10/28/2019',7,2,'11/15/2019',1200,'NULL');
INSERT INTO "RENTAL" VALUES (210,'WAUTFAFH0E0010613','11/1/2019','10/28/2019',7,2,'11/15/2019',1200,'NULL');
INSERT INTO "RENTAL" VALUES (210,'WBA3A9G51ENN73366','11/1/2019','10/28/2019',7,2,'11/15/2019',1200,'NULL');
INSERT INTO "RENTAL" VALUES (210,'WBA3B9C59EP458859','11/1/2019','10/28/2019',7,2,'11/15/2019',1200,'NULL');
INSERT INTO "RENTAL" VALUES (210,'WDCGG0EB0EG188709','11/1/2019','10/28/2019',7,2,'11/15/2019',1200,'NULL');
INSERT INTO "RENTAL" VALUES (212,'19VDE1F3XEE414842','6/10/2019','4/15/2019',7,3,'7/1/2019',1800,'6/10/2019');
INSERT INTO "RENTAL" VALUES (216,'1N6BF0KM0EN101134','8/2/2019','3/15/2019',7,4,'8/30/2019',2740,'8/2/2019');
INSERT INTO "RENTAL" VALUES (216,'1N6BF0KM0EN101134','8/30/2019','3/15/2019',1,2,'9/1/2019',230,'8/2/2019');
INSERT INTO "RENTAL" VALUES (221,'19VDE1F3XEE414842','7/1/2019','6/12/2019',7,1,'7/8/2019',600,'7/1/2019');
INSERT INTO "RENTAL" VALUES (221,'19VDE1F3XEE414842','7/9/2019','6/12/2019',1,2,'7/11/2019',200,'7/1/2019');
INSERT INTO "RENTAL" VALUES (221,'19VDE1F3XEE414842','1/1/2020','12/15/2019',7,4,'1/29/2020',2400,'NULL');
INSERT INTO "RENTAL" VALUES (221,'JTHFF2C26F135BX45','1/1/2020','12/15/2019',7,4,'1/29/2020',2400,'NULL');
INSERT INTO "RENTAL" VALUES (221,'WAUTFAFH0E0010613','7/1/2019','6/12/2019',7,1,'7/8/2019',600,'7/1/2019');
INSERT INTO "RENTAL" VALUES (221,'WAUTFAFH0E0010613','7/9/2019','6/12/2019',1,2,'7/11/2019',200,'7/1/2019');
INSERT INTO "RENTAL" VALUES (221,'WAUTFAFH0E0010613','1/1/2020','12/15/2019',7,4,'1/29/2020',2400,'NULL');
INSERT INTO "RENTAL" VALUES (221,'WBA3A9G51ENN73366','1/1/2020','12/15/2019',7,4,'1/29/2020',2400,'NULL');
INSERT INTO "RENTAL" VALUES (221,'WBA3B9C59EP458859','1/1/2020','12/15/2019',7,4,'1/29/2020',2400,'NULL');
INSERT INTO "RENTAL" VALUES (221,'WDCGG0EB0EG188709','1/1/2020','12/15/2019',7,4,'1/29/2020',2400,'NULL');
INSERT INTO "RENTAL" VALUES (229,'19VDE1F3XEE414842','5/6/2019','4/12/2019',1,4,'5/10/2019',400,'5/6/2019');
INSERT INTO "RENTAL" VALUES (229,'WAUTFAFH0E0010613','5/6/2019','4/12/2019',1,4,'5/10/2019',400,'5/6/2019');

"""
TASK 1

--Query 1--
/*Add an extra column ‘Returned’ to the RENTAL table. Values will be 0-for non-returned cars, and 1-for 
--returned. Then update the ‘Returned’ column with '1' for all records that they have a payment date and 
--with '0' for those that they do not have a payment date. */

ALTER TABLE RENTAL
ADD COLUMN Returned;
UPDATE RENTAL SET Returned = 1 WHERE PaymentDate IS NOT NULL;
UPDATE RENTAL SET Returned = 0 WHERE PaymentDate IS 'NULL';

--Query 2--
/*Create a view vRentalInfo that retrieves all information per rental. The view should have the following 
  attributes:  
• OrderDate ! 
• StartDate – in an ascending order  !
• ReturnDate  !
• Total Days per Rental as 'TotalDays'– you need to change weeks to days  
• Vehicle’s ID as 'VIN'  !
• Vehicle’s Description as 'Vehicle'  !
• Vehicle’s Type as 'Type'– you need to use the description of the type  !
• Vehicle’s Category as 'Category' – you need to use the description of the category  !
• Customer’s ID as 'CustomerID'  !
• Customer’s Name as 'CustomerName' ! 
• Order Total Amount as 'OrderAmount',  !
• Order Remaining Amount as 'RentalBalance' – If there is no remaining balance return zero ‘0’ */
--

CREATE VIEW vRentalInfo AS
SELECT OrderDate, 
StartDate, 
ReturnDate,
julianday( R.ReturnDate) - julianday(R.StartDate ) AS TotalDays, 
R.VehicleID AS VIN, 
Description AS Vehicle,
replace(replace(replace(replace(replace(replace(V.Type,'1','Compact'),'2','Medium'),'3','Large'),'4','SUV'),'5','Truck'),'6','VAN') as Type,
replace(replace(Category,'0','Basic'),'1','Luxury') as Category,
R.CustID AS CustomerID,
C.Name AS CustomerName,
R.TotalAmount AS OrderAmount,
replace(replace(R.PaymentDate,'NULL', R.TotalAmount),PaymentDate, '0') as RentalBalance
FROM RENTAL R, VEHICLE V, CUSTOMER C
WHERE R.VehicleID = V.VehicleID AND R.CustID = C.CustID
ORDER BY StartDate ASC;

SELECT * FROM vRentalInfo; 

"""

"""
TASK 2

NOTE: CONTAINS PYTHON COMMANDS AS THE QUERIES WERE INTEGRATED WITH PYTHON, THE QUERIES ARE STILL EDITABLE VIA TEXT EDITOR ON car_rental_app.py

QUERY 1:
def add_customer(self, name: str, phone: str) -> None:
        try:
            all_user_data = self.run_query(
                "SELECT CustId, Name, Phone FROM CUSTOMER"
            )
            cust_id = all_user_data[-1][0] + 1
            query = f"INSERT INTO CUSTOMER (`CustId, Name, Phone) VALUES ({cust_id},'{name}', '{phone}')"
            _ = self.run_query(query)
            # UPDATE THE UI
            self.update_ui_values()
        except Exception as e:
            print(f"Error in add_customer: {e}")

QUERY 2:
def add_vehicle(self, vehicle_id: str, description: str, year: int, type: int, category: int) -> None:
        try:
            query = f"INSERT INTO VEHICLE (VehicleId, Description, Year, Type, Category) VALUES ('{vehicle_id}', '{description}', {year}, {type}, {category})"
            self.run_query(query)
        except Exception as e:
            print(f"Error in add_vehicle: {e}")

QUERY 3:
def make_reservation(self, customer_id: int, vehicle_type: int, vehicle_category: int, start_date: str, end_date: str, quantity: int = 1, paynow: int = 0) -> None:
	# first find if there are any vehicles available in between the dates
	query = f"""
		SELECT VehicleID FROM Vehicle
		WHERE Type = {vehicle_type}
		AND Category = {vehicle_category}
		AND VehicleID NOT IN (
			SELECT VehicleID FROM Rental
			WHERE StartDate <= '{start_date}'
			AND ReturnDate >= '{end_date}'
			AND Returned = 0
		)
	"""
	vehicles = self.run_query(query)
	if len(vehicles) == 0:
		# no vehicles available
		messagebox.showerror(
			"No Vehicles Available", "No vehicles available for the given dates")
	else:
		# there are vehicles available, so make the reservation
		vehicle_id = vehicles[0][0]
		order_date = datetime.now().strftime(DATE_FORMAT)
		total_price = self.calculate_price(
			vehicle_type, vehicle_category, start_date, end_date)
		if paynow == 1:
			self.add_rental(
				customer_id,
				vehicle_id,
				start_date,
				order_date,
				vehicle_type,
				quantity,
				end_date,
				total_price,
				order_date,
				0)
		else:
			self.add_rental(
				customer_id,
				vehicle_id,
				start_date,
				order_date,
				vehicle_type,
				quantity,
				end_date,
				total_price,
				'NULL',
				0
			)
		messagebox.showinfo("Reservation Successful", message=f"""
							Reservation has been sucessfully made with following details!

							
								Customer ID: {customer_id}
								Vehicle ID: {vehicle_id}
								Start Date: {start_date}
								Return Date: {end_date}
								Total Price: ${total_price}
								Vehicle Type: {vehicle_type}
								Vehicle Category: {vehicle_category}
								Quantity: {quantity}
								Order Date: {order_date}
								Paynow: {"PAID Completely" if paynow == 1 else "NOT PAID"}
							""")

def calculate_price(self, type: int, category: int, start_date: str, end_date: str) -> float:
	# calculate the price of the rental
	# first find the price of the vehicle
	query = f"""
		SELECT Weekly, Daily FROM RATE
		WHERE Type = {type}
		AND Category = {category}
	"""
	weekly_price, daily_price = self.run_query(query)[0]
	print(start_date, end_date)
	# then find the number of days
	days = (datetime.strptime(end_date, DATE_FORMAT) -
			datetime.strptime(start_date, DATE_FORMAT)).days
	number_of_days = days % 7
	number_of_weeks = days//7
	total_price = number_of_weeks*weekly_price + number_of_days*daily_price
	return total_price

QUERY 4:
def get_customer_rental(self, customer_id: int, return_date: str, vehicle_id: str) -> None:
        sql_query = f"SELECT TotalAmount FROM rental WHERE CustId = {customer_id} AND ReturnDate = '{return_date}' AND VehicleId = '{vehicle_id}' AND Returned=0"
        data = self.run_query(sql_query)
        print(customer_id, return_date, data)
        if len(data) > 0:
            payment = messagebox.askyesno("Total Payment Due",
                                          f"""
                                Payment Info:
                                Customer ID: {customer_id}
                                Vehicle ID: {vehicle_id}
                                Total Payment Due: ${data[0][0]}

                                Do you wish to return the vehicle?
                                """)
            if payment:
                messagebox.showinfo(
                    "Return Vehicle", f"""
                    Vehicle returned successfully!
                    
                    Please proceed to the payment.
                    """)
                sql_query = f"UPDATE rental SET Returned = 1, PaymentDate='{return_date}' WHERE CustId = {customer_id} AND ReturnDate = '{return_date}' AND VehicleId = '{vehicle_id}'"
                _ = self.run_query(sql_query)
            else:
                messagebox.showinfo("Return Vehicle", "Vehicle not returned!")

        else:
            messagebox.showerror("Total Payment Due",
                                 "Hi, you have no due amount for this rental")

QUERY 5:
5A:
def get_balance_info(self, customer_id: int = -1, part_of_name: str = None) -> None:
        if customer_id == -1 and part_of_name == None:
            query = """
            WITH NewData AS (
                SELECT Customer.CustId,
                    Customer.Name,
                    Customer.Phone,
                    CASE
                        WHEN Rental.PaymentDate <> 'NULL' THEN 0
                        ELSE Rental.TotalAmount
                    END as BalanceDue
                FROM Customer
                    INNER JOIN Rental ON Customer.CustId = Rental.CustId
            )
            SELECT CustId,
                Name,
                Phone,
                SUM(BalanceDue) AS TotalAmountDue
            FROM NewData
            Group by CustId
            ORDER BY SUM(BalanceDue) ASC;
            """
        elif customer_id != -1:
            query = f"""
            WITH NewData AS (
                SELECT Customer.CustId,
                    Customer.Name,
                    Customer.Phone,
                    CASE
                        WHEN Rental.PaymentDate <> 'NULL' THEN 0
                        ELSE Rental.TotalAmount
                    END as BalanceDue
                FROM Customer
                    INNER JOIN Rental ON Customer.CustId = Rental.CustId
            )
            SELECT CustId,
                Name,
                Phone,
                SUM(BalanceDue) AS TotalAmountDue
            FROM NewData
            WHERE CustId = {customer_id}
            Group by CustId
            ORDER BY SUM(BalanceDue) ASC;
            """
        else:
            query = f"""
            WITH NewData AS (
                SELECT Customer.CustId,
                    Customer.Name,
                    Customer.Phone,
                    CASE
                        WHEN Rental.PaymentDate <> 'NULL' THEN 0
                        ELSE Rental.TotalAmount
                    END as BalanceDue
                FROM Customer
                    INNER JOIN Rental ON Customer.CustId = Rental.CustId
            )
            SELECT CustId,
                Name,
                Phone,
                SUM(BalanceDue) AS TotalAmountDue
            FROM NewData
            WHERE Name Like '%{part_of_name}%'
            Group by CustId
            ORDER BY SUM(BalanceDue) ASC;
            """
        data = self.run_query(query)

        for row in data:
            self.customer_searched_data.insert(
                '', 'end', values=(row[0], row[1], row[2], '$'+'{:.2f}'.format(float(row[3]))))

5B:

def search_vehicle(self, search_parameter: str = None) -> None:
        self.vehicle_searched_data.delete(
            *self.vehicle_searched_data.get_children())
        if search_parameter == '':
            self.get_vehicle_info()
        else:
            self.get_vehicle_info(search_parameter)

    def get_vehicle_info(self, search_parameter: str = None) -> None:
        # Average Daily Price is derived from rental table per 5b. so daily price of each vehicle = total amount / days rented out for (return date - start date)
        # Then we take the average of the daily price of each vehicle grouped by their VINs
        if search_parameter == None:
            query = """
            WITH NewData AS (
                SELECT Vehicle.VehicleID,
                Vehicle.Description,
                Vehicle.Type,
                ROUND((Rental.TotalAmount / ( JULIANDAY(Rental.ReturnDate) - JULIANDAY(Rental.StartDate) )), 2) AS DailyPrice
                FROM Vehicle
                    JOIN Rental ON Vehicle.VehicleID=Rental.VehicleID
            )
            SELECT VehicleID,
            Description,
            AVG(DailyPrice) AS averageDaily
            FROM NewData
            GROUP BY VehicleID;
            """
        else:
            query = f"""
            WITH NewData AS (
                SELECT Vehicle.VehicleID,
                Vehicle.Description,
                Vehicle.Type,
                ROUND((Rental.TotalAmount / ( JULIANDAY(Rental.ReturnDate) - JULIANDAY(Rental.StartDate) )), 2) AS DailyPrice
                FROM Vehicle
                    JOIN Rental ON Vehicle.VehicleID=Rental.VehicleID
            )
            SELECT VehicleID,
            Description,
            AVG(DailyPrice) AS averageDaily
            FROM NewData
            WHERE VehicleID LIKE '%{search_parameter}%' OR Description LIKE '%{search_parameter}%'
            Group by VehicleID;
            """
        vehicle_searched_result = self.run_query(query)

        for row in vehicle_searched_result:
            self.vehicle_searched_data.insert('', 'end', values=(
                row[0], row[1], '$'+'{:.2f}'.format(float(row[2]))))


"""