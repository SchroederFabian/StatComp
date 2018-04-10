
# Excercise A: Make a list of all functions in the base package

objs <- mget(ls("package:base"), inherits = TRUE)
funs <- Filter(is.function, objs)
names(funs)

# Excercise B: Select all primitive functions from the base package
prim.funs <- Filter(is.primitive, funs)
names(prim.funs)


# Excercise C: What does the following code return? What do the different cs stand for?

c <- 10
c(c = c)


# Excercise D: What does the following function return?

f <- function(x) {
  f <- function(x) {
    f <- function(x) {
      x ^ 2
    }
    f(x) + 1
  }
  f(x) * 2
}

f(10)





