### TASK 1,2 ###
setwd("/Users/viktoriasitnik/Downloads/dune/projects.r/stats_exam/data")
library(raster)
library(vegan)
species <-read.csv("mite.csv")
var <-read.delim("mite_env.txt", sep ="", header = T)

dim(species)
dim(var)                
?mite
str(species)
str(var)

### TASK 3 ###
var$Substrate <- factor(var$Substrate,
                        levels = c("Sphagn1", "Sphagn2", "Sphagn3", "Sphagn4", "Litter", "Barepeat", "Interface"),
                        ordered = T)

str(var)

var
install.packages("string")
library(stringr)
var$Shrub = str_replace_all(var$Shrub,"None","1")
var$Shrub = str_replace_all(var$Shrub,"Few","2")
var$Shrub = str_replace_all(var$Shrub,"Many","3")                       

var$Shrub <-factor(var$Shrub, levels= c("1","2","3"), ordered=T)
var$Topo <- factor(var$Topo,
                   levels = c("Blanket", "Hummock"),
                   ordered = T)
str(var)

### TASK 4 a ###
summary(species)
summary(var)

# find NAs
index_na <- which(is.na(var), arr.ind = T)
index_na
index_na <- index_na[ ,1]
var <-var[-index_na, ]
index_na # 3 NAs in rows 13, 17, 48


### TASK 4 b ###
# setwd to output
setwd("/Users/viktoriasitnik/Downloads/dune/projects.r/stats_exam/output")

write.csv(species, file = "species.txt")
write.table(var, file= "var.txt",append = FALSE, sep = " ", dec = ".",
            row.names = TRUE, col.names = TRUE)

### TASK 5 ###

# barplot for categorical data
library(ggplot2)
library(viridis)
install.packages("hrbrthemes")
# make data frame our of vector
df.shrub <- data.frame(var$Shrub)

# plot the frequency distribution of different shrub levels, Viktoria
p1 <- ggplot(data = var, aes(Shrub, fill = Shrub)) +
          geom_bar() 
p1 + ggtitle("Shrub levels and their frequency") +
  xlab("levels") + ylab("frequency")

# plot substrates and their frequency, Alessio
# add no title 
p2 <-ggplot(data = var, aes(Substrate, fill = Substrate)) +
  geom_bar()
p2 + ggtitle(NULL) +
  xlab("Substrate type") + ylab("Frequency")

# make a boxplot of topography, Viktoria
plot(var$WatrCont,main="Water content of the substrate in each site", 
     xlab="Sampling site ", ylab="Water content of the substrate (g/L) ", pch=19, col="green")


# might be useful if data collected as a transect

# plot of SubsDens, Alessio
ggplot(data = var, aes(SubsDens)) +
  geom_histogram(breaks=seq(20, 90, by=10),
                 col = "red",
                 fill = "orange") +
  labs(title = "Histogram for Substrate Density",
       x = "Substrate Density",
       y = "Count")

# substrate density boxplot

boxplot(var$SubsDens, ylab="Substrate density (g/L")

library(ggplot2)

### png to export the figure as .png file to output  ###
png("Figure1.png", res = 300, width = 3000, height = 2000)
ggplot(data = var, aes(SubsDens)) +
  geom_histogram(breaks=seq(20, 90, by=10),
                 col = "red",
                 fill = "orange") +
  labs(title = "Histogram for Substrate Density",
       x = "Substrate Density",
       y = "Count")

### TASK 6a ###
# our community matrix is not presence/absence

### delete the rows in community matrix data set so it matches the one of environmental variables ###
species <- species[-index_na, ]

library(vegan)

### TASK 6b ###
species <- decostand(species, method = "pa")
# now it is presence/absence data

write.csv(species, file = "species.csv")

### TASK 7a ###

var$sr <- specnumber(species)

### TASK 7b ###

var
summary(var$sr)

### TASK 7c ###
### How does species richness distribute in respect with topo variable? Explore it with a boxplot.###
library(ggplot2)

species_richness <- as.factor(var$sr)
p <- ggplot(var, aes(x=Topo, y=sr,color = Topo)) + 
  geom_boxplot()

ggplot(var, aes(x=Topo, y=sr, colour= Topo )) + 
  geom_boxplot() + geom_jitter(shape=16, position=position_jitter(0.2))+

labs(title = "Boxplot of species richness distribution in respect to Topography",
     x = "Topography",
     y = "Species Richness") +
  geom_point()

### TASK 8 ###
# Plot the distribution of species richness in respect with the available numeric environmental variables
install.packages("corrplot")
install.packages("RColorBrewer")
library(ggplot2) # for graphs
library(corrplot) # to plot correlation
library(RColorBrewer) # to change the colours in the graphs
library(vegan) # to check ?mite
?mite
s.richness <- var$sr
SubDens <-var$SubsDens
WaterCont <-var$WatrCont
sr.sb <- data.frame(SubDens,s.richness)
sr.wc <- data.frame(WaterCont, s.richness)



plot(sr.sb,main="Looking for correlation", 
     xlab="Substrate density ", ylab=" Species richness", pch=19) +
ggplot(var, aes(x = WatrCont, y = s.richness)) +   # this is to add regression line
  geom_point() +
  stat_smooth(method = "lm", col = "red") +
  labs(title = "Linear model plot",
       x = "Water content",
       y = "Species richness")

plot(sr.sb,main="Looking for correlation", 
     xlab="Water content of the substrate (g/L)", 
    ,ylab="Species richness", pch=19)

## test for correlation ##
cor.test(SubDens, s.richness,smethod=c("pearson")) # p-value = 0.8051, cor=-0.03071004 
cor.test(WaterCont, s.richness,method = c("pearson")) # p-value = 5.299e-11,  cor= -0.6978042

# pearsons because we have two continuous variables
lm.subdens <-lm(s.richness ~ SubDens, data = var)
summary(lm.subdens) # Adjusted R-squared:  -0.01443

lm.watercont <-lm(s.richness ~ WaterCont, data = var)
summary(lm.watercont) # Adjusted R-squared:  0.479 

chisq <- chisq.test(sr.sb)
chisq



par(mfrow=c(1,2))
cor.sr.sb <- cor(sr.sb)
corrplot(cor.sr.sb, type="upper", order="hclust",
         col=brewer.pal(n=8, name="RdYlBu"))

cor.sr.wc <-cor(sr.wc)
corrplot(cor.sr.wc, type="upper", order="hclust",
         col=brewer.pal(n=8, name="RdYlBu"))


### Playing around with the plots a bit ###

library(corrplot)
new_data <-var[,c(1:2,6)]
correlation <- cor(new_data)
corrplot(correlation, order = 'AOE',col=brewer.pal(n=8, name="RdYlBu")) # n corresponds to the number values grouped by colours i.e. how precisely the colour represents the correlation.


### or if you want to remove the middle values ###

corrplot(correlation, order = 'AOE',
         col = COL2('RdBu', 10),
         diag = F)

# change colours
corrplot(correlation, order = 'AOE',
       col=brewer.pal(n=5, name="RdYlBu"),
         diag = F)


