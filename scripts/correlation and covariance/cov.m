[L,p]= chol(Cov_xy); %cholesky factorization

n=500;
R=randn(2,n); %1000 space generator
X=L'*R;
X_s=(cov(X')); %Covariance Matrix of 1000 space vector
X_s1=round(X_s,4);
fprintf('Cov(Xs):\n');
disp(X_s1);

// 	Result:

// Cov(Xs):
// [ 0.0797, -0.0103]
// [-0.0103,   0.077]


% Note:
% In order to improve the estimate of Cov(Xs), we need to increase the sample vectors i.e. we need to take samples more than 10000 since we have observed previously that as the sample size increases, the approximation improves following the Law of Large Numbers.
