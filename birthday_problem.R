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

# size of the group
n <- 63

# how many random samples to try
n_trials <- 100000

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
                            FUN=function(x)  sum( table(x) >= 2 ))

  
# plot relative histogram of birthday distribution
hist(matching_birthdays,
     main = 'Histogram of Shared Birthdays',
     xlab = paste('how many birthdays are shared for a group of', n),
     ylab = 'relative frequency', 
     freq = FALSE,
     col = 'grey')


# probability of three or more matching birthdays in a group of size n
mean(matching_birthdays >= 3)
