complete2 <- function(pollutionreadings, id = 1:332) {
  # Count the number of observations that have both sulfate and nitrate readings
  
  # This is basically the same as function complete, but accepts the already
  # read table of readings, doing extraction/splitting on that data frame
  # instead of reading the data files into the data frame repeated.
  
  # Extract the data using the id vector
  subsetreadings <- pollutionreadings[pollutionreadings$ID %in% id, ]
  
  # Find row indices where sulfate and nitrate have real values
  sulfateindices <- !is.na(subsetreadings$sulfate)
  nitrateindices <- !is.na(subsetreadings$nitrate)
  
  # Compute the index vector where both are real values
  goodindices <- sulfateindices & nitrateindices
  
  # Extract the ID rows where the comboindices == TRUE
  idvector <- subsetreadings$ID[goodindices]
  
  # Note: This solution will not report counts for sensors with 0 complete obs!!
  
  # Count 'em up and return the data frame of frequency of complete observations
  # for those sensors that have at least some complete observations.
  obscounts <- data.frame(table(idvector))
}