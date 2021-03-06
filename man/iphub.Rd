% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/iphub.R
\name{iphub}
\alias{iphub}
\title{Look IP addresses using iphub}
\usage{
iphub(x, key = NULL)
}
\arguments{
\item{x}{Vector of IP addresses}

\item{key}{`X-Key` supplied by iphub. After first time using, this should be
set for future uses on your machine.}
}
\value{
A tibble data frame or list/parsed response.
}
\description{
Looks up safe/unsafe and basic info on provided IP addresses.
}
\examples{
\dontrun{

ips <- c("192.0.2.1", "255.255.255.0")
iphub(ips)

}
}
