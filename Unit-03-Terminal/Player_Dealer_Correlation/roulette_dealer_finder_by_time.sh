# You manager is impressed with the work you have done so far on the investigation.
# They tasked you with building a shell script that can easily analyze future employee schedules. They will use this to determine which employee was working at a specific time in the case of future losses.
# Complete the following tasks:

# Remain in the Dealer_Analysis directory. Develop a shell script called roulette_dealer_finder_by_time.sh that can analyze the employee schedule to easily find the roulette dealer at a specific time.
# Hint: You will be using a script similar to the one you created for the dealer analysis step, but you will not output the results into a file.

# Design the shell script to accept the following two arguments:
# One for the date (four digits)
# One for the time
# Note: The argument should be able to accept a.m. or p.m.
# Test your script on the schedules to confirm it outputs the correct dealer at the time specified.

grep "$1" $2"_D"* | awk -F" " '{print "Time: "$1" "$2" Dealer: "$3" "$4}';
