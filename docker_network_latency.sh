#!/usr/bin/env bash
# -*- coding:  utf-8 -*-
# Author: Gaurav Sablok
# date: 2023-10-16
# MIT License
echo "plotting all the docker networks as visualization 
                            and also pruning the ones that are not working"
echo "please add the sleep command before running after the 
            original code so that it can plot after that every interval"
read -r -p "network latency plotter docker either for a specific or a subnet mask:": network
read -r -p "do you want to prune the sleeping network": option
gem install youplot
if [[ $network == "yes" ]]
then 
   read -r -p "do you have a manual ip address to plot": ip_address
   if [[ $ip_address ]]
   then 
        ping "$ip_address" > "${ip_address}".log && cat "${ip_address}".log | cut -f 7 -d " " | cut -f 2 -d "=" | uplot bar -d, -t "time latency"
   else 
   for i in $(docker network ls | cut -f 1 -d " " | sed "/NETWORK/d")
         do echo ping "$i" > "${i}".log && cat "${i}".log | cut -f 7 -d " " | cut -f 2 -d "=" | uplot bar -d, -t "timelatency" 
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
            done
    fi
fi
