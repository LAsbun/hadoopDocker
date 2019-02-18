#!/bin/bash
pcount=$#
if((pcount==0));then
        echo no args;
        exit;
fi
myHostName=`hostname`
echo -------------localhost----------

for((host=1; host<4; host++)); do
        echo ----------hadoop$host---------
        if [ $myHostName = "hadoop00"$host ]
              then
          echo -------xxxx-------- hadoop$host ----------------
                    continue
              fi
        ssh hadoop00$host $@
done