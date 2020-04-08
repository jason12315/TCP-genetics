function C = crossover(A,B,rate)
% ½»²æËã×Ó
l=length(A);
result=zeros(1,l);
for i=1:l
    if rand()<rate
        result(1,i)=A(i);
    end
end
for i=B
    if ~ismember(i,result)
        for j=1:length(A)
            if result(j)==0
                result(j)=i;
                break;
            end
        end      
    end
end
C=result;

