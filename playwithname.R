## return a dataframe in which each line is a year with the n 
## most pupular name for boys and for girls (where n is the argument)
## example : to show top 3 names by year :
## > head(top(3)) 
##     Year Top 1 boys Top 1 girls Top 2 boys Top 2 girls Top 3 boys Top 3 girls
## 1    1880       John        Mary    William        Anna      James        Emma
## 1001 1881       John        Mary    William        Anna      James        Emma
## 2001 1882       John        Mary    William        Anna      James        Emma
## 3001 1883       John        Mary    William        Anna      James        Emma
## 4001 1884       John        Mary    William        Anna      James        Emma
## 5001 1885       John        Mary    William        Anna      James        Emma
top <- function(n = 1) {
        
        data <- read.csv("baby-names.csv")
        suppressWarnings(data[, "prop"] <- as.numeric(data[, "prop"]))
        
        ## order data by prop, descending
        data <- data[order(-data$prop),]
        
        ## subset data in 2 genders
        boys <- subset(data, sex == "boy")
        girls <- subset(data, sex == "girl")

        ## initilizing the data frame returned at the end of the function
        result <- data.frame()
        
        ## get every years in data
        years = sort(unique(data$year))

        for (y in years){
                ## subset the boys and girls dataframes for the current year
                boysyear <- subset(boys, year == y)
                girlsyear <- subset(girls, year == y)
                
                ## create a dataframe for the current year
                line = data.frame(y)
                
                ## for every top "n", add 2 columns in the dataframe of the 
                ## year : one for the top "n" boys and one for the top "n" girls
                for (i in 1:n){
                        boysname <- boysyear[i,"name", drop=FALSE]
                        girlsname <- girlsyear[i,"name", drop=FALSE]
                        line = cbind(line, boysname, girlsname)
                }
                ## add the current dataframe to the dataframe to return
                result <- rbind(result, line)
        }
        
        ## naming the columns
        names(result)[1] = "Year"
        for(i in 1:n){
                names(result)[2*i] <- paste("Top", i, "boys")
                names(result)[2*i+1] <- paste("Top", i, "girls")
        }
        
        return (result)
}

## return a dataframe in which each line is a year with the n 
## most pupular name for boys and for girls (where n is the argument)
## example : to show top 3 names by year :
## > head(top(3)) 
##     Year Top 1 boys Top 1 girls Top 2 boys Top 2 girls Top 3 boys Top 3 girls
## 1    1880       John        Mary    William        Anna      James        Emma
## 1001 1881       John        Mary    William        Anna      James        Emma
## 2001 1882       John        Mary    William        Anna      James        Emma
## 3001 1883       John        Mary    William        Anna      James        Emma
## 4001 1884       John        Mary    William        Anna      James        Emma
## 5001 1885       John        Mary    William        Anna      James        Emma
topv2 <- function(n = 1) {
        
        data <- read.csv("baby-names.csv")
        suppressWarnings(data[, "prop"] <- as.numeric(data[, "prop"]))
        
        ## order data by prop, descending
        data <- data[order(-data$prop),]
        
        ## subset data in 2 genders
        boys <- subset(data, sex == "boy")
        girls <- subset(data, sex == "girl")

        
        ## order data by prop, descending
        data <- data[order(-data$prop),]
        
        
        ## subset data in 2 genders
        boys <- subset(data, sex == "boy")
        girls <- subset(data, sex == "girl")
        
        ## split data by year
        boysbyyear <- split(boys, boys$year)
        girlsbyyear <- split(girls, girls$year)
       
        ## initilizing the data frame returned at the end of the function
        result <- data.frame()
        
        ## get every years in data
        years = sort(unique(data$year))

        for (y in years){
                boysyear <- boysbyyear[as.character(y)]
                girlsyear <- girlsbyyear[as.character(y)]
                
                ## create a dataframe for the current year
                line = data.frame(y)
                
                ## for every top "n", add 2 columns in the dataframe of the 
                ## year : one for the top "n" boys and one for the top "n" girls
                for (i in 1:n){
                        boysname <- boysyear[[1]][i,"name", drop=FALSE]
                        girlsname <- girlsyear[[1]][i,"name", drop=FALSE]
                        line = cbind(line, boysname, girlsname)
                }                
                
                ## add the current dataframe to the dataframe to return
                result <- rbind(result, line)

        }
        
        ## naming the columns
        names(result)[1] = "Year"
        for(i in 1:n){
                names(result)[2*i] <- paste("Top", i, "boys")
                names(result)[2*i+1] <- paste("Top", i, "girls")
        }
        
        return (result)
}

