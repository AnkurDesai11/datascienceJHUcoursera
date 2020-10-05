#if(!file.exists("cameraData")){
#  dir.create("cameraData")
#}
fileURL <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileURL, destfile="cameras.csv")
downloadDate <- date()
