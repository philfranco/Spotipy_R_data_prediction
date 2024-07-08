library(GGally)
library(corrplot)
library(MVN)
library(MASS)
library(psych)
library(ggplot2)
# ----------------------------------------
setwd("SET YOUR OWN FOLDER PATH")
data <- read.csv("spotipy_music_genres.csv")
data_rem <- data[,-c(1,2,3)]

onlyData <- data_rem[,-c(1)]
data_cor <- cor(onlyData)
data_scale <- scale(onlyData, scale = TRUE)

n <- nrow(data_scale)
# ---------------- Box Plots ------------------------
rockCount <- 1
countryCount <- 1
classicalCount <- 1
rapCount <- 1
edmCount <- 1

rockData <- data_rem[c(1:50),]
rapData <- data_rem[c(51:100),]
countryData <- data_rem[c(101:150),]
classicalData <- data_rem[c(151:200),]
edmData <- data_rem[c(201:250),]

# not shown in report
boxplot(scale(rockData[,c(-1)]), scale = TRUE)
boxplot(scale(rapData[,c(-1)]), scale = TRUE)
boxplot(scale(countryData[,c(-1)]), scale = TRUE)
boxplot(scale(classicalData[,c(-1)]), scale = TRUE)
boxplot(scale(edmData[,c(-1)]), scale = TRUE)

names <- c("Rock", "Rap", "Country", "Classical", "EDM")

boxplot(rockData[,c(2)], rapData[,c(2)],countryData[,c(2)],classicalData[,c(2)],edmData[,c(2)], horizontal = TRUE, axes=FALSE)
par(las=2)
axis(2, at=1:5, labels=names)
axis(1)
title("Acousticness")
box()
boxplot(rockData[,c(3)], rapData[,c(3)],countryData[,c(3)],classicalData[,c(3)],edmData[,c(3)], horizontal = TRUE, axes=FALSE)
par(las=2)
axis(2, at=1:5, labels=names)
axis(1)
title("Danceability")
box()
boxplot(rockData[,c(4)], rapData[,c(4)],countryData[,c(4)],classicalData[,c(4)],edmData[,c(4)], horizontal = TRUE, axes=FALSE)
par(las=2)
axis(2, at=1:5, labels=names)
axis(1)
title("Duration (ms)")
box()
boxplot(rockData[,c(5)], rapData[,c(5)],countryData[,c(5)],classicalData[,c(5)],edmData[,c(5)], horizontal = TRUE, axes=FALSE)
par(las=2)
axis(2, at=1:5, labels=names)
axis(1)
title("Energy")
box()
boxplot(rockData[,c(6)], rapData[,c(6)],countryData[,c(6)],classicalData[,c(6)],edmData[,c(6)], horizontal = TRUE, axes=FALSE)
par(las=2)
axis(2, at=1:5, labels=names)
axis(1)
title("Instrumentalness")
box()
boxplot(rockData[,c(7)], rapData[,c(7)],countryData[,c(7)],classicalData[,c(7)],edmData[,c(7)], horizontal = TRUE, axes=FALSE)
par(las=2)
axis(2, at=1:5, labels=names)
axis(1)
title("Key")
box()
boxplot(rockData[,c(8)], rapData[,c(8)],countryData[,c(8)],classicalData[,c(8)],edmData[,c(8)], horizontal = TRUE, axes=FALSE)
par(las=2)
axis(2, at=1:5, labels=names)
axis(1)
title("Liveness")
box()
boxplot(rockData[,c(9)], rapData[,c(9)],countryData[,c(9)],classicalData[,c(9)],edmData[,c(9)], horizontal = TRUE, axes=FALSE)
par(las=2)
axis(2, at=1:5, labels=names)
axis(1)
title("Loudness")
box()
boxplot(rockData[,c(10)], rapData[,c(10)],countryData[,c(10)],classicalData[,c(10)],edmData[,c(10)], horizontal = TRUE, axes=FALSE)
par(las=2)
axis(2, at=1:5, labels=names)
axis(1)
title("Speechiness")
box()
boxplot(rockData[,c(11)], rapData[,c(11)],countryData[,c(11)],classicalData[,c(11)],edmData[,c(11)], horizontal = TRUE, axes=FALSE)
par(las=2)
axis(2, at=1:5, labels=names)
axis(1)
title("Tempo")
box()
boxplot(rockData[,c(13)], rapData[,c(13)],countryData[,c(13)],classicalData[,c(13)],edmData[,c(13)], horizontal = TRUE, axes=FALSE)
par(las=2)
axis(2, at=1:5, labels=names)
axis(1)
title("Valence")
box()

