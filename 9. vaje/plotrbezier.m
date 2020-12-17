function plotrbezier(B,w,t)
% Plot rational bezier curve

[n,d] = size(B); 
 %skelet, narišemo poligon
 if d == 2
     plot(B(:,1),B(:,2),'k-')
 elseif d == 3
     plot3D(B(:,1),B(:,2),B(:,3),'k-')
 end
axis equal
hold on


%narišemo krivuljo, dobljene točke na krivulji
bb1 = rbezier(B,w,t);
plot(bb1(:,1),bb1(:,2));
hold on
if d == 2
    plot(bb1(:,1),bb1(:,2));
elseif d == 3
    plot3D(bb1(:,1),bb1(:,2),bb1(:,3));
end
hold on

%Farinove točke
q= zeros(n-1,d);

for i=1:(n-1)
    q(i,:) = w(i)/(w(i)+w(i+1)) * B(i,:) + w(i+1)/(w(i)+w(i+1))*B(i+1,:);
end

%narišemo farinove točke
scatter(q(:,1),q(:,2),'filled');
hold on
end

