function [ PSNR ] = PSNR_cal( figure1,figure2,bit )
img=double(figure2);
imgn=double(figure1);
Size=size(figure1);
height=Size(1);
width=Size(2);
MAX=2^bit-1;          %ͼ��Ҷȼ�����
PMSE=sum(sum((img-imgn).^2))/(height*width)/MAX^2; %������
PSNR=-10*log10(PMSE);           %��ֵ�����
end

