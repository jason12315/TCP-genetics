function drawplot(A,order)
X=A(1,:);
Y=A(2,:);
figure(1) % 画点
plot(X,Y,'.','Color','k','MarkerSize',20); hold on;%前两个参数分别为点的x,y坐标
hold on;
for i=1:length(A)-1
    o=order(i);
    p=order(i+1);
    plot([X(o);X(p)],[Y(o);Y(p)],'r')
end
plot([X(order(1));X(p)],[Y(order(1));Y(p)],'r')
hold off;