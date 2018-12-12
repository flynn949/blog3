data {
  int<lower=0> N;
  vector[N] x;
}
transformed data {
  vector[N] x_std;
  x_std = (x - mean(x))/sd(x);
}
parameters {
  ordered[2] mu_std;
  vector<lower=0>[2] sd_std;
  real<lower=0,upper=1> lambda;
}
model {
  mu_std ~ normal(0,2);
  sd_std ~ cauchy(0,5);
  lambda ~ beta(5,5);
  for (n in 1:N){
    target += log_mix(lambda,
    normal_lpdf(x_std[n] | mu_std[1], sd_std[1]),
    normal_lpdf(x_std[n] | mu_std[2], sd_std[2]));
  }
}
generated quantities {
  vector[2] mu;
  vector[2] std;
  mu = (sd(x)  * mu_std) + mean(x);
  std = sd(x)*sd_std;
  
}
