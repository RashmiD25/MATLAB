clc;
clear all;
close all;

T = [100,1000,10000];
% Normal Distribution
figure(1);
for i = 1:length(T)
    Xi=normrnd(2,2,T(i));
    M1=mean(Xi);
    subplot(2,2,i);
    Xi=sum(Xi);
    Yi=(1/T(i))*Xi;
    plot1=histogram(Yi);
    title("Normal Distribution for T="+T(i));
    xlabel("RV Y");
    ylabel("Probability Density Function f(y)");
end

% Uniform Distribution
figure(2);
for i = 1:length(T)
    Ui=unifrnd(2,4,T(i));
    subplot(2,2,i);
    Ui=(1/T(i))*sum(Ui);
    plot2=histogram(Ui);
    title("Uniform Distribution for T="+T(i))
    xlabel("RV Y");
    ylabel("Probability Density Function f(y)");
end 

%Exponential Distribution
figure(3);
for i = 1:length(T)
    Ei=exprnd((1/2),T(i));
    subplot(2,2,i);
    Ei=(1/T(i))*sum(Ei);
    plot3=histogram(Ei);
    title("Exponential Distribution for T="+T(i))
    xlabel("RV Y");
    ylabel("Probability Density Function f(y)");
end
