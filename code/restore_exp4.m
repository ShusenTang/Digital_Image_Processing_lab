function []=restore_exp4( p, card, original )

[par1,par3]=Hough(p);
subplot(2,3,card+3);
imshow(original);
viscircles(par1,par3);

if card==1
    op='roberts算子';
elseif card==2
    op='sobel算子';
else
    op='laplacian算子';
end
title(['重建图像:',op],'color','k');

end