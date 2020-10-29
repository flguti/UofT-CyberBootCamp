#!/bin/bash

#### Step 1: Investigation Preparation
# Begin by making a single directory titled Lucky_Duck_Investigations.
mkdir -p ./Lucky_Duck_Investigations/

# In this directory, create a directory for this specific investigation titled Roulette_Loss_Investigation.
mkdir -p ./Lucky_Duck_Investigations/Roulette_Loss_Investigation

# In Roulette_Loss_Investigation, create the following directories:
# Player_Analysis to investigate the casino player.
# Dealer_Analysis to investigate the dealers.
# Player_Dealer_Correlation to summarize your findings of the collusion.
mkdir -p ./Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis/ ./Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/ ./Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/

# Create empty files called Notes_<Directory Name> under each subdirectory to store investigation notes.
# For example: Notes_Player_Analysis
touch Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Analysis/Notes_Player_Analysis Lucky_Duck_Investigations/Roulette_Loss_Investigation/Dealer_Analysis/Notes_Dealer_Analysis Lucky_Duck_Investigations/Roulette_Loss_Investigation/Player_Dealer_Correlation/Notes_Player_Dealer_Correlation

#### Step 2: Gathering Evidence
# Navigate to the directory where you created the Lucky_Duck_Investigations directory and run the following command to set up the evidence files:
# wget "https://tinyurl.com/3-HW-setup-evidence" && chmod +x ./3-HW-setup-evidence && ./3-HW-setup-evidence
cd ./Lucky_Duck_Investigations 
wget "https://tinyurl.com/3-HW-setup-evidence" && chmod +x ./3-HW-setup-evidence && ./3-HW-setup-evidence

# After running this command your current directory should have the following subdirectories:
# Dealer_Schedules_0310: Contains the dealer schedules.
# Lucky_Duck_Investigations: Contains the investigation directories and notes files you created.
# Roulette_Player_WinLoss_0310: Contains the data for player wins and losses.
# The Dealer_Schedules_0310 and Roulette_Player_WinLoss_0310 directories contain the dealer schedules and win/loss player data from the roulette tables during the week of March 10.
# Since the losses occurred on March 10, 12, and 15, move the schedules for those days into the directory Dealer_Analysis.
# Move the files for those days into the directory Player_Analysis.
pwd
days=(0310 0312 0315)
for d in "${days[@]}"; do
    mv ./Dealer_Schedules_0310/$d* ./Roulette_Loss_Investigation/Dealer_Analysis/
    mv ./Roulette_Player_WinLoss_0310/$d* ./Roulette_Loss_Investigation/Player_Analysis/
done

#### Step 3: Correlating the Evidence
# Your next task is to correlate the large losses from the roulette tables with the dealer schedule. This will help you determine which dealer and player are colluding to steal money from Lucky Duck.
# Note: Winnings for Lucky Duck Casino are indicated with a positive number and losses are indicated with a negative number.
# Complete the player analysis.
# Navigate to the Player_Analysis directory.
# Use grep to isolate all of the losses that occurred on March 10, 12, and 15.
# Place those results in a file called Roulette_Losses.
cd ./Roulette_Loss_Investigation/Player_Analysis/
grep - * >Roulette_Losses
clear
# Preview the file Roulette_Losses and analyze the data.
cat ./Roulette_Losses
echo "Can you identify if there is a certain player that was playing during each of those times? Please enter the player name:"
read player 
clear
echo $player
# Record in the Notes_Player_Analysis file:
# The times the losses occurred on each day.
echo "Times the losses occurred on each day:" >>Notes_Player_Analysis
grep - Roulette_Losses | awk -F" " '{print $1" "$2}' >>Notes_Player_Analysis
# If there is a certain player that was playing during each of those times.
echo "We identifired that Player $player was playing during most of the losses periods" >>Notes_Player_Analysis
# The total count of times this player was playing.
# Hint: Use the wc command to find this value.
echo "The total count of times $player was playing during losses:" >>Notes_Player_Analysis
grep "$player" Roulette_Losses | wc -l >>Notes_Player_Analysis
cat ./Notes_Player_Analysis
echo "press enter to continue"
read null  
clear
# Complete the dealer analysis.
# Navigate to the Dealer_Analysis directory.
cd ../Dealer_Analysis/
# This file contains the dealer schedules for the various Lucky Duck casino games: Blackjack, Roulette, and Texas Hold 'Em.

