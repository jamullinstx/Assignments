corr <- function(pollutionreadings, threshold = 0) {
  # Function to compute the correlation coefficient between Nitrate & Sulfate
  # readings for sensors that have readings > threshold.
  
  # Note: this function deviates from the assignment because it is STUPID to
  # repeatedly read the data files from inside the function instead of reading
  # them once, then passing the resulting data frame to the functions.
  
  # Compute a frequency data frame that gives the frequency of COMPLETE
  # observations by sensor ID.
  obsfrequencies <- complete2(pollutionreadings)
  
  # Find the sensor IDs with complete observation frequency >= 0. If no
  # sensors meet or exceed the threshold, return an empty numeric vector.
  sensorIDs <- as.integer(obsfrequencies[obsfrequencies$Freq >= threshold, "idvector"])
  
  # If no sensors meet the threshold, return a numeric vector of length 0.
  if (length(sensorIDs) == 0) {
    subsetreadings <- numeric()
    return(subsetreadings)
    }
  
  # If we've reached here, there must be some readings that meet criteria
  # Extract the data using the id vector.
  
  numsensors <- length(sensorIDs)
  cr <- numeric(numsensors)
  for(i in 1:numsensors) {
    sensorreadings <- pollutionreadings[pollutionreadings$ID == sensorIDs[i], ]
    sulfatevalues <- sensorreadings$sulfate
    nitratevalues <- sensorreadings$nitrate
    cr[i] <- cor(nitratevalues, sulfatevalues, use = "pairwise.complete.obs")
  }
  return(cr)
}