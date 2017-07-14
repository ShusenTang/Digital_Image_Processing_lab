T=1;
a=0.02;
b=a;
lena=imread('lena.bmp');
subplot(2,3,1);
imshow(lena);
title('Lena ‘≠Õº');
[x,y]=size(lena);

H1 = zeros(x,y);
j=sqrt(-1);   % generate the model
for u=1:x
    for v=1:y
         H1(u,v)=T/(pi*(a*u+b*v))*sin(pi*(a*u+b*v))*exp(-pi*j*(a*u+b*v));
     end
end
fftlena=fft2(lena);

Q0=fftlena.*H1;       
q0=real(ifft2(Q0));  
q0=uint8(255.*mat2gray(q0));        % Degraded Image
peaksnr=PSNR_cal(lena,q0,8);

subplot(2,3,2);
imshow(q0);
title(sprintf('Ωµ÷ ÕºœÒ, PSNR=%.4f dB',peaksnr));
r=[1,0.8,0.5,0.2];        % inverse filter parameter r
% run inv filter

peaksnr=zeros(1,4);

for i=1:4
%inverse_filter(r(i),x,y,i+2,H1,Q0,lena);
x_r=round(x*r(i));
y_r=round(y*r(i));
% new model
H_r=ones(x,y).*100000;
H_r(1:x_r,1:y_r)=H1(1:x_r,1:y_r);
Q0_inv=Q0./H_r;
q0_inv=uint8(real(ifft2(Q0_inv)));
peaksnr(i)=PSNR_cal(lena,q0_inv,8); % PSNR
% show the image
subplot(2,3,i+2);
imshow(uint8(255.*mat2gray(q0_inv)));
title(sprintf('PSNR=%.4f dB',peaksnr(i)));
%disp(mean(mean(q_r)));

end