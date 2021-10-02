#!/bin/bash


echo "let's check what time a certain dealer was working! First, insert a date in four digits. Ex. 0310"
read _d

	if [ $_d == 0310 ]
	then
		{
		echo "Pulling the data for March 10th."
		}
	elif [ $_d == 0312 ]
	then
		{
		echo "Pulling the data for March 12th."
		}
	elif [ $_d == 0315 ]
	then
		{
		echo "Pulling the data for March 15th."
		}
	else
		{
		echo "File for date not present."
		exit 0
		}
	fi
echo "What hour would you like to check? [1-12]"
read _t1
echo "Awesome! Is this a.m. or p.m.? Note: a.m. or p.m. as written!"
read _t2
	if [ $_t2 != a.m. ] && [ $_t2 != p.m. ]
	then
		{
		echo "Error: Invalid input: Must be 'a.m.' or 'p.m.'"
		exit 0
		}
	elif [ $_t1 == 12 ] && [  $_t2 == a.m. ]
	then
		{
		_r=3
		}
	elif [ $_t1 -gt 12 ]
	then
		{
		echo "Error: Invalid Number: input to high!"
		exit 0
		}
	elif [ $_t1 -lt 1 ]
	then
		{
		echo "Error: Invalid Number: input to low!"
		exit 0
		}
	elif [ $_t2 == a.m. ]
	then
		{
		_r=$(( $_t1 + 2 ))
		}
	elif [ $_t2 == p.m. ]
	then
		{
		_r=$(( $_t1 + 14 ))
		}
	fi
echo "Were they dealing Blackjack, Roulette, or Texas Hold 'Em? Type 'bj' for Blackjack, 'rlt' for Roulette, or 'hldm' for Texas Hold 'em!"
read _g

	if [ $_g != bj ] && [ $_g != rlt ] && [ $_g != hldm ]
	then
		{
		echo "Error: Invalid game selected: must select 'bj', 'rlt', or 'hldm'"
		exit 0
		}
	elif [ $_g == bj ] && [ $_d == 0310 ]
	then
		{
		awk -v row="$_r" 'NR==row{print $3, $4}' 0310_Dealer_schedule
		}
	elif [ $_g == bj ] && [ $_d == 0312 ]
        then
	        {
                awk -v row="$_r" 'NR==row{print $3, $4}' 0312_Dealer_schedule
                }
	elif [ $_g == bj ] && [ $_d == 0315 ]
        then
	        {
                awk -v row="$_r" 'NR==row{print $3, $4}' 0315_Dealer_schedule
                }
	elif [ $_g == rlt ] && [ $_d == 0310 ]
        then
	        {
                awk -v row="$_r" 'NR==row{print $5, $6}' 0310_Dealer_schedule
                }
	elif [ $_g == rlt ] && [ $_d == 0312 ]
        then
	        {
                awk -v row="$_r" 'NR==row{print $5, $6}' 0312_Dealer_schedule
                }
	elif [ $_g == rlt ] && [ $_d == 0315 ]
        then
	        {
                awk -v row="$_r" 'NR==row{print $5, $6}' 0315_Dealer_schedule
                }
	elif [ $_g == hldm ] && [ $_d == 0310 ]
        then
	        {
                awk -v row="$_r" 'NR==row{print $7, $8}' 0310_Dealer_schedule
                }
	elif [ $_g == hldm ] && [ $_d == 0312 ]
        then
	        {
                awk -v row="$_r" 'NR==row{print $7, $8}' 0312_Dealer_schedule
                }
	elif [ $_g == hldm ] && [ $_d == 0315 ]
        then
	        {
                awk -v row="$_r" 'NR==row{print $7, $8}' 0315_Dealer_schedule
                }

	fi

echo Date: $_d Hour: $_t1 $_t2 Game: $_g
echo "Script finished."
