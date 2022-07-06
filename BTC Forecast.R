my1 <- ts(data1, start=c(2017, 08, 17), end=c(2021, 2, 12), frequency = 365.25)
autoplot(my1) +
  autolayer(meanf(my1, h=40),
            series="Mean", PI=FALSE) +
  autolayer(rwf(my1, h=40),
            series="Naïve", PI=FALSE) +
  autolayer(rwf(my1, drift=TRUE, h=40),
            series="Drift", PI=FALSE) +
  ggtitle("BTC Daily Closing Price") +
  xlab("Date") + ylab("Closing Price (US$)") +
  guides(colour=guide_legend(title="Forecast"))

fc <- rwf(my1, drift=TRUE, lambda=0, h=50, level=80)
fc2 <- rwf(my1, drift=TRUE, lambda=0, h=50, level=80,
           biasadj=TRUE)
autoplot(my1) +
  autolayer(fc, series="Simple back transformation") +
  autolayer(fc2, series="Bias adjusted", PI=FALSE) +
  guides(colour=guide_legend(title="Forecast"))

res <- residuals(naive(my1))
autoplot(res) + xlab("Date") + ylab("") +
  ggtitle("Residuals from naïve method")
gghistogram(res) + ggtitle("Histogram of residuals")
ggAcf(res) + ggtitle("ACF of residuals")