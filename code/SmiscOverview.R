## 
## myName <- loadObject("~/aDir/aFile.Rdata")

## 
## # The names of the 100 matrices, m1, m2, ..., m100
## mNames <- paste("m", 1:100, sep = "")
## 
## # Initialize the combined object
## combined <- NULL
## 
## # Now wait forever
## for (m in mNames) {
##   combined <- rbind(combined, get(m))
## }

## 
## # The names of the 100 matrices, m1, m2, ..., m100
## mNames <- paste("m", 1:100)
## 
## # Now combined using `rbind()`
## combined <- qbind(mNames, type = "row")

## 
d <- data.frame(a = 1:2, b = letters[1:2])
d
df2list(d)

## 
z <- list(a = c(first = 10, second = 12), b = c(first = 15, second = 17))
z
list2df(z)

## 
# A simple list that we'll separate
sepList(list(x1 = 10, x2 = "a"))

# 'x1' and 'x2' are now objects in the Global environment:
x1
x2

## 
getExtension(c("~/aDir/aFile.txt", "anotherFile.R"))

## 
getPath(c("~/aDir/aFile.txt", "anotherFile.R"))

## 
stripExtension(c("~/aDir/aFile.txt", "anotherFile.R"))

## 
stripPath(c("~/aDir/aFile.txt", "anotherFile.R"))

## 
grabLast("some_new_stuff", "_")

## 
timeStamp("thisFile", "txt")

## 
# These files will sort in numeric order with the padded zeros
paste("fileNumber_", padZero(c(1, 10, 100)), ".txt", sep = "")

# An example of adding 0's to the right side
padZero(c(1.2, 1.34, 1.399), side = "r")

