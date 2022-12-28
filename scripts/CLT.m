clc
// %This script illustrates the Central Limit theorem which states that
// %the sample average of N IID random variables approaches the normal %distribution.
N=10000; %Number of samples
Nb_bins=30; %number of bins for the histogram computation %Distribution parameters

// %input from the user 'exp','unif' or 'chi2'
  
prompt = "Enter the type of RV : exp, unif or chi2: ";
type =input(prompt,"s");
parameter1=1;
parameter2=2;
x=zeros(1,N); %initializing x
user_interface='';
no_of_variables=0;

while strcmp(user_interface,'q')==0
  switch type 
  case 'exp'
    random_vector=random('exp',parameter1,1,N); 
    original_distribution_mean=(1/parameter1); 
    original_distribution_var=1/(parameter1^2); 
    distrib_name='exponential';
  case 'unif' 
    random_vector=random('unif',parameter1,parameter2,1,N); 
    original_distribution_mean=0.5*(parameter2+parameter1); 
    original_distribution_var=(1/12)*(parameter2-parameter1)^2; 
    distrib_name='uniform';
  case 'chi2'
    random_vector=random('chi2',parameter1,1,N); 
    original_distribution_mean=parameter1; 
    original_distribution_var=2*parameter1; 
    distrib_name='chi2';
  end
  x=x+random_vector;
//   %Value of z=(x1+...+xn)/n
  no_of_variables=no_of_variables+1; z=x/no_of_variables;
//   %Histogram of z
  [n,axis_x]=hist(z,Nb_bins);
  deltaX=axis_x(2)-axis_x(1); 
  pdf_estimate=n/(N*deltaX);
//   %evaluating PDF kurtosis_estimate=(mean((z-mean(z)).^4)./(var(z).^2))-3; 
//   %kurtosis=0 for gaussian distribution
//   %Gaussian pdf
  mean_estimate=original_distribution_mean; 
  var_estimate=original_distribution_var/no_of_variables; 
  [pdf_gaussian]=pdf('norm',axis_x,mean_estimate,sqrt(var_estimate));
//   %Display the two pdf
  plot(axis_x,pdf_estimate); 
  hold on; 
  plot(axis_x,pdf_gaussian); 
  hold off;
  ylim([0 max([pdf_estimate pdf_gaussian])+1]);
  legend(sprintf('Sum of %d i.i.d variables z=(x1+...xn)/n',no_of_variables),'Gaussian pdf'); 
  xlabel('random variable: z');
  ylabel('Probability density function fZ(z)');
  title(sprintf('Illustration of the Central Limit Theorem (%s distribution)',distrib_name));
  fprintf('-> Sum of %d %s i.i.d variables: kurtosis=%f\n',no_of_variables,distrib_name,kurtosis_estimate);
  user_interface=input('Press q key to quit ?','s'); 
end
