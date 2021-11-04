# NYC-Yellow-Taxi-Trips-Data
Calculate all the trips over the 0.9 percentil

## Components

To solve the problem i use a bash script. I called: script.sh

## How it works

At this section i will translate the code to human.

Fist step: download the tlc-trip-record-data page and filter the links staying with only "yellow" trips.
I stored the result on a text file called: enlaces.txt

At this point i have all the csv links of the yellow trips and only have to do is join it all to be able to calculate the 0.9 percentile.
I join all and duplicate the trip column ordering on the 1st position. I do this replication to sort them in a easy way.

At the finish of this process the file all.csv got all the files join in one, and an extra column with the trips to sort it.

Now, sort the file is mandatory to calculate the percentile so i sort it and eliminate the 1st duplicate column (cause i don't need it anymore)

after that there are only maths left.

to calculate the percentile:
1. Count the order.csv file (wich have all the trips joined and ordered)
2. Put in a variable the percentile value: 0.9
3. Put in the calc var the number of lines * percentil. This value rounded to the next int is the first row of the file with is in the percentil.
4. The command: filaPercentil=$(echo $calc | perl -nl -MPOSIX -e 'print ceil($_);') do the round to the next int. (F.E: 11.22 is 12.)
5. Calculate the row number starting from the end of file to do the tail.
6. Tail the file and get the csv with all the trips 

And there it is the solucion.csv file got all the trips over 0.9 percentil for all the NYC “Yellow Taxi” Trips Data.

## How can i run it?

./script.sh

## Comments

This is not an optimized algorithim and is only a way to solve the problem.
