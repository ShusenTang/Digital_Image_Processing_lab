function varargout = experiment2(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @experiment2_OpeningFcn, ...
                   'gui_OutputFcn',  @experiment2_OutputFcn, ...
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

function experiment2_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

%-----------��ȡԭͼ��--------------
p1=imread('lena.bmp');
subplot(2,3,1);
imshow(p1);
title('ԭͼ��');
% Update handles structure
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = experiment2_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


function edit1_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)

%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit2_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)


% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)

function edit3_CreateFcn(hObject, eventdata, handles)

%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)

%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
%-----------��ȡԭͼ��--------------
p1=imread('lena.bmp');
subplot(2,3,1);
imshow(p1);
title('ԭͼ��');
%----------��ͼ����н���-----------
T=1;a=0.05;b=0.05;
[m,n]=size(p1);
H1=zeros(m,n);
for u=1:m
    for v=1:n
        H1(u,v)=T/(pi*(a*u+b*v))*sin(pi*(a*u+b*v))*exp(-i*pi*(a*u+b*v));%�����˲���
    end
end
P1=fft2(p1);
Q1=P1.*H1;%�����˲�
q1=real(ifft2(Q1));
subplot(2,3,2);
imshow(uint8(q1));
title('���ʺ�ͼ��');
%------------r=1 �����˲�---------
P11=Q1./H1;
p11=real(ifft2(P11));
subplot(2,3,3);
imshow(uint8(p11));
title('r=1�����˲�����ԭ');
snr11=Psnr(p1,p11);
set(handles.edit1,'String',snr11);
%----------r=0.8 �����˲�-----------
m08=round(m*0.8);
n08=round(n*0.8);
H08=ones(m,n).*100000;
H08(1:m08,1:n08)=H1(1:m08,1:n08);
P108=Q1./H08;
p108=real(ifft2(P108));
subplot(2,3,4);
imshow(uint8(p108));
title('r=0.8�����˲�����ԭ');
snr108=Psnr(p1,p108);
set(handles.edit2,'String',snr108);
%----------r=0.5 �����˲�-----------
m05=round(m*0.5);
n05=round(n*0.5);
H05=ones(m,n).*100000;
H05(1:m05,1:n05)=H1(1:m05,1:n05);
P105=Q1./H05;
p105=real(ifft2(P105));
subplot(2,3,5);
imshow(uint8(p105));
title('r=0.5�����˲�����ԭ');
snr105=Psnr(p1,p105);
set(handles.edit3,'String',snr105);
%----------r=0.3 �����˲�-----------
m03=round(m*0.3);
n03=round(n*0.3);
H03=ones(m,n).*100000;
H03(1:m03,1:n03)=H1(1:m03,1:n03);
P103=Q1./H03;
p103=real(ifft2(P103));
subplot(2,3,6);
imshow(uint8(p103));
title('r=0.3�����˲�����ԭ');
snr103=Psnr(p1,p103);
set(handles.edit4,'String',snr103);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
p2=imread('lena.bmp');
subplot(2,3,1);
imshow(p2);
title('ԭͼ��');
%----------��ͼ����н���-----------
T=1;a=0.05;b=0.05;
[m,n]=size(p2);
H2=zeros(m,n);
for u=1:m
    for v=1:n
        H2(u,v)=T/(pi*(a*u+b*v))*sin(pi*(a*u+b*v))*exp(-i*pi*(a*u+b*v));%�����˲���
    end
end
P2=fft2(p2);
Q2=P2.*H2;%�����˲�
q2=real(ifft2(Q2));
subplot(2,3,2);
imshow(uint8(q2));
title('���ʺ�ͼ��');


H2M=abs(H2).*abs(H2);

%-----------K=0��ά���˲�-----------
W20=1./H2.*(H2M./(H2M+0));
P20=Q2.*W20;
p20=real(ifft2(P20));
subplot(2,3,3);
imshow(uint8(p20));
title('K=0��ά���˲�');
snr20=Psnr(p2,p20);
set(handles.edit1,'string',snr20);
%-----------K=0.00001��ά���˲�-----------
W21=1./H2.*(H2M./(H2M+0.00001));
P21=Q2.*W21;
p21=real(ifft2(P21));
subplot(2,3,4);
imshow(uint8(p21));
title('K=0.00001��ά���˲�');
snr21=Psnr(p2,p21);
set(handles.edit2,'string',snr21);
%-----------K=0.0001��ά���˲�-----------
W22=1./H2.*(H2M./(H2M+0.0001));
P22=Q2.*W22;
p22=real(ifft2(P22));
subplot(2,3,5);
imshow(uint8(p22));
title('K=0.0001��ά���˲�');
snr22=Psnr(p2,p22);
set(handles.edit3,'string',snr22);
%-----------K=0.001��ά���˲�-----------
W23=1./H2.*(H2M./(H2M+0.001));
P23=Q2.*W23;
p23=real(ifft2(P23));
subplot(2,3,6);
imshow(uint8(p23));
title('K=0.001��ά���˲�');
snr23=Psnr(p2,p23);
set(handles.edit4,'string',snr23);

% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
close(gcf)

function PSNR = Psnr( im1,im2 ) %��[ PSNR,MSE ] = Psnr( im1,im2 )

%------------------------�����ֵ����ȳ��򡪡���������������������������-----
% im1 : the original image matrix
% im2 : the modified image matrix   

if (size(im1))~=(size(im2))
    error('������������ͼ��Ĵ�С��һ��');
end

    [m,n] = size(im1);
    A = double(im1);
    B = double(im2);
    D = sum( sum( (A-B).^2 ) );%||A-B||^2
    MSE = D / (m * n);
if  D == 0
    error('����ͼ����ȫһ��');
    PSNR = 200;
else
    PSNR = 10*log10( (255^2) / MSE );                                                        
end
