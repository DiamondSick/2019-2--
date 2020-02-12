function [Hdis] = DTHausdorff(EM,EN,M,N,k1,k2)
% M=double(M);
% N=double(N);
% 
% EM=edge(M,'canny');
% EN=edge(N,'canny');

[Xm Ym]=find(EM);%������Ե����
[Xn Yn]=find(EN);%ģ���Ե����
lenM=size(Xm,1);
lenN=size(Xn,1);
H1=[];
for i=1:lenM
   minD=inf;
   for j=1:lenN
       tmp=sqrt((Xm(i)-Xn(j))^2+(Ym(i)-Yn(j))^2);
       if tmp<minD
          minD=tmp;
          minIndex=j;
       end
   end
   H1=[H1,abs(M(Xm(i),Ym(i))-N(Xn(minIndex),Yn(minIndex)))];
end

H2=[];
for i=1:lenN
    minD=inf;
    for j=1:lenM
        tmp=sqrt((Xn(i)-Xm(j))^2+(Yn(i)-Ym(j))^2);
        if tmp<minD
            minD=tmp;
            minIndex=j;
        end
    end
    H2=[H2,abs(N(Xn(i),Yn(i))-M(Xm(minIndex),Ym(minIndex)))];
end
H1=sort(H1);
H2=sort(H2);
Hdis=max(H1(round(k1*lenM)),H2(round(k2*lenN)));
%%




