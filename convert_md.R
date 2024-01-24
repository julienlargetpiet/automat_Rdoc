library("Rd2md")

loc <- data.frame(read.table("loc.txt"))[1, 1]

alf <- list.files(loc, pattern="")

alf <- paste(loc, alf, sep="")

loc <- unlist(strsplit(loc, split="/"))

loc <- paste(loc[1:(length(loc)-1)], collapse="/")

RD_me <- paste0(loc, "/README.md")

for (i in 1:length(alf)){

        print(paste("generating markdown for", alf[i]))

        Rd2markdown(alf[i], RD_me, append=T)

}

