rm(list = ls()) #removing all variables


netflix = read.csv("/Users/Davidaarhus/Documents/392_python/finalNetData.csv")

TVandMovie = read.csv("/Users/Davidaarhus/Documents/310 R/Datasets/netflix_titles.csv")

summary(TVandMovie)

TVandMovie$typeMovie<- ifelse(TVandMovie$type=="Movie" ,1, 0)
# getwd()

# netflix$Score_group <- ifelse(netflix$weighted_average_vote < 3, "Bad",
#                   ifelse(netflix$weighted_average_vote < 5.5, "Ok",
#                   ifelse(netflix$weighted_average_vote < 7, "Good", "Great")))



#                   ifelse(netflix$rating== 'TV-PG', "Kid",
#                   ifelse(netflix$rating== 'NC-17', "Teen",
#                   ifelse(netflix$rating== 'PG-13', "Teen",
#                   ifelse(netflix$rating== 'TV-14', "Teen",
#                   ifelse(netflix$rating== 'TV-Y', "Kid",
#                   ifelse(netflix$rating== 'TV-Y7', "Kid",
#                   ifelse(netflix$rating== 'TV-Y7-FV', "Kid",
#                   ifelse(netflix$rating== 'UR', "Adult",
#                   ifelse(netflix$rating== 'NR', "Adult",
#                   ifelse(netflix$rating== 'R', "Adult", "Adult")))))))))))))
# 

summary(netflix)


summary.netflix <- aggregate(netflix$weighted_average_vote,
                            by=list(netflix$release_year), FUN=function(x) c(mean(x)))
summary.netflix <- do.call(data.frame,summary.netflix)
colnames(summary.netflix) <- c("Score Rating", "Mean")

summary.netflix




# write.csv(summary.netflix, file = "/Users/Davidaarhus/Documents/392_python/ScoreRating_mean_votes.csv", row.names=FALSE)
write.csv(TVandMovie, file = "/Users/Davidaarhus/Documents/310 R/Datasets/netflix_titles.csv", row.names=FALSE)
