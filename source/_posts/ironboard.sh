#!/bin/bash
docker kill $(cat /root/.ironboard.cid)
rm /root/.ironboard.cid
docker run -t -i --cidfile="/root/.ironboard.cid" -p 3000:3000 dockerregistry.flatironschool.com/ironboard /bin/bash -c "service postgresql start > /dev/null && cd /ironboard && source /etc/profile.d/rvm.sh && rvm reload > /dev/null && bundle exec rake db:schema:load > /dev/null && /bin/bash"
