#!/bin/bash

. $HOME/.bashrc

# PGPASSWORD=password psql -h localhost -U postgres -d postgres -c 'select * from rf_whatsplaying' > today.txt
# git add today.txt

#PGPASSWORD=password psql -h localhost -U postgres -d postgres -c 'select * from rf_whatsplaying_fd' > today_fd.txt
#git add today_fd.txt

##PGPASSWORD=password psql -h localhost -U postgres -d postgres -c 'select * from rf_whatsplaying_fd_gantt' > today_fd_gantt.txt
git add today_fd_gantt.txt

(cd $HOME/src/movieagent/data/seen && ../../venv/bin/python html.py > $HOME/src/movieagent-pub/whatsplaying.html)
git add whatsplaying.html

(cd $HOME/src/movieagent/data/seen && ../../venv/bin/python html_sf.py > $HOME/src/movieagent-pub/whatsplaying-sf.html)
git add whatsplaying-sf.html

# (cd $HOME/src/movieagent/data/seen && ../../venv/bin/python html_medford.py > $HOME/src/movieagent-pub/whatsplaying-medford.html)
# git add whatsplaying-medford.html

git commit -m today
git push -u origin master
