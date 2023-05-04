#city
population = read.csv("population.csv", stringsAsFactors = FALSE)
regionarea = read.csv("regionarea.csv", stringsAsFactors = FALSE)

data = merge(population, regionarea, by=c("Region"), all.x = TRUE)

data = data[!duplicated(data$CityProvince), ]

citytotal = aggregate(data$CityProvince, list(data$Region), FUN=length)

newcitytotal= merge(data, citytotal, by.x = "Region", by.y = "Group.1", all.x = TRUE)

newcitytotal$cityarea = newcitytotal$Area / newcitytotal$x

citypopulation = aggregate(newcitytotal$Population, list(newcitytotal$CityProvince), FUN = sum)

mergepopulation = merge(newcitytotal, citypopulation, by.x = "CityProvince", by.y = "Group.1", all.x = TRUE)

mergepopulation$citydensity = mergepopulation$x.y / mergepopulation$cityarea

mergepopulation = mergepopulation[order(mergepopulation$citydensity, decreasing = TRUE),] 

head(mergepopulation, 5)

##

#city
population = read.csv("population.csv", stringsAsFactors = FALSE)
regionarea = read.csv("regionarea.csv", stringsAsFactors = FALSE)

data = merge(population, regionarea, by=c("Region"), all = TRUE)

citypopulation = aggregate(data$Population, list(data$CityProvince), FUN = sum)

merge = merge(data, citypopulation, by.x = "CityProvince", by.y = "Group.1", all.x = TRUE)

merge1 = merge[!duplicated(merge$CityProvince), ]

citytotal = aggregate(merge1$CityProvince, list(merge1$Region), FUN=length)

newcitytotal= merge(merge1, citytotal, by.x = "Region", by.y = "Group.1", all.x = TRUE)

newcitytotal$cityarea = newcitytotal$Area / newcitytotal$x.y

newcitytotal$citydensity = newcitytotal$x.x / newcitytotal$cityarea

newcity = newcitytotal[order(newcitytotal$citydensity, decreasing = TRUE),] 

result2 = head(newcity, 5)

write.csv(result2, "C:/Users/10017907/Downloads/city.csv",row.names = TRUE )

