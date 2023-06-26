complete <- function(directory = "./specdata", id = 1:332) {
  # Count the number of observations that have both sulfate and nitrate readings
  
  # Read all of the data files into a data frame using helper function
  pollutionreadings <- readpollutantdatafiles(directory)
  
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
  
  # Count 'em up
  obscounts <- data.frame(table(idvector))
}