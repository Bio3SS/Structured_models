tab <- read.table(input_files[1], header=TRUE)
xt <- sim(p=tab$p, f=tab$f, x=c(5, 1, 0, 0), numSteps=24)
strucPlots(xt, "Salmon example")
print(xt)
