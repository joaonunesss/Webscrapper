import datetime
from enum import Enum

# functional syntax
log = Enum('log', ['DEBUG', 'INFO', 'WARNING', 'ERROR', 'CRITICAL'])

def logger(logLvl, msg):
	file = open("log.txt", "a")
	timestamp = datetime.datetime.now()
	# Format the timestamp as a string in the MySQL-compatible format
	mysql_timestamp = timestamp.strftime('%Y-%m-%d %H:%M:%S')
	string = mysql_timestamp + " - [" + logLvl.name + "] " + msg + "\n"
	file.write(string)
	file.close()
