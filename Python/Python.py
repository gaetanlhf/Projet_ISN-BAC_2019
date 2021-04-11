#!/usr/bin/python
# -*- coding: UTF-8 -*-

# Importation des bibliothèques
import socket
import serial

# Connexion série
serial = serial.Serial('/dev/ttyUSB0', 9600)

# Port réception/envoi des données via socket
HOST = ''
PORT = 5204

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((HOST, PORT))
s.listen(1)

def pi2arduino():
    while 1:        
        conn, addr = s.accept()
        while 1:
            data = conn.recv(1024)
            print(data)
            # Envoie des données sur le port série (ici USB)
            if not data: break
            serial.write(data)
        conn.close()
pi2arduino()