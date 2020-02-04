Sewol_1 <- read.csv('1차년도.csv', header = T, stringsAsFactors = F)
Sewol_2 <- read.csv('2차년도.csv', header = T, stringsAsFactors = F)
Sewol_3 <- read.csv('3차년도.csv', header = T, stringsAsFactors = F)


g_1<- graph.adjacency(Sewol_1_mat, mode='undirected', diag = F)
g_2<- graph.adjacency(Sewol_2_mat, mode='undirected', diag = F)
g_3<- graph.adjacency(Sewol_3_mat, mode='undirected', diag = F)

png(filename = 'Sewol_1.png', height = 600, width = 800)
plot(g_1, edge.arrow.size=0.2,
     edge.color='gray',
     vertex.color='red',
     vertex.size=5,
     edge.width=1,
     vertex.label.color = 'black',
     vertex.label.cex = 2,
     layout=layout.kamada.kawai)
dev.off()

png(filename = 'Sewol_2.png', height = 600, width = 800)
plot(g_2, edge.arrow.size=0.2,
     edge.color='gray',
     vertex.color='red',
     vertex.size=5,
     edge.width=1,
     vertex.label.color = 'black',
     vertex.label.cex = 2,
     layout=layout.kamada.kawai)
dev.off()

png(filename = 'Sewol_3.png', height = 600, width = 800)
plot(g_3, edge.arrow.size=0.2,
     edge.color='gray',
     vertex.color='red',
     vertex.size=5,
     edge.width=1,
     vertex.label.color = 'black',
     vertex.label.cex = 2,
     layout=layout.kamada.kawai)
dev.off()

g_1
g_2
g_3

graph.density(g_1, loops = F)
graph.density(g_2, loops = F)
graph.density(g_3, loops = F)

(deg_1 <- degree(g_1, mode='all'))
(deg_2 <- degree(g_2, mode='all'))
(deg_3 <- degree(g_3, mode='all'))

##(hist(deg_full, main = '연결정도 분포도'))
##(sp_full <- shortest.paths(g, mode = 'all'))

(deg_cent_1 <- degree(g_1, mode = 'all', normalized = T))
(deg_cent_2 <- degree(g_2, mode = 'all', normalized = T))
(deg_cent_3 <- degree(g_3, mode = 'all', normalized = T))


(close_cent_1 <- closeness(g_1, mode = 'all', normalized = T))
(close_cent_2 <- closeness(g_2, mode = 'all', normalized = T))
(close_cent_3 <- closeness(g_3, mode = 'all', normalized = T))

(bet_cent_1 <- betweenness(g_1, directed = F, normalized = T))
(bet_cent_2 <- betweenness(g_2, directed = F, normalized = T))
(bet_cent_3 <- betweenness(g_3, directed = F, normalized = T))
