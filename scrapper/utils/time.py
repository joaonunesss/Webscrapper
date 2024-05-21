import datetime

def get_current_timestamp():
	timestamp = datetime.datetime.now()
	# Format the timestamp as a string in the MySQL-compatible format
	return timestamp.strftime('%Y-%m-%d %H:%M:%S')