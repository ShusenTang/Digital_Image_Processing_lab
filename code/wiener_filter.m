function [ ] = wiener_filter( card, ki, W_k, Q0, lena )

Q_k=Q0.*W_k;
q_k=real(ifft2(Q_k));
% q_k=uint8(255.*mat2gray(q_k));
% q_k=uint8(q_k);

peaksnr=PSNR_cal(lena,uint8(q_k),8);          % PSNR

subplot(2,3,card+2);
imshow(uint8(255.*mat2gray(q_k)));
title(sprintf('K=%f , PSNR=%.4f dB',ki,peaksnr));

end
