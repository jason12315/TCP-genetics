function newbi = SAA(bi,plot,epoch,epoches)
%SAA ��������Խ�ߣ��˻�ѡ������Ӵ��ĸ��ʾ�Խ��


%�����½�
res=bi;
num1=randi(length(bi)-1);
num2=randi([num1+1,length(bi)]);
%���ö��任��
while(num1<num2)
    t=res(num1);
    res(num1)=res(num2);
    res(num2)=t;
    num1=num1+1;
    num2=num2-1;
end
if distance(plot,res)<distance(plot,bi)
    newbi=res;
elseif rand()<exp((-7*epoch)/epoches)     %����7�����ɵ�
    newbi=res;
else 
    newbi=bi;
end
end

