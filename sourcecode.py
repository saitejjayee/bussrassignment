# Python3 code to display hostname,IP and date

# Importing socket library
import socket
  
from datetime import date

# Function to display hostname and
# IP address
def get_Host_name_IP():
    try:
        print("Hello World! I am running on")
        host_name = socket.gethostname()
        host_ip = socket.gethostbyname(host_name)
        print(" Hostname :  ",host_name)
        print(" and IP : ",host_ip)
        today = date.today()
        print(" on Date:", today)
    except:
        print(" Unable to get Hostname and IP")
  
# Driver code
get_Host_name_IP() #Function call
  
