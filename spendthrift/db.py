# db_helper.py

import psycopg2
from psycopg2.extras import RealDictCursor
from contextlib import contextmanager
import config
import os


class PostgresDB:
    def __init__(self, host, dbname, user, password, port=5432):
        self.conn_params = {
            "host": host,
            "dbname": dbname,
            "user": user,
            "password": password,
            "port": port,
        }

    @contextmanager
    def get_connection(self):
        conn = psycopg2.connect(**self.conn_params)
        try:
            yield conn
        finally:
            conn.close()

    @contextmanager
    def get_cursor(self, dict_cursor=False):
        with self.get_connection() as conn:
            cursor_factory = RealDictCursor if dict_cursor else None
            with conn.cursor(cursor_factory=cursor_factory) as cur:
                yield cur
                conn.commit()

    def execute(self, query, params=None):
        with self.get_cursor() as cur:
            cur.execute(query, params)

    def fetch_all(self, query, params=None):
        with self.get_cursor(dict_cursor=True) as cur:
            cur.execute(query, params)
            return cur.fetchall()

    def fetch_one(self, query, params=None):
        with self.get_cursor(dict_cursor=True) as cur:
            cur.execute(query, params)
            return cur.fetchone()
        
if __name__ == "__main__":
    db = PostgresDB(
        host=config.DB_HOST,
        dbname=config.DB_NAME,
        user=config.DB_USER,
        password=os.getenv(config.DB_PASSWORD),
        port=config.DB_PORT,
    )
    # Example usage
    print(db.fetch_one("SELECT NOW();").get("now"))
