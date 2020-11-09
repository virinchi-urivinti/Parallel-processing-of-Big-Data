
library("twitteR")
library("ROAuth")
library("rtweet")

token <- create_token(
  app = "SrujanLab2",
  consumer_key = "4tuyWbJzVuvYcwQqkTROQK0iU",
  consumer_secret = "3dWx2bqSciAvhD2mKEz9WrsCtd4Yrehchupz5clmFUUJQd198i",
  access_token = "440028263-oswKjidBxExYeV2J3WfPgzq3bUl6OGpbwPljUC9U",
  access_secret = "s3VBzTsAEcBI4Js6fcUffSuzlXKL7gwXc5NtPM3d3nji2"
)
#load("twitter_authentication.Rdata")
setup_twitter_oauth("4tuyWbJzVuvYcwQqkTROQK0iU", "3dWx2bqSciAvhD2mKEz9WrsCtd4Yrehchupz5clmFUUJQd198i", "440028263-oswKjidBxExYeV2J3WfPgzq3bUl6OGpbwPljUC9U", "s3VBzTsAEcBI4Js6fcUffSuzlXKL7gwXc5NtPM3d3nji2")

rt <- search_tweets("#basketball OR basketball ",
                    language="en",n = 5000, geocode = lookup_coords("usa"),include_rts = FALSE)

rt1 <- search_tweets(" #baseball  OR baseball",
                    language="en",n = 5000, geocode = lookup_coords("usa"),include_rts = FALSE)

rt2 <- search_tweets("#soccer OR soccer",
                    language="en",n = 5000, geocode = lookup_coords("usa"),include_rts = FALSE)

rt3 <- search_tweets(" #golf OR golf ",
                    language="en",n = 5000, geocode = lookup_coords("usa"),include_rts = FALSE,retryonratelimit = TRUE)

rt4 <- search_tweets(" #tennis OR tennis",
                    language="en",n = 5000, geocode = lookup_coords("usa"),include_rts = FALSE,retryonratelimit = TRUE)

rt5 <- search_tweets(" #football OR football",
                    language="en",n = 5000, geocode = lookup_coords("usa"),include_rts = FALSE,retryonratelimit = TRUE)

basketball<-data.frame(rt)
basketball<-basketball[!duplicated(basketball),]#Removing duplicated tweets
basketball<-data.frame(basketball)#converting to dataframe

baseball<-data.frame(rt1)
baseball<-baseball[!duplicated(baseball),]#Removing duplicated tweets
baseball<-data.frame(baseball)#converting to dataframe

soccer<-data.frame(rt2)
soccer<-soccer[!duplicated(soccer),]#Removing duplicated tweets
soccer<-data.frame(soccer)#converting to dataframe

golf<-data.frame(rt3)
golf<-golf[!duplicated(golf),]#Removing duplicated tweets
golf<-data.frame(golf)#converting to dataframe

tennis<-data.frame(rt4)
tennis<-tennis[!duplicated(tennis),]#Removing duplicated tweets
tennis<-data.frame(tennis)#converting to dataframe

football<-data.frame(rt5)
football<-football[!duplicated(football),]#Removing duplicated tweets
football<-data.frame(football)#converting to dataframe

basketball$text = gsub("&amp", "", basketball$text)
basketball$text=  gsub("[^\x01-\x7F]", "", basketball$text)
basketball$text = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", basketball$text)
basketball$text = gsub("@\\w+", "", basketball$text)
basketball$text = gsub("[[:punct:]]", "", basketball$text)
basketball$text = gsub("[[:digit:]]", "", basketball$text)
basketball$text = gsub("http\\w+", "", basketball$text)
basketball$text = gsub("[ \t]{2,}", "", basketball$text)
basketball$text = gsub("^\\s+|\\s+$", "", basketball$text)
basketball$text=gsub("http[^[:space:]]*", "", basketball$text)
basketball$text=gsub("http[[:alnum:]]*", "", basketball$text)