## return a dataframe in which each line is a year with the n 
## most pupular name for boys and for girls (where n is the argument)
## example : to show top 3 names by year :
## > head(top(3)) 
##     Year Top 1 boys Top 1 girls Top 2 boys Top 2 girls Top 3 boys Top 3 girls
## 1    1880       John        Mary    William        Anna      James        Emma
## 1001 1881       John        Mary    William        Anna      James        Emma
## 2001 1882       John        Mary    William        Anna      James        Emma
## 3001 1883       John        Mary    William        Anna      James        Emma
## 4001 1884       John        Mary    William        Anna      James        Emma
## 5001 1885       John        Mary    William        Anna      James        Emma
topv3 <- function(n = 1) {
        
        data <- read.csv("baby-names.csv")
        suppressWarnings(data[, "prop"] <- as.numeric(data[, "prop"]))
        
        ## order data by prop, descending
        data <- data[order(-data$prop),]
        
        ## subset data in 2 genders
        boys <- subset(data, sex == "boy")
        girls <- subset(data, sex == "girl")
        
        
        ## order data by prop, descending
        data <- data[order(-data$prop),]
        
        
        ## subset data in 2 genders
        boys <- subset(data, sex == "boy")
        girls <- subset(data, sex == "girl")
        
        ## split data by year
        boysbyyear <- split(boys, boys$year)
        girlsbyyear <- split(girls, girls$year)
        
        ## initilizing the data frame returned at the end of the function
        result <- data.frame()
        
        ## get every years in data
        years = sort(unique(data$year))
        
        ## for every top "n", add 2 columns in the dataframe of the 
        ## year : one for the top "n" boys and one for the top "n" girls
        for (i in 1:n){
                
                ## create a dataframe for the current rank
                line = data.frame(i)
                
                for (y in years){
                        boysyear <- boysbyyear[as.character(y)]
                        girlsyear <- girlsbyyear[as.character(y)]
                        
                        boysname <- boysyear[[1]][i,"name", drop=FALSE]
                        girlsname <- girlsyear[[1]][i,"name", drop=FALSE]
                        line = cbind(line, boysname, girlsname)
                }                
                
                ## add the current dataframe to the dataframe to return
                result <- rbind(result, line)
                
        }
        
        ## naming the columns
        names(result)[1] = "Rank"
        i <- 1
        for(y in years){
                names(result)[2*i] <- paste(y, "boys")
                names(result)[2*i+1] <- paste(y, "girls")
                i <- i+1
        }
        
        return (result)
}

## return the first year where a name or a partial name (first argument)
## is in top n (second argument) for a gender (third argument, boy or girl)
## example : to know the first year the name Michelle appears in top 50 for the girls :
## > firstyear("Michelle", 50, "girl")
## [1] 1959
firstyear <- function(thename, n = 1000, gender = "boy") {
        ## check if the gender argument is boy or girl
        if (gender != "boy" && gender != "girl"){
                stop("invalid gender")
        }
        
        data <- read.csv("baby-names.csv")
        suppressWarnings(data[, "prop"] <- as.numeric(data[, "prop"]))
        
        
        ## order data by year, ascending, and prop, descending
        data <- data[order(data$year, -data$prop),]
        
        ## create a subset for the name and the gender in arguments
        ## for the name, the grepl function will return a logical vector 
        ## (match or not for each element name in the dataframe)
        dataname <- subset(data, grepl(thename, name, ignore.case = TRUE) & sex == gender)
        
        ## for each year found in dataname (where the name is present)
        ## we check if the name is present in the n first lines
        ## if the name is found, the year is return and the function stops
        for (y in dataname$year){
                datayear <- subset(data, year == y & sex == gender)
                datayeartop <- subset(datayear[1:n,], grepl(thename,name, ignore.case = TRUE))
                if (nrow(datayeartop) > 0){
                        return (y)
                }
        }
        ## if we are here, it's because the name wasn't found in the first n
        ## lines for each year, so the name was never in the top n 
        NA 
}