# Preview the schedule to view the format and to understand how the data is separated.
# Using your findings from the player analysis, create a separate script to look at each day and time that you determined losses occurred. Use awk, pipes, and grep to isolate out the following four fields:
# Time
# a.m./p.m.
# First name of roulette dealer
# Last name of roulette dealer
# For example, if a loss occurred on March 10 at 2 p.m., you would write one script to find the roulette dealer who was working at that specific day and time.
# Hint: You will have many scripts, but only a small change is required for each script.
# Run all of the scripts and append those results to a file called Dealers_working_during_losses.
for d in "${days[@]}"; do
    grep - ../Player_Analysis/$d* | awk -F" " '{print $1" "$2}' >> ./$d
    echo "day $d" >> ./Dealers_working_during_losses
    while read i ; do grep "$i" $d"_D"* | awk -F" " '{print "Time: "$1" "$2" Dealer: "$5" "$6}'; done <$d >> ./Dealers_working_during_losses
done
# Preview your file Dealers_working_during_losses and analyze the data.
cat ./Dealers_working_during_losses
echo "Can you identify the Dealer that was working during each of those times? Please enter the player name:"
read dealer 
clear
echo $dealer
# Record in the Notes_Dealer_Analysis file:
# The primary dealer working at the times where losses occurred.
echo "Times the losses occurred on each day:" >> Notes_Dealer_Analysis
cat ./Dealers_working_during_losses >> Notes_Dealer_Analysis
echo "We identified that Dealer $dealer was working during most of the losses periods." >>Notes_Dealer_Analysis
# How many times the dealer worked when major losses occurred.
echo "The total count of times $dealer was playing during Roulet losses:" >>Notes_Dealer_Analysis
grep "$dealer" Dealers_working_during_losses | wc -l >>Notes_Dealer_Analysis
cat ./Notes_Dealer_Analysis
echo "press enter to continue"
read null  
# Complete the player/employee correlation.

# In the notes file of the Player_Dealer_Correlation directory, add a summary of your findings noting the player and dealer you believe are colluding to scam Lucky Duck.
# Make sure to document your specific reasons for this finding.
cd ../Player_Dealer_Correlation
clear
echo "" >> Notes_Player_Dealer_Correlation
echo "" >> Notes_Player_Dealer_Correlation
echo "***  Final Report  ***" >> Notes_Player_Dealer_Correlation
echo "" >> Notes_Player_Dealer_Correlation
echo "" >> Notes_Player_Dealer_Correlation
echo "After all the considerations we could identify:" >> Notes_Player_Dealer_Correlation
echo "" >> Notes_Player_Dealer_Correlation
echo "Player Findings" >> Notes_Player_Dealer_Correlation
cat ../Player_Analysis/Notes_Player_Analysis >> Notes_Player_Dealer_Correlation
echo "" >> Notes_Player_Dealer_Correlation
echo "With those findings we can identify that $player may be involved in any fraud involving the Roulette games." >> Notes_Player_Dealer_Correlation
echo "" >> Notes_Player_Dealer_Correlation
echo "Dealer Findings" >> Notes_Player_Dealer_Correlation
cat ../Dealer_Analysis/Notes_Dealer_Analysis >> Notes_Player_Dealer_Correlation
echo "" >> Notes_Player_Dealer_Correlation
echo "With those findings we can identify that $dealer also may be involved in any fraud involving the Roulette at Lucky Duck Casino." >> Notes_Player_Dealer_Correlation
echo "" >> Notes_Player_Dealer_Correlation
echo "We suggest Lucky Duck Casino to use this information and fidings to take the capable actions against $player and $dealer." >> Notes_Player_Dealer_Correlation
echo "" >> Notes_Player_Dealer_Correlation
echo "Sincerely" >> Notes_Player_Dealer_Correlation
echo "Cybersecurity team" >> Notes_Player_Dealer_Correlation
echo "" >> Notes_Player_Dealer_Correlation
echo "" >> Notes_Player_Dealer_Correlation
cat ./Notes_Player_Dealer_Correlation