# --------------- General PCA --------------------
corrplot(data_cor, order = "hclust" )
ggcorr(data_scale, label = T)

data_pca <- princomp(onlyData, cor = TRUE)
summary(data_pca, loadings = TRUE)
plot(data_pca)
abline(h=1,lty=2)
scree(onlyData)
parcoord(onlyData)

#                           Comp.1    Comp.2     Comp.3     Comp.4     Comp.5     Comp.6     Comp.7     Comp.8     
# Standard deviation     2.1456847 1.2247629 1.04725330 0.99080602 0.95194738 0.91576545 0.87684487 0.72046808
# Proportion of Variance 0.3836636 0.1250037 0.09139496 0.08180805 0.07551698 0.06988553 0.06407141 0.04325619 
# Cumulative Proportion  0.3836636 0.5086672 0.60006220 0.68187025 0.75738723 0.82727276 0.89134417 0.93460036 
#                        Comp.9   Comp.10    Comp.11     Comp.12
# Standard deviation     0.62617763 0.42360542 0.38760220 0.251038318
# Proportion of Variance 0.03267487 0.01495346 0.01251962 0.005251686
# Cumulative Proportion  0.96727523 0.98222869 0.99474831 1.000000000

# Cumalitive proportion = 0.75738723

#---------------- PCA ----------------
data_color <- vector(length = n)
for(ii in 1:n){
  if (data_rem$genre[ii] == "Rock") {
    data_color[ii] <- 1
  } else if (data_rem$genre[ii] == "Rap") {
    data_color[ii] <- 2
  } else if (data_rem$genre[ii] == "Country") {
    data_color[ii] <- 3
  }else if (data_rem$genre[ii] == "Classical") {
    data_color[ii] <- 4
  } else {
    data_color[ii] <- 7
  }
}

pca.cor<-princomp(formula = ~ acousticness + danceability + duration_ms + 
                    energy + instrumentalness + key + liveness + speechiness + 
                    tempo  + mode + valence, data = data_rem, cor = TRUE, scores = TRUE)

score.cor<-predict(pca.cor, newdata = data_rem)
common.limits<-c(min(score.cor[,1:2]), max(score.cor[,1:2]))
plot(x = score.cor[,1], y = score.cor[,2], xlab = "PC #1", ylab = "PC #2", col = data_color)
legend(1, 1, legend=c("Rock", "Rap", "Country", "Classical", "EDM"),
       col=c(1,2,3,4,7), lwd=1, lty=c(0,0), pch=c(1))

# yellow - is EDM
# blue - classical
# green - country
# red - rap
# black - rock

#---------------- Factanal testing Factors ----------------
pv <- rep(NA, 9)
for (k in 1:9) {
  out <- factanal(data_scale, factors = k)
  pv[k] <- round(out$PVAL,5)
}
names(pv) <- c("k=1", "k=2", "k=3", "k=4", "k=5", "k=6", "k=7", "k=8", "k=9")
pv
#     k=1     k=2     k=3     k=4     k=5     k=6     k=7     k=8     k=9 
# 0.00000 0.00000 0.00000 0.02042 0.30594 0.83735      NA      NA      NA 

#---------------- FA testing Factors ----------------

# Fit for k=4-8
data_fa <- vector(mode = "list", length = 5)
for (k in 1:5) {
  data_fa[[k]] <- fa(data_cor, nfactors = k+3, n.obs = n, rotate = "none", fm = "ml")
}

