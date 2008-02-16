\name{dist.birch}
\alias{dist.birch}
\title{ Create a dissimilarity matrix from a birch object}
\description{
  This function computes and returns the distance matrix computed by
  passing the centers of the subclusters in the birch object to
  \code{dist}.
}
\usage{
dist.birch(birchObject, \dots)
}
\arguments{
  \item{birchObject}{An object created by the function
    \code{\link{birch}}. Contains a CF-tree.} 
  \item{\dots}{ Further arguments passed to \code{dist}.}
}
\details{
  This function is a wrapper for the \code{dist} function, for
  application on  the centers of birch objects. It is provided as a
  convenient mechanism for provided estimates of initial centers for the
  \code{kmeans.birch} function. An example of this is provided in the
  section below.
}
\value{
  An object of the class \dQuote{dist}. See \code{\link{dist}} for more details.
}
\references{
  Harrington, J and Salibian-Barrera, M (2007) \dQuote{Finding
    Approximate Solutions to Combinatorial Problems with Very Large
    Datasets using BIRCH}, submitted to \emph{Statistical Algorithms
    and Software, 2nd Special Issue} Computational Statistics and Data
  Analysis. A draft can be found at \url{http://www.stat.ubc.ca/~harringt/birch/birch.pdf}.
  
  Harrington, J and Salibian-Barrera, M (2008) \dQuote{birch: Working
    with very large data sets}, submitted to \emph{Journal of
    Statistical Software}. A draft can be found at \url{http://www.stat.ubc.ca/~harringt/birch/birch-jss.pdf}.
}
\author{
  Justin Harrington \email{harringt@stat.ubc.ca} and Matias Salibian-Barrera \email{matias@stat.ubc.ca}
}
\seealso{ \code{\link{birch}}, \code{\link{dist}}, \code{\link{kmeans.birch}}}
\examples{
## Load a demo birch Object
data(birchObj)

## Calculate the distances, perform hclust, and then
## find out which clustering corresponds to 2 groups
bDist <- dist.birch(birchObj)
hc <- hclust(bDist)
clusters <- cutree(hc, 2)

## Calculate centers based on these clusters, and cluster with them
centers <- rbind(summary(birchObj[clusters == 1,])$mean,
summary(birchObj[clusters == 2,])$mean)
kOut <- kmeans.birch(birchObj, centers)
}

\keyword{multivariate}
\keyword{cluster}