## return the rank of the name (first argument) for each year, and for boys and girls
## example : to show the rank of the name Martin for each year
## > head(rankname("Martin"))
##   Year Boys Girls
## 1 1880   45    NA
## 2 1881   46    NA
## 3 1882   48    NA
## 4 1883   46    NA
## 5 1884   49    NA
## 6 1885   49    NA
rankname <- function(thename){
        data <- read.csv("baby-names.csv")
        suppressWarnings(data[, "prop"] <- as.numeric(data[, "prop"]))
        
        ## order data year, ascending, and by prop, descending
        data <- data[order(data$year, -data$prop),]
         
        ## initilizing the data frame returned at the end of the function
        result <- data.frame()
        
        ## get every years in data
        years <- sort(unique(data$year))
        
        for (y in years){
                ## subset the boys and girls dataframes for the current year
                boysbyyear <- subset(data, year == y & sex == "boy")
                girlsbyyear <- subset(data, year == y & sex == "girl")
                
                ## find the rank for the name in each dataframe
                boysrank <- which(boysbyyear$name==thename)
                girlsrank <- which(girlsbyyear$name==thename)
                
                ## if the name wasn't find, we use NA
                if (length(boysrank) == 0) boysrank = NA
                if (length(girlsrank) == 0) girlsrank = NA
                
               
                ## add the current dataframe to the dataframe to return
                result <- rbind(result, data.frame(y, boysrank, girlsrank))
        }
        
        ## naming the columns
        names(result) = c("Year", "Boys", "Girls")

        return (result)
}

## return a linear graph with 2 series (boys and girls) 
## presenting the rank of the name in argument, by year
## example : to show a graph presenting the rank for the name Terry :
## > graphrankname("Terry")
graphrankname <- function(thename){
        require(ggplot2)
        data <- read.csv("baby-names.csv")
        suppressWarnings(data[, "prop"] <- as.numeric(data[, "prop"]))
        
        ## order data year, ascending, and by prop, descending
        data <- data[order(data$year, -data$prop),]
        
        ## initilizing the data frame returned at the end of the function
        result <- data.frame()
        
        ## get every years in data
        years <- sort(unique(data$year))

        for (y in years){
                ## subset the boys and girls dataframes for the current year
                boysbyyear <- subset(data, year == y & sex == "boy")
                girlsbyyear <- subset(data, year == y & sex == "girl")
                
                ## find the rank for the name in each dataframe
                boysrank <- which(boysbyyear$name==thename)
                girlsrank <- which(girlsbyyear$name==thename)
                
                ## if the name wasn't find, we use NA
                if (length(boysrank) == 0) boysrank = NA
                if (length(girlsrank) == 0) girlsrank = NA
                
                ## add the current dataframe to the dataframe to return
                result <- rbind(result, data.frame(Year = y, Rank = boysrank, Sex = "boys"))
                result <- rbind(result, data.frame(Year = y, Rank = girlsrank, Sex = "girls"))
        }
        
        ## return a linear graph with 2 series (boys and girls) 
        ## presenting the rank of the name in argument, by year
        return(ggplot(data=result, aes(x=Year, y=Rank, group=Sex, colour=Sex)) 
                + geom_path(na.rm = TRUE) 
                + scale_y_reverse() 
                + ggtitle(paste("Rank of the name", thename, "by year and by gender")))
}