TLI <- c(rbind(data_fa[[1]]$TLI, data_fa[[2]]$TLI, data_fa[[3]]$TLI, 
               data_fa[[4]]$TLI, data_fa[[5]]$TLI))
names(TLI) <- c("k=4", "k=5", "k=6", "k=7", "k=8")
round(TLI, 3)
#   k=4   k=5   k=6   k=7   k=8 
# 0.970 0.994 1.020 1.024 1.044  

RMSEA <- rbind(data_fa[[1]]$RMSEA, data_fa[[2]]$RMSEA, data_fa[[3]]$RMSEA, 
               data_fa[[4]]$RMSEA, data_fa[[5]]$RMSEA)
round(RMSEA, 3)

#        RMSEA lower upper confidence
# 4 [1,] 0.052 0.021 0.079        0.9
# 5 [2,] 0.024 0.000 0.066        0.9
# 6 [3,] 0.000 0.000 0.042        0.9
# 7 [4,] 0.000 0.000 0.078        0.9

# k = 5 is where TLI > 0.95 and RMSEA < 0.05

#---------------- FA ----------------
library(psych)
data_fa_varimax <- fa(r = data_scale, n.obs = n, 
                      nfactors = 5,
                      rotate = "varimax",
                      fm = "ml",
                      scores="regression")
print(data_fa_varimax$loadings, digits = 2, cutoff = 0.25)
# (RMSR) is  0.02 
# TLI = 0.994

#                    ML1   ML2   ML5   ML4   ML3  
# acousticness     -0.85                    0.47
# danceability      0.35  0.55  0.30  0.30 -0.26 
# duration_ms            -0.39                  
# energy            0.97                        
# instrumentalness -0.72 -0.43       -0.44      
# key                           0.33            
# liveness                                      
# loudness          0.86  0.29        0.28      
# speechiness                   0.33  0.27      
# tempo             0.27       -0.26            
# mode                         -0.49            
# valence           0.38  0.88                  

fa.diagram(data_fa_varimax, cut = 0.2, simple = F, main = "Varimax Rotation")
biplot(data_fa_varimax$scores[,1:2], loadings(data_fa_varimax), main = "Varimax Rotation")

data_fa <- fa(r = data_scale, n.obs = n, 
                      nfactors = 5,
                      rotate = "none",
                      fm = "ml",
                      scores="regression")
# (RMSR) is  0.02 
# TLI = 0.994

fa.diagram(data_fa, cut = 0.2, simple = F, main = "No Rotation")
biplot(data_fa$scores[,1:2], loadings(data_fa), main = "No Rotation")

pairs(data_fa_varimax$scores, panel=panel.smooth)

# -------------------- Cluster Analysis (uses subset of data) --------------------
rockData <- data_rem[c(1:5),]
rapData <- data_rem[c(51:55),]
countryData <- data_rem[c(101:105),]
classicalData <- data_rem[c(151:155),]
edmData <- data_rem[c(201:205),]

# 1 to 5 = rock
# 6 to 10 = rap
# 11 to 15 = country
# 16 to 20 = classical
# 21 to 25 = edm

clusterData <- rbind(rockData,rapData,countryData,classicalData,edmData)
rownames(clusterData) <- NULL

dataCluster_scale <- scale(clusterData[,c(-1)], scale = TRUE)
dist_scale<-dist(dataCluster_scale, method = "euclidean")

clust.s<-hclust(d = dist_scale, method = "single")
plot(clust.s,  main = "Nearest Neighbor Scale")
rect.hclust(clust.s, k = 5, border = "red")

PCA.FN.plot(data.set = clusterData[,c(-1)], cluster.results = clust.s, numb.clust = 5,
            plot.title = "Nearest Neighbor Method")

clust.avg<-hclust(d = dist_scale, method = "average")
plot(clust.avg,  main = "Average Scale")
rect.hclust(clust.avg, k = 5, border = "red")

PCA.FN.plot(data.set = clusterData[,c(-1)], cluster.results = clust.avg, numb.clust = 5,
            plot.title = "Average Method")

