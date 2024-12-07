 n = -1:3; x = 1:5; k = 0:500; w = (pi/500)*k;
 % Numerically compute the DTFT of the sequence x(n) at 501 equispaced frequencies between [0, π].
X=x* (exp(-j*pi/500)) .^ (n'*k);      % 5 rows and 501 columns 

% The matrix multiplication n'*k generates a grid of indices representing all combinations of time indices n and 
% frequency indices k      ->  (n'*k) 

 magX = abs(X); angX = angle(X);
 realX = real(X); imagX = imag(X);
 subplot(2,2,1); plot(k/500,magX);grid
 xlabel('frequency in pi units'); title('Magnitude Part')
 subplot(2,2,3); plot(k/500,angX/pi);grid
 xlabel('frequency in pi units'); title('Angle Part')
 subplot(2,2,2); plot(k/500,realX);grid
 xlabel('frequency in pi units'); title('Real Part')
 subplot(2,2,4); plot(k/500,imagX);grid
 xlabel('frequency in pi units'); title('Imaginary Part')



 