function PSNR = PSNR_myown( im1,im2 )
% ����������ͼ���ֵ�����

if (size(im1))~=(size(im2))
    error('����ͼ���С��һ�£�');
end

d=double(im1) - double(im2);
MSE=sum(sum(d(:).^2))/prod(size(im1));

if  d == 0
    PSNR = 200;
else
    PSNR = 10*log10( (255^2) / MSE );                                                        
end

end