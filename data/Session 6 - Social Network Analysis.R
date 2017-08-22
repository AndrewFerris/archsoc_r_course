### Session 6 - Social Network Analysis

# Read in the data
load("/Users/andrewferris/Downloads/termDocMatrix.rdata")

#Transform Data into an Adjacency Matrix
termDocMatrix[termDocMatrix>=1] <- 1
termMatrix <- termDocMatrix %*% t(termDocMatrix)
termMatrix[5:10,5:10]

if("igraph" %in% installed.packages()){
  update.packages("igraph")
  library(igraph)
} else {
  install.packages("igraph")
  library(igraph)
}

# build a graph from the above matrix
g <- graph.adjacency(termMatrix, weighted=T, mode = "undirected")
# remove loops
g <- simplify(g)
# set labels and degrees of vertices
V(g)$label <- V(g)$name
V(g)$degree <- degree(g)

# set seed to make the layout reproducible
set.seed(3952)
layout1 <- layout.fruchterman.reingold(g)
plot(g, layout=layout1)

plot(g, layout=layout.kamada.kawai)
tkplot(g, layout=layout.kamada.kawai)

V(g)$label.cex <- 2.2 * V(g)$degree / max(V(g)$degree)+ .2
V(g)$label.color <- rgb(0, 0, .2, .8)
V(g)$frame.color <- NA
egam <- (log(E(g)$weight)+.4) / max(log(E(g)$weight)+.4)
E(g)$color <- rgb(.5, .5, 0, egam)
E(g)$width <- egam
# plot the graph in layout1
plot(g, layout=layout1)