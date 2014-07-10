The Birthday Problem
================


# Background
There's the famous statistical truth that, [given only 23 people, there is better than a 50% chance that at least two share a birthday](http://en.wikipedia.org/wiki/Birthday_problem).  What is the probability that two birthdays are shared?  How about three?  What are the probabilities for larger and smaller groups?

I interviewed 63 colleagues at The University of Chicago's [Data Science for Social Good](http://dssg.io) program and found three birthdays shared by at least two people.  Rather than calculating the probabilities by hand, I decided to write a function that would estimate the results using simulation.  This repository contains the code I used.

# The R Function
The function is called birthday_problem, and it takes the following inputs:

* NUMBER OF PERSONS IN THE GROUP: the default is the standard birthday problem number: 23.
* MINIMUM NUMBER OF SHARED BIRTHDAYS: the default is the standard birthday problem number: 1.  If we change this to 2, then the script will estimate the probability that there are at least two shared birthdays.
* MINIMUM NUMBER OF PEOPLE SHARING: the default is the standard birthday problem number: 2.  If we change this to 3, then the script will estimate the probability that each birthday is shared by at least three people.
* NUMBER OF TRIALS: this is the number of randomly generated groups we use.  The default is 10,000.  Using more trials generates more precise estimates but also takes longer.

The function plots a histogram of relative probabilities and prints to the screen a probability based on the inputs given.

# Sample Results

## Standard birthday problem
In the standard birthday problem, we find that [the probability of at least one shared birthday among 23 people is 50.7%](http://www.wolframalpha.com/input/?i=birthday+problem+23+people).  The R function estimates the probability as 51.1% and produces the histogram below.  Note that zero shared birthdays is most common, even though it happens slightly less than half the time:

    > birthday_problem()
    [1] 0.5106
  
<img src="https://dl.dropboxusercontent.com/u/55192/standard_birthday_histogram.png" align="center">


## 2014 DSSG birthday problem

    > birthday_problem(n=63, n_trials=10000, min_shared_birthdays=3, min_people_sharing=2)
    [1] 0.9006

<img src="https://dl.dropboxusercontent.com/u/55192/birthday_problem_group_of_63.png" align="center">


## Given a group of 50, what is the probability that at least three people share a birthday? 
(Confirmation [here](http://www.wolframalpha.com/input/?i=birthday+problem+50+people))

    > birthday_problem(n=50, n_trials=10000, min_shared_birthdays=1, min_people_sharing=3)
    [1] 0.13
    
<img src="https://dl.dropboxusercontent.com/u/55192/birthday_problem_50_people_3_share.png" align="center">
