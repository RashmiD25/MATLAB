T = [100, 1000, 10000];
for i = 1:length(T)    
    rv=unifrnd(2,4,[1 T(i)]);
    avg=mean(rv);
    X1=unifrmRejection(T(i));
    figure(i)
    subplot(2,1,1)
    hist1=histogram(rv);
    grid on;
    title("Uniform Distribution on [2,4] using MATLAB routine")
    xlabel(T(i) + " Samples of Xi");
    ylabel('Frequency of Xi');
    subplot(2,1,2)
    X1=histogram(X1);
    grid on;
    title("Uniform Distribution on [2,4] using Rejection Method");
    xlabel(T(i) + " Samples of Xi");
    ylabel('Frequency of Xi');
end

function R = unifrmRejection(T)
    R = zeros(T,0); 
    n = 1;      %for uniform distribution amplitude is one
    for i = 1:T
        accept = false;
        while (accept == false)
            q = 2+2*rand();
            p = rand();
            if n*p <= 0.5
               accept = true;
               R(i) = q;
            end
        end
    end
end
