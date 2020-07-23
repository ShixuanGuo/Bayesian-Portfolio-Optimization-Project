#1. Download Pakcages
library(quantmod)
library(xts)
library(coda)
library(bayesm)
library(cbw)
library(ggplot2)
#2. Import Stock Data
data = getfinwdat(symbols=c("AAPL","BAC","AMZN","T","GOOG","MO","DAL","AA",
                            "AXP","DD","BABA","ABT","AMAT","AMGN","AAL",
                            "AIG","ALL","ADBE","GOOGL","ACN","ABBV","MT","LLY",
                            "AGN","APA","ADP","AKAM","NLY","ATVI","ADSK","^gspc"),
                  symnames = c("apple","BAC","AMZN","T","GOOG","MO","DAL","AA","AXP","DD","BABA","ABT",
                               "AMAT","AMGN","AAL",
                               "AIG","ALL","ADBE","GOOGL","ACN","ABBV","MT","LLY",
                               "AGN","APA","ADP","AKAM","NLY","ATVI","ADSK","sp500"),
                  from = "2015-6-01", to = "2019-6-01")
data = na.omit(data)
#3. Construct the prior portfolio sample
portmean = seq(.03,.12,by=0.03)/52
# portfolio 1
capmfrmls = list(prmapple~prmsp500-1,
                 prmBAC~prmsp500-1,
                 prmAMZN~prmsp500-1,
                 prmT~prmsp500-1,
                 prmGOOG~prmsp500-1)

camportls = makebayesportfolioaftersureg(portmean = portmean,
                                         modelfrmls = capmfrmls,
                                         data = data)
# portfolio 2
capmfrmls2 = list(prmapple~prmsp500-1,
                  prmBAC~prmsp500-1,
                  prmAMZN~prmsp500-1,
                  prmT~prmsp500-1,
                  prmGOOG~prmsp500-1,
                  prmMO~prmsp500-1,
                  prmDAL~prmsp500-1,
                  prmAA~prmsp500-1,
                  prmAXP~prmsp500-1,
                  prmDD~prmsp500-1)

camportls2 = makebayesportfolioaftersureg(portmean = portmean,
                                          modelfrmls = capmfrmls2,
                                          data = data)
# portfolio 3
capmfrmls3 = list(prmapple~prmsp500-1,
                  prmBAC~prmsp500-1,
                  prmAMZN~prmsp500-1,
                  prmT~prmsp500-1,
                  prmGOOG~prmsp500-1,
                  prmMO~prmsp500-1,
                  prmDAL~prmsp500-1,
                  prmAA~prmsp500-1,
                  prmAXP~prmsp500-1,
                  prmDD~prmsp500-1,
                  prmBABA~prmsp500-1,
                  prmABT~prmsp500-1,
                  prmAMAT~prmsp500-1,
                  prmAMGN~prmsp500-1,
                  prmAAL~prmsp500-1)

camportls3 = makebayesportfolioaftersureg(portmean = portmean,
                                          modelfrmls = capmfrmls3,
                                          data = data)

# portfolio 4
capmfrmls4 = list(prmapple~prmsp500-1,
                  prmBAC~prmsp500-1,
                  prmAMZN~prmsp500-1,
                  prmT~prmsp500-1,
                  prmGOOG~prmsp500-1,
                  prmMO~prmsp500-1,
                  prmDAL~prmsp500-1,
                  prmAA~prmsp500-1,
                  prmAXP~prmsp500-1,
                  prmDD~prmsp500-1,
                  prmBABA~prmsp500-1,
                  prmABT~prmsp500-1,
                  prmAMAT~prmsp500-1,
                  prmAMGN~prmsp500-1,
                  prmAAL~prmsp500-1,
                  prmAIG~prmsp500-1,
                  prmALL~prmsp500-1,
                  prmADBE~prmsp500-1,
                  prmGOOGL~prmsp500-1,
                  prmACN~prmsp500-1)

camportls4 = makebayesportfolioaftersureg(portmean = portmean,
                                          modelfrmls = capmfrmls4,
                                          data = data)

# portfolio 5
capmfrmls5 = list(prmapple~prmsp500-1,
                  prmBAC~prmsp500-1,
                  prmAMZN~prmsp500-1,
                  prmT~prmsp500-1,
                  prmGOOG~prmsp500-1,
                  prmMO~prmsp500-1,
                  prmDAL~prmsp500-1,
                  prmAA~prmsp500-1,
                  prmAXP~prmsp500-1,
                  prmDD~prmsp500-1,
                  prmBABA~prmsp500-1,
                  prmABT~prmsp500-1,
                  prmAMAT~prmsp500-1,
                  prmAMGN~prmsp500-1,
                  prmAAL~prmsp500-1,
                  prmAIG~prmsp500-1,
                  prmALL~prmsp500-1,
                  prmADBE~prmsp500-1,
                  prmGOOGL~prmsp500-1,
                  prmACN~prmsp500-1,
                  prmABBV~prmsp500-1,
                  prmMT~prmsp500-1,
                  prmLLY~prmsp500-1,
                  prmAGN~prmsp500-1,
                  prmAPA~prmsp500-1)

