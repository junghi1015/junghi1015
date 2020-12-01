library(shiny)
library(leaflet)
library(dplyr)
library(readr)
library(extrafont)
library(showtext)
library(tidyverse)
library(shinythemes)
library(ggmap)
library(ggplot2)
library(raster)
library(rgeos)
library(maptools)
library(rgdal)

View(P_merge)
write.csv(P_merge,'C:/Users/user/Desktop/R/8.11/Rshiny/project_rshiny/P_merge.csv')
#식료품 지도
P <- read.csv("engel.csv", header = TRUE) #시각화할 데이터셋
gu_name <- read.csv('gu_name.csv', header = TRUE)

map <- shapefile("TL_SCCO_SIG.shp") #지리 정보 데이터셋
map <- spTransform(map, CRSobj = CRS('+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs'))
new_map <- fortify(map, region = 'SIG_CD')

new_map$id <- as.numeric(new_map$id)
seoul_map <- new_map[new_map$id <= 11740,]
P_merge <- merge(seoul_map, P, by='id')
#P_merge$grocery <- as.numeric(P_merge$grocery)  

#ggplot() + geom_polygon(data = P_merge, aes(x=long, y=lat, group=group), fill = 'white', color='black')
#ggplot() + geom_polygon(data = P_merge, aes(x=long, y=lat, group=group, fill = grocery, color='white'))

#plot + scale_fill_gradient(low = "#ffe5e5", high = "#ff3232", space = "Lab", guide = "colourbar") + 
#  theme_bw() + labs(title = "서울시 구별 식료품 매장 수") + 
#  theme(panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank(), panel.grid.major.y = element_blank(), panel.grid.minor.y = element_blank(), plot.title = element_text(face = "bold", size = 18, hjust = 0.5)) +
#  geom_text(data = gu_name,
#            aes(x = long,
#                y = lat,
#                label = paste(location, grocery, sep = "\n")))




#식료품 매장 수
ggplot() + 
  geom_polygon(data = P_merge, 
               aes(x = long, 
                   y = lat, 
                   group = group, 
                   fill = grocery),
               color = "white")  +
  scale_fill_gradient(low = "#FBCF61",
                      high = "#00CC99",
                      space = "Lab",
                      guide = "colourbar") + 
  labs(fill = "구별 식료품 매장 수") +
  theme_void() +
  theme(legend.position = c(.18, .82)) +
  geom_text(data = gu_name,
            aes(x = long,
               y = lat,
               label = paste(location, grocery, sep = "\n")))


#문화공간
ggplot() + 
  geom_polygon(data = P_merge, 
               aes(x = long, 
                   y = lat, 
                   group = group, 
                   fill = leisure),
               color = "white")  +
  scale_fill_gradient(low = "antiquewhite2",
                      high = "cyan3",
                      space = "Lab",
                      guide = "colourbar") + 
  labs(fill = "구별 문화공간 수") +
  theme_void() +
  theme(legend.position = c(.18, .82)) +
  geom_text(data = gu_name,
            aes(x = long,
                y = lat,
                label = paste(location, leisure, sep = "\n")))


#행복지수
ggplot() + 
  geom_polygon(data = P_merge, 
               aes(x = long, 
                   y = lat, 
                   group = group, 
                   fill = rank_happy),
               color = "white")  +
  scale_fill_gradient(low = "Hot Pink 2",
                      high = "#FFDFD3",
                      space = "Lab",
                      guide = "colourbar") + 
  labs(fill = "구별 행복지수 순위") +
  theme_void() +
  theme(legend.position = c(.18, .82)) +
  geom_text(data = gu_name,
            aes(x = long,
                y = lat,
                label = paste(location, rank_happy, sep = "\n")))

runApp('ggplot최종')
