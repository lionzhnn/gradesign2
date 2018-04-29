function [f]=feature_extraction(filename)
image1=imread(filename); %读入图像
srcImage=rgb2gray(image1); %变为灰度图像
[c,s]=wavedec2(srcImage,4,'haar'); %四层小波变换

%第一层系数
ch1=detcoef2('h',c,s,1); %水平系数
cv1=detcoef2('v',c,s,1); %对角系数
m1=mean(mean(log2(abs(ch1))));%均值
m2=mean(mean(log2(abs(cv1))));
v1=mean(mean(log2(abs(ch1-m1))));%方差
v2=mean(mean(log2(abs(cv1-m2))));
e1=0;%信息熵
e2=0;
temp1=double(uint8(ch1)); %去除小数点之后的数据，节省计算时间，精度变差
temp2=tabulate(temp1(:));
temM=size(temp2,1);
for i=1:temM
    e1=temp2(i,3)*log(temp2(i,3))+e1;
end
temp1=double(uint8(cv1));
temp2=tabulate(temp1(:));
temM=size(temp2,1);
for i=1:temM
    e2=temp2(i,3)*log(temp2(i,3))+e2;
end

%第二层系数
ch2=detcoef2('h',c,s,2); %水平系数
cv2=detcoef2('v',c,s,2); %对角系数
m3=mean(mean(log2(abs(ch2)))); %均值
m4=mean(mean(log2(abs(cv2))));
v3=mean(mean(log2(abs(ch2-m3))));%方差
v4=mean(mean(log2(abs(cv2-m4))));
e3=0;%信息熵
e4=0;
temp1=double(uint8(ch2));
temp2=tabulate(temp1(:));
temM=size(temp2,1);
for i=1:temM
    e3=temp2(i,3)*log(temp2(i,3))+e3;
end
temp1=double(uint8(cv2));
temp2=tabulate(temp1(:));
temM=size(temp2,1);
for i=1:temM
    e4=temp2(i,3)*log(temp2(i,3))+e4;
end

%第三层系数
ch3=detcoef2('h',c,s,3); %水平系数
cv3=detcoef2('v',c,s,3); %对角系数
m5=mean(mean(log2(abs(ch3))));%均值
m6=mean(mean(log2(abs(cv3))));
v5=mean(mean(log2(abs(ch3-m5))));%方差
v6=mean(mean(log2(abs(cv3-m6))));
e5=0;%信息熵
e6=0;
temp1=double(uint8(ch3));
temp2=tabulate(temp1(:));
temM=size(temp2,1);
for i=1:temM
    e5=temp2(i,3)*log(temp2(i,3))+e5;
end
temp1=double(uint8(cv3));
temp2=tabulate(temp1(:));
temM=size(temp2,1);
for i=1:temM
    e6=temp2(i,3)*log(temp2(i,3))+e6;
end

%第四层系数
ch4=detcoef2('h',c,s,4); %水平系数
cv4=detcoef2('v',c,s,4); %对角系数
m7=mean(mean(log2(abs(ch4))));%均值
m8=mean(mean(log2(abs(cv4))));
v7=mean(mean(log2(abs(ch4-m7))));
v8=mean(mean(log2(abs(cv4-m8))));
e7=0;%信息熵
e8=0;
temp1=double(uint8(ch4));
temp2=tabulate(temp1(:));
temM=size(temp2,1);
for i=1:temM
    e7=temp2(i,3)*log(temp2(i,3))+e7;
end
temp1=double(uint8(cv4));
temp2=tabulate(temp1(:));
temM=size(temp2,1);
for i=1:temM
    e8=temp2(i,3)*log(temp2(i,3))+e8;
end

%形成图像的特征向量
f=[m8,m7,m6,m5,m4,m3,m2,m1,v8,v7,v6,v5,v4,v3,v2,v1,e8,e7,e6,e5,e4,e3,e2,e1];
for i=1:1:24
    if f(i)==inf
        f(i)=0;
    end
    if f(i)==-inf
        f(i)=0;
    end;
end
