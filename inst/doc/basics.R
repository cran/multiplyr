## ---- echo = FALSE, message = FALSE--------------------------------------
library(multiplyr)
knitr::opts_chunk$set(
  comment = NA,
  error   = FALSE,
  tidy    = FALSE,
  eval    = FALSE)

## ------------------------------------------------------------------------
#  # Construct a new data frame
#  dat <- Multiplyr (x=1:100, G=rep(c("A", "B", "C", "D"), length.out=100))
#  
#  # Group data by G
#  dat %>% group_by (G)
#  
#  # Summarise length(x) in each group and store in N
#  dat %>% summarise (N = length(x))

## ------------------------------------------------------------------------
#  dat <- Multiplyr (x=1:100, y=1:100)
#  
#  dat %>% filter(x<=50) %>% mutate (y=x*2) %>% select (y)

## ------------------------------------------------------------------------
#  dat <- Multiplyr (x=1:100)
#  
#  dat %>% mutate (x=length(x):1)

## ------------------------------------------------------------------------
#  # Create a new data frame with 2 columns called x and y
#  dat <- Multiplyr (x=1:100, y=rep(1, 100))
#  
#  # As above, but allocate space for 1 new column and create cluster with 2 nodes
#  dat <- Multiplyr (x=1:100, y=rep(1, 100), alloc=1, cl=2)
#  
#  # Convert back to standard data frame
#  dat.df <- as.data.frame (dat)
#  dat.df <- dat %>% as.data.frame()

## ------------------------------------------------------------------------
#  # Create new data frame with space for 3 new columns
#  dat <- Multiplyr (x=1:100, alloc=3)
#  
#  # Create 2 new columns named y and z
#  # Note that this define is actually not needed as mutate will define implicitly
#  dat %>% define (y, z)
#  
#  # Do things with new columns
#  dat %>% mutate (y=x*2, z=sqrt(x))

## ------------------------------------------------------------------------
#  # Create new Multiplyr frame with two columns (A and P) with space for 3 more
#  dat <- Multiplyr (A=rep(c("A", "B", "C", "D"), each=25),
#                    P=rep(c("p", "q"), each=50),
#                    alloc=3)
#  
#  # Create new columns named newA and newP
#  dat %>% define (newA=A, newP=P)
#  
#  # Set their values
#  dat %>% mutate (newA="A", newP="p")

## ------------------------------------------------------------------------
#  # Create a new Multiplyr frame with variables named x, y and z
#  dat <- Multiplyr (x=1:100, y=100:1, z=rnorm(100))
#  
#  # Rename to p, q and r
#  dat %>% rename (p=x, q=y, r=z)

## ------------------------------------------------------------------------
#  # Create Multiplyr data frame with columns named x, y, z and misc
#  dat <- Multiplyr (x=1:100, y=100:1, z=rnorm(100), misc=rep(1, 100))
#  
#  # Drop column named misc
#  dat %>% undefine (misc)
#  
#  # Keep only the x and y columns
#  dat %>% select (x, y)

## ------------------------------------------------------------------------
#  # Load data on guinea pig tooth growth:
#  #  len    Odontoblast (tooth cell) length
#  #  supp   Supplement (VC = Vit C supplement, OJ = Orange Juice)
#  #  dose   Dose in mg (0.5, 1 or 2)
#  #
#  data (ToothGrowth)
#  
#  # Convert into a Multiplyr data frame with space for 2 new columns
#  dat <- Multiplyr (ToothGrowth, alloc=2)
#  
#  # Group data by supplement and dose
#  dat %>% group_by (supp, dose)
#  
#  # Produce summary statistics
#  dat %>% summarise (len.mean = mean(len), len.sd = sd(len))

## ------------------------------------------------------------------------
#  # Load data on guinea pig tooth growth:
#  data (ToothGrowth)
#  dat <- Multiplyr (ToothGrowth)
#  
#  # Group data by supplement and dose
#  dat %>% group_by (supp, dose)
#  
#  # Ungroups data
#  dat %>% ungroup()
#  
#  # Regroups data (implicitly by supplement and dose)
#  dat %>% regroup()

## ------------------------------------------------------------------------
#  # Load data on guinea pig tooth growth:
#  data (ToothGrowth)
#  dat <- Multiplyr (ToothGrowth)
#  
#  # Group by supplement
#  dat %>% group_by (supp)
#  
#  # Select only guinea pigs with a dose >= 1 mg/kg
#  dat %>% filter (dose >= 1)
#  
#  # Produce summary
#  dat %>% summarise (mean.len = mean(len))

## ------------------------------------------------------------------------
#  # Create new Multiplyr data frame
#  dat <- Multiplyr (A=rep(c("A", "B", "C", "D"), each=25),
#                    P=rep(c("p", "q"), length.out=100))
#  
#  # Filter so only one of each AxP combination
#  dat %>% distinct()
#  
#  # Filter so only one of each A
#  dat %>% distinct(A)

