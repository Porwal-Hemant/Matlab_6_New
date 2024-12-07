load handel; % signal is in y and sampling frequency in FS 
sound(y,Fs); pause(10); % play the original sound
alpha = 0.9; 
D=[4196 4197 4200];
b=[1,zeros(1,D(1)),alpha , zeros(1,D(2)) ,alpha^2, zeros(1,D(3)) ,alpha^3]  ; % filter parameters
x=filter(b,1,y);% generate sound plus its echo
sound(x,Fs);% play sound with echo
pause(10);
% note that MATLAB's filter() function is primarily designed for FIR filters 
% (where the second argument is typically 1), and using a second-order polynomial directly in this context
% might not provide the expected behavior and could result in errors or unexpected outputs.
w = filter(1,b,x);
sound(w,Fs)