clust.wd<-hclust(d = dist_scale, method = "ward.D2")
plot(clust.wd,  main = "Ward.D2 Scale Scale")
rect.hclust(clust.wd, k = 5, border = "red")

PCA.FN.plot(data.set = clusterData[,c(-1)], cluster.results = clust.wd, numb.clust = 5,
            plot.title = "Ward.D2 Method")

clust.fn<-hclust(d = dist_scale, method = "complete")
plot(clust.fn,  main = "Complete Scale")
rect.hclust(clust.fn, k = 5, border = "red")

PCA.FN.plot(data.set = clusterData[,c(-1)], cluster.results = clust.fn, numb.clust = 5,
            plot.title = "Complete Method")

clust.cent<-hclust(d = dist_scale, method = "centroid")
plot(clust.cent,  main = "Centroid Scale")
rect.hclust(clust.cent, k = 5, border = "red")

PCA.FN.plot(data.set = clusterData[,c(-1)], cluster.results = clust.cent, numb.clust = 5,
            plot.title = "Centroid Method")

# -------------------- Discriminate Analysis  --------------------
summarize.class<-function(original, classify) {
  class.table<-table(original, classify)
  numb<-rowSums(class.table)
  prop<-round(class.table/numb,4)
  overall<-round(sum(diag(class.table))/sum(class.table),4)
  list(class.table = class.table, prop = prop, overall.correct = overall)
}

# linear
data_lda <- lda(formula = genre ~ acousticness  + danceability + duration_ms + 
                  energy + instrumentalness + key + liveness + speechiness + 
                  tempo  + mode + valence,
                data = data_rem, CV = TRUE)
summarize.class(original = data_rem$genre, classify = data_lda$class)

# quadratic
data_qda <- qda(formula = genre ~ acousticness  + danceability   + duration_ms + 
                  energy + instrumentalness + key + liveness + speechiness + 
                  tempo  + mode + valence,
                data = data_rem, CV = TRUE)
summarize.class(original = data_rem$genre, classify = data_qda$class)

# -------------------- Neural Network  --------------------
library(nnet)
set.seed(1)

sampidx <- c(sample(1:50,45), sample(51:100,45), sample(101:150,45), sample(151:200,45),sample(201:250,45))
genreCol <- factor(c(rep("rock",50), rep("rap",50), rep("country",50), rep("Classical",50), rep("EDM",50)))
data_remFix <- cbind(data_rem, genreCol)

nn <- nnet(formula = genreCol ~ acousticness  + danceability   + duration_ms + 
               energy + instrumentalness + key + liveness + speechiness + 
               tempo  + mode + valence, data=data_remFix, subset = sampidx, size=4, decay=1.0e-6, maxit=5000)

cm <- table(data_remFix$genreCol[-sampidx], predict(nn, data_remFix[-sampidx, ], type="class"))
cm

# predicting the Killers: Mr. Brightside
pred2 <- predict(nn, onlyData[c(2),], type="class")
pred2

# ----------------------------------------
# your function below for plotting

