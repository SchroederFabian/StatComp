
## VECTORS

?vector # open help page for vector function

# initialize vector
vec_num <- vector(mode = "numeric", length = 7)
vec_log <- vector(mode = "logical", length = 7)
vec_chr <- vector(mode = "character", length = 7)

# what are the default values? print to console
vec_num
vec_log
vec_chr

# The following functions generate Vectors and fill them according to some rule.

# c() concatenate
vec_chr <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
vec_int <- c(1L, 0L, 1L, 2L, 3L, 0L, 2L)
vec_dou <- c(1.0, 0, 1.0, 2.0, 3.0, 0, 2.0)
is.vector(vec_int)

# seq(), seqence
vec_num <- seq(1,7)
is.vector(vec_num)

# rep(), repeat
vec_log <- rep(TRUE, 7)
is.vector(vec_log)

# properties of the vector

typeof(vec_log)
typeof(vec_int)
typeof(vec_dou)

length(vec_dou)

names(vec_num) <- vec_chr

str(vec_log)
str(vec_num)


## EXCERCISES A

# EX.A1: What is the type of the following vector? Why?
c(1, TRUE, "hallo")




# INDEXING

# positive indexing
vec_num[2] <- 2

# positive indexing using a vector
vec_num[c(1,3)]

# negative indexing
vec_num[-c(2,4)]

# named indexing
vec_num["Wednesday"]

# blank indexing
vec_num[]

# zero indexing
vec_num[0]


vec_num[c(FALSE, FALSE, FALSE, FALSE, FALSE, TRUE, TRUE)]

vec_num[vec_num == 0]

vec_num[vec_num == 2]

# EX.B1: Select all elements of num_vec that are greater than zero

# EX.B2: what happens when you assign a numeric value to a logical vector?
vec_log <- rep(TRUE, 7)
vec_log[2] <- 3

# EX.B3: what happens when you assign a character string to a numeric vector?
vec_num[2] <- "2"

# EX.B4: What is the underlying rule for this behaviour?

# EX.B5: what happens when the index numer is greater than the length of the vector?
vec_log[8]

# EX.B6: what is the output of the following command? Why?
vec_num[c(TRUE, FALSE)]

# EX.B7: what happens if indices are not integers?
vec_num[c(1.1, 3.9)]


## MATRICES AND ARRAYS

# initialize

mat <- matrix(1:6, ncol=3, nrow=2)

arr <- array(1:24, dim=c(3,4,2))


# indexing


mat[c(1,4,6)]  # positive indexing by a vector
mat[1,3]  # positive indexing by row and column number

# zero indexing for matrices
mat[1,]
mat[,2]

mat[matrix(rep(c(TRUE, FALSE), 3), nrow = 2)]  # positive indexing with a logical matrix

arr[c(2,12,24)]

arr[1,2,1]

arr[1,,]

arr[array(rep(c(TRUE, FALSE), 12), dim = c(3,4,2) )]
arr[c(TRUE, FALSE)]


# EX.C1: What is the difference between the following commands?
matrix(1:6, ncol = 3, nrow = 2, byrow = TRUE)
matrix(1:6, ncol = 3, nrow = 2, byrow = FALSE)

# EX.C2: What is the difference between the following commands?
mat[matrix(rep(c(TRUE, FALSE), 3), nrow = 2)]
mat[c(TRUE, FALSE)]

# EX.C3: What is the dimension of a vector?

# EX.C4: What is the length of a matrix?

# EX.C5: Use cbind() to make a matrix from vec_num, vec_int, vec_int

# EX.C6: What happens to the type of the matrix if you use cbind with numeric and character vectors?


## LISTS

# initialize list
lst <- list("Logical_Vector" = vec_log,
            "Integer_Vector" = vec_int,
            "Double_Vector" = vec_dou,
            "Character_Vector" = vec_chr,
            "Result" = TRUE)


lst

str(lst)


# indexing a list

lst[1]
class(lst[1])

lst[[1]]
class(lst[[1]])

lst$Logical_Vector
class(lst$Logical_Vector)


# EX.D1: What is the difference between the following?
c(lst, lst)
lst[7] <- lst

# EX.D2: How to you access a level 2 list with the $ operator?

# EX.D3: What does typeof() of a list return?


## FACTORS

# initialize a factor
fac <- factor(c("green", "green", "blue", "green", "blue"))

class(fac)
levels(fac)
labels(fac)


# EX.E1: What does as.numeric(fac) return? Why?

# EX.E2: What happens when we assign a value that is currently not a factor level?
fac[2] <- "red"

# EX.E3: How can one concatenate two factors?
fac_1 <- factor(c("green", "green", "blue"))
fac_2 <- factor(c("green", "blue", "blue"))

c(fac_1, fac_2)
fac_3 <- factor(c(fac_1, fac_2), labels = c("green", "blue"))


## DATA FRAMES

# initialize
df <- data.frame(V1 = 1:5, V2 = c("a", "a", "b", "a", "d"))
str(df)

# attributes of data frames
length(df)
dim(df)

names(df)
colnames(df)
rownames(df)

# Coercing to data frames
vec_1 <- 1:5
lst_1 <- list(vec_1 = vec_1, vec_2 = letters[c(1,2,3,2,1)])
lst_2 <- list(vec_1 = vec_1, vec_2 = letters[c(1,2,3,2,1,3)])
str(as.data.frame(vec_1))

str(as.data.frame(mat))

str(as.data.frame(lst_1))


# EX.F1: What is the difference between the following expression?
c(df, c(1:5))
cbind(df, c(1:5))



