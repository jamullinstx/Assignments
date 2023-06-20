myfunction <- function() {
  x <- rnorm(100)
  mean(x)
}

cube <- function(x, n) {x^3}

f <- function(x) {
  g <- function(y) {
    y + z
  }
  z <- 4
  x + g(x)
}