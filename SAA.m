function newbi = SAA(bi,plot,epoch,epoches)
%SAA 迭代次数越高，退火选择更低子代的概率就越低


%产生新解
res=bi;
num1=randi(length(bi)-1);
num2=randi([num1+1,length(bi)]);
%采用二变换法
while(num1<num2)
    t=res(num1);
    res(num1)=res(num2);
    res(num2)=t;
    num1=num1+1;
    num2=num2-1;
end
if distance(plot,res)<distance(plot,bi)
    newbi=res;
elseif rand()<exp((-7*epoch)/epoches)     %倍率7参数可调
    newbi=res;
else 
    newbi=bi;
end
end

