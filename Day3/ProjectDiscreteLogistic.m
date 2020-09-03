%% c, d, e
r = 2.5;
K = 0.6;
initial = [0 .2 .4 .6 .8];
x = zeros(25,1);
for j = 1:4
    x(1) = initial(j);
    for n = 1:24
        x(n+1) = x(n) + r*(1 - (x(n)/K))*x(n);
    end
    figure; clf; 
    plot(1:25,x);
    title(['initial is ', num2str(initial(j))]);
end

%% g

r = linspace(0,3,100);
K = 0.6;
nmax = 1e4;
x = zeros(nmax,1);
x(1) = 0.2;
for i = 1:length(r)-1
    for n = 1:nmax-1
        x(n+1) = x(n) + r(i)*(1 - x(n)/K)*x(n);
    end
    plot(ones(1,nmax/2)*r(i),x(nmax/2+1:nmax),'.');
    hold on;
end
hold off;


