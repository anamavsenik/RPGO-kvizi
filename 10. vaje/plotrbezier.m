function plotrbezier(B,w,t)
%narišemo poligon
plot(B(:,1),B(:,2),'-o');
axis equal
hold on

%narišemo krivuljo
%dobljenje točke na krivulji
D = rbezier(B,w,t);

plot(D(:,1),D(:,2));
hold on

%Farinove točke
[n,d]=size(B);
q= zeros(n-1,d);

for i=1:(n-1)
    q(i,:) = w(i)/(w(i)+w(i+1)) * B(i,:) + w(i+1)/(w(i)+w(i+1))*B(i+1,:);
end

%narišemo farinove točke
%scatter(q(:,1),q(:,2),'filled');
hold off

end