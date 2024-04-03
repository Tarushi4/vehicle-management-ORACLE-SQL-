from tkinter import *
from tkinter import messagebox
from tkinter import simpledialog 
import oracledb
from tkinter.ttk import Combobox, Treeview

# Connection details
username = 'SYSTEM'
password = '888D29d5@'
host = '192.168.56.1'
port = '1521'
service_name = 'XE'

# Establish connection
# DSN serving as a crucial link between applications and databases.
dsn = oracledb.makedsn(host, port, service_name=service_name)
connection = oracledb.connect(user=username, password=password, dsn=dsn)

t = Tk()
t.geometry('350x250')
t.title("LOGIN PAGE")

entry_label = Label(t, text="USERNAME", font=('Arial', 20))
entry_label.grid(row=0, column=0)
input_entry = Entry(t, width=25, font=('Arial', 20))
input_entry.grid(row=1, column=0)

entry1_label = Label(t, text="PASSWORD", font=('Arial', 20))
entry1_label.grid(row=2, column=0)
input1_entry = Entry(t, width=25, font=('Arial', 20))
input1_entry.grid(row=3, column=0)

def submit():
    value = input_entry.get()
    value1 = input1_entry.get()
    if value == "ADMIN" and value1 == "ADMIN":
        menu()
    else:
        messagebox.showerror("title", "error occurred, retry")

btn = Button(t, text="Submit", background="green", font=('Arial', 20), command=submit)
btn.grid(row=4, column=0)

def menu():
    t2 = Tk()
    t2.title("MENU")
    t2.geometry('200x200')
    view = Button(t2, text="VIEW", command=viewing)
    view.pack()
    add = Button(t2, text="INSERT", command=insert_data_to_db)
    add.pack()
    delete = Button(t2, text="DELETE", command=deleting)
    delete.pack()
    update = Button(t2, text="UPDATE", command=updating)
    update.pack()

def viewing():
    t1 = Tk()
    t1.title("VIEW PAGE")
    t1.geometry('400x400')
    def table_VIEW():
        tables = ['Brandtable', 'Suppliertable', 'CarModeltable', 'Optionstable', 'Dealertable',
                'Customertable', 'Vehicletable', 'Inventorytable', 'Saletable', 'Suppliestable',
                'Manufacturertable']
        
        for table in tables:
            Button(t1, text=table, command=lambda table=table: view_table(table)).pack()
    table_VIEW()
    def view_table(table_name):
        t3 = Tk()
        t3.title(f"VIEW {table_name.upper()}")

        tree = Treeview(t3)
        tree["columns"] = table_columns[table_name]
        tree.heading("#0", text="Index")
        for col in table_columns[table_name]:
            tree.heading(col, text=col)
        tree.pack()

        query = f"SELECT * FROM {table_name}"
        cursor = connection.cursor()
        cursor.execute(query)
        rows = cursor.fetchall()
        cursor.close()

        for i, row in enumerate(rows):
            tree.insert("", "end", text=str(i+1), values=row)

def fetch_data(query, params=None):
    cursor = connection.cursor()
    if params:
        cursor.execute(query, params)
    else:
        cursor.execute(query)
    result = cursor.fetchall()
    cursor.close()
    return result

# Initialize a list to track dynamically created widgets for input fields
dynamic_widgets = []

# Dictionary to hold input fields for column data
input_fields = {}

# Function to dynamically create input fields based on the selected table
def create_input_fields(table_name):
    # Clear existing widgets
    for widget in dynamic_widgets:
        widget.destroy()
    dynamic_widgets.clear()
    input_fields.clear()

    # Create new widgets for the selected table
    for column in table_columns[table_name]:
        label = Label(input_window, text=f"Enter {column}:")
        label.pack()
        dynamic_widgets.append(label)
        
        entry = Entry(input_window)
        entry.pack()
        dynamic_widgets.append(entry)
        
        input_fields[column] = entry
# Function to execute database queries
def execute_query(query, params=None):
    cursor = connection.cursor()
    if params:
        cursor.execute(query, params)
    else:
        cursor.execute(query)
    connection.commit()


# Function to handle the submission of data to the database
def submit():
    table_name = table_combobox.get()
    query = f"INSERT INTO {table_name} ({', '.join(table_columns[table_name])}) VALUES ({', '.join([':' + column for column in table_columns[table_name]])})"
    params = {column: entry.get() for column, entry in input_fields.items()}
    try:
        execute_query(query, params)
        messagebox.showinfo("Success", "Data inserted successfully.")
    except oracledb.IntegrityError as e:
        messagebox.showerror("Error", f"Data already exists in the database. Error: {e}")

# Main function to set up the GUI
def insert_data_to_db():
    global input_window, table_combobox
    input_window = Tk()
    input_window.title("Enter Data")

    table_label = Label(input_window, text="Select table:")
    table_label.pack()

    table_var = StringVar()
    table_combobox = Combobox(input_window, textvariable=table_var, width=30)
    table_combobox['values'] = ('Brandtable', 'Suppliertable', 'CarModeltable', 'Optionstable', 'Dealertable', 'Customertable', 'Vehicletable', 'Inventorytable', 'Saletable', 'Suppliestable', 'Manufacturertable')
    table_combobox.pack()

    submit_button = Button(input_window, text="Submit", command=submit)
    submit_button.pack()

    table_combobox.bind("<<ComboboxSelected>>", lambda event: create_input_fields(table_combobox.get()))

    input_window.mainloop()

