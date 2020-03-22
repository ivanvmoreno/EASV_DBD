# mssql-cli
This directory contains a series of scripts used to demonstrate the usage of `pyodbc` as a Microsoft SQL driver for Python.

## Execution of examples
The required version of Python is `>= 3.7`.

Before executing any of the included scripts, install the required dependencies using `Pipenv install` or `pip install -r requirements.txt`.

The scripts expect several environment variables as input:
| Environment variable | Description |
| -------------------- | ----------- |
| DB_SERVER | Database server hostname |
| DB_NAME | Name of the Database to open |
| DB_USER | Database login username |
| DB_PWD | Database login password |

Input to scripts is provided using arguments (e.g. `python mssql-cli.delete_department [department_number]`, being `[department_number]` an argument passed to the script). 