import pyodbc


class MSSQLHelper:
    def __init__(self, db_host, db_name, db_user, db_pwd, db_driver='{ODBC Driver 17 for SQL Server}'):
        self._cnxn = None
        self._cnxn_uri = \
            f'DRIVER={db_driver};SERVER={db_host};DATABASE={db_name};UID={db_user};PWD={db_pwd}'

    def connect(self):
        if not self._cnxn:
            self._cnxn = pyodbc.connect(self._cnxn_uri)
        return self._cnxn
