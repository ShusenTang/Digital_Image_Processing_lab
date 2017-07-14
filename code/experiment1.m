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
title('Lena Ô­Í¼');

guidata(hObject, handles);



function varargout = experiment1_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --------------------------------------------------------------------
function transform_Callback(hObject, eventdata, handles)


% ------------------------------ÍË³ö----------------------------------
function exit_Callback(hObject, eventdata, handles)
close(gcf);

% -----------------------------¸µÁ¢Ò¶±ä»»-----------------------------
function Fourier_Callback(hObject, eventdata, handles)
%-------------------------------Ô­Í¼Ïñ--------------------------------
figure=imread('Lena.bmp');  
subplot(1,3,1);
imshow(figure);
title('Lena Ô­Í¼');
%------------------------------¸µÁ¢Ò¶±ä»»ÆµÆ×--------------------------
fourier = fft2(figure);        
shiftf=fftshift(fourier);    
R=real(shiftf);                % È¡¸µÁ¢Ò¶±ä»»µÄÊµ²¿
I=imag(shiftf);                % È¡¸µÁ¢Ò¶±ä»»µÄÐé²¿
spectrum = sqrt(R.^2+I.^2);             % ¼ÆËãÆµÆ×·ùÖµ
spectrum_norm =(spectrum-min(min(spectrum)))/(max(max(spectrum))-min(min(spectrum)))*255;%¹éÒ»»¯
subplot(1,3,2);
imshow(spectrum_norm);        % ÏÔÊ¾Ô­Í¼ÏñµÄÆµÆ×
title('¸µÁ¢Ò¶±ä»»ÆµÆ×')
%--------------------------------¸µÁ¢Ò¶Äæ±ä»»--------------------------
Size=size(figure);
height=Size(1);
width=Size(2);
spectrum2=sort(reshape(spectrum,[1,width*height]));%ÅÅÐò£¬È¡ãÐÖµ
threshold=spectrum2(round(width*height*0.95)); %ÃÅÏÞ
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
title('Äæ±ä»»Í¼Ïñ');

PSNR = PSNR_cal(figure,256*refigure,8); %¼ÆËãPSNR
set(handles.edit2,'string',PSNR);

% -----------------------------ÀëÉ¢ÓàÏÒ±ä»»----------------------------
function dct_Callback(hObject, eventdata, handles)
figure = imread('Lena.bmp');   
subplot(1,3,1);
imshow(figure);
title('Lena Ô­Í¼');
%--------------------------ÀëÉ¢ÓàÏÒ±ä»»ÆµÆ×----------------------------
DCT=dct2(figure); %ÀëÉ¢ÓàÏÒ±ä»»
subplot(1,3,2);
imshow(abs(DCT),[0 255]);
title('ÀëÉ¢ÓàÏÒ±ä»»ÆµÆ×')
%---------------------------ÀëÉ¢ÓàÏÒÄæ±ä»»-----------------------------
Size=size(DCT);
height=Size(1);
width=Size(2);
DCT_sort=sort(reshape(DCT,1,width*height));%ÅÅÐò£¬È¡ãÐÖµ
threhold=DCT_sort(round(width*height*0.95)); %ÃÅÏÞ
DCT(abs(DCT)<threhold)=0;
refigure=idct2(DCT);
subplot(1,3,3);
imshow(refigure,[0 255]);
title('Äæ±ä»»Í¼Ïñ');

PSNR = PSNR_cal(figure,refigure,8); %¼ÆËãPSNR
set(handles.edit2,'string',PSNR);

% --------------------------------------------------------------------
function Hadamard_Callback(hObject, eventdata, handles)
%----------------------------Ô­Í¼Ïñ-----------------------------------
figure=imread('Lena.bmp');  
subplot(1,3,1);
imshow(figure);
title('Lena Ô­Í¼');
%-----------------------------¹þ´ïÂê±ä»»-------------------------------
H=hadamard(512);
figure=double(figure);
DHT=H*figure*H./(512^2);
subplot(1,3,2);
imshow(DHT*2^10,[0,255]);
title('¹þ´ïÂê±ä»»ÆµÆ×')

%--------------------------------¹þ´ïÂêÄæ±ä»»--------------------------
Size=size(figure);
height=Size(1);
width=Size(2);
DHT_sort=sort(reshape(DHT,1,width*height));  %ÅÅÐò£¬È¡ãÐÖµ
threshold=abs(DHT_sort(round(width*height*0.95)));  %ÃÅÏÞ
DHT(abs(DHT)<=threshold)=0;
refigure=H*DHT*H;
subplot(1,3,3);
imshow(refigure,[0,255]);
title('Äæ±ä»»Í¼Ïñ');

PSNR = PSNR_cal(figure,refigure,8); %¼ÆËãPSNR
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
