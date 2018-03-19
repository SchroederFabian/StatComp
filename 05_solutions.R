
## EX.1 : Calculate the n-th element of the Fibonacci series using the for() loop

n <- 12

fibo <- vector(mode = "numeric", length = n)
fibo[1] <- 1
fibo[2] <- 1

for (i in 3:n) {
  fibo[i] <- fibo[i-1] + fibo[i-2]
}

## EX.2 : Calculate the n-th element of the Fibonacci series using the while() loop

n <- 12
fib.new <- c(1,1)
count <- 2

while (count < n) {
  fib.old <- fib.new
  fib.new[1] <- fib.old[2]
  fib.new[2] <- fib.old[1] + fib.old[2]
  
  count <- count + 1
}

## EX.3 : Calculate the n-th element of the Fibonacci series using the repeat() loop

n <- 12
fib.new <- c(1,1)
count <- 2

repeat {
  if (count > n) break
  fib.old <- fib.new
  fib.new[1] <- fib.old[2]
  fib.new[2] <- fib.old[1] + fib.old[2]
  count <- count + 1
}
fib.new

## EX.4 : Write three different functions fibo_for(n), fibo_while(n), and fibo_repeat(n) which 
## implement the calulation of the Fibonacci Series in three different ways. Then write a further 
## function, called fibo_switch(n, type) which handles which approach is used by the argument type.

## Fibonaci series using a for loop

fibo_for <- function(n) {
  
  fibo <- vector(mode = "numeric", length = 12)
  fibo[1] <- 1
  fibo[2] <- 1
  
  for (i in 3:n) {
    fibo[i] <- fibo[i-1] + fibo[i-2]
  }
  
  return(fibo[n])
}

## Fibonacci series using a while function

fibo_while <- function(n) {
  
  fib.new <- c(1,1)
  count <- 2
  
  while (count < n) {
    
    fib.old <- fib.new
    fib.new[1] <- fib.old[2]
    fib.new[2] <- fib.old[1] + fib.old[2]
    
    count <- count + 1
  }
  
  return(fib.2)
  
}


## Fibonaci series a recursive function

fibo_rec <- function(n) {
  
  if (n <= 2) {
    return(1)
  } else {
    return(fibo_rec(n-1) + fibo_rec(n-2))
  }
  
}


## write a switch function

fibo_switch <- function(n, type) {
  switch(type,
         "recursion" = fibo_rec(n),
         "for_loop" = fibo_for(n),
         "while_loop" = fibo_while(n))
}




