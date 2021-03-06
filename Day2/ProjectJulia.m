c = -0.8;
d = 0.156;
nmax = 22;

x = zeros(nmax,1);
y = x;
x(1) = 0.1;
y(1) = 0.1;

% a
for k = 1:nmax-1
   x(k+1) = x(k).^2  - y(k).^2 + c;
   y(k+1) = 2.*x(k).*y(k) + d;
end

% b
figure
plot(1:nmax,x,'-ob','linewidth',1.5)
xlabel('n','fontsize',12)
ylabel('x','fontsize',12)
title(['c = ',num2str(c),' d = ',num2str(d)])

% c
figure
plot(y,x,'-ob','linewidth',1.5)
xlabel('x','fontsize',12)
ylabel('y','fontsize',12)
title(['c = ',num2str(c),' d = ',num2str(d)])

%% d
a = -2;
b = 2;
r = a + (b-a).*rand(100,1)

%% e
%m = 100;
m = 1e5; % g
rx = a + (b-a).*rand(m,1);
ry = a + (b-a).*rand(m,1);
plot(rx,ry, 'o')

%% f

kin = 1;
kout = 1;
xin = [];
yin = [];
xout = [];
yout = [];

for j = 1:m
    x(1) = rx(j);
    y(1) = ry(j);

    % Part a
    for k = 1:nmax-1
       x(k+1) = x(k).^2  - y(k).^2 + c;
       y(k+1) = 2.*x(k).*y(k) + d;
    end
    
    if abs(x(nmax))<2 && abs(y(nmax))<2
        xin(kin) = x(1);
        yin(kin) = y(1);
        kin = kin+1;
    else
        xout(kout) = x(1);
        yout(kout) = y(1);
        kout = kout + 1;
    end
end

figure
hold on
if ~isempty(xin)
    plot(xin,yin,'b.','linewidth',1.5)
end
if ~isempty(xout)
    %plot(xout,yout,'r.','linewidth',1.5)
    scatter(xout, yout, 0.1, linspace(1,10,length(xout)) 
end
xlabel('x','fontsize',12)
ylabel('y','fontsize',12)
title(['Random Initial Conditions at n = ',num2str(nmax)])







