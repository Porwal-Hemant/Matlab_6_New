
% Hemant Porwal 
% 2201092 

% consider a sample s(t) given by s(t) = max( 0 , 2cos( pi t )  

t  = 0 : 0.001 : 3 ;  

% plotting of the cos signal 
y = 2*cos( pi * t ) ;  

figure ; 

title("simple cos signal ") ; 
plot(y) ;  

%  clear explaination of signal y 

% s(t) = max( 0 , 2*cos(pi*t) ) 
y_new = max(0 , y) ; 

figure ; 

title("s(t) signal")
plot( y_new ) ; 

f = 1 / 2   ;    

% ( can be understood with the help of pi*t =  (  w * t) ) 
% solving above equation leads to frequency =  1 / 2  ; 

f_new = 4  ;    % adjusted frequency so that signl oversample for two time period 

y_oversample  =  max( 0 , 2*cos( 2 * pi * f_new * t ) ) ;  

% this is showing the length of y_oversample

display( "Displaying length - ") ; 
display( length(y_oversample)) ;  

figure ;  

title("oversample signal") ;  

plot(y_oversample) ;  


%   first part done 


%   x and y are gaussian distributed with mean 0 and variance 4 


% 3001 samples of random number taken from 0 to 1 
x = sqrt(4) + randi([0,1], 1 , 3001 ) ;      % 1   x  10 matrix of random numbers range from 0 to 1 

y = sqrt(4) + randi([0,1] , 1 , 3001 ) ;   

% display(x) ; 
% display(y) ;


z = [] ; 

% since i have created 10 samples of x and y , newly created z random
% variable will also have 10 samples 
for i = 1 : 3001
     
    z_cur = sqrt( x(i) * x(i) + y(i) * y(i) ) ; 
    z = [z z_cur]  ; 

end

display(z) ; 

figure ;  

plot(z) ;  


% z generated sucessfully ( for reference I have also plotted it ) 

% noise added with the help of z 

noise_added = z + y_oversample ;  

plot(noise_added) ; 

%  explaination of above plot is that after adding this generated noise
%  with the help of z random variable ( cos function become distorted ) 

% second part completed 


% third part started 

% I am explaining it with the help of comments about how i approached
% towards this problem 

% since i have created 10 instances of z , I will proceed it with the same 

% formula for calculation variance of z^2 is 
%    E[z^4]  - ( E[z^2] ) ^ 2 

% Now we have to find 2 parameters  
% first is E[Z^2]
% second is E[z^4] 

first = 0 ; 

second = 0 ; 

for i = 1 : 10 
   
    first = first +  z(i) * z(i)  ;   % in order to calculate E[Z^2]

    second = second + z(i) * z(i) * z(i) * z(i) ; 
    % in order to calculate E[Z^4]

end

% after for loop first and second contains the sum of z^2 and sum of z^4
% respectively 

first_mean = first / 10 ;  

second_mean = second / 10 ;  

display( first_mean) ; 
display( second_mean) ;  

variance =  second_mean * second_mean - first_mean ; 

display(variance) ;  



% third part done 



% fourth part start 


%  mean of z will be 0  and variance - 16 

variance = 16 ; 
z = sqrt(16) * randi([0,1] , 1 , 10 ) ;  

figure() ;  

% plotting the pdf of z
plot(z) ;  













