dock=rgb2gray(imread('dock.png'));
dock2=medfilt2(dock);       % ��ֵ�˲�
t=Ostu(dock2);

dock3=dock2;
dock3(dock3<t)=0;
dock3(dock3>=t)=255;

subplot(flag,3,1);
imshow(dock);
title('ԭͼ','color','k');
subplot(flag,3,2);
imshow(dock2);
title('��ֵ�˲�','color','k');
subplot(flag,3,3);
imshow(dock3);
title('��䷽����ֵ�ָ�','color','k');