
import random
import datetime


def random_date(seed):
    return datetime.datetime.fromordinal(736413+seed)
f = open("test.sql","w")

for i in range(150, 1000):
    f.write("insert into camara values ("+str(i+1)+");\n")

for i in range(100, 1000):
    f.write("insert into video values ("+str(i+1)+",'"+str(random_date(i*9))+"','"+str(random_date(i*9+1))+"');\n")
f.close()
