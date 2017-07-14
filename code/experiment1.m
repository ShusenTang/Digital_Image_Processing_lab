function varargout = experiment1(varargin)
% Initialization
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @experiment1_OpeningFcn, ...
                   'gui_OutputFcn',  @experiment1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function experiment1_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

figure=imread('Lena.bmp');  
subplot(1,3,1);
imshow(figure);
title('Lena ԭͼ');

guidata(hObject, handles);



function varargout = experiment1_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --------------------------------------------------------------------
function transform_Callback(hObject, eventdata, handles)


% ------------------------------�˳�----------------------------------
function exit_Callback(hObject, eventdata, handles)
close(gcf);

% -----------------------------����Ҷ�任-----------------------------
function Fourier_Callback(hObject, eventdata, handles)
%-------------------------------ԭͼ��--------------------------------
figure=imread('Lena.bmp');  
subplot(1,3,1);
imshow(figure);
title('Lena ԭͼ');
%------------------------------����Ҷ�任Ƶ��--------------------------
fourier = fft2(figure);        
shiftf=fftshift(fourier);    
R=real(shiftf);                % ȡ����Ҷ�任��ʵ��
I=imag(shiftf);                % ȡ����Ҷ�任���鲿
spectrum = sqrt(R.^2+I.^2);             % ����Ƶ�׷�ֵ
spectrum_norm =(spectrum-min(min(spectrum)))/(max(max(spectrum))-min(min(spectrum)))*255;%��һ��
subplot(1,3,2);
imshow(spectrum_norm);        % ��ʾԭͼ���Ƶ��
title('����Ҷ�任Ƶ��')
%--------------------------------����Ҷ��任--------------------------
Size=size(figure);
height=Size(1);
width=Size(2);
spectrum2=sort(reshape(spectrum,[1,width*height]));%����ȡ��ֵ
threshold=spectrum2(round(width*height*0.95)); %����
for p=1:height
     for j=1:width
         if spectrum(p,j)<=threshold
             R(p,j)=0;
             I(p,j)=0;
         end
     end
end
refigure=ifft2(ifftshift(R+1i*I))/256 ;
subplot(1,3,3);
imshow(refigure);
title('��任ͼ��');

PSNR = PSNR_cal(figure,256*refigure,8); %����PSNR
set(handles.edit2,'string',PSNR);

% -----------------------------��ɢ���ұ任----------------------------
function dct_Callback(hObject, eventdata, handles)
figure = imread('Lena.bmp');   
subplot(1,3,1);
imshow(figure);
title('Lena ԭͼ');
%--------------------------��ɢ���ұ任Ƶ��----------------------------
DCT=dct2(figure); %��ɢ���ұ任
subplot(1,3,2);
imshow(abs(DCT),[0 255]);
title('��ɢ���ұ任Ƶ��')
%---------------------------��ɢ������任-----------------------------
Size=size(DCT);
height=Size(1);
width=Size(2);
DCT_sort=sort(reshape(DCT,1,width*height));%����ȡ��ֵ
threhold=DCT_sort(round(width*height*0.95)); %����
DCT(abs(DCT)<threhold)=0;
refigure=idct2(DCT);
subplot(1,3,3);
imshow(refigure,[0 255]);
title('��任ͼ��');

PSNR = PSNR_cal(figure,refigure,8); %����PSNR
set(handles.edit2,'string',PSNR);

% --------------------------------------------------------------------
function Hadamard_Callback(hObject, eventdata, handles)
%----------------------------ԭͼ��-----------------------------------
figure=imread('Lena.bmp');  
subplot(1,3,1);
imshow(figure);
title('Lena ԭͼ');
%-----------------------------������任-------------------------------
H=hadamard(512);
figure=double(figure);
DHT=H*figure*H./(512^2);
subplot(1,3,2);
imshow(DHT*2^10,[0,255]);
title('������任Ƶ��')

%--------------------------------��������任--------------------------
Size=size(figure);
height=Size(1);
width=Size(2);
DHT_sort=sort(reshape(DHT,1,width*height));  %����ȡ��ֵ
threshold=abs(DHT_sort(round(width*height*0.95)));  %����
DHT(abs(DHT)<=threshold)=0;
refigure=H*DHT*H;
subplot(1,3,3);
imshow(refigure,[0,255]);
title('��任ͼ��');

PSNR = PSNR_cal(figure,refigure,8); %����PSNR
set(handles.edit2,'string',PSNR);


% function edit1_Callback(hObject, eventdata, handles)


function edit1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% function edit2_Callback(hObject, eventdata, handles)

function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
