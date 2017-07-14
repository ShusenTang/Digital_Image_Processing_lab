function []=op_exp4( p0 , original ,flag)
% edge detect

ps=cell(1,4);
ps{1}=edge(p0,'roberts');            % roberts operator
subplot(231); imshow(ps{1}); title([flag,':','robertsËã×Ó'],'color','k');
ps{2}=edge(p0,'sobel');              % sobel operator
subplot(232); imshow(ps{2}); title([flag,':','sobelËã×Ó'],'color','k');
ps{3}=edge(p0,'log');                % laplacian operator
subplot(233); imshow(ps{3}); title([flag,':','laplacianËã×Ó'],'color','k'); 

for i=1:3
    restore_exp4(ps{i},i,original);
end

end