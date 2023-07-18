import tkinter as tk
import sqlite3
from tkcalendar import Calendar
from tkinter import messagebox
from datetime import datetime
import os

FILE_PATH = os.path.join('./db/main.db')

CATEGORY = {
    "Basic": 0,
    "Advanced": 1,
}


TYPE = {
    "Compact": 1,
    "Medium": 2,
    "Large": 3,
    "SUV": 4,
    "Truck": 5,
    "Van": 6
}

DATE_FORMAT = "%Y-%m-%d"


class CarRentalApplication(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("Car Rental Application")
        self.resizable(True, True)

        self.tab_control = tk.ttk.Notebook(self)

        self.tab1 = tk.Frame(self.tab_control)
        self.tab2 = tk.Frame(self.tab_control)
        self.tab3 = tk.Frame(self.tab_control)
        self.tab4 = tk.Frame(self.tab_control)
        self.tab5 = tk.ttk.Notebook(self.tab_control)
        # create two tabs under a tab 5
        self.tab5_sub1 = tk.Frame(self.tab5)
        self.tab5_sub2 = tk.Frame(self.tab5)

        self.tab_control.add(self.tab1, text="Add New Customers")
        self.tab_control.add(self.tab2, text="Add New Vehicles")
        self.tab_control.add(self.tab3, text="Make New Reservations")
        self.tab_control.add(
            self.tab4, text="Manage Return of Rental Vehicles")
        self.tab_control.add(self.tab5, text="View's Results")
        self.tab5.add(self.tab5_sub1, text="View Remaining Balance")
        self.tab5.add(self.tab5_sub2, text="View Vehicle Information")

        # Tab 1: Add New Customers
        self.name = tk.Entry(self.tab1, width=30)
        self.name.grid(row=1, column=1, padx=10, pady=10)
        self.name_label = tk.Label(self.tab1, text="Name")
        self.name_label.grid(row=1, column=0)

        self.phone = tk.Entry(self.tab1, width=30)
        self.phone.grid(row=2, column=1, padx=10, pady=10)
        self.phone_label = tk.Label(self.tab1, text="Phone Number")
        self.phone_label.grid(row=2, column=0)

        self.newcust_label = tk.Label(self.tab1, text="Add information about a new customer. Please input the new customer's Name and Phone Number")
        self.newcust_label.grid(row=5, column=1)

        self.customer_btn = tk.Button(
            self.tab1, text="Add Customer", command=lambda: self.add_customer(self.name.get(), self.phone.get())
        )
        self.customer_btn.grid(row=3, column=1, padx=10, pady=10)

        ################################################################################################################
        # Tab 2: Add New Vehicles
        self.vehicle_id = tk.Entry(self.tab2, width=30)
        self.vehicle_id.grid(row=1, column=1, padx=10, pady=10)
        self.vehicle_id_label = tk.Label(self.tab2, text="Vehicle ID")
        self.vehicle_id_label.grid(row=1, column=0)

        self.description = tk.Entry(self.tab2, width=30)
        self.description.grid(row=2, column=1, padx=10, pady=10)
        self.description_label = tk.Label(
            self.tab2, text="Vehicle Description")
        self.description_label.grid(row=2, column=0)

        self.year = tk.Entry(self.tab2, width=30)
        self.year.grid(row=3, column=1, padx=10, pady=10)
        self.year_label = tk.Label(self.tab2, text="Vehicle Year")
        self.year_label.grid(row=3, column=0)

        self.type_var = tk.StringVar()
        self.type_var.set("Compact")
        self.type = tk.OptionMenu(self.tab2, self.type_var, *TYPE.keys())
        self.type.grid(row=4, column=1, padx=10, pady=10)
        self.type_label = tk.Label(self.tab2, text="Vehicle Type")
        self.type_label.grid(row=4, column=0)

        self.category_var = tk.StringVar()
        self.category_var.set("Basic")
        self.category = tk.OptionMenu(
            self.tab2, self.category_var, *CATEGORY.keys())
        self.category.grid(row=5, column=1, padx=10, pady=10)
        self.category_label = tk.Label(self.tab2, text="Vehicle Category")
        self.category_label.grid(row=5, column=0)

        self.newvehicle_label = tk.Label(self.tab2, text="Add information about a new vehicle. Please input the new vehicle's VIN, Description, Year, Type, and Category")
        self.newvehicle_label.grid(row=7, column=1)

        self.vehicle_btn = tk.Button(
            self.tab2,
            text="Add Vehicle",
            command=lambda: self.add_vehicle(self.vehicle_id.get(), self.description.get(),
                                             int(self.year.get(
                                             )), TYPE[self.type_var.get()],
                                             CATEGORY[self.category_var.get()])
        )
        self.vehicle_btn.grid(row=6, column=1, padx=10, pady=10)

        ################################################################################################################
        # Tab 3: Make New Reservations
        self.type_var_res = tk.StringVar()
        self.type_var_res.set("Compact")
        self.type_res = tk.OptionMenu(
            self.tab3, self.type_var_res, *TYPE.keys())
        self.type_res.grid(row=1, column=1, padx=10, pady=10)
        self.type_res_label = tk.Label(self.tab3, text="Vehicle Type")
        self.type_res_label.grid(row=1, column=0)

        self.category_var_res = tk.StringVar()
        self.category_var_res.set("Basic")
        self.category_res = tk.OptionMenu(
            self.tab3, self.category_var_res, *CATEGORY.keys())
        self.category_res.grid(row=2, column=1, padx=10, pady=10)
        self.category_res_label = tk.Label(self.tab3, text="Vehicle Category")
        self.category_res_label.grid(row=2, column=0)

        self.start_date = Calendar(
            self.tab3, selectmode="day", year=2021, month=1, day=1, date_pattern="yyyy-mm-dd")
        self.start_date.grid(row=3, column=1, padx=10, pady=10)
        self.start_date_label = tk.Label(self.tab3, text="Start Date")
        self.start_date_label.grid(row=3, column=0)

        self.end_date = Calendar(
            self.tab3, selectmode="day", year=2021, month=1, day=1, date_pattern="yyyy-mm-dd")
        self.end_date.grid(row=4, column=1, padx=10, pady=10)
        self.end_date_label = tk.Label(
            self.tab3, text="End Date / Return Date")
        self.end_date_label.grid(row=4, column=0)

        self.CUSTOMERS = self.get_customers()  # get customer list
        self.customer_name_var_res = tk.StringVar()
        self.customer_name_var_res.set(list(self.CUSTOMERS.keys())[0])
        self.customer_name_res = tk.OptionMenu(
            self.tab3, self.customer_name_var_res, *list(self.CUSTOMERS.keys()))
        self.customer_name_res.grid(row=5, column=1, padx=10, pady=10)
        self.reservation_customer_name_label = tk.Label(
            self.tab3, text="Customer Name")
        self.reservation_customer_name_label.grid(row=5, column=0)

        self.reservation_pay_now = tk.IntVar()
        tk.Checkbutton(self.tab3, text="Pay Now",
                       variable=self.reservation_pay_now, onvalue=1, offvalue=0).grid(row=6, column=1, padx=10, pady=10)

        self.newreservation_label = tk.Label(self.tab3, text="Make a new reservation on a free vehicle.")
        self.newreservation_label.grid(row=1, column=2)
        self.newreservation_label2 = tk.Label(self.tab3, text="Enter the type and category of the vehicle you would like and the desired start and return date.")
        self.newreservation_label2.grid(row=2, column=2)
        self.newreservation_label3 = tk.Label(self.tab3, text="If you are a new customer, please sign up at the add new customer tab.")
        self.newreservation_label3.grid(row=5, column=2)

        self.reservation_btn = tk.Button(
            self.tab3, text="Add Reservation", command=lambda: self.make_reservation(
                self.CUSTOMERS[self.customer_name_var_res.get()],
                TYPE[self.type_var_res.get()],
                CATEGORY[self.category_var_res.get()],
                self.start_date.get_date(),
                self.end_date.get_date(),
                paynow=self.reservation_pay_now.get()
            )
        )
        self.reservation_btn.grid(row=7, column=1, padx=10, pady=10)

        ################################################################################################################
        # Tab 4: Handle return of the rented vehicles
        '''
            You need to be able to retrieve a rental by the return date, customer name (the table
            needs the id), and vehicle info. Submit your editable SQL queries (retrieve & update rental) that your
            code executes. [6 points]
        '''
        self.customer_name_var_return = tk.StringVar()
        self.customer_name_var_return.set(list(self.CUSTOMERS.keys())[0])
        self.customer_name_return = tk.OptionMenu(
            self.tab4, self.customer_name_var_return,
            *list(self.CUSTOMERS.keys())
        )
        self.customer_name_return.grid(
            row=1, column=1, padx=10, pady=10)
        self.customer_name_return_label = tk.Label(
            self.tab4, text="Customer Name")

        self.return_data_return = Calendar(
            self.tab4, selectmode="day", year=2021, month=1, day=1, date_pattern='yyyy-mm-dd')
        self.return_data_return.grid(
            row=2, column=1, padx=10, pady=10)
        self.customer_name_return_label.grid(row=1, column=0)
        self.return_data_return_label = tk.Label(
            self.tab4, text="Return Date")
        self.return_data_return_label.grid(
            row=2, column=0)

        self.vehicle_id_return = tk.Entry(
            self.tab4, width=30)
        self.vehicle_id_return.grid(
            row=3, column=1, padx=10, pady=10)
        self.vehicle_id_return_label = tk.Label(
            self.tab4, text="Vehicle ID")
        self.vehicle_id_return_label.grid(
            row=3, column=0)

        self.find_rental = tk.Button(
            self.tab4, text="Find Reservation Rental", command=lambda: self.get_customer_rental(
                self.CUSTOMERS[self.customer_name_var_return.get()],
                self.return_data_return.get_date(),
                self.vehicle_id_return.get()
            )
        )
        self.find_rental.grid(row=4, column=1, padx=10, pady=10)

        self.return_label = tk.Label(self.tab4, text="Return your rented vehicle.")
        self.return_label.grid(row=1, column=2)
        self.return_label2 = tk.Label(self.tab4, text="Enter the desired return date of your vehicle.")
        self.return_label2.grid(row=2, column=2)
        self.return_label3 = tk.Label(self.tab4, text="Enter your vehicle's VIN number.")
        self.return_label3.grid(row=3, column=2)

        ################################################################################################################
        # Tab 5: View Information
        # tab 5: part a
        self.customer_search_parameter = tk.Entry(self.tab5_sub1, width=30)
        self.customer_search_parameter.grid(row=1, column=1, padx=10, pady=10)
        self.search_customer_btn = tk.Button(
            self.tab5_sub1, text="Search Customer", command=lambda: self.search_customer(
                self.customer_search_parameter.get()))
        self.search_customer_btn.grid(row=3, column=1, padx=10, pady=10)
        self.search_customer_id_label = tk.Label(
            self.tab5_sub1, text="Search by Customer ID / Name")
        self.search_customer_id_label.grid(row=1, column=0)
        # create a tree view
        self.columns = ('Customer ID', 'Name', 'Phone Number',
                        'Balance Due (in USD)')
        self.customer_searched_data = tk.ttk.Treeview(
            self.tab5_sub1, columns=self.columns, show="headings")
        self.customer_searched_data.grid(row=4, column=1, padx=10, pady=10)
        # define headings
        self.customer_searched_data.heading(
            self.columns[0], text=self.columns[0])
        self.customer_searched_data.heading(
            self.columns[1], text=self.columns[1])
        self.customer_searched_data.heading(
            self.columns[2], text=self.columns[2])
        self.customer_searched_data.heading(
            self.columns[3], text=self.columns[3])
        # add a scrollbar
        self.customer_searched_data_scrollbar = tk.ttk.Scrollbar(
            self.tab5_sub1, orient=tk.VERTICAL, command=self.customer_searched_data.yview)
        self.customer_searched_data.configure(
            yscroll=self.customer_searched_data_scrollbar.set)
        self.customer_searched_data_scrollbar.grid(
            row=4, column=2, sticky="ns")

        self.search_label = self.search_label = tk.Label(self.tab5_sub1, text="Search for a customer by entering their name, part of their name, or ID in the search box.")
        self.search_label.grid(row=2, column=1)
        # fill the tree view with data
        self.search_customer('')

        # tab 5: part b
        self.vehicle_search_parameter = tk.Entry(self.tab5_sub2, width=30)
        self.vehicle_search_parameter.grid(row=1, column=1, padx=10, pady=10)
        self.search_vehicle_btn = tk.Button(
            self.tab5_sub2, text="Search Vehicle", command=lambda: self.search_vehicle(
                self.vehicle_search_parameter.get()))
        self.search_vehicle_btn.grid(row=3, column=1, padx=10, pady=10)
        self.search_vehicle_id_label = tk.Label(
            self.tab5_sub2, text="Search by VIN / Description")
        self.search_vehicle_id_label.grid(row=1, column=0)
        # create a tree view
        self.vehicle_table_columns = (
            'Vehicle ID', 'Description', 'Average Daily Rate')
        self.vehicle_searched_data = tk.ttk.Treeview(
            self.tab5_sub2, columns=self.vehicle_table_columns, show="headings")
        self.vehicle_searched_data.grid(row=4, column=1, padx=10, pady=10)
        # define headings
        self.vehicle_searched_data.heading(
            self.vehicle_table_columns[0], text=self.vehicle_table_columns[0])
        self.vehicle_searched_data.heading(
            self.vehicle_table_columns[1], text=self.vehicle_table_columns[1])
        self.vehicle_searched_data.heading(
            self.vehicle_table_columns[2], text=self.vehicle_table_columns[2])
        # add a scrollbar
        self.vehicle_searched_data_scrollbar = tk.ttk.Scrollbar(
            self.tab5_sub2, orient=tk.VERTICAL, command=self.vehicle_searched_data.yview)
        self.vehicle_searched_data.configure(
            yscroll=self.vehicle_searched_data_scrollbar.set)
        self.vehicle_searched_data_scrollbar.grid(
            row=4, column=2, sticky="ns")

        self.searchvehicle_label = self.search_label = tk.Label(self.tab5_sub2, text="Search for a vehicle by entering the vehicle model or VIN number in the search box.")
        self.searchvehicle_label.grid(row=2, column=1)
        
        # fill the tree view with data
        self.search_vehicle('')
        ################################################################################################################
        self.tab_control.pack(fill="both", expand=True)

    # returns the database snapshot after the query is executed

    @ staticmethod
    def run_query(sql: str) -> list:
        with sqlite3.connect(FILE_PATH) as db:
            cursor = db.cursor()
            cursor.execute(sql)
            db.commit()
            return list(cursor.fetchall())

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

    def get_customers(self) -> dict:
        format_customer = dict()
        try:
            customer_data = self.run_query(
                "SELECT CustId,Name,Phone FROM Customer"
            )
            # formatting structure
            '''
                {
                    "name,phone"= customerId
                }
            '''
            for customer in customer_data:
                format_customer[customer[1]+","+customer[2]] = customer[0]
        except Exception as e:
            print(f"Error getting customer: {e}")
        # print(format_customer)
        return format_customer

    def add_customer(self, name: str, phone: str) -> None:
        try:
            all_user_data = self.run_query(
                "SELECT CustId, Name, Phone FROM CUSTOMER"
            )
            cust_id = all_user_data[-1][0] + 1
            query = f"INSERT INTO CUSTOMER (CustId, Name, Phone) VALUES ({cust_id},'{name}', '{phone}')"
            _ = self.run_query(query)
            # UPDATE THE UI
            self.update_ui_values()
        except Exception as e:
            print(f"Error in add_customer: {e}")

    def update_ui_values(self) -> None:
        try:
            # update the customer lists
            tab3_customer_option = self.customer_name_res['menu']
            tab4_customer_option = self.customer_name_return['menu']
            tab3_customer_option.delete(0, tk.END)
            tab4_customer_option.delete(0, tk.END)
            for customer in self.get_customers():
                tab3_customer_option.add_command(
                    label=customer, command=lambda value=customer: self.customer_name_res.set(value))
                tab4_customer_option.add_command(
                    label=customer, command=lambda value=customer: self.customer_name_return.set(value))

        except Exception as e:
            print(f"Error in update_customer: {e}")

    def add_vehicle(self, vehicle_id: str, description: str, year: int, type: int, category: int) -> None:
        try:
            query = f"INSERT INTO VEHICLE (VehicleId, Description, Year, Type, Category) VALUES ('{vehicle_id}', '{description}', {year}, {type}, {category})"
            self.run_query(query)
        except Exception as e:
            print(f"Error in add_vehicle: {e}")

    def add_rental(
            self, cust_id: int, vehicle_id: str, start_date: str, order_date: str,
            type: int, quantity: int, return_date: str, total_amt: float, payment_date: str, return_status: int) -> None:
        try:
            print(cust_id, vehicle_id, start_date, order_date, type,
                  quantity, return_date, total_amt, payment_date, return_status)
            query = f"\
                INSERT INTO Rental (CustID,VehicleID,StartDate,OrderDate,RentalType,Qty,ReturnDate,TotalAmount,PaymentDate, Returned) VALUES (\
                    {cust_id},'{vehicle_id}','{start_date}','{order_date}',{type},{quantity}, '{return_date}', {total_amt},'{payment_date}',{return_status})\
                "
            self.run_query(query)
        except Exception as e:
            print(f"Error in adding rental info: {e}")

    # Requirement 5 - a

    def search_customer(self, search_parameter: str = None) -> None:
        self.customer_searched_data.delete(
            *self.customer_searched_data.get_children())
        if search_parameter == '':
            self.get_balance_info()
        elif search_parameter.isnumeric():
            self.get_balance_info(customer_id=int(search_parameter))
        else:
            self.get_balance_info(part_of_name=search_parameter)

    # we don't need to create another args for customer name:
    # len(part_of_name)<=len(name)
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

    # Requirement 5 - b

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


if __name__ == "__main__":
    carRentalApplication = CarRentalApplication()
    carRentalApplication.mainloop()
