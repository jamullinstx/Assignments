pollutantmean2 <- function(pollutionreadings, pollutant, idlist = 1:332) {
  # Extract the data using the id vector
  subsetreadings <- pollutionreadings[pollutionreadings$ID %in% idlist, ]
  
  # Compute the mean of the pollutant, ignoring NA values, without rounding
  meanvalue <- mean(subsetreadings[[pollutant]], na.rm = TRUE)
}