# setwd
# import data
setwd("/Users/viktoriasitnik/Downloads/dune/projects.r")
dune <-read.table("data/dune.txt")

dune.env <- read.csv("data/dune_env.csv")
dune

# community matrix, species in the columns
# rows represent pbservations in sites
# values represent abunadce 0- absence, lardegr values - present

head(dune.env)
install.packages("vegan")
library(vegan)
?dune
make.cepnames(dune)
dev.off(make.cepnames(dune))
str(dune.env)

dune.env$Management<-factor(dune.env$Management)
str(dune.env)
?factor
dune.env$Moisture <-factor(dune.env$Moisture, ordered = T)
                          
                        
dune.env$Moisture <- factor(dune.env$Moisture, ordered = T, levels = c(1, 2, 4, 5))
                           
dune.env$Moisture <- factor(dune.env$Moisture, ordered = T, levels = 1:5)
                           
dune.env$Manure <-factor(dune.env$Manure, ordered = T)
structure(dune.env)
dune.env$Use <-factor(dune.env$Use, ordered = T)
structure(dune.env)

# Lecture 09.12.21 topic: loops
# want to apply the same function to multiple objects

library(vegan)
data (dune)


for(i in 1:10) {print(i)}

# apply print function to every value in i
# try in with real data set - dune
# dune is a community matrix representing speciad abundances

# we want to count the number of species in a site 
# lets caluclate species richness in each of 20 sites

for(i in 1:nrow(dune)) { sum(dune[i,]>0)}  
  
# false 0, true 1
sum(dune[1,]>0)

# 5 species are present in site 1  

species_richness <- vector()
for(i in 1:nrow(dune))
  species_richness[i] <- sum(dune[i, ]>0)


# create a function by specifying arguments
 calculate_species_richness <- function(df){
 species_richness <- vector()
for(i in 1:nrow(df)) {
    species_richness[i] <- sum(df[i, ]>0)}
  
return(species_richness)

### lesson 2 09.12.21 ###

library(vegan)
data(dune)  

data(dune.env)
str(dune.env)

summary(dune.env)

# lets look at the distribution of columns

hist(dune.env$A1)

# 9 observations (out of 20) within 2-4
# modify labels
hist(dune.env$A1, xlab= "Thickness of soil A1 horizon (cm)",
     main= "use main=NULL for empty title",
     breaks= 10)

# breaks = means now we have 10 intervals 
# lets look at the distribution of factors
# histogram for continous distribution, bar chart for categorical variables

counts <- table(dune.env$Management)
barplot(counts)
barplot(counts, xlab="Management type", 
        ylab= "Frequency",
        names.arg = c("bio farming",
        "hobby farming",
        "nama mama",
        "suur fuura"))

# use names.arg to change category names

# if we are interested in how 1 of these factors is distributed in comparison to others
# use stacked bar chart for that

table(dune.env$Management, dune.env$Manure)

counts <- table(dune.env$Manure, dune.env$Management)
barplot(counts,
        xlab= "Management type",
        ylab= "Frequency",
        main= "Management by manure",
        legend=rownames(counts),
        xlim= c(0, 6))

# colour legend is missing use legend=rownames(counts))
# use xlim to move the overlapping figure legend

counts
prop.table(counts)

# now we have proportion of the values

prop.table(counts, margin=1)

# calculate relative frequencies based on the sum of the row 
# margin 1= row, margin 2= column
