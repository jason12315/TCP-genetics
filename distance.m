function d=distance(A,order)
result=sqrt((A(1,order(end))-A(1,order(1)))^2+(A(2,order(end))-A(2,order(1)))^2);
for i=1:length(A)-1
    o=order(i);
    p=order(i+1);
    result=result+sqrt((A(1,p)-A(1,o))^2+(A(2,p)-A(2,o))^2);
end
d=result;
