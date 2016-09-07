%用5*5模板计算LBP特征值
%法一
function [out]=calculatelbp2(mat)
[m,n]=size(mat);
%mat=double(mat);
in=mat;
r=m+4;
c=n+4;
%out=zeros(m,n);
A=zeros(r,c);
r0=3:r-2;
c0=3:c-2;
A(r0,c0)=in;
%alpha=2-sqrt(2);
alpha=0.5;
beta=1-alpha;
d0=A(r0,c0-2)-in;
d2=A(r0+2,c0)-in;
d4=A(r0,c0+2)-in;
d6=A(r0-2,c0)-in;
d1=alpha*A(r0+1,c0-1)+beta*A(r0+2,c0-2)-in;
d3=alpha*A(r0+1,c0+1)+beta*A(r0+2,c0+2)-in;
d5=alpha*A(r0-1,c0+1)+beta*A(r0-2,c0+2)-in;
d7=alpha*A(r0-1,c0-1)+beta*A(r0-2,c0-2)-in;



d=[d0(:),d1(:),d2(:),d3(:),d4(:),d5(:),d6(:),d7(:)];
code=2.^(7:-1:0)';
out =reshape((d>=0)*code,m,n);
%法二
%out=mat2gray(out);
%imshow(out);
%可先声明一个大矩阵，把mat放入矩阵中
% [m,n]=size(mat);
% mat=[zeros(m,2) mat zeros(m,2)];
% mat=[zeros(2,n+4);mat;zeros(2,n+4)];
% A=zeros(5,5);
% p=zeros(1,8);
% k=0;
% lbp=zeros(size(mat));
% h=zeros(1,8);
% for i=3:(m+2)
%  for j=3:(n+4)
%         lbpnumber=0;
%         A=mat(i:i+4,j:j+4);
%         k=A(3,3);
%         p(2)=(A(1,1)+A(2,2))/2;
%         p(3)=A(1,3);
%         p(4)=(A(1,5)+A(2,4))/2;
%         p(1)=A(3,1);
%         p(5)=A(3,5);
%         p(8)=(A(5,1)+A(4,2))/2;
%         p(7)=A(5,3);
%         p(6)=(A(5,5)+A(5,4))/2;
%         h=(p>=k);
%         for q=1:8
%             lbpnumber=lbpnumber+(h(q)*2^(8-q));
%         end
%         lbp(i+2,j+2)=lbpnumber;
%     end
% end
%     lbp(1:2,:)=[];
%    lbp((1+m):end,:)=[];
%     lbp(:,1:2)=[];
%     lbp(:,(1+n):end)=[];
% end
% imshow(lbp,[]);%强制转换为double 类型