T = [100, 1000, 10000];
for i = 1:length(T)  
rv=exprnd((1/2),[1 T(i)]);
    avg=mean(rv);
    X3=expRejection(T(i));
    figure(i)
    subplot(2,1,1)
    hist3=histogram(rv);
    grid on;
    title("Exponential Distribution with parameter=2 using MATLAB routine")
    xlabel(T(i) + " Samples of Xi");
    ylabel('Frequency of Xi');
    subplot(2,1,2)
    X3=histogram(X3);
    grid on;
    title("Exponential Distribution with parameter=2 using Rejection Method");
    xlabel(T(i) + " Samples of Xi");
    ylabel('Frequency of Xi');
end
function X = expRejection(T)
    X = zeros(T,0);
    lambda = 2;
    for i = 1:T
        accept = false;
        while (accept == false)
            q = 5*rand();
            p = rand();
            if lambda*p <= 2*exp(-2*q)
               accept = true;
               X(i) = q;
            end
        end
    end
end
