function PSNR = PSNR_myown( im1,im2 )
% 计算两输入图像峰值信噪比

if (size(im1))~=(size(im2))
    error('输入图像大小不一致！');
end

d=double(im1) - double(im2);
MSE=sum(sum(d(:).^2))/prod(size(im1));

if  d == 0
    PSNR = 200;
else
    PSNR = 10*log10( (255^2) / MSE );                                                        
end

end