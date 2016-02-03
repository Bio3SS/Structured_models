sim <- function(p, f, s=0, x=NULL, numSteps=10){
	if (is.null(x)){
		x=0*p
		x[[1]]=1
	}
	if (length(p) != length(f)){
		die("p and f must have the same length")
	}
	if (p[[length(p)]] != 0){
		die("No survival allowed from last age class")
	}

	gen <- function(x, p, f, s){
		prog = p*x
		new = sum(f*x)
		stay = s*x
		return(c(new, prog[-length(prog)]) + stay)
	}

	xt <- x
	for (i in 1:numSteps){
		x <- gen(x, p, f, s)
		xt <- rbind(xt, x)
	}
	rownames(xt) <- 0:numSteps
	return(xt)
}

cumulate <- function(xt){
	cum <- list()
	for (i in 1:ncol(xt)){
		cum[[i]] <- rowSums(xt[, 1:i, drop=FALSE])
	}
	return(cum)
}

######### Pictures #############

strucPlots <- function(xt, title="Structured population"){
	barplot(t(as.matrix(xt)), 
		main = title,
		xlab = "T",
		ylab = "Population in each age class"
	)
	r <- rowSums(xt)
	pt <- sweep(xt, 1, r, "/")
	plot(row.names(xt), r,
		main = title,
		xlab="T", ylab="Total population", log="y", type="b"
	)
	barplot(t(as.matrix(pt)), 
		main = title,
		xlab = "T", ylab = "Proportion in each age class"
	)
}
