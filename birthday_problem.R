######################################
##                                  ##
##      GENERATE PROBABILITIES      ##
##     FOR THE BIRTHDAY PROBLEM     ##
##                                  ##
##            Joe Walsh             ##
##          July 10, 2014           ##
##       http://joestradam.us       ##
##                                  ##
######################################

# set seed
set.seed(1234)


## Create birthday function
birthday_problem <- function(n = 23,                      # size of the group
                             min_shared_birthdays = 1,    # minimum number of shared birthdays (default: at least one shared birthday)
                             min_people_sharing = 2,      # minimum number of people sharing the birthday (e.g. at least two people sharing a birthday)
                             n_trials = 10000){           # how many random samples to try

  # generate n_trials samples
  data <- sample(x=1:365, size=n*n_trials, replace=TRUE)

  # rows are trials, columns are persons.  Each row is a randomly generated
  # group of birthdays for n persons
  data_matrix <- matrix(data, ncol=n)

  # count how many birthdays are shared by at least two people in each row.
  # table() produces counts for each birthday in the row, and sum()
  # counts how many birthdays are shared by at least two people.
  matching_birthdays <- apply(X=data_matrix, 
                              MARGIN=1, 
                              FUN=function(x)  sum( table(x) >= min_people_sharing ))

  # plot relative histogram of birthday distribution
  hist(matching_birthdays,
     main = 'Histogram of Shared Birthdays',
     xlab = paste('how many birthdays are shared for a group of', n),
     ylab = 'relative frequency', 
     probability = TRUE,
     breaks = min(matching_birthdays) : (max(matching_birthdays) + 1) - .5,
     col = 'grey')

  # probability of x or more matching birthdays in a group of size n
  return( mean(matching_birthdays >= min_shared_birthdays) )

}


# standard birthday problem (probability of at least one shared birthday in
# a group of 23) estimated with 10,000 draws
birthday_problem()

# 2014 DSSG birthday problem (probability of at least three shared birthdays
# in a group of 63) estimated with 100,000 draws
birthday_problem(n=63, n_trials=10000, min_shared_birthdays=3, min_people_sharing=2)

# given a total group of 50 people, what is the probability of at least one 
# subgroup of three people sharing a birthday?
birthday_problem(n=50, n_trials=10000, min_shared_birthdays=1, min_people_sharing=3)
