tab <- read.table(input_files[1], header=TRUE)
x <- 0*tab$f
x[[1]] <- 50
xt <- sim(p=tab$p, f=tab$f, x=x)
strucPlots(xt, "Squirrel example")
print(xt)
