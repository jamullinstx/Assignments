pollutantmean <- function(directory = "./specdata", pollutant, idlist = 1:332) {
  # Read ALL of the data into a data frame using the helper fxn
  pollutionreadings <- readpollutantdatafiles(directory)
  
  # Extract the data using the id vector
  subsetreadings <- pollutionreadings[pollutionreadings$ID %in% idlist, ]
  
  # Compute the mean of the pollutant, ignoring NA values, without rounding
  meanvalue <- mean(subsetreadings[[pollutant]], na.rm = TRUE)
}