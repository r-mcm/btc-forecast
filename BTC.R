my1 <- ts(data1, start=c(2017, 08, 17), end=c(2021, 2, 12), frequency = 365.25)
autoplot(my1) +
  ggtitle("BTC Price") +
  xlab("Date") +
  ylab("Price")
