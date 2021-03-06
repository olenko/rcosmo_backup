% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Statistics.R
\name{covmodelCMB}
\alias{covmodelCMB}
\title{Computes values of covariance functions}
\usage{
covmodelCMB(obj, cov.model = "matern",
  cov.pars = stop("no cov.pars argument provided"), kappa = 0.5)
}
\arguments{
\item{obj}{Vector of distances between pairs of spatial locations.}

\item{cov.model}{A type of the correlation function. Available choices are: "matern",
"exponential","spherical", "powered.exponential", "cauchy", "gencauchy", "pure.nugget",
"askey", "c2wendland", "c4wendland", "sinepower", "multiquadric". Default is "matern"}

\item{cov.pars}{A vector with two covariance parameters. The first parameter
corresponds to the variance sigma^2. The second parameter corresponds
to the range phi of the correlation function.}

\item{kappa}{A smoothness parameter of the correlation function.}
}
\value{
Values of a covariance function for the given distances.
}
\description{
This function computes the covariances given the separation distance of  locations.
Options for different covariance functions on spheres are available. The function
extends the function \code{\link[geoR]{cov.spatial}} for additional
covariance models on spheres.
}
\details{
The function returns the value of the covariance \code{C(h)} at the distance \code{h}.
The covariance function has the form

\deqn{C(h) = sigma^2 * rho(h/phi).}

The parameters of the covariance are positive numbers \code{sigma^2}, \code{phi}
and \code{kappa}.

Expressions for the correlation functions which are not included in the package
\strong{geoR}:

\describe{
\item{\strong{askey}}{
\deqn{rho(h/phi) = (1 - h/phi)^{kappa}, if h < phi;}
\deqn{0, otherwise.}}
\item{\strong{c2wendland}}{
\deqn{rho(h/phi) =  (1 + kappa * h/phi) * (1 - h/phi)^{kappa}, if h < phi;}
\deqn{0, otherwise.}}
\item{\strong{c4wendland}}{
\deqn{rho(h/phi) =  (1 + kappa * h/phi + (kappa^2 - 1) * (h/phi)^2 / 3) * (1 - h/phi)^{kappa}, if h < phi;}
\deqn{0, otherwise.}}
\item{\strong{sinepower}}{
\deqn{rho(h/phi) = 1 - (sin(h/(2 phi))) ^{kappa}}}
 \item{\strong{multiquadric}}{
 \deqn{C(h) =   (1 - phi) ^{(2 * kappa)} / (1 + phi^2 - 2 * phi * cos(h))^{kappa},
 0<phi<1}}
 }

Additional information can be found in the section Details in
\code{\link[geoR]{cov.spatial}}.
}
\examples{

## Compute Askey variogram at x = pi/4

1 - covmodelCMB(pi/4, cov.pars = c(1, pi), kappa = 3, cov.model = "askey" )

## Plot of the Askey covariance function

v1.f <- function(x, ...) {covmodelCMB(x, ...)}
curve( v1.f(x, cov.pars = c(1, 0.03), kappa = 3, cov.model = "askey"),
from = 0, to = 0.1, xlab = "distance", ylab = expression(cov(h)), lty = 2,
main = "covariance")

}
\references{
\strong{geoR} package, \code{\link[geoR]{cov.spatial}}

T. Gneiting. Strictly and non-strictly positive definite functions on spheres.
Bernoulli 19 (2013), no. 4, 1327-1349.
}
