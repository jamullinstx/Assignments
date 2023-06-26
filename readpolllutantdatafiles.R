readpollutantdatafiles <- function(directory = "./specdata") {
  # This is a helper function to be used by pollutantmean, complete & corr
  # It takes in the directory, reads all .csv files putting the contents
  # into a dataframe, then returning that dataframe object for use in analysis.
  
  # Normally would trap for directory existence, etc., but not for this
  # assignment.

  filelist <- list.files(directory, pattern = "\\.csv$", ignore.case = TRUE)
  
  # Read first file to initialize the data frame for the data
  nextfile <- file.path(directory, filelist[1])
  pollutantdata <- read.csv(nextfile)
  
  # Drop the 1st file from filelist to continue generating the data frame
  numfiles <- length(filelist)
  filelist <- filelist[2:numfiles]
  
  # Read each CSV file into a data frame, and row bind to prior data frame
  for (fname in filelist) {
    nextfile <- file.path(directory, fname)
    tmpdf <- read.csv(nextfile)
    pollutantdata <- rbind(pollutantdata, tmpdf)
  }
  pollutantdata
}