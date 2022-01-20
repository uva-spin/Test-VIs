#!/usr/bin/env python2
import xmlrpclib

url = "https://www-bd.fnal.gov/xmlrpc/Accelerator"
list_dev = [ "F:NM4LCWFLOW", \
             "F:NM4LCWP1", "F:NM4LCWP2", "F:NM4LCWP3", \
             "F:NM4LCWT1", "F:NM4LCWT2", "F:NM4LCWT3", \
]

server = xmlrpclib.Server(url)
for dev in server.getReading(list_dev):
  print dev
