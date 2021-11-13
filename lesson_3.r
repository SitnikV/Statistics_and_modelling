### How to get help in R ###

?mean
help("sum")

### Another way to create vectors (numeric only) ###

seq(1, 10, by = 1) # note that it's equal to "1:10"
seq(1, 10, by = 2) # note that the ending point "is not reached" as the sequence stops at 9, indeed 10 would be out of the sequence as 9 -> 10 has a step of 1 and not 2, whereas 11 is out of the given interval

### Other functions to work on vectors)

apples_vector <- c(20, 50, 30, 40, 100)
oranges_vector <- c(70, 70, 50, 20, 80)

names(apples_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday") # assign names to vector elements
apples_vector
names(oranges_vector) <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")
days_vector <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday")

names(apples_vector) <-  days_vector
apples_vector
names(oranges_vector) <- days_vector
oranges_vector

apples_vector + oranges_vector # note that names are "inherited" from apples_vector and oranges_vector

typeof(oranges_vector) # you can check the "type" of a given object with typeof (note that the given "classes" are slightly different to those printed by class() function)
is.numeric(oranges_vector) # with the is.___ functions you can test the types of objects
is.character(oranges_vector)
is.double(oranges_vector)
is.integer(oranges_vector)
as.character(oranges_vector) # with the as.___ functions you coerce data types into other data types
as.logical(oranges_vector)

typeof(days_vector)
is.character(days_vector)
is.logical(days_vector)
is.vector(days_vector)
as.logical(days_vector)
as.numeric(days_vector)

logical_vector <- c(T, T, F)
typeof(logical_vector)
is.logical(logical_vector)
is.numeric(logical_vector)
as.numeric(logical_vector)
as.character(logical_vector)

typeof(c(1.1, 2.3, 4))
length(oranges_vector)
length(1:3)

total_daily <- apples_vector + oranges_vector # sum two vectors
total_daily
total_apples <- sum(apples_vector) # sum the elements of a vector
total_apples
total_oranges <-  sum(oranges_vector)
total_week <- apples_vector + oranges_vector
total_week
total_apples > total_oranges # > major than

### Vectors indexing ###

apples_wednesday <- apples_vector["Wednesday"] # select elements by name
apples_wednesday
apples_vector[2:4] # select element by index/position
apples_vector[c("Monday", "Tuesday")]
selection_vector <- apples_vector > 100
selection_vector
apples_vector[selection_vector]
apples_vector[apples_vector < 100] # "<" means "minor than"
apples_vector[apples_vector < 100] # ">" means "minor than"
apples_vector[apples_vector == 120] # "==" means "is equal"
apples_vector[apples_vector != 120] # "!=" means "is not equal"
# "<=" means "minor or equal than"
# ">=" means "major or equal than"

### Matrices ###

matrix(1:9, nrow = 3) # your first matrix!
matrix(1:9, byrow = TRUE, nrow = 3) # by default byrow = FALSE, therefore the matrix is filled column-wise, by specifying byrow = TRUE the matrix is filled row-wise

# here we create our very first community matrix! A community matrix contains occurrences of species within sites. Typically, species are represented by columns and sites by rows. The value at the intersection between a species and a site tells us if the species was found at the site and in certain cases also the abundance of the species at the site
# in this case we create a matrix where values represent the number of individuals of a given species found in a given site (i.e. abundances). If we would have had only 1s and 0s, we would have called it a presence/absence community matrix (where 1 means we found the species and 0 means we didn't found the species)
garden <- c(10, 2) # in our garden site we found 10 individuals of the first species and two individuals of the second species
forest <- c(8, 3) # here we found 8 individuals of the first species and 3 of the second species
hedgerow <- c(1, 12) # see above
community_matrix <- matrix(c(garden, forest, hedgerow), nrow = 3, byrow = TRUE) # here we build our community matrix by providing a vector made by combining our previous 3 vectors and filling the matrix row-wise -> each row is a site and has two fields (i.e. columns)
species <- c("Parus major", "Erithacus rubecula") # here we create a vector for columns' names (i.e. species' names)
sites <- c("Garden", "Forest", "Hedgerow") # vector for rows' names (i.e. sites' names)
colnames(community_matrix) <- species # we assign names to the columns
rownames(community_matrix) <- sites # the same with rows
community_matrix # our nicely formatted community matrix

# we can also expand our matrix by "binding" other vectors or matrices to our original matrix

passer <- c(15, 2, 5) # we create a vector for another species we sampled but we previously forgot to add to the matrix
community_matrix <- cbind(community_matrix, passer) # here we add (bind) a new column (cbind -> column bind)
park <- c(10, 1, 8) # we also want to add another sampling site where we collected data on the three species we're studying
community_matrix <- rbind(community_matrix, park) # here we add a new row (rbind -> row bind)
community_matrix

colnames(community_matrix)[3] <- "Passer domesticus" # by using vector indexing we only modify the third column name
rownames(community_matrix)[4] <- "Park" # as above with the fourth row name
community_matrix
