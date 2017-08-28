#!/bin/bash

# before running this, delete the files .txt and *_average.txt
INIT_FILE_NAME="test_fig5.3_5-25"

INIT_NUM_TCP_USERS=5
STEP_NUM_TCP_USERS=5
UPPER_LIMIT_NUM_TCP_USERS=25

PERCENTAGE_VOIP_USERS=100 #10 means 10%, i.e. there will be a VoIP upload user per each 10 TCP download users

INITSEED=1
MAXSEED=20

for ((i=INIT_NUM_TCP_USERS; i<=UPPER_LIMIT_NUM_TCP_USERS; i=$((${i}+${STEP_NUM_TCP_USERS})) )); do

  for ((seed=INITSEED; seed<=MAXSEED; seed++)); do

    NUMBER_TCP_USERS=$i

    NUMBER_VOIP_USERS=$(( (${NUMBER_TCP_USERS}*${PERCENTAGE_VOIP_USERS}) / 100))

    echo "$INIT_FILE_NAME $(date) seed: $seed. number of TCP download users $NUMBER_TCP_USERS. number VoIP upload users $NUMBER_VOIP_USERS. Starting..."
    NS_GLOBAL_VALUE="RngRun=$seed" ./waf -d optimized --run \
	"scratch/wifi-central-controlled-aggregation_v139 \
	--simulationTime=300 \
	--numberVoIPupload=$NUMBER_VOIP_USERS \
	--numberVoIPdownload=0 \
	--numberTCPupload=0 \
	--numberTCPdownload=$NUMBER_TCP_USERS \
	--nodeMobility=3 \
	--number_of_APs=16 \
	--number_of_APs_per_row=4 \
	--distance_between_APs=100 \
	--distanceToBorder=30
	--outputFileName=$INIT_FILE_NAME \
	--outputFileSurname="TcpDownUsers-"$NUMBER_TCP_USERS"_seed-"$seed \
	--rateAPsWithAMPDUenabled=1.0 \
	--aggregationAlgorithm=0 \
	--prioritiesEnabled=1 \
	--powerLevel=1 \
	--maxAmpduSize=8000 \
	#--maxAmpduSizeWhenAggregationDisabled=8000
	--version80211=0 \
	--rateModel=Ideal \
	--RtsCtsThreshold=999999 \
	--enablePcap=0 \
	--generateHistograms=0 \
	--writeMobility=0 \
	--wifiModel=0 \
	--numChannels=16 \
	--verboseLevel=0 \
	--printSeconds=10 \
	"
  done
done
