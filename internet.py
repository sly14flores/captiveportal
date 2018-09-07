import MySQLdb
import subprocess
import time

db = MySQLdb.connect("localhost","root","root","lzdscaptiveportal")
cursor = db.cursor()
sql = "SELECT mac_address, ip_address, DATE_ADD(session_datetime, INTERVAL hours_allowed HOUR) FROM devices WHERE unlimited = 0"
cursor.execute(sql)
rows = cursor.rowcount
data = cursor.fetchall()

# for row in data:
	# mac = row[0]
	# ip = row[1]
	# mac = mac.upper()
	# ipt = "sudo iptables -D internet -t mangle -m mac --mac-source %s -j RETURN" % mac
	# rmt = "sudo rmtrack %s" % ip
	# subprocess.call(ipt, shell=True)
	# subprocess.call(rmt, shell=True)
	# time.sleep(1)

db.close()

