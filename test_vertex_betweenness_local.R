require(igraph)
packageVersion("igraph") # my installed version is 1.0.1

#--- set plotting parameters
vs <- 25# vertex.size
ec <- gray(0.8)#edge.color
elx <- 2# edge.label.cex
elc <- "black"#,edge.label.color
vlc <- 2#vertex.label.cex
ew <- 2#edge.width
cm <- 2
vc <- "orange"


#--- example 1
set.seed(1210)
g <- make_ring(8)
lay <- layout.auto(g)

graphics.off()
windows(width = 12, height=12)
par(mfrow=c(2,2))

V(g)$name <- letters[1:length(V(g))]
g <- set.edge.attribute(g, "weight", value= c(.1 , .2, rep(.1, 2), rep(0.2,4)))
plot(g, edge.label=round(E(g)$weight,1), layout=lay, vertex.size=vs, edge.color=ec, edge.label.cex=elx, vertex.label.cex=vlc, edge.width=ew, edge.label.color=elc, vertex.color=vc)
title("(a) Weights", cex.main = cm)

bl.1 <- estimate_betweenness(g, cutoff=0.29)
V(g)$name <- bl.1
plot(g,        layout=lay, vertex.size=vs, edge.color=ec, edge.label.cex=elx, vertex.label.cex=vlc, edge.width=ew, edge.label.color=elc, vertex.color=vc)
title("(b) Local Betweenness\ncutoff 0.29", cex.main = cm)

V(g)$name <- letters[1:length(V(g))]
g <- set.edge.attribute(g, "weight", value=.2)
plot(g, edge.label=round(E(g)$weight,1), layout=lay, vertex.size=vs, edge.color=ec, edge.label.cex=elx, vertex.label.cex=vlc, edge.width=ew, edge.label.color=elc, vertex.color=vc)
title("(c) new weights", cex.main = cm)

bl.2 <- estimate_betweenness(g, cutoff=0.29)
V(g)$name <- bl.2
plot(g,          layout=lay, vertex.size=vs, edge.color=ec, edge.label.cex=elx, vertex.label.cex=vlc, edge.width=ew, edge.label.color=elc, vertex.color=vc)
title("(d) Local Betweenness\ncutoff 0.29", cex.main = cm)


# Comments and Discussion:
# This simple example illustrates, that vertex betweenness values change,
# if the edge weights are changed and the cutoff parameters are chosen constant.
# Ring shape of the graph, for easier reconstring the calculation;
#
# 1. define edge weights as in plot (a)
# 2. calculate vertex betweenness with cutoff 0.29 (b)
# 3. define new edge weights as in plot (c)
# 4. calculate vertex betweenness with cutoff 0.29 (d)




#--- example 2
##--- adjust plotting parameters
vs <- 20# vertex.size
elx <- 1# edge.label.cex
vlc <- 1#vertex.label.cex


set.seed(1210)
g <- make_ring(20)
lay <- layout.auto(g)

graphics.off()
windows(width = 30, height=30)
par(mfrow=c(2,2))

V(g)$name <- letters[1:length(V(g))]
g <- set.edge.attribute(g, "weight", value= c(rep(2:3,10)))
plot(g, edge.label=round(E(g)$weight,1), layout=lay, vertex.size=vs, edge.color=ec, edge.label.cex=elx, vertex.label.cex=vlc, edge.width=ew, edge.label.color=elc, vertex.color=vc)
title("(a) Weights", cex.main = cm)

bl.1 <- estimate_betweenness(g, cutoff=6)
V(g)$name <- bl.1
plot(g,        layout=lay, vertex.size=vs, edge.color=ec, edge.label.cex=elx, vertex.label.cex=vlc, edge.width=ew, edge.label.color=elc, vertex.color=vc)
title("(b) Local Betweenness\ncutoff 6", cex.main = cm)

bl.2 <- estimate_betweenness(g, cutoff=9)
V(g)$name <- bl.2
plot(g,        layout=lay, vertex.size=vs, edge.color=ec, edge.label.cex=elx, vertex.label.cex=vlc, edge.width=ew, edge.label.color=elc, vertex.color=vc)
title("(c) Local Betweenness\ncutoff 9", cex.main = cm)

bl.3 <- estimate_betweenness(g, cutoff=Inf)
V(g)$name <- bl.3
plot(g,          layout=lay, vertex.size=vs, edge.color=ec, edge.label.cex=elx, vertex.label.cex=vlc, edge.width=ew, edge.label.color=elc, vertex.color=vc)
title("(d) Global Betweenness\ncutoff Inf", cex.main = cm)


# Comments and Discussion:
# This simple example illustrates, that vertex betweenness values change,
# if the edge weights are constant and the cutoff parameters change.
# Ring shape of the graph, for easier reconstring the calculation;
#
# 1. define edge weights as in plot (a)
# 2. calculate vertex betweenness with cutoff 6 (b)
# 2. calculate vertex betweenness with cutoff 9 (c)
# 4. calculate vertex betweenness with cutoff Inf (d)
