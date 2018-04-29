function A=OMP(D,X,L) 
% 输入参数: 
%       D - 过完备字典，注意：必须字典的各列必须经过了规范化
%       X - 信号
%       L - 系数中非零元个数的最大值（可选，默认为D的列数，速度可能慢）
% 输出参数: 
%       A - 稀疏系数
if nargin==2
    L=size(D,2);
end
P=size(X,2);
K=size(D,2);
for k=1:1:P,
    a=[];
    x=X(:,k);
    residual=x;
    indx=zeros(L,1);
    for j=1:1:L,
        proj=D'*residual;
        [maxVal,pos]=max(abs(proj));
        pos=pos(1);
        indx(j)=pos;
        a=pinv(D(:,indx(1:j)))*x;
        residual=x-D(:,indx(1:j))*a;
        if sum(residual.^2) < 1e-6
            break;
        end
    end;
    temp=zeros(K,1);
    temp(indx(1:j))=a;
    A(:,k)=sparse(temp);
end;
return;
