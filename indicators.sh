#!/usr/bin/env bash 

function indicators() {
    indlist=( ppa:atareao/atareao \
		  ppa:fossfreedom/indicator-sysmonitor \
	          ppa:indicator-multiload/stable-daily \
		  ppa:dgadomski/indicator-sensors )
    
    for i in "${indlist[@]}"
    do
	# sudo add-apt-repository -y $i
	echo $i
    done

    # sudo apt-get update
    sudo apt-get install -y indicator-multiload indicator-sysmonitor caffeine calendar-indicator indicator-sensors  indicator-cpufreq my-weather-indicator
}

indicators
