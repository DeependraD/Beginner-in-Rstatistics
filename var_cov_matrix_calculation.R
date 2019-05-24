## simulate some data
mat_x <- ceiling(runif(100, 12, 150))
mat_x <- matrix(mat_x, nrow = 20, byrow = F)
colmean_mat_x <- colMeans(mat_x)

# this centers the columns
cent_mat_x <- t(apply(mat_x, 1, function(x) x-colmean_mat_x))

# a verification
colMeans(cent_mat_x)

# this should be the variance-covariance matrix
cov_cent_mat_x <- (t(cent_mat_x) %*% cent_mat_x)/(dim(cent_mat_x)[1] - 1)

# alternatively, through matrix multiplication:

cent_mat_x <- mat_x - (matrix(data = 1, nrow = nrow(mat_x)) %*% rbind(colMeans(mat_x)))
colMeans(cent_mat_x)
(nrow(mat_x)-1)**(-1)*t(cent_mat_x) %*% cent_mat_x


# this is the shortest of all to get cov matrix
crossprod(sweep(mat_x, 2L, colMeans(mat_x))) / (nrow(mat_x) - 1L)
