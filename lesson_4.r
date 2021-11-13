### Matrices ###

matrix(1:9, byrow = TRUE, nrow = 3) # default is byrow = FALSE

garden <- c(10, 2)
forest <- c(8, 3)
hedgerow <- c(1, 12)
community_matrix <- matrix(c(garden, forest, hedgerow), nrow = 3, byrow = TRUE)
species <- c("Parus major", "Erithacus rubecula")
sites <- c("Garden", "Forest", "Hedgerow")
colnames(community_matrix) <- species
rownames(community_matrix) <- sites
community_matrix

passer <- c(15, 2, 5)
community_matrix <- cbind(community_matrix, passer)
park <- c(10, 1, 8)
community_matrix <- rbind(community_matrix, park)
community_matrix

colnames(community_matrix)[3] <- "Passer domesticus"
rownames(community_matrix)[4] <- "Park"
community_matrix

dim(community_matrix) # check matrix's dimensions, first comes the number of rows, second comes the number of columns
nrow(community_matrix) # check the number of rows
ncol(community_matrix] # check the number of columns

colSums(community_matrix) # calculate column sums (this and the latter works for matrices, whereas for vectors you can use the sum() function)
rowSums(community_matrix) # calculate row sums

community_matrix + 2
community_matrix * 2 # note that this is NOT the standard matrix multiplications for which you should use %*% in R

community_matrix[, "Parus major"] # select the "Parus major" row
community_matrix["Park", ] # select the "Park" row
community_matrix[1, ] # this subset the first row of the matrix
community_matrix[, 2] # second column (note that as for the dim() function, the first number always refers to rows and the second to columns)
community_matrix[, 2, drop = FALSE] # keep the matrix structure by using the "drop = FALSE" argument
# indeed you can cross check it
class(community_matrix[, 2])
class(community_matrix[, 2, drop = FALSE])

community_matrix[2, 3] # select the element found at the intersection between the second row and the third column
community_matrix[1:2, ] # select the first two rows
community_matrix[, 2:ncol(community_matrix)] # select the second to the last columns by taking advantage of the ncol() function


### Factors ###

plants_vector <- c("Tree", "Grass", "Forb", "Grass", "Tree") # create a vector of names (or labels)
factor_plants_vector <- factor(plants_vector) # create the actual factor from the character vector
factor_plants_vector

temperature_vector <- c("High", "Low", "High","Low", "Medium")
factor_temperature_vector <- factor(temperature_vector, order = TRUE, levels = c("Low", "Medium", "High")) # note here we specified that the factor is an ordered one (factors can be ordered or not), as we specified it is ordered we have to specify
factor_temperature_vector
summary(factor_temperature_vector) # calculate the frequency of each element (i.e. a summary statistic, note that the summary() function can be used with several other data structures and objects)

substrate_vector <- c("L", "S", "S", "L", "L")
factor_substrate_vector <- factor(substrate_vector)
levels(factor_substrate_vector) <- c("Limestone", "Siliceous") # here we assign factor levels by means of levels() function
summary(factor_substrate_vector)

### Data frames ###

# the line below creates a 6 rows and 5 columns dataframe, note that different columns may contain different data types but a column can have only one data type. Moreover, all columns must have the same length
dat <- data.frame(
	id = 1:6,
	name = c("Eokochia saxicola", "Cytisus aeolicus", "Anthemis aeolica", "Centaurea aeolica", "Silene hicesiae", "Genista tyrrhena")
	has_legumes = c(F, T, F, F, F, T)
	population_size = c(50, 2000, 5000, 10000, 200, 3000)
	growth_form = factor(c("Herb", "Tree", "Herb", "Shrub", "Herb", "Tree"))
	)
