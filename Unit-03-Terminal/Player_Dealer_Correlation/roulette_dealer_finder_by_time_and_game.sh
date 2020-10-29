# Bonus
# In case there is future fraud on the other Lucky Duck games, create a shell script called roulette_dealer_finder_by_time_and_game.sh that has the three following arguments:

# Specific time
# Specific date
# Casino game being played
# Hint: The argument does not need to name the specific casino game.

echo "Enter the Specific time in a format xx:xx:xx xx (hour):(minute):(second) (AM or PM upper case) ex.: 10:00:00 AM"
read time
echo "Enter the Specific date xxxx (month)(day) ex.: 0310"
read date
echo "Enter the number of the game being played 1 for BlackJack 2 for Roulette or 3 for Texas_Hold_EM ex.: 1"
read game

if [ $game -eq 1 ]; 
then
grep "$time" $date"_D"* | awk -F" " '{print "Time: "$1" "$2" Dealer: "$3" "$4}';
elif [ $game -eq 2 ]; 
then
grep "$time" $date"_D"* | awk -F" " '{print "Time: "$1" "$2" Dealer: "$5" "$6}';
else
grep "$time" $date"_D"* | awk -F" " '{print "Time: "$1" "$2" Dealer: "$7" "$8}'
fi

