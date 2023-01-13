%% Time single run

tic
[avg,var] = IsingModel(100,1,0.1,1,4096);
toc
%update1 - 16mins; update2 - 14mins

%% Plot graph
%N=100,K=4096 took 17mins
%N=50,K=4096 took 9mins
%N=100,K=2048 took 12mins
%N=50,K=2048 took 7mins
%N=100,K=1024 took 10mins
%N=50,K=1024 took 5mins

tic
beta = 0:0.01:2';
T = 1./beta;
MVals = zeros(length(T),2);

for i = 1:length(T)
    [MVals(i,1),MVals(i,2)] = IsingModel(50,1,0.1,T(i),1024);
end
toc

fM_avg = figure;
plot(beta,MVals(:,1),'.');

fM_var = figure;
plot(beta,MVals(:,2),'.');
