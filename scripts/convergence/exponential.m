function [T, count1,count2, error, count3] = convergence_expo()
clc
clear all
close all

%% Exponential Distribution
M = 500;
N = 2000;
T = zeros(M,N);

%% Generation of M Realisations
for i = 1: M
expo_transform = exprnd(1,N);
T(i,1:1:N) = tranform(expo_transform);
-
end

%% Convergence in Probability
count1 = zeros(1,length(T));
e = 0.05;
for n = 1:1: N
c = 0;
    for m = 1 : 1 : M
        if ((T(m,n)-1) > e) 
        c = c + 1;
        elseif ((T(m,n)-1) < (-1*e))
        c = c + 1;
        end
    end 
count1(1,n)= c/M;
end


%% Almost Sure Convergence 
K = 0.5;
count2 = zeros(1,(K*N));
for n2 = 1:1: (K*N)
c = 0;   
    for m = 1 : 1 : M
        for n1 = n2 : 1 : N
            if ((T(m,n1)-1) > e) 
            c = c + 1;
            break;
            elseif ((T(m,n1)- 1) < (-1*e))
            c = c + 1;
            break;
            end
        end
    end  
count2(1,n2)= c/M;
end


%% Mean Square Convergence 

e = (T-1).^2;
error = sum(e)/M;

%% Convergence in Distribution
d = 0:0.00001:2;
count3 = zeros(1,length(d));
n = N;
for t = 1 : 1 : length(d)
c1 = 0;
    for m1 = 1 : 1 : M
        if (T(m1,n)) <= d(t)
        c1 = c1 + 1;
        end
    end
count3(1,t) = c1/M;
end

end
