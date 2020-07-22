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


