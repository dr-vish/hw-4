
## Control flow

# 1. ----
# for-loop

# Download the following ZIP file to your computer and unzip it in any 
# directory you want:
# https://class.lambdamd.org/pdsr/data/dat.zip


# The ZIP file contains 3 CSV files: dat_1.csv, dat_2.csv, and dat_3.csv

# Get the paths -
# 'datadir' should be the directory that contains the 3 CSV files
# Edit the line below:
datadir <- "/Users/drvish/Desktop/biostat 213- R/dat"
getwd()

# 'paths' should contain full paths to the 3 CSV files
paths <- file.path(datadir, dir(datadir))


# >> Initialize a list of length 3 named "dat"
dat <- vector("list", 3)
dat

# >> Name the list elements "dat1", "dat2", "dat3"
dat <- list("dat1", "dat2", "dat3")
dat

# Using a single for-loop:
# >> Read each CSV file as a data.frame in the corresponding list element
# i.e. dat1.csv to dat1, dat2.csv to dat2, and dat3.csv to dat3.
i = 1
for (path in paths) {
  dat[[i]] <- data.frame(read.csv(path)) #read.csv("dat_" + str(i) + ".csv")
  i = i + 1
}
dat

# >> Print the dimensions of each data.fame
for (i in 1:3) {
  print(dim(dat[[i]]))
}

# >> Print the column names of each data.frame
for (i in 1:3) {
  print(colnames(dat[[i]]))
}

# 2. ----
# Create two vectors, named "xvec" and "xfor", each containing the 
# first 11 odd integers raised to the third power.
xvec <- vector()
xfor <- vector()
for (i in seq(11)) {
  xvec[i] <- (2 * i - 1)^3 
  xfor[i] <- (2 * i - 1)^3
}

  
# Note: There are many ways to get the first 11 odd integers, use whichever you 
# prefer.



# >> a. Construct "xvec" using vectorization and print it:
xvec <- vector()
xvec <- 1:11
xvec <- (xvec*2 - 1)^3

# >> b. Construct "xfor" by initializing the vector and using a for-loop and
# print it:

xfor <- vector()
for (i in seq(11)) {
  xfor[i] <- (2 * i - 1)^3
}

# >> c. Test that "xvec" and "xfor" are identical:
all(xvec==xfor)

# 3. ----
# Run the following command to create a data.frame:
dat <- data.frame(matrix(rnorm(400), 20))

# >> Using a single for-loop, replace each column vector with the
# squared difference from its mean
# i.e. perform elementwise subtraction of the mean, then square
for (i in 1:20) {
  dat[i] <- ((dat[i] - mean(dat[,i]))^2)
}


# 4. ----
# Build a vector using a for-loop that performs 20 iterations.
# Each time:
#  >> Draw 10 numbers from a normal distribution with a mean of 5 and standard deviation of 1.2
#  >> Get the mean of the above numbers, replace the corresponding value of 'x' and print it to the console
#  >> If the mean is greater than 5 print "you did ok this time"
#  >> If the mean is equal to 5 print "this is rather unlikely, you must be a wizard"
#  >> otherwise print "better luck next time"
x <- vector("numeric", 20)
for (i in seq(20)) {
  y <- rnorm(10, 5, 1.2)
  x[i] <- mean(y)
  if (x[i] > 5) {
    cat("you did ok this time\n")
  } else if (x[i] == 5) {
    cat("this is rather unlikely, you must be a wizard\n")
  } else { 
    cat("better luck next time\n")
  }
}


# 5. ----
# Create the following data.frame:
hd <- data.frame(
  PIDN = sample(8001:9000, 100),
  SBP = rnorm(100, mean = 120, sd = 2)
)

# >> Add a third column to the 'hd' data.frame called "SBP_bin",
# which is factor with levels "Normal", "High", in that order, such that any 
# cases with SBP > 120 are labeled "High", otherwise "Normal", 
hd <- data.frame(
  PIDN = sample(8001:9000, 100),
  SBP = rnorm(100, mean = 120, sd = 2)
)
hd$SBP_bin <- with(hd, ifelse(SBP > 120, "High", "Normal"))
hd$SBP_bin <- factor(c("Normal", "High"))
hd


# 6. [Bonus Question] ----
# Begin with x equal to 9
# Using a while-loop,
# >> subtract from x the absolute of a number drawn from a normal distribution
#   with mean = 0.01 and sd = 0.5
# >> print the new x
# >> repeat until x is less than .1

x <- 9
while (x >= 0.1) {
  y <- rnorm(1, 0.01, 0.5)
  x <- x - abs(y)
  print(x)
}

