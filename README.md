playwithnames
=============

# Function : top

##Arugment
* n (for top 1, call top(), for top 5, call top(5))

##Definition
This function returns a dataframe in which each line is a year with the n most pupular name for boys and for girls (where n is the argument)

## Example
To show top 3 names by year :
> head(top(3)) 
>     Year Top 1 boys Top 1 girls Top 2 boys Top 2 girls Top 3 boys Top 3 girls
> 1    1880       John        Mary    William        Anna      James        Emma
> 1001 1881       John        Mary    William        Anna      James        Emma
> 2001 1882       John        Mary    William        Anna      James        Emma
> 3001 1883       John        Mary    William        Anna      James        Emma
> 4001 1884       John        Mary    William        Anna      James        Emma
> 5001 1885       John        Mary    William        Anna      James        Emma
      

# Function : firstyear

##Arguments
* thename (the name or the partial name to find)
* n (to specify the top n)
* gender (girl or boy, to specify in which gender search the first occurence of the name)

##Definition
This function returns the first year where a name or a partial name is in top n  for a gender.

## Example
To know the first year the name Michelle appears in top 50 for the girls :
> firstyear("Michelle", 50, "girl")
> [1] 1959


# Function : rankname

##Argument
* thename (the name to find)

##Definition
This function returns the rank of the name (first argument) for each year, and for boys and girls.

## Example
To show the rank of the name Martin for each year :
> head(rankname("Martin"))
>   Year Boys Girls
> 1 1880   45    NA
> 2 1881   46    NA
> 3 1882   48    NA
> 4 1883   46    NA
> 5 1884   49    NA
> 6 1885   49    NA


# Function : graphrankname

##Argument
* thename (the name to find)

##Definition
This function returns a linear graph with 2 series (boys and girls) presenting the rank of the name in argument, by year.

## Example
To show a graph presenting the rank for the name Terry :
> graphrankname("Terry")
![Image of Yaktocat](https://octodex.github.com/images/yaktocat.png)