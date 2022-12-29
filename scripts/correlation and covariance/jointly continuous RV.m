clc;
clear;
close all;

syms x y;
f_xy = @(x,y)x+(3/2)*y.^2; % Given joint pdf of X and Y
f_x=(int(f_xy,y,[0,1])); %Marginal pdf X
f_y=(int(f_xy,x,[0,1])); %Marginal pdf Y

E_x=(int(x*f_x,x,[0,1])); %Expectation of X
E_y=(int(y*f_y,y,[0,1])); %Expectation of Y

E_x2=(int(x^2*f_x,x,[0,1])); % 2nd order Moment of X
E_y2=(int(y^2*f_y,y,[0,1])); % 2nd order Moment of Y

Varx=(E_x2-(E_x^2)); %Variance of X
Vary=(E_y2-(E_y^2)); %Variance of Y

f1=@(x,y) x.^2.*y+(3/2)*y.^3.*x; 
E_xy=(integral2(f1,0,1,0,1));
covxy=((E_xy-(E_x*E_y))); %Covariance Coefficient

Cov_xy=([Varx covxy; covxy Vary]);
Cov_xy1=round(Cov_xy,4);
fprintf('Cov(U):\n');
disp(Cov_xy1);
Correlation=[E_x2 E_xy; E_xy E_y2];
Correlation1=round(Correlation,4);
fprintf('Cor(U):\n');
disp(Correlation1);

// Result:
// Cov(U):
// [ 0.0764, -0.0104]
// [-0.0104,   0.076]

// Cor(U):
// [0.4167, 0.3542]
// [0.3542, 0.4667]
