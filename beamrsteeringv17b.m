%2D FFT beamforming
%clc;
%clear all;
%close all;
c=3e8;
%frequency and wavelength of observing source
f=1420e6;
lambda=c/f;
ls = 2;
%distance between antennas in y direction
dx = lambda/ls;
%distance between antennas in x direction
dy = lambda/ls;
%propagation constant
k = 2*pi/lambda;
%Number of antennas in y direction
M = 8;
%Number of antennas in x direction
N = 8;

%Find maximun of M and N and create a square matrix of max of M and N if M and N are not equal
if (M == N)
  A =  ones(M,N);
else 
  r = max(M,N);
B = oneon
sourcedird = -30;s(r,r);
A = ones(M,N);
%Amplitudes of each antenna in 8X8 array: 64 elements
A(size(B,1), size(B,2)) = 0;
endif

%Zenith angle
thetad1 = -90:1:90;
thetar1 = deg2rad(thetad1);
%Azimuth angle
phi1 = 220;
phir1 = deg2rad(phi1);

%Initial Array Factor 
AFx = 0;
AFy = 0;
w =  zeros(1,M);
z = zeros(1,N);
%AF for all the columns
m = 1:1:M;
y = 1;
n = 1:1:N;
x = 1;
phir = phir1;
  %Source direction
sourcedird = -45;
sourcedirr = deg2rad(sourcedird);

%Progressive Phase shift in y and x direction 
delta1 = -k.*dx.*sin(sourcedirr).*cos(phir);
delta2 = -k.*dy.*sin(sourcedirr).*sin(phir);
 for p =  1:length(thetar1)
 wz9x = A(x,m).*exp(1i.*(m-1).*(k.*dx.*sin(thetar1(p)).*cos(phir)+delta1)); 
 AFx(p) = sum(wz9x);
endfor
 for q =  1:length(thetar1)
 wz9y1 = A(y,n).*exp(1i.*(n-1).*(k.*dy.*sin(thetar1(q)).*sin(phir)+delta2)); 
 AFy(q) = sum(wz9y1);
endfor


AF = AFx.*AFy;
plot(thetad1,AF);
 [maxP,maxIdx]=max(AF);
 fprintf('Maximum value %f at theta=%f\n',maxP,thetad(maxIdx));
ylabel('Array factor of x');
xlabel('zenith- -90 to 90,az- 0 and 180');
title('Array factor')