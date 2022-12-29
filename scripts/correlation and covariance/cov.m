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
