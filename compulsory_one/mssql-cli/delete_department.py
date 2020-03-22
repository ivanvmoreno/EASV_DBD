from .config.constants import DB_HOST, DB_NAME, DB_PWD, DB_USER
from .modules.mssql_helper import MSSQLHelper
from pyodbc import ProgrammingError
from sys import argv

# Name of the USP in the remote database
usp_name = 'dbo.usp_DeleteDepartment'

if __name__ == "__main__":
    try:
        # Open connection to database
        cnxn = MSSQLHelper(DB_HOST, DB_NAME, DB_USER, DB_PWD).connect()
        cursor = cnxn.cursor()
        # Get department number from CLI arguments
        department_number = int(argv[1])
        # Execute USP
        emp_num = cursor.execute(f'EXECUTE {usp_name} {department_number}').fetchval()
        print(f'Department {department_number} has been deleted')
    except ProgrammingError as error:
        print('Error during database connection', error)
