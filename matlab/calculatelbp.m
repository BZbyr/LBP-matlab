%用3*3模板计算LBP特征值
function [lbp]=calculatelbp(mat)
[m,n]=size(mat);
mat=double(mat);
mat=[zeros(m,2) mat zeros(m,2)];
mat=[zeros(2,n+4);mat;zeros(2,n+4)];
A=[];
P=zeros(3,3);
lbp=zeros(size(mat));
for i=3:(m+2)
    for j=3:(n+2)
        A=mat(i:i+2,j:j+2);
        k=A(1,1);
        for s=1:3
            for t=1:3
                if A(s,t)>=k
                    P(s,t)=1;
                else P(s,t)=0;
                end
            end 
        end
        lbp(i+1,j+1)=(P(2,1)*2^7)+(P(1,1)*2^6)+(P(1,2)*2^5)+(P(1,3)*2^4)+(P(2,3)*2^3)+(P(3,3)*2^2)+(P(3,2)*2^1)+(P(3,1)*2^0);
    end
end
    lbp(1:2,:)=[];
   lbp((1+m):end,:)=[];
    lbp(:,1:2)=[];
    lbp(:,(1+n):end)=[];
    imshow(lbp);