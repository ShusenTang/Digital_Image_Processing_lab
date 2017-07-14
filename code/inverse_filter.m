function [ ] = inverse_filter( r , x, y, card, H1, Q0, lena )
% inv_r calculate the inv filtered image and show it
x_r=round(x*r);
y_r=round(y*r);
% new model
H_r=ones(x,y).*100000;
H_r(1:x_r,1:y_r)=H1(1:x_r,1:y_r);
Q0_inv=Q0./H_r;
q0_inv=uint8(real(ifft2(Q0_inv)));
peaksnr=PSNR_cal(lena,q0_inv,8); % PSNR
% show the image
subplot(2,3,card);
imshow(uint8(255.*mat2gray(q0_inv)));
title(sprintf('r_0=%.1f , PSNR=%.4f dB',r,peaksnr));
%disp(mean(mean(q_r)));
end