PCA.FN.plot<-function(data.set, cluster.results, numb.clust, plot.title, cor.use = TRUE, inches = 0.5) {
  
  clusters<-cutree(tree = cluster.results, k = numb.clust)
  
  #PC scores
  pca.cor<-princomp(x = data.set, cor = cor.use, scores = FALSE)
  pca.cor$scale<-apply(X = data.set, MARGIN = 2, FUN = sd)
  score.cor<-predict(pca.cor, newdata = data.set)
  
  #Scatter plot of first two PCs
  win.graph()
  par(pty = "s")
  common.limits<-c(min(score.cor[,1:2]), max(score.cor[,1:2]))
  plot(x = score.cor[,1], y = score.cor[,2], xlab = "PC #1", ylab = "PC #2",
       main = paste("PCs with", plot.title, "and", numb.clust, "clusters"),
       xlim = common.limits, ylim = common.limits, panel.first = grid(col = "lightgray", lty = "dotted"),
       col = clusters, pch = clusters)
  abline(h = 0)
  abline(v = 0)
  text(x = score.cor[,1], y = score.cor[,2]+0.2)
  
  #Bubble plot of first three PCs
  win.graph()
  par(pty = "s")
  PC3.positive<-score.cor[,3] - min(score.cor[,3])  #Bubble needs to contain all values > 0
  col.symbol<-ifelse(test = score.cor[,3]>0, yes = "red", no = "blue")
  symbols(x = score.cor[,1], y = score.cor[,2], circles = PC3.positive,
          xlab = "PC #1", ylab = "PC #2", main = paste("PCs with", plot.title, "and", numb.clust, "clusters"), inches = inches,
          xlim = common.limits, ylim = common.limits, panel.first = grid(col = "lightgray", lty = "dotted"),
          fg = col.symbol)
  text(x = score.cor[,1], y = score.cor[,2], col = clusters)
  abline(h = 0)
  abline(v = 0)
  
  #3D plot - Note: I used common limits for all three dimensions here because the distance between points is important
  plot3d(x = score.cor[,1], y = score.cor[,2], z = score.cor[,3], xlab = "PC #1", ylab = "PC #2",
         zlab = "PC #3", type = "h", xlim = common.limits, ylim = common.limits, zlim = common.limits)
  plot3d(x = score.cor[,1], y = score.cor[,2], z = score.cor[,3], add = TRUE, col = clusters, size = 6)
  persp3d(x = common.limits, y = common.limits, z = matrix(data = c(0,0,0,0), nrow = 2, ncol = 2),
          add = TRUE, col = "green") #Put a plane on the plot
  grid3d(side = c("x", "y", "z"), col = "lightgray")
  
  invisible()
}

# ----------------------------------------
# no Classical
data <- read.csv("scraped_noClassic.csv")
data_rem <- data[,-c(1,2,3)]

n <- nrow(data_scale)

onlyData <- data_rem[,-c(1)]
data_cor <- cor(onlyData)
data_scale <- scale(onlyData, scale = TRUE)

corrplot(data_cor, order = "hclust" )
ggcorr(data_scale, label = T)

data_pca <- princomp(onlyData, cor = TRUE)
summary(data_pca, loadings = TRUE)       
plot(data_pca)
scree(onlyData)

data_color <- vector(length = n)
for(ii in 1:n){
  if (data_rem$genre[ii] == "Rock") {
    data_color[ii] <- 1
  } else if (data_rem$genre[ii] == "Rap") {
    data_color[ii] <- 2
  } else if (data_rem$genre[ii] == "Country") {
    data_color[ii] <- 3
  } else {
    data_color[ii] <- 4
  }
}

pca.cor<-princomp(formula = ~ acousticness + danceability + duration_ms + 
                    energy + instrumentalness + key + liveness + speechiness + 
                    tempo  + mode + valence, data = data_rem, cor = TRUE, scores = TRUE)

score.cor<-predict(pca.cor, newdata = data_rem)
common.limits<-c(min(score.cor[,1:2]), max(score.cor[,1:2]))
plot(x = score.cor[,1], y = score.cor[,2], xlab = "PC #1", ylab = "PC #2", col = data_color)


summarize.class<-function(original, classify) {
  class.table<-table(original, classify)
  numb<-rowSums(class.table)
  prop<-round(class.table/numb,4)
  overall<-round(sum(diag(class.table))/sum(class.table),4)
  list(class.table = class.table, prop = prop, overall.correct = overall)
}

# linear
data_lda <- lda(formula = genre ~ acousticness  + danceability   + duration_ms + 
                  energy + instrumentalness + key + liveness + speechiness + 
                  tempo  + mode + valence,
                data = data_rem, CV = TRUE)
summarize.class(original = data_rem$genre, classify = data_lda$class)

# quadratic
data_qda <- qda(formula = genre ~ acousticness  + danceability   + duration_ms + 
                  energy + instrumentalness + key + liveness + speechiness + 
                  tempo  + mode + valence,
                data = data_rem, CV = TRUE)
summarize.class(original = data_rem$genre, classify = data_qda$class)


