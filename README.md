# Bayesian Portfolio Optimization
## Part 1 Project Introduction  
1. **Description**  
    This project extracts 30 stocks' real time weekly price data from website and provides functions to optimize protfolios matching target return levels and analyze diversification effects.  
    Constructing the portfolio by applying MCMC simulation, maximizing Sharpe ratio and minimizing variance.  
2. **Data**  
    Totally 30 stocks and S&P 500 index. 4 years of weekly price data for each stock from June 1, 2015 to June 1, 2019.  
    You can check stock symbols at [Yahoo Finance Stock Tickers](https://investexcel.net/all-yahoo-finance-stock-tickers/).  
    In this project, I choose: "AAPL","BAC","AMZN","T","GOOG","MO","DAL","AA","AXP","DD","BABA","ABT","AMAT","AMGN","AAL","AIG","ALL","ADBE","GOOGL","ACN","ABBV","MT","LLY","AGN","APA","ADP","AKAM","NLY","ATVI","ADSK".  
3. **Approaches**  
    - Markov Chain Monte Carlo (MCMC) simulation
    - Seemingly Unrelated Regression CAPM model
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
    3) Set prior training model  
    Assume the stock premium is explained by the Gaussian Seemingly Unrelated Regression (SURE) Capital Asset Pricing Model (CAPM) without an intercept.  
    For each size level, I construct portfolios matching prior mean return levels. Thus, I construct 6x4=24 portfolios in total.  
    ```r
    capmfrmls=list(prmapple~prmsp500-1,...)
    camportls = makebayesportfolioaftersureg(portmean = portmean,
                                         modelfrmls = capmfrmls,
                                         data = data)
    priorls = trainpriorsureg(modelfrmls = capmfrmls,
                          data = data,
                          trainpct = .15)
    ```
    3) Use 
