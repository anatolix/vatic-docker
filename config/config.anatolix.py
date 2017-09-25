signature = "fKKAwaw6oCXQ1oNdZ+orgiEyjCKoEBhFWdpv4PGc"    # AWS secret access key
accesskey = "AKIAJ2ICE7JIF2VFD6VQ"                        # AWSaccesskeyID
sandbox   = True                      # if true, put on workersandbox.mturk.com
localhost = "http://bigdata:8111/"    # your local host
database  = "mysql://root@localhost/vatic" #server://user:pass@localhost/dbname
geolocation = "34a0dc5f3c5643a9a10842db0616e7ec1b18b1743fc9ee77163c75561df8788b"  # api key for ipinfodb.com
maxobjects  = 25;

# probably no need to mess below this line

import multiprocessing
processes = multiprocessing.cpu_count()
import os.path
import sys
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
