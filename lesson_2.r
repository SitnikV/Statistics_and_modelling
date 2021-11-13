print("Hello World!")

5 + 5 # addition
5 - 5 # subtraction
5 * 2 # multiplication
5 / 2 # division (and addition)
5^2 # exponentiation, also "**" works, e.g. 2**5
5%%2 # modulo
5%/%2 # integer division

# This is a comment
1 + 1 # this is a comment as well

x <- 42 # assignment and variable creation
x # print the variable content
x <- 21 # reassign the variable
x # check the new values

my_apples <- 5
my_apples
my_oranges <- 6
my_apples + my_oranges # sum two variables
my_fruit <- my_apples + my_oranges
my_fruit

# What if a want to remove a variable?
rm(x)
x # now x is missing!

my_numeric <- 42 # numeric variable
my_integer <- 42L # integer variable
my_double <- 42.24 # numeric variable
my_character <- "universe" # character variable
my_logical <- FALSE # logical or boolean variable (n.b. T = TRUE; F = FALSE)

class(my_numeric) # check the variable type, using one of your first functions!
class(my_character)
class(my_logical)

numeric_vector <- c(1, 10, 49) # create a numeric vector
numeric_vector
character_vector <- c("a", "b", "c") # create a character vector
character_vector
character_vector <- c("a", "b", "c", my_numeric)
character_vector
boolean_vector <- c(TRUE, FALSE, T) # create a boolean vector
boolean_vector
apples_vector <- c(40, 50, 20, 120, 240)
apples_vector
oranges_vector <-  c(24, 50, 100, 350, 10)
oranges_vector
my_fruit_vector <- my_oranges_vector + my_apples_vector # if both vectors are the same size, the operation is "paired"
apples_vector <- c(40, 50, 20, 120)
oranges_vector <-  c(24, 50)

my_fruit_vector <- apples_vector + oranges_vector # if the vectors have different lengths, the shortest one is "recycled" until the longest ones ends (e.g. for a vector of length four and a vector of length two, it would be: first of A with first of B, second of A with second of B, third of A with first of B, fourth of A with second of B)
my_fruit_vector + 50 # in this case the operation is applied the same way to all vector's elements

1:10 # sequence of integer numbers from one to ten
10:1 # sequence of integer numbers from ten to one

rep(c("a", "b", "c"), 2) # this repeats the whole vector two times
rep(c("a", "b", "c"), times = 2) # this is the same as the above command
rep(c("a", "b", "c"), each = 2) # this repeats each vectors element twice before moving onto the next one