# Dictionary mapping tables to their columns
table_columns = {
        'Brandtable': ['brand_name', 'company_name'],
        'Suppliertable': ['supplier_name', 'supplier_location', 'supplierID'],
        'CarModeltable': ['modelID', 'model_name', 'model_year', 'body_style', 'brand_name'],
        'Optionstable': ['optionID', 'engine', 'transmission', 'color', 'modelID'],
        'Dealertable': ['DealerID', 'name', 'dealer_location'],
        'Customertable': ['customerID', 'name', 'address', 'phone', 'gender', 'income'],
        'Vehicletable': ['vehicleID', 'optionID', 'model_name', 'inventory', 'customerID', 'manufacturerID'],
        'Inventorytable': ['inventoryID', 'inventory_location', 'vehicleID'],
        'Saletable': ['invoiceID', 'customerID', 'DealerID', 'vehicleID', 'sale_date', 'price'],
        'Suppliestable': ['part_type', 'part_date', 'supply_date', 'supplierID'],
        'Manufacturertable': ['manufacturer_name', 'manufacturerID', 'manufacturer_location', 'vehicleeID']
    }


def execute_query(query, params=None):
    cursor = connection.cursor()
    if params:
        cursor.execute(query, params)
    else:
        cursor.execute(query)
    connection.commit()

def updating():
    update_window = Tk()
    update_window.title("Update Data")
    update_window.geometry('400x500')

    table_columns = {
        'Brandtable': ['brand_name', 'company_name'],
        'Suppliertable': ['supplier_name', 'supplier_location', 'supplierID'],
        'CarModeltable': ['modelID', 'model_name', 'model_year', 'body_style', 'brand_name'],
        'Optionstable': ['optionID', 'engine', 'transmission', 'color', 'modelID'],
        'Dealertable': ['DealerID', 'name', 'dealer_location'],
        'Customertable': ['customerID', 'name', 'address', 'phone', 'gender', 'income'],
        'Vehicletable': ['vehicleID', 'optionID', 'model_name', 'inventory', 'customerID', 'manufacturerID'],
        'Inventorytable': ['inventoryID', 'inventory_location', 'vehicleID'],
        'Saletable': ['invoiceID', 'customerID', 'DealerID', 'vehicleID', 'sale_date', 'price'],
        'Suppliestable': ['part_type', 'part_date', 'supply_date', 'supplierID'],
        'Manufacturertable': ['manufacturer_name', 'manufacturerID', 'manufacturer_location', 'vehicleeID']
    }

    # Dropdown for selecting the table
    table_var = StringVar(update_window)
    table_dropdown = OptionMenu(update_window, table_var, *table_columns.keys())
    table_dropdown.pack()

    # Dynamic form elements stored here
    form_elements = {}

    def create_form(table_name):
        # Clear existing form elements
        for widget in form_elements.values():
            widget.destroy()
        form_elements.clear()

        # Create an input field for each column except the ID (assumed first column is ID)
        for column in table_columns[table_name][1:]:  # Skip the ID column
            label = Label(update_window, text=f"{column}:")
            label.pack()
            entry = Entry(update_window)
            entry.pack()
            form_elements[column] = entry

    def update_form(*args):
        table_name = table_var.get()
        create_form(table_name)

    table_var.trace('w', update_form)  # Update form when table selection changes

    def submit_update():
        table_name = table_var.get()
        id_column = table_columns[table_name][0]  # Assuming the first column is the ID
        updates = []

        # Prepare the SET part of the update query
        for column, entry in form_elements.items():
            if entry.get():  # Only include columns that have been filled out
                updates.append(f"{column} = '{entry.get()}'")

        if not updates:
            messagebox.showerror("Error", "At least one field must be filled out.")
            return

        set_clause = ', '.join(updates)
        # Prompt for the ID of the record to update
        id_value = simpledialog.askstring("Input", f"Enter the {id_column} of the record to update:")

        if not id_value:
            messagebox.showerror("Error", "You must provide an ID value.")
            return

        # Construct the update query
        query = f"UPDATE {table_name} SET {set_clause} WHERE {id_column} = '{id_value}'"

        try:
            execute_query(query)
            messagebox.showinfo("Success", "Record updated successfully.")
        except Exception as e:
            messagebox.showerror("Error", str(e))

    # Submit button
    submit_btn = Button(update_window, text="Submit Update", command=submit_update)
    submit_btn.pack()

    update_window.mainloop()

def deleting():
    delete_window = Tk()
    delete_window.title("Delete Data")
    delete_window.geometry('400x500')

    # Tables and their unique identifier columns
    table_identifiers = {
        'Brandtable': 'brand_name',
        'Suppliertable': 'supplier_name',
        'CarModeltable': 'modelID',
        'Optionstable': 'optionID',
        'Dealertable': 'DealerID',
        'Customertable': 'customerID',
        'Vehicletable': 'vehicleID',
        'Inventorytable': 'inventoryID',
        'Saletable': 'invoiceID',
        'Suppliestable': 'supplierID',
        'Manufacturertable': 'manufacturerID'
    }

    # Dropdown for selecting the table
    table_var = StringVar(delete_window)
    table_dropdown = OptionMenu(delete_window, table_var, *table_identifiers.keys())
    table_dropdown.pack()

    def submit_delete():
        table_name = table_var.get()
        id_column = table_identifiers[table_name]
        id_value = simpledialog.askstring("Input", f"Enter the {id_column} of the record to delete:")

        if not id_value:
            messagebox.showerror("Error", "You must provide an ID value.")
            return

        query = f"DELETE FROM {table_name} WHERE {id_column} = :id_value"

        try:
            execute_query(query, {'id_value': id_value})
            messagebox.showinfo("Success", "Record deleted successfully.")
        except Exception as e:
            messagebox.showerror("Error", str(e))

    # Submit button for deletion
    submit_btn = Button(delete_window, text="Delete Record", command=submit_delete)
    submit_btn.pack()

    delete_window.mainloop()

t.mainloop()