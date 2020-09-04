<<<<<<< HEAD
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


=======
% MCSB Bootcamp
% VStudent - Project 3.1 Discrete logistic

% simulation parameters
ntMax = 1000;
nParam = 1000;

% model parameters to sweep through
rArray = linspace(0.1,2.99,nParam);

% data collection
xSS = zeros(nParam,300);

% loop through parameters
for iParam=1:nParam
    
    % model parameters
    r = rArray(iParam);
    K = 0.6;
   
    x = zeros(1,ntMax);
    
    % initial condition
    x(1) = 0.5;
    
    % loop through time
    for nt=1:ntMax
        x(nt+1) = x(nt) + r*(1-x(nt)/K)*x(nt);
    end
    
    %% data analysis and collection
    if 0
        figure(1); clf; hold on; box on;
        plot(x(1:100), '-ok');
        xlabel('Time');
        ylabel('Population');
    end % finished plotting time series
    
    
    xSS(iParam,:) = x((end-size(xSS,2)+1):end);
    
end % finished loop through parameters

save('xSS.mat', 'xSS');


%% analysis

load('xSS.mat', 'xSS');

% plot parameter-sweep diagram
figure(2); clf; hold on; box on;
plot(rArray,xSS, '.');
ylabel('Population');
xlabel('Growth rate r')
>>>>>>> a77e1be4c78109c63be30b0ba26b93d3897f08fe
