
# an intro to quantifying air quality in Utah using R

download.file("http://aqsdr1.epa.gov/aqsweb/aqstmp/airdata/daily_88101_2013.zip",
              destfile="daily.zip")

unzip("daily.zip")

d = read.csv("daily_88101_2013.csv")

names(d)

d = d[d$State.Name == "Utah",]

head(d)

d$Date.Local = as.Date(d$Date.Local)

summary(d)

plot( factor(d$City.Name), d$Arithmetic.Mean )

unique(d$City.Name)

with( d[d$City.Name =="Salt Lake City",],
      plot(Date.Local, Arithmetic.Mean, main ="Salt Lake City PM2.5")
      )
