function best = Ostu ( I )
%用类间方差阈值求最佳阈值best
%   输入8位灰度图，输出最佳阈值（灰度值）

s=prod(size(I));
N=zeros(256,1);
T=zeros(256,1);

for k=0:255
    num=size(find(I==k),1);
    N(k+1,1)=num;
end

for t=1:256
    a0=0; a1=0; b0=0; b1=0;
    % 一部分图像
    for m=1:t
        a0=a0+N(m,1);
        b0=b0+(m-1)*N(m,1);
    end

    % 另一部分图像
    for m=t+1:256
        a1=a1+N(m,1);
        b1=b1+(m-1)*N(m,1);
    end
    w0=a0/s;
    w1=a1/s;
    % u0 u1
    u0=0; u1=0;
    for m=1:t
        u0=u0+(m-1)*N(m,1)/s;
    end
    for m=t+1:256
        u1=u1+(m-1)*N(m,1)/s;
    end
    u0=u0/w0;
    u1=u1/w1;
        
    T(t,1)=w0*w1*(u0-u1)*(u0-u1);
end

best=find(T==max(max(T)))-1;

end

