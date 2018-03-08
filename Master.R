---
title: "Road Accidents of UK in 2012"
output: pdf_document
fontsize: 12pt
---
  
##By Yiming Sun

  ```{r load_packages, include=FALSE}
library(readx1)
library(ggthemes)
library(scales)
library(lubridate)
library(knitr)
library(tidyverse)



accidents<-read.csv('https://aql.datapress.com/leeds/dataset/road-traffic-accidents/2016-05-19T15:30:01/2012.csv')
```
  
#Duplicate the dataset for different uses
accidents_EDA=accidents
accidents_map=accidents

##Data exploration
#The data has these columns
str(accidents_EDA)

#To have a better reading of the variable names always use:
names(accidents_EDA)

#EDA for non-ordinal polytomous variables
table(accidents$Accident.Date)

#Get the date have the most accidents in 2012
accidents$Accident.Date=as.factor(accidents$Accident.Date)
var=accidents$Accident.Date.
Mode <- function(num) {
  unique_num <- unique(num)
  unique_num [which.max(tabulate(match(num, unique_num )))]
}
Mode(var)



endpoint="https://data.seattle.gov/resource/pu5n-trf4.json"





compressedMap= "https://github.com/sunyiming2016/map1/blob/master/KingCountyTractsShapefiles%20copy.zip"
library(utils)
temp=tempfile()
download.file(compressedMap, temp)
unzip(temp)
(maps=list.files(pattern = 'shp'))
library(rgdal)
wazipMap <- rgdal::readOGR("SAEP_ZIP_Code_Tabulation_Areas.shp",stringsAsFactors=F)
names(wazipMap)
