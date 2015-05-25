# set dimensions of the mouse data set
xdim=60
ydim=20

# read the simulated mouse data and format it as a matrix
SimulateMouseData(dist='unif', xdim=xdim, ydim=ydim)
mousedata = readRDS('simulated_mouse_data.rds')
mousedatamat = as.matrix(mousedata)

# plot heatmap of the mouse data
rowcolors = rainbow(nrow(mousedatamat))
colcolors = rainbow(ncol(mousedatamat))
#heatmap(mousedatamat, RowSideColors = rowcolors, ColSideColors = colcolors)
heatmap(mousedatamat, col=cm.colors(256))

# calculate correlations between all rows
rowcors = matrix(data=NA, nrow=ydim, ncol=ydim)
for (i in 1:ydim) {
  for (j in 1:ydim) {
    rowcors[i,j] = cor(mousedatamat[i,], mousedatamat[j,])
  }
}

# calculate correlations between all columns
colcors = matrix(data=NA, nrow=xdim, ncol=xdim)
for (i in 1:xdim) {
  for (j in 1:xdim) {
    colcors[i,j] = cor(mousedatamat[,i], mousedatamat[,j])
  }
}