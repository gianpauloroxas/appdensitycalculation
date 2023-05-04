#province
population = read.csv("population.csv", stringsAsFactors = FALSE)
regionarea = read.csv("regionarea.csv", stringsAsFactors = FALSE)

data = merge(population, regionarea, by=c("Region"), all.x = TRUE)

brgytotal = aggregate(data$Barangay, list(data$Region), FUN=length)

newmerge = merge(data, brgytotal, by.x = "Region", by.y = "Group.1", all.x = TRUE)

newmerge$brgyarea = newmerge$Area /newmerge$x

newmerge$brgydensity = newmerge$Population / newmerge$brgyarea

newmerge = newmerge[order(newmerge$brgydensity, decreasing = TRUE),] 

result = head(newmerge, 5)

write.csv(result, "C:/Users/10017907/Downloads/city.csv",row.names = TRUE )