## ------------------------------------------------------------------------
#  # Construct a new data frame
#  dat <- Multiplyr (x=1:100, G=rep(c("A", "B", "C", "D"), length.out=100))
#  
#  # Return the first 10 rows only
#  dat %>% slice (1:10)
#  
#  # Return alternate rows
#  dat %>% slice (rep(c(TRUE, FALSE), length.out=10))

## ------------------------------------------------------------------------
#  # Construct a new data frame
#  dat <- Multiplyr (x=1:100, G=rep(c("A", "B", "C", "D"), length.out=100))
#  
#  # Group by G
#  dat %>% group_by (G)
#  
#  # Return the first 10 rows in each group
#  dat %>% slice (1:10, each=TRUE)

## ------------------------------------------------------------------------
#  # Construct a new data frame
#  dat <- Multiplyr (x=1:100, G=rep(c("A", "B", "C", "D"), length.out=100))
#  
#  # Return the first 10 rows in each node
#  dat %>% slice (1:10, each=TRUE)

## ------------------------------------------------------------------------
#  # Create new data frame
#  dat <- Multiplyr (G=rep(c("A", "B", "C", "D"), each=25), x=100:1)
#  
#  # Sort by G, then by x
#  dat %>% arrange (G, x)

## ------------------------------------------------------------------------
#  # Construct a new data frame with space for 2 new columns
#  dat <- Multiplyr (x=1:100, alloc=2)
#  
#  # Update all cells in the x column to be twice their value
#  dat %>% mutate (x=x*2)
#  
#  # Create 2 new columns and populate them with data
#  dat %>% mutate (y=x*2, z=sqrt(x))

## ------------------------------------------------------------------------
#  # Construct a new data frame with space for 2 new columns
#  dat <- Multiplyr (x=1:100, alloc=2)
#  
#  # Create new columns (y and z), drop x in the process
#  dat %>% transmute (y=x*2, z=sqrt(x))

## ------------------------------------------------------------------------
#  # Load data on guinea pig tooth growth:
#  data (ToothGrowth)
#  
#  # Convert into a Multiplyr data frame with space for 2 new columns
#  dat <- Multiplyr (ToothGrowth, alloc=2)
#  
#  # Group data by supplement and dose
#  dat %>% group_by (supp, dose)
#  
#  # Produce summary statistics
#  dat %>% summarise (len.mean = mean(len), len.sd = sd(len))

## ------------------------------------------------------------------------
#  dat <- Multiplyr (x=1:100)
#  
#  dat %>% summarise (N=sum(x))

## ------------------------------------------------------------------------
#  dat <- Multiplyr (x=1:100)
#  
#  dat %>% summarise (N=sum(x)) %>% reduce(N=sum(x))

## ------------------------------------------------------------------------
#  # Construct a new data frame
#  dat <- Multiplyr (x=1:100)
#  
#  # Define y and z to be new columns
#  dat %>% define(y, z)
#  
#  # Execute the following code within each node
#  dat %>% within_node ({
#      y <- x * 10
#      z <- sqrt(y)
#  })

## ------------------------------------------------------------------------
#  # Construct a new data frame
#  dat <- Multiplyr (x=1:100, G=rep(c("A", "B", "C", "D"), length.out=100))
#  
#  # Group by G
#  dat %>% group_by (G)
#  
#  # Execute the following block of code within each group
#  dat %>% within_group({
#      N <- length(x)
#      xbar <- sum(x) / N
#  })
#  
#  # Export the data
#  dat %>% summarise(N=N, xbar=xbar)

## ------------------------------------------------------------------------
#  # Create data frame
#  dat <- Multiplyr (G = rep(c("A", "B"), each=50),
#                    m = rep(c(5, 10), each=50),
#                    alloc=1)
#  
#  # Group by G
#  dat %>% group_by (G)
#  
#  # Generate some random data in x with mean of m
#  dat %>% mutate (x=rnorm(length(m), mean=m))
#  
#  # Fit a linear model with just an intercept to x in each group
#  dat %>% within_group ({
#      mdl <- lm (x ~ 1)
#  })
#  
#  # Extract intercept and store it in x.mean
#  dat %>% summarise (x.mean = coef(mdl)[[1]])

## ------------------------------------------------------------------------
#  # Construct a new data frame
#  dat <- Multiplyr (G=rep(c("A", "B", "C", "D"), length.out=100),
#                    H=rep(c("p", "q", "r", "s"), each=25))
#  # Display data
#  dat["G"]
#  dat["H"]
#  
#  # Switch into NSA mode
#  dat %>% nsa()
#  dat["G"]
#  dat["H"]
#  
#  # Do some things
#  dat %>% mutate (G=max(G))
#  
#  # Switch back
#  dat %>% nsa(FALSE)
#  dat["G"]
#  dat["H"]

