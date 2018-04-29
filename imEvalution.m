function rdmos=imEvalution(filename)
feature=load('C:\Users\张海燕\Desktop\毕设\feature.mat');  %字典，最后一行为dmos值
D=zeros(24,780);
for i=1:1:780
    D(:,i)=feature.f(1:24,i); 
end
%测试图像特征提取
xfeature=feature_extraction(filename);
%行向量转为列向量
xfeature=reshape(xfeature,24,1);
%特征向量归一化
xfeature=xfeature./repmat(sqrt(sum(xfeature.^2,1)),size(xfeature,1),1); 
%稀疏表示
D=D./repmat(sqrt(sum(D.^2,1)),size(D,1),1); %对字典进行规范化
m=OMP(D,xfeature);  %稀疏稀疏矩阵
%以稀疏稀疏为权值求解dmos值
[ir,~,pr]=find(m);
rdmos=0;
for i=1:size(ir,1)
    rdmos=rdmos+feature.f(25,ir(i))*pr(i);
end
return;
