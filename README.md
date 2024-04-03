# Database Management System (DBMS) Application

This application provides a graphical user interface (GUI) for managing a database. It allows users to perform various operations such as viewing, inserting, updating, and deleting data from different tables in the database.

## Features

1. **Login Page**: Users need to provide a username and password to access the application. The default username and password are both set to "ADMIN".

2. **Main Menu**: After successful login, users are presented with a menu where they can choose different operations like viewing data, inserting data, updating records, and deleting records.

3. **Viewing Data**: Users can view the data from different tables in the database. The application displays the data in a tabular format for easy visualization.

4. **Inserting Data**: Users can insert new records into the database by selecting a table and entering values for the corresponding columns. The application validates the data before insertion to ensure data integrity.

5. **Updating Data**: Users can update existing records in the database by specifying the ID of the record and entering new values for the columns. The application verifies the ID before performing the update operation.

6. **Deleting Data**: Users can delete records from the database by providing the ID of the record to be deleted. The application confirms the deletion operation before proceeding.

## Prerequisites

- Python 3.x
- Oracle Database

## Installation

1. Clone this repository to your local machine.

2. Install the required Python packages using the following command:

3. Update the database connection details in the code:
- Set the `username`, `password`, `host`, `port`, and `service_name` variables according to your Oracle Database configuration.

## Usage

1. Run the Python script `login.py` to start the application.

2. Enter the username and password in the login window. The default username and password are both set to "ADMIN".

3. After successful login, you will be directed to the main menu where you can select the desired operation.

4. Follow the on-screen instructions to perform the selected operation (e.g., view data, insert data, update records, delete records).

5. Close the application window when done.

## Support

For any issues or questions, please open an issue in the GitHub repository.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
