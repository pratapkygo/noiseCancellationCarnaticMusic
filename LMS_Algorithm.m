 close all; clear all;
% Parameters：
%     x     ： input signal      
%     d     ： reference signal  
%     y     ： output signal     
%     e     ： error signal      
%     mu    ： LMS stepsize      
%     mu2   ： NLMS stepsize     
%     a     ： NLMS bias         
%     lamda ： RLS weight        
%     w     ： filter parameters


[d, fs] = audioread('carnaticclean.wav');
x = audioread('carnaticnoisy.wav');
mu =  0.05;
mu2 = 0.1;
a = 0.01;
lamda = 0.99;
M = 80;


%Functions for LMS and NLMS
[e1, y1, w1] = myLMS(d, x, mu, M);
[e2, y2, w2] = myNLMS(d, x,mu2, M, a);


y1 = normalize(y1, 'range', [-1 1]);
y2 = normalize(y2, 'range', [-1 1]);

audiowrite('LMS_o2.wav',y1,fs);
audiowrite('NLMS_o2.wav',y2,fs);


%% 
figure()
subplot(4,1,1)
plot(x);
xlabel('time');
title('x(n)-Noisy Audio');
subplot(4,1,2)
plot(d);
xlabel('time');
title('d(n)-Clean Audio');
subplot(4,1,3)
plot(y1);
xlabel('time');
title('LMS y(n)');
subplot(4,1,4)
plot(y2);
xlabel('time');
title('NLMS y(n)');


