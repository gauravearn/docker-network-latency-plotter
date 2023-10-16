# docker_network_latency_plotter
a docker network latency plotter coded which is a part of the bundle docker swarm management and this subpart will check and plot all the docker network latency and also prune them if they are sleeping or are dead. this is the subpart of the docker swarm and management bundle which i already finished coding and pushing in a short while. A snippet of which is here if you want to use it separately. if will show you visual graphs for each of the container that is on the network including the bridge and the local ones. A bigger bundle you can find at [docker_management](https://github.com/sablokgaurav/docker_swarm_management) which is in release.

```
if [[ $ip_address ]]
   then 
        ping "$ip_address" > "${ip_address}".log && cat "${ip_address}".log | \
                           cut -f 7 -d " " | cut -f 2 -d "=" | uplot bar -d, -t "time latency"
   else 
   for i in $(docker network ls | cut -f 1 -d " " | sed "/NETWORK/d") \
         do echo ping "$i" > "${i}".log && cat "${i}".log | cut -f 7 -d " " | \
                                             cut -f 2 -d "=" | uplot bar -d, -t "timelatency" 
   done
   fi
fi 
if [[ $network == "yes" ]] && 
        [[ $option == "yes" ]]
then 
     for i in $(docker network ls | cut -f 1 -d " " | sed "/NETWORK/d")
         do 
            echo ping "$i" > "${i}".log && cat "${i}".log
        done
            for file in $(pwd)/*log
            do 
                if [[ -f $file ]] &&
                        [[ -z $file ]]
                then
                    docker network prune -y
```
Gaurav Sablok \
ORCID: https://orcid.org/0000-0002-4157-9405 \
WOS: https://www.webofscience.com/wos/author/record/C-5940-2014 \
RubyGems Published: https://rubygems.org/profiles/sablokgaurav \
Python Packages Published : https://pypi.org/user/sablokgaurav/
