data_files = datadefs$data
gf_files = datadefs$gf

for (file in data_files) {
  datafile = paste(getwd(), "/data/", file, "_random", ".txt", sep="")
  assign(file, read.table(file=datafile, header=TRUE, sep=" "))
}

for (file in gf_files) {
  gffile = paste(getwd(), "/data/", file, ".txt", sep="")
  assign(file, read.table(file=gffile, header=TRUE, sep=" "))
}
