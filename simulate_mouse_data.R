# Creates a simulated dataset of xdim mouse-region-volumes by ydim strains.
# You can specify the type of distribution you want to sample from.
simulate_mouse_data = function(dist='unif', xdim=60, ydim=20) {
  
  xnames = rep(1:xdim, 1)
  ynames = c('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j',
             'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't')
  
  if (dist == 'unif') {
    data = runif(n=xdim*ydim, min=-3, max=3)
  } else if (dist == 'norm') {
    data = rnorm(n=xdim*ydim, mean=0, sd=1)
  } else {  
    print("No data was saved.  Please enter a valid distribution type.")
    return(-1)
  }
  
  mat = matrix(data, nrow=ydim, ncol=xdim)
  frame = as.data.frame(mat)
  colnames(frame) = xnames
  rownames(frame) = ynames
    
  saveRDS(frame, file='simulated_mouse_data.rds')
}

###                             NOTES

### save() and load()
# saves the name of the variable along with the actual object data
# not ideal because loading the variable can conflict with a current variable with the same name
# one advantage is it allows you to save multiple objects into one file
# save() produces an .rda file 

### saveRDS(), readRDS()
# use this function instead
# it serializes the object for later use, and you can assign it to any variable
# more lower level function so can only save one object to a file
# saveRDS() produces an .rds file