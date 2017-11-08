#!/usr/bin/env bash 

function indicators() {
    sudo -v
    sudo add-apt-repository ppa:atareao/atareao ppa:fossfreedom/indicator-sysmonitor ppa:indicator-multiload/stable-daily ppa:alexmurray/indicator-sensors-daily ppa:atareao/atareao

    sudo apt-get update
    sudo apt-get install indicator-multiload indicator-sysmonitor caffeine calendar-indicator indicator-sensors lm-sensors indicator-cpufreq my-weather-indicator -y
}
