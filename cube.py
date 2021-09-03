# Authors
# Cyrus Muchiri
# Kelvin Mwaura
# Stanley Mandela
# -- 1.Connect to database (MSSQL)
# -- 2.Get Preferences and store in array , get first prefences
# -- 3.Connect to device (SSH)
# -- 4.Write Configuration to device (NETCONF)

# -- Validation

import os.path
import time
import sys
import re
import pyodbc
import http.client
import json
import paramiko
import hashlib



class DevNet:
    connection = object  # database connection
    ssh_connection = object  # ssh connection
    session = object  # session
    preferences = [None]
    host = ""
    port = ""
    username = ""
    password = ""

    def __init__(self):
        # constructor
        self
        # get credentials

    def dbconnect(self, server=None):
        server = "10.244.0.5"
        database = "DevNet"
        tcon = "yes"
        uname = "sa"
        pword = "K0Junga#"
        conn = pyodbc.connect(driver='{SQL Server Native Client 11.0}', host=server, database=database,
                              user=uname, password=pword)
        self.connection = conn

    def get_credentials(self):
        cursor = self.connection.cursor()
        cursor.execute('SELECT * FROM ssh_credentials')
        i = 0
        for row in cursor:
            self.host = row[1]
            self.username = row[3]
            self.password = row[4]

    def get_preferences(self):
        cursor = self.connection.cursor()
        # Get count of dial peers
        cursor.execute('SELECT COUNT(*) FROM pref_sip_operators')
        result = cursor.fetchone()
        number_of_rows = result[0]
        # set size of preferences array to count of dial peers
        self.preferences = self.preferences * number_of_rows
        # get dial peers
        cursor.execute('SELECT * FROM pref_sip_operators')
        i = 0  # iterator
        for row in cursor:
            self.preferences[i] = row
            i = i + 1
        self.connection.close()

    def connect_to_device(self):
        # Logging into device
        self.session = paramiko.SSHClient()

        # This allows auto-accepting unknown host keys. Not to be used in production
        self.session.set_missing_host_key_policy(paramiko.AutoAddPolicy())

        # Connect to the device using username and password
        self.session.connect(hostname=self.host, username=self.username, password=self.password)
        # Start an interactive shell session on the router
        self.connection = self.session.invoke_shell()

        # Setting terminal length for entire output - disable pagination
        self.connection.send("enable\n")
        self.connection.send("terminal length 0\n")
        time.sleep(1)

        # Entering global config mode
        self.connection.send("\n")
        self.connection.send("configure terminal\n")
        time.sleep(1)

    def write_config(self):
        preference = 0
        for dial_peer in self.preferences:
            # Create dial peer
            peer = str(1) + str(dial_peer.AREA) + str(dial_peer.SPCODE) + str(dial_peer.GW)
            # write dial peer and preference
            self.connection.send("dial-peer voice " + peer + " voip\n")  # dial-peer voice 1 254 3 voip
            self.connection.send("preference " + str(preference) + "\n")  # preference 0
            preference = preference + 1
            time.sleep(1)

        router_output = self.connection.recv(65535)
        # Test for reading command output
        print(str(router_output) + "\n")


if __name__ == "__main__":
    devnet = DevNet()  # create object
    devnet.dbconnect()  # dbConnect
    devnet.get_credentials()  # get Credentials
    devnet.get_preferences()  # get Preferences
    devnet.connect_to_device()  # Connect to device
    devnet.write_config()  # write config
