---
title: Hierarchical Logistic Regression
author: Flynn
date: '2018-10-24'
slug: hierarchical-logistic-regression
categories: []
tags:
  - stan
  - logistic regression
header:
  caption: ''
  image: ''
---

This one is just a snippet. I was reading through the Stan manual (version 2.17.0), and it has some nice examples of Stan models in chapter III, however, only the Stan model code is given for these. I decided to make a data simulation to try one out, specifically, the model in section 9.9: Hierarchical Logistic Regression.

The Stan  code from the manual looks like this (after substituting the suggested improvements on pages 140-141). 

```cpp
data {
int<lower=1> D;
int<lower=0> N;
int<lower=1> L;
int<lower=0,upper=1> y[N];
int<lower=1,upper=L> ll[N];
row_vector[D] x[N];
}
parameters {
real mu[D];
real<lower=0> sigma[D];
vector[D] beta[L];
}
model {
mu ~ normal(0, 100);
for (l in 1:L)
  beta[l] ~ normal(mu, sigma);

for (n in 1:N)
  y[n] ~ bernoulli_logit(x[n] * beta[ll[n]]);
}
```
I came up with the following R code to simulate some example data. I have annotated what each variable represents. To make it interesting, the widths of the population distributions from which the coefficients in beta have been drawn range from narrow to wide.

```r
set.seed(42)
#number of predictors
D <- 10
#number of observations
N <- 10000
#matrix of predictors for each observation
x <- matrix(rnorm(N*D,0,1), nrow = N, ncol = D)
#number of categorical levels
L <- 15
#Vector indicating level membership for each observation
ll <- sample(seq(1,L), N, replace = TRUE)
#centre of distribution for each predictor, from which individual predictors are drawn for each level
mu <- rnorm(D, 0, 1)
#the sigma values progressively increase for each predictor in D.
sigma <- seq(0.2,2,length.out = D)
#Matrix of coefficients for each predictor in each level.
beta <- matrix(NA, nrow = L, ncol = D)
for (l in seq(1:L)){
  for (d in seq(1:D)){
    beta[l,d] <- rnorm(1, mu[d], sigma[d])
  }
}
#vector of observations, in linear scale, prior to noise being added.
ypred_linear <- rep(NA, N)
for (n in seq(1:N)){
  ypred_linear[n] <- x[n,] %*% beta[ll[n],]
}
#Observations in logistic scale
invlogit <- function(x){exp(x)/(1+exp(x))}
ypred <- invlogit(ypred_linear)
#Bernoulli trial outcomes
y <- rbinom(N, 1, ypred)
```

The model is run by executing the following code. It is interesting to play around with the number of iterations. For a relatively simple regression model like this, a huge number of iterations is not necessary. It is also interesting to play around with the number of predictors D, levels L and observations N.

```r
library("rstan")

fit <- stan("hierarchical_logistic.stan", 
            data = list(D = D, N = N, x = x, L = L, y = y, ll = ll),
            chains = 4, 
            cores = 4, 
            iter = 1000, 
            warmup = 200, 
            control = list(adapt_delta = 0.99))

```

As the widths of the underlying distributions from which the coefficients beta were drawn increase (sequentially, from first to last), so to does the uncertainty surrounding the estimated centre positions mu, and the widths themselves, sigma.

Here are the estimated centre positions of these underlying distributions.
```r
plot(fit, pars = "mu")
```
 
![Mu plot](/img/mu_plot.png)


And here are the estimates of the corresponding widths.

```r
plot(fit, pars = "sigma")
```

![Sigma plot](/img/sigma_plot.png)

Because there are D * L = 150 indivudal coefficients in beta, I won't plot them all. Here, I will plot the estimates across all levels for the first and last coefficients. To do this, I will use Bayesplot.

```r
library(bayesplot)

posterior  <- as.array(fit)

mcmc_intervals(posterior, pars = paste0("beta[", seq(1:L), ",1]"))

```
![Beta 1 plot](/img/beta1plot.png)


```r
mcmc_intervals(posterior, pars = paste0("beta[", seq(1:L), ",", D, "]"))
```

![Beta 10 plot](/img/beta10plot.png)

Note the wider distribution of beta[,10] coefficients.
