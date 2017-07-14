global test species k labels

label=[0,1,6,7,9];
load('train_digit0.mat');
load('train_digit1.mat');
load('train_digit6.mat');
load('train_digit7.mat');
load('train_digit9.mat');

train_digit0=double(train_digit0);
train_digit1=double(train_digit1);
train_digit6=double(train_digit6);
train_digit7=double(train_digit7);
train_digit9=double(train_digit9);

train_digit=[
             train_digit0(1:1000,:);
             train_digit1(1:1000,:);
             train_digit6(1:1000,:);
             train_digit7(1:1000,:);
             train_digit9(1:1000,:)
             ];
         

size_label=[];
for i=1:5
    size_label=cat(1,size_label,label(i)*ones(1000,1));
end

svm=fitcecoc(train_digit,size_label);


load('test_digit.mat');
load('test_labels.mat');
n=size(test_digit,1);
test=cell(n,28,28);
species=zeros(n,1);

for i=1:n
    species(i)=predict(svm,test_digit(i,:));
    test{i}=reshape(test_digit(i,:),28,28);
end

accurate_number=length(find((species-labels)==0));
precision=accurate_number/size(labels,1)*100;
k=1;