camportls5 = makebayesportfolioaftersureg(portmean = portmean,
                                          modelfrmls = capmfrmls5,
                                          data = data)

# portfolio 6
capmfrmls6 = list(prmapple~prmsp500-1,
                  prmBAC~prmsp500-1,
                  prmAMZN~prmsp500-1,
                  prmT~prmsp500-1,
                  prmGOOG~prmsp500-1,
                  prmMO~prmsp500-1,
                  prmDAL~prmsp500-1,
                  prmAA~prmsp500-1,
                  prmAXP~prmsp500-1,
                  prmDD~prmsp500-1,
                  prmBABA~prmsp500-1,
                  prmABT~prmsp500-1,
                  prmAMAT~prmsp500-1,
                  prmAMGN~prmsp500-1,
                  prmAAL~prmsp500-1,
                  prmAIG~prmsp500-1,
                  prmALL~prmsp500-1,
                  prmADBE~prmsp500-1,
                  prmGOOGL~prmsp500-1,
                  prmACN~prmsp500-1,
                  prmABBV~prmsp500-1,
                  prmMT~prmsp500-1,
                  prmLLY~prmsp500-1,
                  prmAGN~prmsp500-1,
                  prmAPA~prmsp500-1,
                  prmADP~prmsp500-1,
                  prmAKAM~prmsp500-1,
                  prmNLY~prmsp500-1,
                  prmATVI~prmsp500-1,
                  prmADSK~prmsp500-1)

camportls6 = makebayesportfolioaftersureg(portmean = portmean,
                                          modelfrmls = capmfrmls6,
                                          data = data)

# Train prior model
priorls = trainpriorsureg(modelfrmls = capmfrmls,
                          data = data,
                          trainpct = .15)

priorls2 = trainpriorsureg(modelfrmls = capmfrmls2,
                           data = data,
                           trainpct = .15)

priorls3 = trainpriorsureg(modelfrmls = capmfrmls3,
                           data = data,
                           trainpct = .15)


priorls4 = trainpriorsureg(modelfrmls = capmfrmls4,
                           data = data,
                           trainpct = .15)

priorls5 = trainpriorsureg(modelfrmls = capmfrmls5,
                           data = data,
                           trainpct = .15)

priorls6 = trainpriorsureg(modelfrmls = capmfrmls6,
                           data = data,
                           trainpct = .15)

# Simulate the portfolio using MCMC SURE Gassuin model
thetamcapmsure = MCMCsureg(modelfrmls = capmfrmls,
                           data = data)
thetamcapmsure2 = MCMCsureg(modelfrmls = capmfrmls2,
                            data = data)
thetamcapmsure3 = MCMCsureg(modelfrmls = capmfrmls3,
                           data = data)
thetamcapmsure4 = MCMCsureg(modelfrmls = capmfrmls4,
                            data = data)
thetamcapmsure5 = MCMCsureg(modelfrmls = capmfrmls5,
                           data = data)
thetamcapmsure6 = MCMCsureg(modelfrmls = capmfrmls6,
                            data = data)
# look at the simulation summary
summarymcmc(thetamcapmsure, header = T)

# 3. Form the optimal portfolio
# the optimal portfolio for each group of assets at each target portfolio return level.
portmean_weights=cbind(camportls$portsd,camportls$weights)
portmean_weights2=cbind(camportls2$portsd,camportls2$weights)
portmean_weights3=cbind(camportls3$portsd,camportls3$weights)
portmean_weights4=cbind(camportls4$portsd,camportls4$weights)
portmean_weights5=cbind(camportls5$portsd,camportls5$weights)
portmean_weights6=cbind(camportls6$portsd,camportls6$weights)

# 4. Student-t assumption
# portfolio 1
capmfrmls1=capmfrmls
nug = seq(from = 3.0, to = 5.0, by=0.2)
nug = as.matrix(nug)
if (!require(future.apply)) { install.packages("future.apply",dependencies = TRUE)
} 
library(future.apply)
outls=future_mapply("MCMCregresst", 
                    modelfrm =  capmfrmls1,
                    nu = nug, 
                    MoreArgs = list(data = data), 
                    SIMPLIFY = FALSE)
A = cbind(nug,t(logmarglik(outls)))
ind1=which.max(A[,2])
bestnu1=A[ind1]
bestlike1=max(A[,2])
independr1=cbind(bestnu1,bestlike1)
print(independr1)
thetamcapmsuret1 = MCMCsuret(modelfrmls = capmfrmls1,
                             data = data,
                             nu=bestnu1)
#summarymcmc(thetamcapmsuret, header = T)
capmporttls1 = makebayesportfolioaftersuret(portmean = portmean,
                                            modelfrmls = capmfrmls1,
                                            data = data,
                                            nu=bestnu1)
portmean_weights_t1=cbind(capmporttls1$portsd,capmporttls1$weights)