baseball$text = gsub("&amp", "", baseball$text)
baseball$text=  gsub("[^\x01-\x7F]", "", baseball$text)
baseball$text = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", baseball$text)
baseball$text = gsub("@\\w+", "", baseball$text)
baseball$text = gsub("[[:punct:]]", "", baseball$text)
baseball$text = gsub("[[:digit:]]", "", baseball$text)
baseball$text = gsub("http\\w+", "", baseball$text)
baseball$text = gsub("[ \t]{2,}", "", baseball$text)
baseball$text = gsub("^\\s+|\\s+$", "",baseball$text)
baseball$text=gsub("http[^[:space:]]*", "", baseball$text)
baseball$text=gsub("http[[:alnum:]]*", "", baseball$text)

soccer$text = gsub("&amp", "", soccer$text)
soccer$text=  gsub("[^\x01-\x7F]", "", soccer$text)
soccer$text = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", soccer$text)
soccer$text = gsub("@\\w+", "", soccer$text)
soccer$text = gsub("[[:punct:]]", "", soccer$text)
soccer$text = gsub("[[:digit:]]", "", soccer$text)
soccer$text = gsub("http\\w+", "", soccer$text)
soccer$text = gsub("[ \t]{2,}", "", soccer$text)
soccer$text = gsub("^\\s+|\\s+$", "", soccer$text)
soccer$text=gsub("http[^[:space:]]*", "", soccer$text)
soccer$text=gsub("http[[:alnum:]]*", "", soccer$text)

golf$text = gsub("&amp", "", golf$text)
golf$text=  gsub("[^\x01-\x7F]", "", golf$text)
golf$text = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", golf$text)
golf$text = gsub("@\\w+", "", golf$text)
golf$text = gsub("[[:punct:]]", "", golf$text)
golf$text = gsub("[[:digit:]]", "", golf$text)
golf$text = gsub("http\\w+", "", golf$text)
golf$text = gsub("[ \t]{2,}", "", golf$text)
golf$text = gsub("^\\s+|\\s+$", "", golf$text)
golf$text=gsub("http[^[:space:]]*", "", golf$text)
golf$text=gsub("http[[:alnum:]]*", "", golf$text)

tennis$text = gsub("&amp", "", tennis$text)
tennis$text=  gsub("[^\x01-\x7F]", "", tennis$text)
tennis$text = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", tennis$text)
tennis$text = gsub("@\\w+", "", tennis$text)
tennis$text = gsub("[[:punct:]]", "", tennis$text)
tennis$text = gsub("[[:digit:]]", "", tennis$text)
tennis$text = gsub("http\\w+", "", tennis$text)
tennis$text = gsub("[ \t]{2,}", "", tennis$text)
tennis$text = gsub("^\\s+|\\s+$", "", tennis$text)
tennis$text=gsub("http[^[:space:]]*", "", tennis$text)
tennis$text=gsub("http[[:alnum:]]*", "", tennis$text)

football$text = gsub("&amp", "", football$text)
football$text=  gsub("[^\x01-\x7F]", "", football$text)
football$text = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", football$text)
football$text = gsub("@\\w+", "", football$text)
football$text = gsub("[[:punct:]]", "", football$text)
football$text = gsub("[[:digit:]]", "", football$text)
football$text = gsub("http\\w+", "", football$text)
football$text = gsub("[ \t]{2,}", "", football$text)
football$text = gsub("^\\s+|\\s+$", "", football$text)
football$text=gsub("http[^[:space:]]*", "", football$text)
football$text=gsub("http[[:alnum:]]*", "", football$text)

write.table(basketball$text, file = "twitter_basket.txt", sep = "\t",
            row.names = FALSE)

write.table(baseball$text, file = "twitter_baseball.txt", sep = "\t",
            row.names = FALSE)

write.table(soccer$text, file = "twitter_soccer.txt", sep = "\t",
            row.names = FALSE)

write.table(golf$text, file = "twitter_golf.txt", sep = "\t",
            row.names = FALSE)

write.table(tennis$text, file = "twitter_tennis.txt", sep = "\t",
            row.names = FALSE)

write.table(football$text, file = "twitter_football.txt", sep = "\t",
            row.names = FALSE)
