import psycopg2

import sys

if __name__ == "__main__":
	
	try:
    	
		arguments = sys.argv
		url = "host='{0}' dbname='{1}' user='{2}' password='{3}'".format('localhost', arguments[1], 'postgres', 'Yael123')


		conn = psycopg2.connect(url)


		cursor = conn.cursor()

		sql = """SELECT
relname as table,
pg_size_pretty(pg_total_relation_size(relid)) As size,
pg_size_pretty(pg_total_relation_size(relid)-pg_relation_size(relid)) as external_size
FROM pg_catalog.pg_statio_user_tables
ORDER BY pg_total_relation_size(relid) DESC LIMIT 10"""

		cursor.execute(sql)

		for row in cursor:
			print("\t",row[0],"\t",row[1],"\t",row[2])


		cursor.close()
	except (Exception, psycopg2.DatabaseError) as e:
		print(e)
