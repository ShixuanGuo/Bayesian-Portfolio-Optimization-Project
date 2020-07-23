# Bayesian Portfolio Optimization
## Part 1 Project Introduction  
1. **Description**  
    This project extracts 30 stocks' real time weekly price data from website and provides functions to optimize protfolios matching target return levels and analyze diversification effects.  
    Constructing the portfolio by applying MCMC simulation, SURE CAMP model and minimizing variance.  
2. **Data**  
    Totally 30 stocks and S&P 500 index. 4 years of weekly price data for each stock from June 1, 2015 to June 1, 2019.  
    You can check stock symbols at [Yahoo Finance Stock Tickers](https://investexcel.net/all-yahoo-finance-stock-tickers/).  
    In this project, I choose: "AAPL","BAC","AMZN","T","GOOG","MO","DAL","AA","AXP","DD","BABA","ABT","AMAT","AMGN","AAL","AIG","ALL","ADBE","GOOGL","ACN","ABBV","MT","LLY","AGN","APA","ADP","AKAM","NLY","ATVI","ADSK".  
3. **Approaches**  
    - Markov Chain Monte Carlo (MCMC) simulation
    - Seemingly Unrelated Regression CAPM model
    - Minimizing portfolio variance
4. **Packages**  
    - quantmod
    - cbw
    - xts
    - coda
    - bayesm
    - ggplot2  
    
Note: "cbw" is a package for the Bayesian analysis of several different regression models. You can install this package from [cbw rpackage](https://apps.olin.wustl.edu/faculty/chib/rpackages/cbw/).  
## Part 2 Get Started
1. **Import Stock Data**  
    First, download stock prices and S&P as benchmark using `getfinwdat`. Then, remove NULL values. 
    ```r
    data=getfinwdat(symbols=symbols, symnames=symnames, from=start_date, to=end_date)
    ```
2. **Construct the prior portfolio sample**    
    1) Set portfolio return  
    I set the desired portfolio mean return levels `portmean` as .03, .06, .09 and .12, each in annual terms, which are prior means of portfolio.  
    2) Set portfolio components
    I choose 5, 10, 15, 20, 25 and 30 stocks from downloaded stocks to construct portfolios in different sizes. The smaller set of assets should be a subset of the larger set. Each portfolio should contain a risk-free asset (S&P index in this project). 
    3) Train prior model  
    Assume the stock premium is explained by the Gaussian Seemingly Unrelated Regression (SURE) Capital Asset Pricing Model (CAPM) without an intercept. The SURE model is useful when we are interested in the joint behavior of two or more outcomes, like evaluating the portfolio consisting of several different assets.   
    For each size level, I construct portfolios matching prior mean return levels. Thus, I construct 6x4=24 prior portfolios in total.  
    ```r
    capmfrmls=list(prmapple~prmsp500-1,...)
    camportls = makebayesportfolioaftersureg(portmean = portmean, modelfrmls = capmfrmls, data = data)
    priorls = trainpriorsureg(modelfrmls = capmfrmls, data = data, trainpct = .15)
    ```  
    4) Error distribution assumption  
    In this project, I assume the error term is Gaussian distributed.  
    If it is student-t distributed, we can change 'g' to 't' ( for example: `makebayesportfolioaftersuret`). Then for each set of assets, use log-marginal likelihoods to find the appropriate-degrees of freedom of the student-t distribution on a grid of values.  
3. **Form optimal portfolio: MCMC**  
    1) Use the default training sample prior, simulate the posterior distribution using MCMC regression for each portfolio.  
    ```r
    thetamcapmsure = MCMCsureg(modelfrmls = capmfrmls, data = data)
    ```  
    Look at the simulated result (posterior mean and standard deviation, etc) by using `summarymcmc(thetamcapmsure, header = T)`  
    2) Compute the optimal portfolios   
    The return on the portfolio is the weighted sum of the individual stock returns while the portfolio variance is calculated using the standard deviation of each security in the portfolio and the correlation between securities in the portfolio.  
    We can get the optimal portfolio by minimizing the portfolio variance. A minimum variance portfolio indicates a well-diversified portfolio that consists of individually risky assets, which are hedged when traded together, resulting in the lowest possible risk for the rate of expected return. 
    Compute the optimal portfolios for each group of assets at each target portfolio return level:  
    ```r
    portmean_weights=cbind(camportls$weights,camportls$portsd)
    ```  
    The optimal portfolio consisting of 5 riksy assets is:  
    <img src="https://github.com/ShixuanGuo/Bayesian-Portfolio-Optimization-Project/blob/master/optimal%20portfolio.png" alt="optimal portfolio" width="591" height="190">  
4. **Diversification effects analysis**  
  Use ggplot to plot the standard deviation vs. the number of stocks in the assets.  
  <img src="https://github.com/ShixuanGuo/Bayesian-Portfolio-Optimization-Project/blob/master/diversification%20effect.png" alt="diversification effect" width="666" height="485">  
    
   The result shows: at each target return level, the more diversified the portfolio is, the lower variance the portfolio has. Thus, portfolio risk can be reduced by investing in a variety of assets.  
