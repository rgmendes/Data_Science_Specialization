# Reading data from APIs
# install.packages("httr")

# Load libraries
library(httr)
library(RJSONIO)
library(jsonlite)

# Accessing Twitter from R
myapp = oauth_app("twitter", key="1qzf050hx4mKfXBsJmUshZys7",secret="BtfRoDztYaJ3E7Or3sPia5EQXH7ErQ9Yu0GFs6z1uMrHBKjnK0")
sig = sign_oauth1.0(myapp, token = "709291514-kSRN9tgbrq11SzcpzpfOfPbq7WMC2pVzIAHfpXsi", token_secret = "eT0YLayubZAAQlALbuwnNkxDlvaxUus4qdVIVj4nPj1nV")
homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json", sig)

# Converting the json object
json1 = content(homeTL)
json2 = jsonlite::fromJSON(toJSON(json1))
json2[1,1:4]

# Getting Tweets from user
myapp = oauth_app("twitter", key="1qzf050hx4mKfXBsJmUshZys7",secret="BtfRoDztYaJ3E7Or3sPia5EQXH7ErQ9Yu0GFs6z1uMrHBKjnK0")
sig = sign_oauth1.0(myapp, token = "709291514-kSRN9tgbrq11SzcpzpfOfPbq7WMC2pVzIAHfpXsi", token_secret = "eT0YLayubZAAQlALbuwnNkxDlvaxUus4qdVIVj4nPj1nV")
search_tw = GET("https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=_rgmendes&count=10", sig)

json3 = content(search_tw)
json4 = jsonlite::fromJSON(toJSON(json3))
json4$text
