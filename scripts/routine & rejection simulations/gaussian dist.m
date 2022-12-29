T = [100, 1000, 10000];
for i = 1:length(T)  
    		rv=normrnd(2,sqrt(2),[T(i),1]);
    		avg=mean(rv);
    		X2=normalRejection(T(i));
    		figure(i)
   		subplot(2,1,1)
    		hist2=histogram(rv);
    		grid on;
    		title("Normal Distribution[mean=2, var=2] using MATLAB routine")
    		xlabel(T(i) + " Samples of Xi");
    		ylabel('Frequency of Xi');
    		subplot(2,1,2)
    		X2=histogram(X2);
    		grid on;
    		title("Normal Distribution[mean=2, var=2] using Rejection Method");
    		xlabel(T(i) + " Samples of Xi");
    		ylabel('Frequency of Xi');
end

function R = normalRejection(T)
    R = zeros(1,T);
    fn=@(x)exp(-((x-2).^2)/2)*(1/(2*sqrt(pi)));
    pdf=1/(2*sqrt(pi))*exp(-1/2);
    for i = 1:T
        accept = false
        while (accept == false)
            q = 2+2*randn();
            p = randn();
            if pdf*p <= fn(q)
               accept = true;
               R(i) = q;
            end
        end
    end
end
